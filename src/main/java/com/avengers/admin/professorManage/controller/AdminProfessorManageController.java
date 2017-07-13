package com.avengers.admin.professorManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avengers.admin.main.service.AdminMainService;
import com.avengers.admin.professorManage.service.AdminProfessorManageService;
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
		
		PrfsVO professorVO = null;
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
	@RequestMapping("/insertProfessor")
	//자동으로 매핑~
	public String insertProfessor(@ModelAttribute PrfsVO prfsVO, Model model){
	
		try {
			adminProfessorManageService.insertPrfs(prfsVO);
			//security에도 enabled와 role정보 추가해주기
			adminProfessorManageService.insertSecurity(prfsVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("prfsVO",prfsVO);
		return "admin/adminProfessorManage.jsp";
	}
}
