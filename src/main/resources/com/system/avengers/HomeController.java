package com.system.avengers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping(value="member/list")
	public String getMemberList(Model model,Principal principal){
		List<TestVO> testList = service.getTestList();
		System.out.println(principal.getName());
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(user.getUsername());
		
		model.addAttribute("memberList", testList);
		
		return "member/list";
	}
	
	@RequestMapping("admin/adminMain")
	public String test(){
		return "admin/adminMain";
	}
	@RequestMapping("student/studentMain")
	public String test1(){
		return "student/studentMain";
	}
	@RequestMapping("professor/professorMain")
	public String test2(){
		return "professor/professorMain";
	}
	@RequestMapping("common/logout")
	public String logout(){
		return "common/logout";
	}
}
