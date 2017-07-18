package com.avengers.student.counsel.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.CnsVO;
import com.avengers.student.counsel.service.StudentCounselService;

@Controller
@RequestMapping("/student/counsel")
public class StudentCounselController {
	
	@Autowired
	private StudentCounselService service;
	
	@RequestMapping("/counselList")
	public String counselList(Principal principal, Model model){
		String stud_num = principal.getName();
		ArrayList<CnsVO> cnsList  = null;
		try {
			cnsList = service.selectCounselList(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("cnsList",cnsList);
		return "/student/counsel/counselList";
	}
	@RequestMapping("/counselApplyPage")
	public String counselApplyPage(Model model){
	
		return "/student/counsel/counselApplyPage";
	}
	
	@RequestMapping("/counselApplyDetail")
	public String counselApplyDetail(@ModelAttribute CnsVO vo,Model model){
		ArrayList<CnsVO> cnsList=null;
		System.out.println(vo.getCns_date());
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String tempDate = sdFormat.format(vo.getCns_date());
		System.out.println(tempDate);
		
		try {
			cnsList = service.selectCounselDateList(tempDate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cnsList",cnsList);
		return "/student/counsel/counselApplyDetail";
	}
	
	@RequestMapping("/counselApply")
	public String counselApply(@ModelAttribute CnsVO vo, Principal principal, Model model){
		String stud_num = principal.getName();
		ArrayList<CnsVO> cnsList  = null;
		try {
			cnsList = service.selectCounselList(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(vo.getCns_prfs());
		model.addAttribute("cnsList",cnsList);
		return "/student/counsel/counselList";
	}
	
}
