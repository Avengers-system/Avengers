package com.avengers.admin.lectureManage.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.admin.lectureManage.service.AdminLectureManageService;

@Controller
@RequestMapping("admin")
public class AdminLectureManageController {
	@Autowired
	private AdminLectureManageService adminLctService;
	   
	public void setAdminLectureManageService(AdminLectureManageService adminLctService){
		this.adminLctService=adminLctService;
	}
	
	@RequestMapping("/adminLectureManage/classMain")
	public String adminLectureManageClassMain(Model model){
		String view = "admin/adminLectureManage/classMain";
		
		ArrayList<Map<String, String>> lctList = null;
		
		try {
			lctList = adminLctService.selectAllLctList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("lctList", lctList);
		
		return view;
	}
	
}
