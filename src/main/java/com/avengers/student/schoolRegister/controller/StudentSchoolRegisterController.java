package com.avengers.student.schoolRegister.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.student.schoolRegister.service.StudentSchoolRegisterService;

@Controller
@RequestMapping("/student/schoolRegister")
public class StudentSchoolRegisterController {

	@Autowired
	private StudentSchoolRegisterService service;
	
	
	@RequestMapping("/certificate")
	public String certificate(){
		return "/student/schoolRegister/certificate";
	}
	
	@RequestMapping("/gradeCertificate")
	public String gradeCertificate(Principal principal, Model model){
		String stud_num = principal.getName();
		HashMap<String,String> gradeInfo = null; //성명,학번,학과,학적상태
		List<HashMap<String,String>> gradeList = null;//학기, 과목명, 취득학점,성적
		int allGrade = 0; //총 취득학점
		int allGradeCount = 0; // 총취득학점/allGradeCount = 총평점평균
		try {
			gradeInfo = service.selectGradeInfo(stud_num);
			gradeList = service.selectGradeList(stud_num);
			allGrade = service.selectAllGrade(stud_num);
			allGradeCount = service.selectAllGradeCount(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			createGradeCertificate(gradeInfo, gradeList, allGrade, allGradeCount);
		
		return "/student/schoolRegister/gradeCertificate";
	}
	
	
	
	public void createGradeCertificate(HashMap<String,String> gradeInfo,List<HashMap<String,String>> gradeList, int allGrade, int allGradeCount){
		//pdf 만들기
	}
	
}
