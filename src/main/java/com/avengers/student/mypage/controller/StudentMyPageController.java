package com.avengers.student.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.avengers.db.dto.StudVO;
import com.avengers.student.mypage.service.StudentMypageService;

@RequestMapping("/student/mypage")
@Controller
public class StudentMyPageController {

	@Autowired
	private StudentMypageService service;
	
	@RequestMapping("/myInfo")
	public String studentInformation(Principal principal,Model model){
		String url="student/mypage/myInfo";
		String stud_num="";
		StudVO studVO  = null;
		
		stud_num = principal.getName();
		
		try {
			studVO = service.selectMyInfo(stud_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(studVO.getStud_num());
		model.addAttribute("stud",studVO);
		return url;
	}
	
	@RequestMapping("/myInfoUpdate")
	public String myInfoUpdate(
			@RequestParam("file")MultipartFile myImage
			,@ModelAttribute("stud")StudVO studVO
			,HttpServletRequest request
			,HttpSession session
			,Model model
			){
		String url="redirect:/student/mypage/myInfo";
		String upload = request.getSession().getServletContext().getRealPath("resources/myInfo_images");
		String message="수정이 실패하였습니다.";
		
		if(!myImage.isEmpty()){
			File file = new File(upload,myImage.getOriginalFilename());
			
			try {
				myImage.transferTo(file);
				studVO.setStud_pic(file.getName());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		try {
			int success = service.updateMyInfo(studVO);
			if(success >= 1){
				message="수정이 완료되었습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("message", message);
		return url;
	}
	
	@RequestMapping("/mySchedule")
	public String studentSchedule(){
		String url="/student/mypage/mySchedule";
		
		return url;
	}
	
}
