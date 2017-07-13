package com.avengers.admin.professorManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.avengers.admin.professorManage.service.AdminProfessorManageService;
import com.avengers.db.dto.CommandPrfsVO;
import com.avengers.db.dto.PrfsVO;

@Controller
public class AdminProfessorManageController {
 
	@Autowired
	private AdminProfessorManageService adminProfessorManageService;
	
	/**
	 * 교수리스트 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("/adminProfessorManage")
	public String professorList(Principal principal, Model model){
		
		List<PrfsVO> professorList = null;
		
		String key = principal.getName();
		try {
			professorList = adminProfessorManageService.selectPrfsList(key, 1, 10);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("professorList",professorList);
		
		return "admin/adminProfessorManage.jsp";
	}

	
	/**
	 * 교수등록하기
	 * @param prfsVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/insertProfessor", headers=("content-type=multipart/*"))
	//자동으로 매핑~
	public String insertProfessor(@ModelAttribute PrfsVO prfsVO,
								  HttpServletRequest request,
								  @RequestParam("prgs_pic") MultipartFile multipartFile){ 
//									Model model,){
//									CommandMap commandMap){
		
		//깃 경로를 써야한다고 함
		String upload = request.getSession().getServletContext().getRealPath("/resource/upload");

		
		 if(!multipartFile.isEmpty()){
	            File file= new File(upload, multipartFile.getOriginalFilename()+"$$"+System.currentTimeMillis());
	    
	            CommandPrfsVO commandPrfsVO = new CommandPrfsVO();
	            prfsVO = commandPrfsVO.toPrfsVO();
	            
	         try {
	            multipartFile.transferTo(file);
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	            
	         }

		 System.out.println("성공");
	      
	      int result=0;
	   		
		
		try {
			adminProfessorManageService.insertPrfs(prfsVO);
			//security에도 enabled와 role정보 추가해주기
			adminProfessorManageService.insertSecurity(prfsVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		model.addAttribute("prfsVO",prfsVO);
		return "redirect:/admin/adminProfessorManage.jsp";
	}
}
