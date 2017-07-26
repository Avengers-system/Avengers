package com.avengers.professor.mypage.controller;

import java.security.Principal;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.mypage.service.ProfessorMypageService;

@Controller
@RequestMapping("/professor/mypage")
public class ProfessorMypageController {
	
	@Autowired
    ProfessorMypageService proService;
	
	  @RequestMapping("/myInfo")
	   public String professorMyPage(Principal principal,Model model){
		   String url="/professor/mypage/myInfo";
		   String proNum = "";
		   PrfsVO proVO = null;
		   
		   proNum = principal.getName();
		   try {
			proVO = proService.selectPrfs(proNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   
		   model.addAttribute("prfs", proVO);
		   return url;
	   }
	  
	  @RequestMapping("/myInfoUpdage")
	  public String professorMyPageUpdate(
			  @RequestParam("prfs_pic")MultipartFile prfs_pic,
			  Model model,
			  PrfsVO proVO
			  ){
		  String url="";
		  
		  
		  
		  return url;
	  }
	   
	   @RequestMapping("/mySchedule")
	   public String professorMySchedule(){
		   String url="";
		   
		   return url;
	   }
}
