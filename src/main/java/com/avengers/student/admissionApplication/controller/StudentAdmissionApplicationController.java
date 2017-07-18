package com.avengers.student.admissionApplication.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avengers.db.dto.AdmissionApplicationVO;
import com.avengers.db.dto.AtdcVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.LrVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.TlVO;
import com.avengers.student.admissionApplication.serviceImpl.StudentAdmissionApplicationServiceImpl;

@Controller
@RequestMapping("/student")
public class StudentAdmissionApplicationController {
	   @Autowired
	   private StudentAdmissionApplicationServiceImpl studentService;
	   
	   /**stud_num으로 최대신청 가능학점 구하고 넣어줘야함
	    * stud_num으로 tl목록 검색해서 학점들 총점 더해줄것 그리고 최대신청가능학점에서 이를빼주고 남은학점을구함
	    * 
	    * @param model
	    * @param principal
	    * @param lctVO
	    * @return
	    */
	   @RequestMapping(value="/admissionApplication",method={RequestMethod.GET, RequestMethod.POST})

	   public String professorMain(Model model,Principal principal,AdmissionApplicationVO admissionVO){
		   if(admissionVO==null){
			   admissionVO=new AdmissionApplicationVO();
		   }		  
		   String view = "/student/admissionApplication/admissionApplication";
		   String stud_num = principal.getName();
		   admissionVO.setStud_num(stud_num);
		   int cur_score = 0;
		   try {
			List<HashMap<String,String>> cartList=studentService.selectCartList(admissionVO);
			List<HashMap<String,String>> lectureList=studentService.selectLctList(admissionVO);
			List<HashMap<String,String>> admissionApplicationList=studentService.selectTlList(admissionVO);
			StudVO studentInfo = studentService.selectStudMaxCrd(stud_num);
			TlVO tlVO = new TlVO();
			tlVO.setTl_stud(stud_num);
			ArrayList<TlVO> tlList = studentService.selectTl_LCTList(tlVO);
			for(TlVO tl:tlList){
				LctVO lct =studentService.selectLct(tl.getTl_lct());
				cur_score+=Integer.parseInt(lct.getLct_crd());				
			}
			model.addAttribute("term","본수강신청");
			model.addAttribute("cartList",cartList);
			model.addAttribute("lectureList",lectureList);
			model.addAttribute("admissionApplicationList",admissionApplicationList);
			model.addAttribute("cur_score",cur_score);
			model.addAttribute("studentInfo",studentInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}			   
		   return view;
	   }
	   /**
	    * 이미 장바구니에 들어있는건 신청하면안됨 
	    * stud_num 이랑 cart_lct로 장바구니 먼저 검색해서 있나 없나 찾긔
	    * @param principal
	    * @param cart_lct
	    * @return
	    */
	   @RequestMapping(value="/insertCart",method=RequestMethod.POST)
		public String CartInsert(Principal principal,@RequestParam(value="cart_lct")String cart_lct){
		   CartVO cartVO = new CartVO();
		   String cart_stud = principal.getName();
		   cartVO.setCart_stud(cart_stud);
		   cartVO.setCart_lct(cart_lct);
		   try {
			if(studentService.selectCart(cartVO)==null){
			studentService.insertCart(cartVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   
			return "redirect:admissionApplication";
		}
	   @RequestMapping(value="/deleteCart",method=RequestMethod.POST)
	   public String CartDelete(Principal principal,@RequestParam(value="cart_lct")String cart_lct){
		   String cart_stud = principal.getName();
		   CartVO cartVO = new CartVO();
		   cartVO.setCart_lct(cart_lct);
		   cartVO.setCart_stud(cart_stud);
		   try {
			studentService.deleteCart(cartVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   return "redirect:admissionApplication";
	   }
	   
	   
	   /**
	    * 이미 신청되있는건 신청하면 안됨
	    * stud_num,tl_lct 로 먼저 셀렉트한다음에 tl에서 결과값이 없고
	    * stud_num으로 tl목록 검색해서 학점들 총점 더해줄것 그리고 최대신청가능학점에서 이를빼주고 남은학점을구함
	    * tl_lct로 lct 셀렉해서 LCT_QUA_NUM != LCT_CNT_NUM  LCT_CRD <=남은학점이어야함
	    * 시간도 겹치면 안됌 lr_hour를 검색해서 비교 우선 /로 자르고 그걸 하나씩 잘라서
	    * arr1{{1,0,1,2},{2,0,5,6}}
	    * arr2{{1,1,2,3}}
	    * 이런식으로 자른다.
	    * 넣어주고나선
	    * 업데이트 tl_lct로 lct 검색해서 LCT_CNT_NUM+1
	    * tlVO로 입력한 tl_num 찾아서 ATDC에 ATDC_TL 입력후 ATDC_DATE를
	    * 개강일을 구한뒤 종강일보다 작을때까지 계속 일주일에 한번이라면 +7을 2번이라면
	    * 2번째요일 - 1번째요일 = 기간1, 7-기간1 = 기간2 이렇게 구한뒤 기간1,기간2를 번갈아가면서 더한다.
	    * @param tlVO
	    * @return
	    */
	   @RequestMapping(value="/insertTl",method=RequestMethod.POST)
	   public String TlInsert(Principal principal,@RequestParam(value="lct_num")String lct_num){
		TlVO tlVO = new TlVO();
		AdmissionApplicationVO admissionVO = new AdmissionApplicationVO();		
		String stud_num = principal.getName();
		admissionVO.setStud_num(stud_num);
		tlVO.setTl_lct(lct_num);
		tlVO.setTl_stud(stud_num);
		int cur_score = 0;
		int save_score = 0;
		boolean checkHour = true;
		try {
			
			LctVO checkLct = studentService.selectLct(lct_num);
			LrVO checkLr = studentService.selectLr(lct_num);
			StudVO studentInfo = studentService.selectStudMaxCrd(stud_num);
			ArrayList<TlVO> tlList = studentService.selectTl_LCTList(tlVO);
			
			String checkLr_hour = checkLr.getLr_hour();
			String[] checkArr1 = checkLr_hour.split("/");
			//선택한 강의친구 강의요일 구해저장해줄 어레이리스트
			ArrayList<Integer> selectLctLr = new ArrayList<Integer>();
			for (String check :checkArr1) {
				String[] checkArr2=check.split("");
				//선택한 강의친구 강의요일 저장 사이즈가 2이하이며 서로 다를때
				if (selectLctLr.size()==0) {
					selectLctLr.add(Integer.parseInt(checkArr2[1]));
				}else if(selectLctLr.size()==1&&selectLctLr.get(0)!=Integer.parseInt(checkArr2[1])){
					selectLctLr.add(Integer.parseInt(checkArr2[1]));
				}
			}
			
			//수강신청하려는 친구와 이미 있는친구들의 시간이 겹치지않도록 해주는 로직
			List<HashMap<String, String>> admissionApplicationList = studentService
					.selectTlList(admissionVO);
			for (HashMap<String, String> admissionMap : admissionApplicationList) {
				String lr_hour = admissionMap.get("lr_hour");
				String[] arr1 = lr_hour.split("/");

				for (String check : checkArr1) {
					String[] checkArr2 = check.split("");
					for (String hour : arr1) {
						String[] arr2 = hour.split("");
						// 첫자리가 같다면 즉 요일이 같다면
						if (checkArr2[1].equals(arr2[1])) {
							for (int i = 2; i < arr2.length; i++) {
								for (int j = 2; j < checkArr2.length; j++) {
									if (checkArr2[i].equals(arr2[j])
											&& !checkArr2[i].equals("0")) {
										checkHour = false;
									}
								}
							}
						}
					}
				}
			}
			for (TlVO tl : tlList) {
				LctVO lct = studentService.selectLct(tl.getTl_lct());
				cur_score += Integer.parseInt(lct.getLct_crd());
			}
			
			save_score = Integer.parseInt(studentInfo.getStud_max_crd()) -cur_score;
			if(Integer.parseInt(checkLct.getLct_crd())<=save_score
					&&studentService.selectTl(tlVO)==null
					&&(checkLct.getLct_qua_num()!=checkLct.getLct_cnt_num())
					&&checkHour){
			studentService.insertTl(tlVO);
			studentService.updateLctPlus(lct_num);
			
			TlVO insertVO =  studentService.selectTl_num(tlVO);
			String tl_num = insertVO.getTl_num();
			
			GregorianCalendar today = new GregorianCalendar ( );
			String date ="";
			int month =  today.get ( today.MONTH ) + 1;
			if(month>=3&&month<=8){
				date="1-"+today.get( today.YEAR );	
			}else{
				date="2-"+today.get( today.YEAR );	
			}
			BoardVO boardVO = new BoardVO();
			boardVO.setBoard_cont("개강일");
			boardVO.setBoard_title(date);
			BoardVO Univschd=studentService.selectUnivschdList(boardVO);
			date=Univschd.getBoard_title();
			date = date.substring(2, date.length());
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			//학사일정에서 검색해온 개강일을 Date타입으로 형변환 해준다.
			Date beginDate=null;
			try {
				beginDate = formatter.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//개강일 날짜
			today.setTime(beginDate);
			//개강일 요일구하기
			Calendar cal= Calendar.getInstance();
			cal.setTime(beginDate);
		     
		    int dayOfWeek = cal.get ( Calendar.DAY_OF_WEEK );
		    //수업요일 - 개강요일
		    int checkPlusDay = selectLctLr.get(0)-dayOfWeek;
		    if(checkPlusDay<0){
		    	checkPlusDay+=7;
		    }
		    
		    //1주에 수업이2번일때 수업일수를 계속 7일더해주는게 아닌 각각 수업요일에 따라 번갈아가며 일정기간을 더해주기위한 변수
		    int term1= 0;
		    int term2= 0;
		    
		    
		    //1주에 수업이 2번일때 둘중 학사일정 개강일과 가장 차이가 적은것
		    if(selectLctLr.size()==2){
		    	term1=selectLctLr.get(0)-selectLctLr.get(1);
		    	int checkPlusDay2 = selectLctLr.get(1)-dayOfWeek;
		    	 if(checkPlusDay2<0){
				    	checkPlusDay2+=7;
				    }
		    	if(checkPlusDay2<checkPlusDay){
		    		term1=selectLctLr.get(1)-selectLctLr.get(0);
		    		checkPlusDay=checkPlusDay2;		    		
		    	}
		    }
		    if(term1<0){
		    	term1+=7;
		    }
		    
		    term2=7-term1;		    
			
		    //학사일정 개강일에서 해당수업의 실제 첫수업날짜(개강일)을 구하기위해 수업요일-개강요일을 더해준다.		    
		    today.add(Calendar.DAY_OF_YEAR, checkPlusDay);
		    AtdcVO atdcVO = new AtdcVO();
			atdcVO.setAtdc_tl(tl_num);
		    
		    
			int plusDay = 0;
			atdcVO.setAtdc_date(today.getTime());
			studentService.insertAtdc(atdcVO);
			
				while (plusDay < 112) {

					if (selectLctLr.size() == 2) {
						today.add(Calendar.DAY_OF_YEAR, term1);
						atdcVO.setAtdc_date(today.getTime());
						studentService.insertAtdc(atdcVO);
						plusDay += 7;
						if (plusDay == 112) {
							break;
						}
						today.add(Calendar.DAY_OF_YEAR, term2);
						atdcVO.setAtdc_date(today.getTime());
						studentService.insertAtdc(atdcVO);

					} else {
						// 이부분이 고민이좀 있었는데 위에서 각수업의 개강일에 맞춰서 먼저 출석부를 넣어줬는데 이렇게되면
						// 1주에 수업이 1번인 수업은 이미 1주차가 끝난거고 1주에 수업이 2번인 수업은 다음주에
						// term1만큼 더해준 요일에 한번더
						// 수업을 해야지 1주차가 끝나는것이기에 일주에 수업이1번일 경우와 2번일경우에 plusDay를
						// 해주는곳을 이렇게 설정했다.
						plusDay += 7;
						if (plusDay == 112) {
							break;
						}
						today.add(Calendar.DAY_OF_YEAR, 7);
						atdcVO.setAtdc_date(today.getTime());
						studentService.insertAtdc(atdcVO);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   
		   return "redirect:admissionApplication";
	   }
	   
	   /**
	    * 업데이트 tl_lct로 lct 검색해서 LCT_CNT_NUM-1
	    * 해당 출석부 모두 삭제
	    * @param tlVO
	    * @return
	    */
	   @RequestMapping(value="/deleteTl",method=RequestMethod.POST)
	   public String TlDelete(@RequestParam(value = "tl_num") String tl_num){
		   try {			
			TlVO tlVO = new TlVO();
			tlVO.setTl_num(tl_num);
			tlVO=studentService.selectTl(tlVO);
			studentService.updateLctMinus(tlVO.getTl_lct());
			studentService.deleteAtdc(tl_num);			
			studentService.deleteTl(tl_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   
		   return "redirect:admissionApplication";
	   }
	   
	   /**
	    * 시간표 pdf 보기
	    * @param model
	    * @return
	    */
	   @RequestMapping("/pdfView")
	   public String pageRankPdfView(Model model,Principal principal){
		   AdmissionApplicationVO admissionVO = new AdmissionApplicationVO();
		   HashMap<String,String> timeList = new HashMap<String,String>();
		   admissionVO.setStud_num(principal.getName());
		   try {
			List<HashMap<String,String>> admissionApplicationList=studentService.selectTlList(admissionVO);
			for (HashMap<String, String> admissionMap : admissionApplicationList) {
				//해쉬맵리스트에서 수강한강좌 하나씩 꺼내서 그중에 시간 구해옴
				String lr_hour = admissionMap.get("lr_hour");
				String lct_nm =  admissionMap.get("lct_nm");
				String prfs_nm =  admissionMap.get("prfs_nm");
				// /로 자름
				String[] arr1 = lr_hour.split("/");
				
				// /로 자른 애들 수만큼 반복
				for (String hour : arr1) {
					// ""으로 자름 결국 문자 하나씩 나옴
					String[] arr2 = hour.split("");
					for (int i = 2; i < arr2.length; i++) {
						timeList.put(arr2[1]+arr2[i], lct_nm+" - "+prfs_nm);
					}
				}
			}
						
					
				
			
			
			
			
			
			
			model.addAttribute("TlList", timeList);
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		   
	      return "pagePDFView"; 
	   }
	   
	   
}
