package com.avengers.student.classManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.student.classManage.service.StudentClassManageService;

@Controller
public class StudentClassManageController {

	@Autowired
	public StudentClassManageService scmService;
	
	public void setScmService(StudentClassManageService scmService){
		this.scmService = scmService;
	}
	
	
	
}
