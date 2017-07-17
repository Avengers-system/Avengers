package com.avengers.professor.classManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avengers.db.dto.LctVO;
import com.avengers.professor.classManage.service.ProfessorClassManageService;

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
		
		model.addAttribute("lct_num", lct_num);
		
		return view;
	}
	@RequestMapping("professor/classManage/lectureDetail")
	public String professorLectureDetail(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureDetail";
		
		Map<String, String> detailLct = null;
		
		try {
			detailLct = pcmService.selectDetailLct(request.getParameter("lct_num"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String[] textbook = detailLct.get("lct_tb").split("/");
		
		model.addAttribute("detailLct", detailLct);
		model.addAttribute("textbook", textbook);
		return view;
	}
	
	@RequestMapping("professor/classManage/lectureModifyDetail")
	public String professorLectureModifyDetail(HttpServletRequest request, Model model){
		String view = "professor/classManage/lectureModifyDetail";
		
		Map<String, String> detailLct = null;
		
		try {
			detailLct = pcmService.selectDetailLct(request.getParameter("lct_num"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String[] textbook = detailLct.get("lct_tb").split("/");
		
		model.addAttribute("detailLct", detailLct);
		model.addAttribute("textbook", textbook);
		
		return view;
	}
	
	@RequestMapping(value="professor/classManage/lectureModify", method=RequestMethod.POST)
	public String professorLectureModify(HttpServletRequest request, 
										@ModelAttribute(value="lct")LctVO lctVO,
										@RequestParam(value="writer")String writer,
										@RequestParam(value="")String title,
										@RequestParam(value="publisher")String publisher,
										@RequestParam(value="year")String year){
		String view = "redirect:/professor/classManage/lectureDetail?lct_num="+lctVO.getLct_num();
		
		System.out.println(lctVO.getLct_num());
		System.out.println(writer);
		
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
}
