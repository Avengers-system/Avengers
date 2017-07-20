package com.avengers.admin.professorManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.avengers.admin.professorManage.service.AdminProfessorManageService;
import com.avengers.db.dto.CommandPrfsVO;
import com.avengers.db.dto.PrfsVO;

@Controller
@RequestMapping("/admin")
public class AdminProfessorManageController {

	@Autowired
	private AdminProfessorManageService adminProfessorManageService;

	/**
	 * 교수리스트 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("/professorManage")
	public String professorList(Principal principal, Model model) {

		List<PrfsVO> professorList = null;

		// key??
		String key = principal.getName();
		try {
//			professorList = adminProfessorManageService.selectPrfsList(key, 1,	10);
			professorList = adminProfessorManageService.selectPrfsList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("professorList", professorList);

		return "admin/main/professorManage";
	}

	
	/**
	 * 교수 상세보기
	 * @param prfs_num
	 * @param model
	 * @return
	 */
	@RequestMapping("/professorManage/detail")
	public String professorDetail(
			@RequestParam("prfs_num") String prfs_num,
			Model model){
		PrfsVO prfsVO = new PrfsVO();
		try {
			prfsVO = adminProfessorManageService.selectPrfs(prfs_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("professor",prfsVO);
		return "admin/professorDetail";
	}
	
	/**
	 * 교수 삭제하기 
	 * @param prfs_num
	 * @return
	 */
	@RequestMapping("/deleteProfessor")
	public String deleteProfessor(@RequestParam("prfs_num") String prfs_num,
									Model model){
		if(prfs_num!=null || prfs_num!=""){
			
			try {
				adminProfessorManageService.deletePrfs(prfs_num);
				System.out.println(prfs_num + "번 교수 삭제!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//enabled 만 1로 바꾸면 됨 
			String msg = "삭제 완료되었습니다.";
			model.addAttribute("msg",msg);
		}
	return "admin/main/professorManage";	
	}
	
	/**
	 * 교수수정하기 
	 * @param commandPrfsVO
	 * @param prfs_num
	 * @param request
	 * @param multipartFile
	 * @return
	 */
	@RequestMapping(value = "/professorManage/update")
	public String updateProfessor(
						CommandPrfsVO commandPrfsVO,
						@RequestParam("prfs_num") String prfs_num,
						MultipartHttpServletRequest request,
						@RequestParam("prfs_pic") MultipartFile multipartFile
						){
		
		String upload = "C:/Users/pc15/git/Avengers/src/main/webapp/resources/admin_professor_images/"
				+ multipartFile.getOriginalFilename();
		
		if (!multipartFile.isEmpty()) {
			File file = new File(upload, multipartFile.getOriginalFilename()+"$$"+ System.currentTimeMillis());

			PrfsVO prfsVO = new PrfsVO();
			prfsVO = commandPrfsVO.toPrfsVO();
			try {
				multipartFile.transferTo(file); // 깃 위치로 전송
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			} 
			
			try {
				adminProfessorManageService.updatePrfs(prfsVO, prfs_num);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
			System.out.println("성공");
		}
		
		return "admin/main/professorManage";
	}
	
	
	/**
	 * 교수등록하기
	 * @param prfsVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/insertProfessor")
	public String insertProfessor(CommandPrfsVO commandPrfsVO,
			HttpSession session	){

		PrfsVO prfsVO = commandPrfsVO.toPrfsVO();		

		//System.out.println("학과 :  "+prfsVO.getPrfs_dept());
		//System.out.println("생년월일 :  "+prfs_bir);

		//SimpleDateFormat sdf1 = new SimpleDateFormat("yy-mm-dd");
		//SimpleDateFormat sdf2 = new SimpleDateFormat("yy/mm/dd");
	    //String input = prfs_bir;
	    
	    /*try {
			Date date = sdf1.parse(input);
			System.out.println(sdf2.format(date));
			String date2 = sdf2.format(date);
			date = sdf2.parse(date2);
			prfsVO.setPrfs_bir(date);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}*/

	    
		// 깃 경로 (동일)
		String upload = session.getServletContext().getRealPath("resources/admin_professor_images");		
		
		if (!prfsVO.getPrfs_pic().isEmpty()) {
			File file = new File(upload, prfsVO.getPrfs_pic());
 
			try {
				commandPrfsVO.getPrfs_pic().transferTo(file); // 깃 위치로 전송
				
				adminProfessorManageService.insertPrfs(prfsVO);
				
				prfsVO.setPrfs_num(adminProfessorManageService.selectPrfsNum());
				adminProfessorManageService.insertSecurity(prfsVO);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
			System.out.println("성공");
		}

		return "admin/main/professorManage"; // redirect??
	}
	
}
