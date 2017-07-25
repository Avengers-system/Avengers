package com.avengers.admin.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.avengers.admin.mypage.service.AdminMypageService;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.PerschdVO;
import com.lowagie.text.List;


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
		String url="/admin/mypage/myInfo";
		
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
		String url="admin/mypage/myInfo";
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
	public String mySchedule(
			Principal principal,
			HttpSession session,
			Model model){
		
		String scheduleId = principal.getName(); 
		ArrayList<PerschdVO> perschdList = null;
		ArrayList<PerschdVO> perschdList2 = new ArrayList<PerschdVO>();
		
		String url="/admin/mypage/mySchedule";
		String message="";
	
		try {
			perschdList =  myPageService.selectPerschdList(scheduleId);
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");    
		        Date date1 = new Date();
		        Date date2 = new Date();
			    String start_date="";
			    String end_date="";
			
			    PerschdVO perschdVO = new PerschdVO();
			    for (int i = 0; i < perschdList.size(); i++) {
					perschdVO = perschdList.get(i);
					
					try {
						date1 = sdf.parse(perschdList.get(i).getPerschd_start_date());
						date2 = sdf.parse(perschdList.get(i).getPerschd_end_date());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					start_date = sdf.format(date1);
					end_date = sdf.format(date2);
		    
					perschdVO.setPerschd_start_date(start_date);
					perschdVO.setPerschd_start_date(end_date);
					perschdList2.add(perschdVO);
		    }
			if(perschdList != null){
				
				model.addAttribute("perschdList",perschdList2);
				message="개인정보가 조회되었습니다.";
			}else{
				message = "입력된 개인정보가 없습니다.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);
		return url;
	}
	
	/**
	 * 개인일정 세부조회
	 * @param perschd_num
	 * @param model
	 * @return string
	 */
	@RequestMapping("/myScheduleDetail")
	@ResponseBody   //없으면 viewresolver로 빠짐 json필요할때 사용할것 
	public PerschdVO myScheduleDetails(
			
			String perschd_title,
			HttpSession session
			,Model model
			){
		System.out.println("?!?!?!?!?!?!:::::::"+perschd_title);
		String message="";
		
		PerschdVO perschd = new PerschdVO();
			System.out.println(perschd.getPerschd_date());
		if(perschd != null){
					perschd = myPageService.selectPerschd_title(perschd_title);
					message="해당날짜에 등록된 일정이 없습니다.";
					session.setAttribute("message", message);
				
			}
		
		
		return perschd;
	}
	
	/**
	 * ★일정 등록★
	 * @param perschd
	 * @param model
	 * @return string
	 */
	@RequestMapping("/myScheduleInsert")
	public String myScheduleInsert(
			PerschdVO perschd,
			Principal who,
			HttpSession session,
			@RequestParam("PERSCHD_START_DATE")String perschd_start_date,
			@RequestParam("PERSCHD_END_DATE")String perschd_end_date,
			@RequestParam("PERSCHD_TITLE")String perschd_title,
			@RequestParam("PERSCHD_CONT")String perschd_cont
			){
		
		String message="일정등록을 실패하였습니다.";
		
		perschd.setPerschd_writer(who.getName());
		perschd.setPerschd_cont(perschd_cont);
		perschd.setPerschd_start_date(perschd_start_date);
		perschd.setPerschd_end_date(perschd_end_date);
		perschd.setPerschd_title(perschd_title);
		
		
		System.out.println("!!!!!!!!!!"+perschd.toString());
		
		try {
			int  success= myPageService.insertPerschd(perschd);
			if(success == 1){
				message="일정등록에 성공하였습니다.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message",message);
		return "redirect:/admin/mypage/mySchedule";
	}
	
	/**
	 * 일정 삭제★★★★★★★★★★★★★
	 * @param perschd_num
	 * @param session
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/myScheduleDelete")
	public String myScheduleDelete(
			HttpSession session,
			@RequestParam()String perschd_num
			){
		String url="redirect:/admin/mypage/mySchedule";
		String message="일정 삭제를 실패하였습니다.";
		
		try {
			int success = myPageService.deletePerschd(Integer.parseInt(perschd_num));
			if(success != -1){
				message="일정 삭제를 성공하였습니다.";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("message", message);
	
	return "redirect:/admin/mypage/mySchedule";
	}
	
	
	 
	/**
	 * 일정수정 
	 * @param perschd
	 * @param session
	 * @return String
	 */
	@RequestMapping("/myScheduleUpdate")
	public String myScheduleUpdate(
				@RequestParam("perschd_num")Integer perschd_num,
				@RequestParam("perschd_cont")String perschd_cont,
				@RequestParam("perschd_title")String perschd_title,
				@RequestParam("perschd_start_date")String perschd_start_date,
				@RequestParam("perschd_end_date")String perschd_end_date,
//				PerschdVO perschd,
				HttpSession session
			){
		
		String message="";
		PerschdVO perschd = new PerschdVO();
		perschd.setPerschd_num(perschd_num);
		perschd.setPerschd_cont(perschd_cont);
		perschd.setPerschd_title(perschd_title);
		perschd.setPerschd_start_date(perschd_start_date);
		perschd.setPerschd_end_date(perschd_end_date);
		
		
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
				e.printStackTrace();
			}
		
		session.setAttribute("message", message);
		return "redirect:/admin/mypage/mySchedule";
		
	}
	
	

}
