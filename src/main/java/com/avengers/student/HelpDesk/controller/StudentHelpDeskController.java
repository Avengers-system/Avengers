package com.avengers.student.HelpDesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EmpVO;
import com.avengers.student.HelpDesk.service.StudentHelpDeskService;


@Controller
public class StudentHelpDeskController {
	
	@Autowired
	public StudentHelpDeskService service;
	
	
	@RequestMapping("/student/helpDesk/studentFAQList")
	public String studentFAQList(Model model, @ModelAttribute BoardVO boardVO) {
	    //검색조건, 검색어
		
	    //--페이징 처리
	    int totalCount = service.getFAQListCount(boardVO); //게시물 총갯수를 구한다
	    boardVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
	    model.addAttribute("pageVO", boardVO);
	    //--페이징 처리
	    
	  
	    List<BoardVO> empList = service.getFAQList(boardVO);
	    model.addAttribute("resultList", empList);
	  
	    return "/student/helpDesk/studentFAQList";
	    
	}
	
	@RequestMapping("/student/helpDesk/studentFAQDetail")
	public String studentFAQDetail(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo = boardVO.getPageNo();
		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());

		model.addAttribute("detail",detail);
		model.addAttribute("pageNo",pageNo);
		return "/student/helpDesk/studentFAQDetail";
	}

	@RequestMapping("/student/helpDesk/studentFAQUpdatePage")
	public String studentFAQUpdatePage(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo = boardVO.getPageNo();
		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());
		
		model.addAttribute("detail",detail);
		model.addAttribute("pageNo",pageNo);
		return "/student/helpDesk/studentFAQUpdatePage";
	}
	
	@RequestMapping("/student/helpDesk/studentFAQUpdate")
	public String studentFAQUpdate(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo =boardVO.getPageNo();
		service.updateStudentFAQ(boardVO);
		
		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());
		model.addAttribute("detail",detail);
		model.addAttribute("pageNo",pageNo);
		
		return "/student/helpDesk/studentFAQDetail";
	}
	
	@RequestMapping("/student/helpDesk/studentFAQDelete")
	public String studentFAQDelete(Model model, @ModelAttribute BoardVO boardVO){
		boardVO.setPageNo(1);
		service.deleteStudentFAQ(boardVO);
		 //--페이징 처리
	    int totalCount = service.getFAQListCount(boardVO); //게시물 총갯수를 구한다
	    boardVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
	    model.addAttribute("pageVO", boardVO);
	    //--페이징 처리
	    List<BoardVO> empList = service.getFAQList(boardVO);
	    model.addAttribute("resultList", empList);
	  
	    return "/student/helpDesk/studentFAQList";
	}
	
	@RequestMapping("/student/helpDesk/studentFAQWritePage")
	public String studentFAQWritePage(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo =boardVO.getPageNo();
		
		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());
		model.addAttribute("detail",detail);
		
		model.addAttribute("pageNo",pageNo);
		return "/student/helpDesk/studentFAQWritePage";
	}
	
	@RequestMapping("/student/helpDesk/studentFAQWrite")
	public String studentFAQWrite(Model model, @ModelAttribute BoardVO boardVO ){
		boardVO.setPageNo(1);

		
		
		//--페이징 처리
	    int totalCount = service.getFAQListCount(boardVO); //게시물 총갯수를 구한다
	    boardVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
	    model.addAttribute("pageVO", boardVO);
	    //--페이징 처리
	    List<BoardVO> empList = service.getFAQList(boardVO);
	    model.addAttribute("resultList", empList);
		
		
		return "/student/helpDesk/studentFAQList";
	}
		
		
	
	
}
