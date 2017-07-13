package com.avengers.student.counsel.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
