package com.avengers.student.schoolRegister.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.schoolRegister.service.StudentSchoolRegisterService;

@Controller
@RequestMapping("/student")
public class StudentSchoolRegisterController {

	@Autowired
	private StudentSchoolRegisterService service;
	
	
	@RequestMapping("/schoolRegister/certificate")
	public String certificate(){
		return "/student/schoolRegister/certificate";
	}
	
	@RequestMapping("/schoolRegister/gradeCertificate")
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
	
	@RequestMapping("/schoolRegister/leaveBackList")
	public String leaveBack(Principal principal, Model model){
		String stud_num = principal.getName();
		ArrayList<LoaVO> leaveList = null;
		ArrayList<RtsVO> backList = null;
		try {
			leaveList = service.selectLeaveList(stud_num);
			backList = service.selectBackList(stud_num);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		model.addAttribute("leaveList",leaveList);
		model.addAttribute("backList",backList);
		return "/student/schoolRegister/leaveBackList";
	}
	
	@RequestMapping("/schoolRegister/leaveBackApplyPage")
	public String leaveBackApplyPage(Principal principal, Model model){
		
		
		return "/student/schoolRegister/leaveBackApplyPage";
	}
	
	@RequestMapping("/schoolRegister/leaveApply")
	public String leaveApply(@ModelAttribute LoaVO vo  ,Principal principal){
		String loa_stud = principal.getName();
		vo.setLoa_stud(loa_stud);
		
		try {
			service.applyLeave(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "/student/schoolRegister/leaveBackList";
	}
	
	@RequestMapping("/schoolRegister/backApply")
	public String backApply(@ModelAttribute RtsVO vo , Principal principal){
		String rts_stud = principal.getName();
		vo.setRts_stud(rts_stud);
		
		try {
			service.applyBack(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "/student/schoolRegister/leaveBackList";
	}
	
	@RequestMapping("/schoolRegister/dropOff")
	public String dropOffPage(Principal principal, Model model){
		String stud_num = principal.getName();
		ArrayList<LsVO> list = null;
		try {
			list = service.selectDropOffList(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("dropOffList",list);
		
		
		return "/student/schoolRegister/dropOff";
	}
	@RequestMapping("/schoolRegister/dropOffApply")
	public String dropOffApply(@ModelAttribute LsVO vo , Principal principal, Model model){
		String ls_stud = principal.getName();
		vo.setLs_stud(ls_stud);
		ArrayList<LsVO> list = null;
		try {
			service.applyDropOff(vo);
			list = service.selectDropOffList(ls_stud);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("dropOffList",list);
		return "/student/schoolRegister/dropOff";
	}
	
	public void createGradeCertificate(HashMap<String,String> gradeInfo,List<HashMap<String,String>> gradeList, int allGrade, int allGradeCount){
		//pdf 만들기
		System.out.println("성적pdf만들기");
	}
	
}
