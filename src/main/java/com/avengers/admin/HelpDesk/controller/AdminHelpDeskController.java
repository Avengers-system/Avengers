package com.avengers.admin.HelpDesk.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.db.dto.BoardVO;

@RequestMapping("/admin")
@Controller
public class AdminHelpDeskController {
	
	@Autowired
	private AdminHelpDeskService adminHelpDeskService;
		
	
	/**
	 * 학과게시판조회
	 * 
	 * */
	@RequestMapping("/deptNoticeList")
	public String adminDeptList(Model model, Principal principal){
		
		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		
		String key = principal.getName();
		String bc_num = "PORTAL";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		try {
			boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptNoticeList", boardList);
		
		return "admin/helpDesk/deptNotice";
		
	}
	
	/**
	 * faq게시판조회
	 * 
	 * */
	@RequestMapping("/deptNoticeList")
	public String adminFaqList(Model model, Principal principal){
		
		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		
		String key = principal.getName();
		String bc_num = "UNIV";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		try {
			boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqNoticeList", boardList);
		
		return "admin/helpDesk/faqNoticeList";
		
	}
	/**
	 * 교수등록하기
	 * 
	 * **/
	
	@RequestMapping("/insertDeptBoard")
	public String insertDeptBoard(@ModelAttribute BoardVO boardVO, Model model, String bc_num){
		
		try {
			adminHelpDeskService.insertBoard(boardVO, bc_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "admin/helpDesk";
		
		
	}
}
