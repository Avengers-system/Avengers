package com.avengers.professor.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		   PrfsVO prfs = null;
		   
		   proNum = principal.getName();
		   try {
			   prfs = proService.selectPrfs(proNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   
		   model.addAttribute("prfs", prfs);
		   return url;
	   }
	  
	  @RequestMapping(value="/myInfoUpdate",method=RequestMethod.POST)
	  public String professorMyPageUpdate(
			  @RequestParam(value="prfs_pic",required=false)MultipartFile prfs_pic,
			  @ModelAttribute("prfs")PrfsVO prfs,
			  HttpServletRequest request,
			  Model model
			  ){
		  int success = -1;
		  String url="redirect:/professor/mypage/myInfo";
		  String upload = request.getSession().getServletContext().getRealPath("resources/myInfo_images");
		  String message="수정이 실패하였습니다.";
		  
		  if(!prfs_pic.isEmpty()){
			  File file = new File(upload,prfs_pic.getOriginalFilename());
			  
			  try {
				prfs_pic.transferTo(file);
				prfs.setPrfs_pic(file.getName());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
		  
		  try {
			success = proService.updatePrfs(prfs);
			if(success >= 1){
				message = "수정이 완료되었습니다.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  
		  return url;
	  }
	   
	   @RequestMapping("/mySchedule")
	   public String professorMySchedule(){
		   String url="";
		   
		   return url;
	   }
}
