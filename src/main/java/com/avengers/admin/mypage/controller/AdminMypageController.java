package com.avengers.admin.mypage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;




import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	 * 개인정보 확인
	 * @param principal
	 * @param model
	 * @return string
	 */
	@RequestMapping("/myInfo")
	public String myInfo(Principal principal,Model model){
		String adminId = principal.getName();
		String url="admin/myPage/myInfo";
		AdminVO admin= null;
		
		try {
			admin = myPageService.selectAdmin(adminId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("admin",admin);
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
		String url="admin/myPage/mySchedule";
		try {
			perschdList =  myPageService.selectPerschdList(scheduleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("perschdList",perschdList);
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
			@RequestParam(value="perschd_num",defaultValue="0")String perschd_num,
			Model model
			){
		String url="admin/mypage/myScheduleDetail";
		String message="";
			//등록된 일정이 있다면, 등록된 일정을 보여준다.
			//등록된 일정이 없다면, 새로운 세부화면을 보여준다.
			if(perschd_num != null){
				try {
					PerschdVO perschd = myPageService.selectPerschd(perschd_num);
					message="해당날짜에 등록된 일정이 없습니다.";
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.addAttribute("message",message);
				model.addAttribute("perschd_num",perschd_num);
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
	@RequestMapping("/myScheduleDelete")
	public String myScheduleDelete(
			@RequestParam(value="perschd_num")String perschd_num,
			HttpSession session
			){
		String url="redirect:/admin/mypage/mySchedule";
		String message="일정 삭제를 실패하였습니다.";
		
		try {
			int success = myPageService.deletePerschd(perschd_num);
			if(success==1){
				message="일정 삭제를 성공하였습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("message", message);
		return url;
	}
	/**
	 * 일정수정
	 * @param perschd
	 * @param session
	 * @return String
	 */
	@RequestMapping("/myScheduleUpdate")
	public String myScheduleUpdate(
			@RequestParam(value="perschdVO")PerschdVO perschd,
			HttpSession session
			){
		String url="redirect:/admin/mypage/mySchedule";
		String message="일정 수정을 실패하였습니다.";
		
		try {
			int success = myPageService.updatePerschd(perschd);
			if(success == 1){
				message="일정 수정을 성공하였습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("message", message);
		return url;
	}
}
