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
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping("/faqNoticeList")
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
		
		return "admin/helpDesk/faqNotice";
		
	}
	
	/**
	 * portal게시판조회
	 * 
	 * */
	@RequestMapping("/portalNoticeList")
	public String adminPortalList(Model model, Principal principal){
		
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
		model.addAttribute("portalNoticeList", boardList);
		
		return "admin/helpDesk/portalNotice";
		
	}
	
	
//	@RequestMapping("/insertDeptBoard")
//	public String adminDeptWrite(Model model, Principal principal){
//		
//
//	  	BoardVO boardVO = new BoardVO();
//	  	String key = principal.getName();
//	  	String bc_num = "UNIV";
//	  	boardVO.setBoard_bc(bc_num);
//	  	boardVO.setBoard_writer(key);
//	  	int insertBoard =0;
//	  	try {
//			insertBoard= adminHelpDeskService.insertBoard(boardVO);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	  	model.addAttribute("insertDeptBoard",insertBoard);
//	  	
//	  	return "admin/helpDesk/deptWrite";
//	    
//	}
	/**
	 * 학과등록하기
	 * 
	 * **/
	
	// 입력받는 곳
	@RequestMapping("/insertDeptBoard")
	public String insertDeptBoard(@ModelAttribute BoardVO boardVO, Model model, String bc_num){
		
		return "admin/helpDesk/deptWrite";
	}
	
	/**
	 * 학과등록내용보내기
	 * 
	 * **/
	@RequestMapping("/insertDeptBoard2")
	public String insertDeptBoard2(@ModelAttribute BoardVO boardVO, Model model, 
			@RequestParam("bc_num")String bc_num){
		
		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "admin/helpDesk/deptWrite";
	}
	
	
	/**
	 * 포털게시판 수정하기
	 * 
	 * */
	
	/**
	 * Faq등록하기
	 * 
	 * **/
	// 입력받는 곳
	@RequestMapping("/insertFaqBoard")
	public String insertFaqBoard(@ModelAttribute BoardVO boardVO, Model model, String bc_num){
		
//		boardVO.setBoard_title(bc_num);
//		boardVO.setBoard_cont(bc_num);
//		boardVO.setBoard_writer(bc_num);
//		boardVO.setBoard_bc(bc_num);
//		
//		try {
//			adminHelpDeskService.insertBoard(boardVO);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		return "admin/helpDesk/faqWrite";
	}
	
	/**
	 * 학과등록내용보내기
	 * 
	 * **/
	@RequestMapping("/insertFaqBoard2")
	public String insertFaqBoard2(@ModelAttribute BoardVO boardVO, Model model, String bc_num){
		
//		boardVO.setBoard_title(bc_num);
//		boardVO.setBoard_cont(bc_num);
//		boardVO.setBoard_writer(bc_num);
//		boardVO.setBoard_bc(bc_num);
		
		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "admin/helpDesk/faqWrite";
	}
	
	@RequestMapping("/portalDetail")
	public String detailPortal(@RequestParam("board_num")String board_num, Model model){
		BoardVO boardVo=null;
		try {
			 boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList",boardVo);
		return "admin/helpDesk/portalDetail";
	}
}
