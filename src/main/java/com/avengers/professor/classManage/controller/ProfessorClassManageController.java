package com.avengers.professor.classManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.ExamVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.RegistryExamVO;
import com.avengers.professor.classManage.service.ProfessorClassManageService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfessorClassManageController {
	@Autowired
	private ProfessorClassManageService pcmService;
	
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
	
//										,@RequestParam(value="startHour")String startHour
//										,@RequestParam(value="startMi")String startMi
//										,@RequestParam(value="endHour")String endHour
//										,@RequestParam(value="endMi")String endMi
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
	
	@RequestMapping("professor/classManage/lectureExamQn")
	public String professorLectureExamQn(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureExamQn";
		
		String exam_num = request.getParameter("exam_num");
		
		ArrayList<EqVO> eqList = null;
		
		try {
			eqList = pcmService.selectEqList(exam_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("eqList", eqList);
		
		return view;
	}
}
