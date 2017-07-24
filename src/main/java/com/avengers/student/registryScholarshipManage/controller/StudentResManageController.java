package com.avengers.student.registryScholarshipManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avengers.db.dto.LoaRtsVO;
import com.avengers.db.dto.ScrVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.resSchStudentVO;
import com.avengers.student.registryScholarshipManage.serviceImpl.StudentResManageServiceImpl;

/**
 * 학생 등록/장학관리
 * @author 조영훈
 * @version 0.1
 * @since 2017.07.18
 *
 */
@Controller
@RequestMapping("/student")
public class StudentResManageController {

	@Autowired
	private StudentResManageServiceImpl stuResService;
	
	@RequestMapping("/studRes")
	public String studRes(Principal princiapl
			,Model model
			,@RequestParam(value="lct_yr",defaultValue="2016")String lct_yr
			,@RequestParam(value="scr_year",required=false)String scr_year
			,@RequestParam(value="scr_qtr",required=false)String scr_qtr
			,@RequestParam(value="scrappl_year",required=false)String scrappl_year
			,@RequestParam(value="scrappl_qtr",required=false)String scrappl_qtr){
		String url="student/registryScholarshipManage/registryScholarshipManageMain";
		String loa_stud= princiapl.getName();
		String entrance_year = loa_stud.substring(0,4);//입학년도
		GregorianCalendar today = new GregorianCalendar ( );
		int today_year = today.get ( today.YEAR );	
		ArrayList<String> yearList = new ArrayList<String>();
		int IntegerEntrance_year = 2016;
		try {
			IntegerEntrance_year = Integer.parseInt(entrance_year);
		} catch (Exception e) {
			
		}
		for (int i = IntegerEntrance_year; i < today_year+1 ; i++) {
			yearList.add(Integer.toString(i));
		}
		model.addAttribute("yearList",yearList);
		
		String message="";
		int grades = 0 ;// 학점
		double average_rating=0.0;//평균평점
		
		resSchStudentVO resSchStudent = new resSchStudentVO();
		ArrayList<resSchStudentVO> stuRes = null;
		ArrayList<LoaRtsVO> LoaRts = null; 
		resSchStudentVO studInfo = new resSchStudentVO();
		try {
			stuRes =stuResService.selectResSchHistory(loa_stud,lct_yr);
			LoaRts = stuResService.selectLoaRts(loa_stud);//휴학 및 복학 
			studInfo = stuResService.selectStudInfo(loa_stud);
			if(stuRes == null || stuRes.size()==0){
				message="조회된 결과가 없습니다.";
			}else{
				for (int i = 0; i < LoaRts.size(); i++) {
					for (int j = 0; j < stuRes.size(); j++) {
						
						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
						String year = transFormat.format(LoaRts.get(i).getLOA_START_DATE());//강의 개설년도
						
						//강의개설년도와 휴학년도가 같이 않다면,그 해 년도 학점을 계산한다.
						if(!year.equals(stuRes.get(j).getLct_yr())){
							if(stuRes.get(j).getTl_asmt_check().equals("2")){//강의평가를 완료했다면
								
								//각 과목의 평점 * 학점을 더한다
								average_rating  += stuRes.get(j).getTl_mark() * Integer.parseInt(stuRes.get(j).getLct_crd());
								grades += Integer.parseInt(stuRes.get(j).getLct_crd());
							}
						}
					}
				}
				//최종 평균평점 = (각 과목의 평점*학점을 더한값)/과목의 모든 학점을 더한 값
				average_rating = average_rating/grades;
				
			}
			resSchStudent.setCol_nm(studInfo.getCol_nm());//공과대
			resSchStudent.setDept_nm(studInfo.getDept_nm());//전공
			resSchStudent.setStud_grd(studInfo.getStud_grd());//학년
			resSchStudent.setStud_nm(studInfo.getStud_nm());//이름
			resSchStudent.setStud_num(studInfo.getStud_num());//학번
			ScrapplVO scrApplVO = new ScrapplVO();
			scrApplVO.setScrappl_stud(loa_stud);
			scrApplVO.setScrappl_yr(scr_year);
			scrApplVO.setScrappl_qtr(scr_qtr);
			List<HashMap<String,String>> selectScrList =stuResService.selectScrList(scrApplVO); 		 
			scrApplVO.setScrappl_yr(scrappl_year);
			scrApplVO.setScrappl_qtr(scrappl_qtr);			
			List<HashMap<String,String>> selectScrApplList =  stuResService.selectScrApplList(scrApplVO);
			model.addAttribute("scrList", selectScrList);
			model.addAttribute("scrApplList", selectScrApplList);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DecimalFormat format = new DecimalFormat("#.##");
		average_rating = Double.valueOf(format.format(average_rating));
			
		model.addAttribute("resSchStudent",resSchStudent);
		model.addAttribute("grades",grades);//취득학점
		model.addAttribute("average_rating", average_rating);//평균평점
		model.addAttribute("message",message);
		return url; 
	}
	/**
	 * 장학금신청 페이지
	 * @return
	 */
	@RequestMapping("/schAppl")
	public String schAppl(Model model){	
		String url="student/registryScholarshipManage/registryScholarshipApplication";
		try {
			ArrayList<ScrVO> scrList = stuResService.selectScrVO();
			model.addAttribute("scrList",scrList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return url;		
	}
	/**
	 * 신청등록했을시에 insert해주고 그결과를 
	 * schAppl에 다시 보여준다.
	 * @return
	 */
	@RequestMapping(value="/insertSchAppl",method=RequestMethod.POST)
	public String insertSchAppl(Principal principal,@RequestParam(value="scr_nm")String scr_nm,Model model,@RequestParam(value="scrappl_cause")String scrappl_cause){
		ScrapplVO scrapplVO = new ScrapplVO();
		try {
					
			String stud_num = principal.getName();
			scrapplVO.setScrappl_stud(stud_num);			
			scrapplVO.setScrappl_scr(scr_nm);
			scrapplVO.setScrappl_cause(scrappl_cause);
			stuResService.insertScrappl(scrapplVO);	
			model.addAttribute("insertScrappl","success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:schAppl";	
	}
	/**
	 * 등록현황 조회
	 * @param princiapl
	 * @param model
	 * @return
	 */
	@RequestMapping("/tuition")
	public String tuition(Principal princiapl,Model model){		
		String url="student/registryScholarshipManage/registryScholarshipTuition";
		
		
		return url;		
	}
	/**
	 * 등록금 관리
	 * @param princiapl
	 * @param model
	 * @return
	 */
	@RequestMapping("/tuitionManage")
	public String tuitionManage(Principal princiapl,Model model){		
		String url="student/registryScholarshipManage/registryScholarshipTuitionManage";
		
		
		return url;		
	}

	
}
