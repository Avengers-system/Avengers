package com.avengers.admin.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;














import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.avengers.admin.mypage.service.AdminMypageService;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.PerschdVO;


/**
 * 관리자 mypage
 * mypage controller
 * @author 조영훈
 * @version 0.1
 * @since 2017.07.12
 */
@Controller
@RequestMapping("/admin/mypage")
public class AdminMypageController {

	@Autowired
	private AdminMypageService myPageService;

	public void setMyPageService(AdminMypageService myPageService) {
		this.myPageService = myPageService;
	}
	/**
	 * mypage로 가기위한 함수
	 * @return String
	 */
	@RequestMapping("/")
	public String myPage(Principal principal,Model model,HttpSession session){
		String adminId = "";
		AdminVO admin= null;
		String url="/admin/mypage/mypage";
		
		if( session.getAttribute("adminId") != null){
			adminId = (String) session.getAttribute("adminId");
		} else {
			adminId = principal.getName();
			
		}

		try {
			admin = myPageService.selectAdmin(adminId);
			if(admin != null){
				model.addAttribute("admin",admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
	
	
	/**
	 * 개인정보 확인
	 * @param principal
	 * @param model
	 * @return string
	 */
	@RequestMapping("/myInfo")
	public String myInfo(Principal principal,Model model){
		String adminId = principal.getName();
		String url="/admin/mypage/mypage";
		AdminVO admin= null;
		
		try {
			admin = myPageService.selectAdmin(adminId);
			if(admin != null){
				model.addAttribute("admin",admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping(value="/myInfoUpdate")
	public String myInfoUpdate(
			@RequestParam("file")MultipartFile myImage
			,@ModelAttribute("admin") AdminVO admin
			,HttpSession session
			,Model model){
		String url="redirect:/admin/mypage/";
		String upload="C:/Users/pc13/git/Avengers/src/main/webapp/resources/myInfo_images";
		String message="수정이 실패하였습니다.";
		
		
		//파일 저장
		if(!myImage.isEmpty()){
			File file = new File(upload,myImage.getOriginalFilename());
			try {
				myImage.transferTo(file);
				//파일 이름 vo 저장
				admin.setAdmin_pic(file.getName());
				System.out.println(admin.getAdmin_pic());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			int success = myPageService.updateAdmin(admin);
			if(success >= 1) {
				message="수정이 완료되었습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("message",message);
		return url;
	}
	
	/**
	 * 개인일정 조회
	 * @param principal
	 * @param model
	 * @return string
	 */
	@RequestMapping("/mySchedule")
	public String mySchedule(Principal principal,Model model){
		String scheduleId = principal.getName(); 
		ArrayList<PerschdVO> perschdList = null;
		String url="/admin/mypage/mypage";
		String message="";
		try {
			perschdList =  myPageService.selectPerschdList(scheduleId);
			if(perschdList != null){
				model.addAttribute("perschdList",perschdList);
			}else{
				message = "입력된 개인정보가 없습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("message",message);
		return url;
	}
	
	/**
	 * 개인일정 세부조회
	 * @param perschd_num
	 * @param model
	 * @return string
	 */
	@RequestMapping("/myScheduleDetail")
	public String myScheduleDetails(
			@ModelAttribute(value="scheduleDetail")PerschdVO perschd,
			Model model
			){
		String url="/admin/mypage/myScheduleDetail";
		String message="";
			//등록된 일정이 있다면, 등록된 일정을 보여준다.
			//등록된 일정이 없다면, 새로운 세부화면을 보여준다.
			if(perschd != null){
				try {
					perschd = myPageService.selectPerschd(perschd.getPerschd_num());
					message="해당날짜에 등록된 일정이 없습니다.";
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.addAttribute("message",message);
				model.addAttribute("perschd",perschd);
			}
		return url;
	}
	
	/**
	 * 일정 등록
	 * @param perschd
	 * @param model
	 * @return string
	 */
	@RequestMapping("/myScheduleInsert")
	public String myScheduleInsert(
			@RequestParam(value="perschdVO")PerschdVO perschd,
			HttpSession session
			){
		String url="redirect:/admin/mypage/mySchedule";
		String message="일정등록을 실패하였습니다.";
		
		try {
			int  success= myPageService.insertPerschd(perschd);
			if(success == 1){
				message="일정등록에 성공하였습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("message",message);
		return url;
	}
	/**
	 * 일정 삭제
	 * @param perschd_num
	 * @param session
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/myScheduleDelete",method = RequestMethod.POST)
	public void myScheduleDelete(
			@ModelAttribute(value="scheduleDetail")PerschdVO perschd,
			HttpSession session
			){
		System.out.println("perschd_num:!!!!!!!!!!:"+perschd.getPerschd_num());
		String url="redirect:/admin/mypage/mySchedule";
		String message="일정 삭제를 실패하였습니다.";
		
		try {
			int success = myPageService.deletePerschd(perschd.getPerschd_num());
			if(success != -1){
				message="일정 삭제를 성공하였습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("message", message);
	}
	/**
	 * 일정수정
	 * @param perschd
	 * @param session
	 * @return String
	 */
	@RequestMapping(value="/myScheduleUpdate",method = RequestMethod.POST)
	@ResponseBody
	public void myScheduleUpdate(
			@ModelAttribute(value="scheduleDetail")PerschdVO perschd,
			HttpSession session
			){
		String message="";
		try {
			int success = myPageService.updatePerschd(perschd);
			if(success != -1){
				message="일정 수정을 성공하였습니다.";
				System.out.println(message);
			} else if(success == -1){
				message="일정 수정을 실패하였습니다.";
				System.out.println(message);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("message", message);
	}
}
