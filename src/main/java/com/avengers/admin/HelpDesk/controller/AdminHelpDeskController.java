package com.avengers.admin.HelpDesk.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	 * helpDeskMain 페이지
	 * 
	 * */
		@RequestMapping("/main/helpDeskMain1")
	public String helpDeskMain(Model model, Principal principal){
			
			String key = principal.getName();
			
			//학부테이블
			BoardVO collegeVO = new BoardVO();
			ArrayList<BoardVO> collegeList = new ArrayList<BoardVO>();
			String col_num = "";
			collegeVO.setBoard_bc(col_num);
			collegeVO.setBoard_writer(key);
			
			//학교정보테이블
			BoardVO boardVO1 = new BoardVO();
			ArrayList<BoardVO> boardList1 = new ArrayList<BoardVO>();
			String bc_num1="UNIV";
			boardVO1.setBoard_bc(bc_num1);
			boardVO1.setBoard_writer(key);
			
			//학과테이블
			BoardVO boardVO1 = new BoardVO();
			ArrayList<BoardVO> boardList1 = new ArrayList<BoardVO>();
			String bc_num1="UNIV";
			boardVO1.setBoard_bc(bc_num1);
			boardVO1.setBoard_writer(key);
			try {
				boardList = adminHelpDeskService.selectBoardList(boardVO,1,2);
				boardList1 = adminHelpDeskService.selectBoardList(boardVO1,1,2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			//포털정보테이블
//			//학사
			model.addAttribute("collegeNoticeList", boardList);
//			//Q&A
//			model.addAttribute("qnaNoticeList", boardList);
//			//FAQ
//			model.addAttribute("faqNoticeList", boardList);
//			//학교
			model.addAttribute("schoolNoticeList", boardList1);
			
		return "admin/main/helpDeskMain";
	}

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
	@RequestMapping("portalNoticeList")
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
		System.out.println(boardList.get(0).getBoard_date());
		return "admin/helpDesk/portalNotice";
		
	}
	
	/**
	 * 포털게시판  글쓰기
	 * 
	 * */
	
	@RequestMapping("/portalWriteForm")
	public String adminPortalWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;
		
		System.out.println("controller" + bc_num);
		try {
			 boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);
		
		System.out.println(boardVo.getBoard_num()+"controller");
			 return "admin/helpDesk/portalWrite";
	}
	
	/**
	 * 포털게시판  글쓰기
	 * 
	 * */
	
	@RequestMapping("/portalWrite")
	public String adminPortalWrite(HttpServletRequest req, Model model,
			String bc_num){
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc(req.getParameter("board_bc"));
		
		System.out.println(boardVO.getBoard_cont()+"service");
		
		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			 return "redirect:portalNoticeList";
	}
	
	/**
	 * 포털 update
	 * **/
	
	@RequestMapping("/portalUpdate")
	public String portalUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			adminHelpDeskService.updateBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:portalNoticeList";
	}
		
	@RequestMapping("portalDelete")
	public String portalDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:portalNoticeList";
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
