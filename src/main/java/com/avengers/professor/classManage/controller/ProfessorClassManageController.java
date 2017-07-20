package com.avengers.professor.classManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.ExamVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.RegistryExamVO;
import com.avengers.professor.classManage.service.ProfessorClassManageService;

@Controller
public class ProfessorClassManageController {
	@Autowired
	private ProfessorClassManageService pcmService;
	
	/**
	 * 교수가 강의한 리스트를 화면에 뿌리기 위한 메소드
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("professor/classManage/classMain")
	public String professorClassMain(Principal principal
									,Model model){
		String view = "professor/classManage/classMain";
		
		String prfs_num = principal.getName();
		
		ArrayList<Map<String, String>> prfsLctList = null;
		try {
			prfsLctList = pcmService.selectPrfsLecture(prfs_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("prfsLctList", prfsLctList);
		return view;
	}
	
	/**
	 * 강의메인화면
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("professor/classManage/lectureMain")
	public String professorLectureMain(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureMain";
		
		String lct_num = request.getParameter("lct_num");
		
		if(lct_num != null && !lct_num.equals("")){
			HttpSession session = request.getSession();
			
			session.setAttribute("lct_num", lct_num);
		}
		return view;
	}
	
	/**
	 * 강의계획서 상세보기
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("professor/classManage/lectureDetail")
	public String professorLectureDetail(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureDetail";
		
		Map<String, String> detailLct = null;
		
		try {
			detailLct = pcmService.selectDetailLct((String)request.getSession().getAttribute("lct_num"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(detailLct.get("lct_tb") != null){
			String[] textbook = detailLct.get("lct_tb").split("/");
			model.addAttribute("textbook", textbook);
		}
		
		model.addAttribute("detailLct", detailLct);
		return view;
	}
	
	/**
	 * 강의계획서 수정화면
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("professor/classManage/lectureModifyDetail")
	public String professorLectureModifyDetail(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureModifyDetail";
		
		Map<String, String> detailLct = null;
		
		try {
			detailLct = pcmService.selectDetailLct((String)request.getSession().getAttribute("lct_num"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(detailLct.get("lct_tb") != null){
			String[] textbook = detailLct.get("lct_tb").split("/");
			model.addAttribute("textbook", textbook);
		}
		
		model.addAttribute("detailLct", detailLct);
		
		return view;
	}
	
	/**
	 * 강의계획서 수정버튼을 눌렀을 때 update하기 위한 메소드
	 * @param request
	 * @param lctVO
	 * @param writer
	 * @param title
	 * @param publisher
	 * @param year
	 * @return
	 */
	@RequestMapping(value="professor/classManage/lectureModify", method=RequestMethod.POST)
	public String professorLectureModify(HttpServletRequest request, 
										@ModelAttribute(value="lct")LctVO lctVO,
										@RequestParam(value="writer")String writer,
										@RequestParam(value="title")String title,
										@RequestParam(value="publisher")String publisher,
										@RequestParam(value="year")String year){
		String view = "redirect:/professor/classManage/lectureDetail?lct_num="+(String)request.getSession().getAttribute("lct_num");
		
		String lct_tb = writer+"/"+title+"/"+publisher+"/"+year;
		lctVO.setLct_tb(lct_tb);
		
		try {
			int result = pcmService.updateLct(lctVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return view;
	}
	//내일할일
	/* 강의계획서 수정
	 * 시험등록, 수정, 삭제
	 * 과제등록, 수정, 삭제
	 * 그리고 시험을 등록하는 순간 학생모두가 등록되게 하는거
	 * location.href를 쓰는 순간 form태그에 있는 거 하나도 안넘어감!!!
	 * @ResponseBody는 페이지이동이 없음. ajax에 쓰임
	 * ModelAttribute() form태그를 VO형태로 가져옴
	 * RequestParam vo에 들어가지 않는 값들을 각각 가져올 수 있음
	 */
	
	/**
	 * 교수가 등록한 시험리스트 출력
	 * @param request
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping(value="professor/classManage/lectureExam")
	public String professorLectureExam(HttpServletRequest request
									   ,Principal principal
									   ,Model model){
		String view = "professor/classManage/lectureExam";
		
		String prfs_num = principal.getName();
		String lct_num = (String)request.getSession().getAttribute("lct_num");
		
		Map<String, String> key = new HashMap<String,String>();
		ArrayList<Map<String, String>> prfsExamList = null;
		key.put("prfs_num", prfs_num);
		key.put("lct_num", lct_num);
		try {
			prfsExamList = pcmService.selectPrfsExamList(key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("prfsExamList", prfsExamList);
		
		return view;
	}
	
	/**
	 * 시험등록화면
	 */
	@RequestMapping(value="professor/classManage/lectureRegistryExam")
	public String professorLectureRegistryExam(){
		String view = "professor/classManage/lectureRegistryExam";
		
		return view;
	}
	
	/**
	 * 시험등록, 시험을 등록할 때 학생들을 응시테이블에 자동으로 추가
	 * @param registryExamVO
	 * @param request
	 * @return
	 */
	@RequestMapping(value="professor/classManage/registryExam", method=RequestMethod.POST)
	public String professorRegistryExam(@ModelAttribute(value="exam") RegistryExamVO registryExamVO
										,HttpServletRequest request){
		String view = "redirect:/professor/classManage/lectureExam";
		
		ExamVO examVO = new ExamVO();
		
		//일단 시험등록하자
		examVO.setExam_date(registryExamVO.getExam_date());
		examVO.setExam_type(registryExamVO.getExam_type());
		examVO.setExam_start_date(registryExamVO.getStartHour() + ":" + registryExamVO.getStartMi());
		examVO.setExam_end_date(registryExamVO.getEndHour() + ":" + registryExamVO.getEndMi());
		
		//시험의 기본키를 년도+학기+'E'+LPAD(EXAM_SEQ.NEXTVAL,5,0)로 하면 학기마다 EXAM_SEQ를 1로 초기화시켜서 사용할 수 있음
		//그래서 해당 과목의 년도와 학기를 LECTURE 테이블에서 가져와야됨
		LctVO lctVO = null;
		
		try {
			lctVO = pcmService.selectLctYearQtr((String)request.getSession().getAttribute("lct_num"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		examVO.setExam_num(lctVO.getLct_yr() + "" + lctVO.getLct_qtr());
		examVO.setExam_lct((String)request.getSession().getAttribute("lct_num"));
		
		System.out.println(examVO.getExam_date() + "\n" + examVO.getExam_end_date()+
							"\n" + examVO.getExam_lct() + "\n" + examVO.getExam_num() + "\n" +examVO.getExam_start_date() + 
							"\n" + examVO.getExam_type());
		
		int result = -1;
		
		try {
			//시험등록 완료
			result = pcmService.insertExam(examVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(result > 0){
			view = "redirect:/professor/classManage/lectureExam";
		}
		
		//방금 등록한 시험의 기본키를 가져옴
		ArrayList<String> examPkList = null;
		try {
			examPkList = pcmService.selectExamPk((String)request.getSession().getAttribute("lct_num"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//자 이제 방금등록한 시험 기본키를 가져왔으니까
		//시험을 등록한 강의를 수강하는 학생들을 응시테이블에 자동으로 insert해보자
		
		//가장 최신걸 가져온다(근데 이거 하나밖에 안나올꺼야)
		String exam_num = examPkList.get(0);
		
		Map<String,String> key = new HashMap<String, String>();
		
		key.put("exam_num", exam_num);
		key.put("lct_num", (String)request.getSession().getAttribute("lct_num"));
		try {
			//학생등록 완료
			pcmService.insertStudTe(key);
			//학생등록을 완료했으니까 시험테이블에 학생 등록여부를 1로 바꿔주자
			pcmService.updateExamCheck(exam_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return view;
	}
	
	/**
	 * 시험문제조회 메소드
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("professor/classManage/lectureExamQn")
	public String professorLectureExamQn(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureExamQn";
		
		String exam_num = request.getParameter("exam_num");
		String division = request.getParameter("division");
		
		ArrayList<EqVO> eqList = null;
		
		try {
			eqList = pcmService.selectEqList(exam_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("eqList", eqList);
		model.addAttribute("exam_num",exam_num);
		
		if(division.equals("1")){
			view = "professor/classManage/lectureExamQn";
		} else {
			view = "professor/classManage/lectureRegistryExamQn";
		}
		
		return view;
	}
	
//	@RequestMapping("professor/classManage/removeExamEq")
//	@ResponseBody
//	public void professorRemoveExamEq(@RequestParam(value="eq_num")String eq_num){
//		System.out.println("성공");
//		int result = -1;
//		
//		try {
//			result = pcmService.deleteEqInfo(eq_num);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		
//	}
	
	/**
	 * 시험문제를 등록,수정,삭제를 할 수 있게 하기위한 메소드
	 * @param request
	 * @return
	 */
	@RequestMapping("professor/classManage/registryExamEq")
	public String professorRegistryExamEq(HttpServletRequest request){
		ArrayList<EqVO> eqList = new ArrayList<EqVO>();
		
		String length = request.getParameter("length");
		String exam_num = request.getParameter("exam_num");
		
		String view = "redirect:lectureExamQn?exam_num="+exam_num+"&division=1";
		
		int result = -1;
		//form태그 값들 가져오기
		for(int i=1; i<Integer.valueOf(length)+1;i++){
			EqVO eqVO = new EqVO();
			if(request.getParameter("eq_num"+i)!=null && !request.getParameter("eq_num"+i).equals("")){
				eqVO.setEq_num(request.getParameter("eq_num"+i));
			}
			eqVO.setEq_qtna(Integer.valueOf(request.getParameter("eq_qtna"+i)));
			System.out.println(Integer.valueOf(request.getParameter("eq_qtna"+i)));
			eqVO.setEq_qtn(request.getParameter("eq_qtn"+i));
			eqVO.setEq_qtn_type(request.getParameter("eq_qtn_type"+i));
			//1.객관식,2.주관식
			if(request.getParameter("eq_qtn_type"+i).equals("1")){
				eqVO.setEq_exmp_one(request.getParameter("eq_exmp_one"+i));
				eqVO.setEq_exmp_two(request.getParameter("eq_exmp_two"+i));
				eqVO.setEq_exmp_three(request.getParameter("eq_exmp_three"+i));
				eqVO.setEq_exmp_four(request.getParameter("eq_exmp_four"+i));
				eqVO.setEq_ans(request.getParameter("eq_ans"+i));
			}
			eqVO.setEq_exam(exam_num);
			eqList.add(eqVO);
		}
		
		ArrayList<String> eqPkList = null;
		
		try {
			eqPkList = pcmService.selectEqPkList(exam_num);
			System.out.println(eqPkList);
			System.out.println(eqList);
			//기본키값들을 비교
			//1.만약에 eqPkList에 있는 값이 eqList에 존재한다면 업데이트를 해야됨 ==> eq_num 맨 마지막에 u를 붙여??
			//2.만약에 eqPkList에 있는 값이 eqList에 존재하지 않는다면 삭제해야됨 ==> eqList에 그냥 추가해버려?? eq_num 맨 마지막에 d를 붙이고
			//3.만약에 eqList의 eq_num이 -1인 경우 ==> 그냥 insert
			if(eqPkList != null && !eqPkList.isEmpty()){
				if(eqList != null && eqList.size() == 0){
					//다삭제
				}
				int eqListSize = eqList.size();//form에서 가져온 값들만 비교하기 위해 for문을 돌기 전에 기존의 size를 저장
				int updateCount = 0;
				for(int eqPk=0; eqPk<eqPkList.size(); eqPk++){
					updateCount = 0;
					for(int eq=0; eq<eqListSize; eq++){
						if(eqList.get(eq).getEq_num().equals("-1")){
							System.out.println("새로운거");
							continue;
						} else if(eqPkList.get(eqPk).equals(eqList.get(eq).getEq_num())){//1번째 조건
							updateCount = 1;
							System.out.println("업데이트");
							eqList.get(eq).setEq_num(eqList.get(eq).getEq_num()+"u");//업데이트 해야된다.
							break;
						}
					}
					if(updateCount == 0){
						EqVO eqVO = new EqVO();
						eqVO.setEq_num(eqPkList.get(eqPk)+"d");
						eqList.add(eqVO);
					}
				}
				result = pcmService.allFunctionEq(eqList);
			} else {//만약 원래값이 없다면 그냥 인서트만 해주면됨
				result = pcmService.insertEq(eqList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//mybatis의 if문 사용해보자
		
		//문제의 타입을 먼저 비교한다
		//1이면 객관식 2이면 주관식
		
		//기존의 문제들을 불러와서 새로 넣는 것과 비교
		//만약에 기본키가 같은 것이 존재하면 문제들을 업데이트
		
		//그리고 문제의 타입을 봐서 1이면 객관식 인서트문
		
		return view;
	}
	
	/**
	 * 시험등록일에만 시험을 등록 및 수정을 할 수 있게 함
	 * @return
	 */
	@RequestMapping(value="professor/classManage/checkRegistryExamDate", method=RequestMethod.POST)
	@ResponseBody
	public String checkRegistryExamDate(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//DB에 시험시작날짜하고 종료날짜를 넣어서 비교하는게 좋을꺼같다.
		String start = "2017-07-17";//포함
		String end = "2017-07-20";//미포함
		
		Date sDate = new Date();//시험등록 시작일을 담기 위한 DATE변수
		Date eDate = new Date();//시험등록 종료일을 담기 위한 DATE변수
		Date cDate = new Date();//현재시간을 담기 위한 DATE변수
		
		try {
			sDate = dateFormat.parse(start);
			eDate = dateFormat.parse(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Calendar sCalendar = Calendar.getInstance();
		Calendar eCalendar = Calendar.getInstance();
		Calendar cCalendar = Calendar.getInstance();
		sCalendar.setTime(sDate);
		eCalendar.setTime(eDate);
		cCalendar.setTime(cDate);
		
		int result = 0;
		if(cCalendar.compareTo(sCalendar) == 1 
				&& cCalendar.compareTo(eCalendar) == -1){
			result = 1;//등록화면으로 이동이 가능
		} else {
			result = -1;//등록화면으로 이동이 불가능
		}
		return String.valueOf(result);
	}
	
	//응시자 확인하기
	@RequestMapping(value="professor/classManage/lectureTakeExamStudent")
	public String professorLectureTakeExamStudent(HttpServletRequest request
												  ,Model model){
		String view = "professor/classManage/lectureTakeExamStudent";
		
		String exam_num = request.getParameter("exam_num");
		
		ArrayList<Map<String, String>> studTeList = null;
		try {
			studTeList = pcmService.selectStudTeList(exam_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("studTeList", studTeList);
		return view;
	}
	
}
