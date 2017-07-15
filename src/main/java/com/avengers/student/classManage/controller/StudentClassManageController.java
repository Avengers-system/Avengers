package com.avengers.student.classManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avengers.db.dto.EqVO;
import com.avengers.student.classManage.service.StudentClassManageService;

@Controller
public class StudentClassManageController {

	@Autowired
	public StudentClassManageService scmService;
	
	public void setScmService(StudentClassManageService scmService){
		this.scmService = scmService;
	}
	
	@RequestMapping("student/classManage/lectureMain")
	public String studentLectureMain(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureMain";
		
		model.addAttribute("lct_num",request.getParameter("lct_num"));
		
		return view;
	}
	@RequestMapping("student/classManage/lecture")
	public String studentLecture(Principal principal, Model model){
		String view = "student/classManage/lecture";
		
		
		return view;
	}
	
	@RequestMapping("student/classManage/lectureDetail")
	public String studentLectureDetail(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureDetail";
		
		String lct_num = request.getParameter("lct_num");
		Map<String, String> detailLct = null;
		System.out.println(lct_num);
		try {
			detailLct = scmService.selectDetailLct(lct_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String[] textbook = detailLct.get("lct_tb").split("/");
		
		
		model.addAttribute("detailLct", detailLct);
		model.addAttribute("textbook", textbook);
		
		return view;
	}
	
	@RequestMapping("student/classManage/lectureExam")
	public String studentExamMain(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureExam";
		
		String te_stud = principal.getName();
		
		ArrayList<Map<String, String>> examList = null;
		
		Map<String,String> key = new HashMap<String, String>();
		
		key.put("te_stud", te_stud);
		key.put("lct_num", request.getParameter("lct_num"));
		try {
			examList = scmService.selectExamList(key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("examList", examList);
		
		return view;
	}
	
	@RequestMapping("student/classManage/lectureTakeExam")
	public String studentLectureTe(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureTakeExam";
		
		String exam_num = request.getParameter("exam_num");
		String lct_num = request.getParameter("lct_num");
		ArrayList<EqVO> eqList = null;
		
		try {
			eqList = scmService.selectEqList(exam_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		
		model.addAttribute("eqList", eqList);
		model.addAttribute("lct_num", lct_num);
		model.addAttribute("te_num",request.getParameter("te_num"));
		
		return view;
	}
	
	@RequestMapping(value="student/classManage/lectureExamSubmit", method = RequestMethod.POST)
	@ResponseBody
	public void studentLectureExamSubmit(HttpServletRequest request, Principal principal, Model model,
											@RequestParam(value="qtnaArr[]") List<String> qtnaArr,
											@RequestParam(value="answerArr[]") List<String> answerArr,
											@RequestParam(value="lct_num") String lct_num,
											@RequestParam(value="te_num") String te_num){
		//학생이 푼 정답 저장하고
		ArrayList<Map<String, String>> saList = new ArrayList<Map<String, String>>();
		for(int i=0; i<qtnaArr.size(); i++){
			Map<String, String> temp = new HashMap<String, String>();
			temp.put("qtna", qtnaArr.get(i));
			temp.put("ans", answerArr.get(i));
			temp.put("te", te_num);
			saList.add(temp);
		}
		
		//학생의 응시여부 업데이트 시키고
		try {
			int result = scmService.insertSa(saList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="student/classManage/lectureExamSubmit", method = RequestMethod.GET)
	public String studentLectureExamSubmit(HttpServletRequest request, Principal principal, Model model){
		String view = "redirect:lectureExam?lct_num="+request.getParameter("lct_num");
		return view;
	}
	
}
