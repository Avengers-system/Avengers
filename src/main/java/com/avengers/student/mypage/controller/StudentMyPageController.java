package com.avengers.student.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.PerschdVO;
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
	

	/**
	 * 학생개인일정
	 * 
	 * @return
	 */
	@RequestMapping("/studSchd/studSchedule")
	public String studentSchedule(
			Principal principal,
			HttpSession session,
			Model model			
			){

		String scheduleId = principal.getName();
		ArrayList<PerschdVO> perschdList = null;
		ArrayList<PerschdVO> perschdList2 = new ArrayList<PerschdVO>();

		String url = "student/studSchd/studSchedule";
		String message="";

		try {
			perschdList = service.selectPerschdList(scheduleId);
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
				perschdVO.setPerschd_end_date(end_date);
				perschdList2.add(perschdVO);
			}
			if (perschdList != null) {
				model.addAttribute("perschdList", perschdList2);
				message="학생일정이 조회되었습니다.";
			}else{
				message="입력된 학생일정이 없습니다";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);
		return url;
	}

	/**
	 * 학생일정 세부조회
	 * @param perschd_num
	 * @param model
	 * @return string
	 */
	@RequestMapping("/studSchd/studScheduleDetail")
	@ResponseBody
	public PerschdVO studScheduleDetails(

			String perschd_title,
			HttpSession session,
			Model model
			){
		String message = "";
		PerschdVO perschd = new PerschdVO();
		if (perschd!=null) {
			perschd = service.selectPerschd_title(perschd_title);
			message = "해당날짜에 등록된 일정이 없습니다";
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
	
	@RequestMapping("/studScheduleInsert")
	public String studScheduleInsert(
				PerschdVO perschd,
				Principal who,
				HttpSession session,
				@RequestParam("PERSCHD_START_DATE")String perschd_start_date,
				@RequestParam("PERSCHD_END_DATE")String perschd_end_date,
				@RequestParam("PERSCHD_TITLE")String perschd_title,
				@RequestParam("PERSCHD_CONT")String perschd_cont
			){
		String message="일정등록을 실패하였습니다";
		
		perschd.setPerschd_writer(who.getName());
		perschd.setPerschd_cont(perschd_cont);
		perschd.setPerschd_start_date(perschd_start_date);
		perschd.setPerschd_end_date(perschd_end_date);
		perschd.setPerschd_title(perschd_title);
		
		try {
			int success = service.insertPerschd(perschd);
			if (success == 1) {
				message = "일정등록에 성공하였습니다.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);
		
		return "redirect:/student/mypage/studSchd/studSchedule";
	}
	
	/**
	 * 일정 삭제★★★★★★★★★★★★★
	 * @param perschd_num
	 * @param session
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/studSchd/studScheduleDelete")
	public String studScheduleDelete(
			
			HttpSession session,
			@RequestParam()String perschd_num
			){
		String url="redirect:/student/mypage/studSchd/studSchedule";
		String message="일정삭제를 실패하였습니다.";
		
		try {
			int success = service.deletePerschd(Integer.parseInt(perschd_num));
			if (success != -1) {
				message = "일정삭제를 성공하였습니다";
			}
		} catch (SQLException e) {
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
		
		@RequestMapping("/studSchd/studScheduleUpdate")
		public String studScheduleUpdate(
				
				@RequestParam("perschd_num")Integer perschd_num,
				@RequestParam("perschd_cont")String perschd_cont,
				@RequestParam("perschd_title")String perschd_title,
				@RequestParam("perschd_start_date")String perschd_start_date,
				@RequestParam("perschd_end_date")String perschd_end_date,
				HttpSession session
				){
			String url="redirect:/student/mypage/studSchd/studSchedule";
			
			String message="";
			PerschdVO perschd = new PerschdVO();
			perschd.setPerschd_num(perschd_num);
			perschd.setPerschd_cont(perschd_cont);
			perschd.setPerschd_title(perschd_title);
			perschd.setPerschd_start_date(perschd_start_date);
			perschd.setPerschd_end_date(perschd_end_date);
			
			
			try {
				int success = service.updatePerschd(perschd);
				
					if (success !=-1) {
						message = "일정 수정을 성공하였습니다.";
					}else if (success == -1) {
						message = "일정 수정을 실패하였습니다.";
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			session.setAttribute("message", message);
			return url;
		}
	
}
