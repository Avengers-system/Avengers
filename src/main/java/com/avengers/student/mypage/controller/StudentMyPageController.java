package com.avengers.student.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.student.mypage.service.StudentMypageService;

@Controller
public class StudentMyPageController {

	@Autowired
	private StudentMypageService service;
	
	@RequestMapping("/student/mypage/studentMypage")
	public String studentInformation(){
		
		
		return "/student/mypage/studentMypage";
	}
	
	@RequestMapping("/student/mypage/studentMySchedule")
	public String studentSchedule(){
		
		return "/student/mypage/studentMySchedule";
	}
	
}
