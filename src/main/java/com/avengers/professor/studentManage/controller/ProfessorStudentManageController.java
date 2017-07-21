package com.avengers.professor.studentManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.CounselInsertVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;
import com.avengers.professor.studentManage.service.ProfessorStudentManageService;

@Controller
@RequestMapping("/professor")
public class ProfessorStudentManageController {

	
	@Autowired
	private ProfessorStudentManageService service;
	
	@RequestMapping("/studentManage/departmentList")
	public String departmentList(Principal principal, Model model, @ModelAttribute PrfsVO prfVO){
		String prfs_num = principal.getName();
		prfVO.setPrfs_num(prfs_num);
		
		 List<StudVO> departmentStudentList =null;
		
	    //--페이징 처리
	    int totalCount=0;
		try {
			totalCount = service.getDepartmentStudentListCount(prfVO);
			prfVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
	    //--페이징 처리
	    departmentStudentList = service.getDepartmentStudentList(prfVO);
	  
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		model.addAttribute("pageVO", prfVO);
	    model.addAttribute("resultList", departmentStudentList);
		

		return "professor/studentManage/departmentList";
	}
	
	
	
	@RequestMapping("/studentManage/departmentDetail")
	public String departmentDetail(@ModelAttribute StudVO studVO, Model model){
		
		String stud_num = studVO.getStud_num();
		int pageNo = studVO.getPageNo();
		StudVO studDetail = null;
		try {
			studDetail = service.selectStud(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("studDetail",studDetail);
		return "professor/studentManage/departmentDetail";
	}

	@RequestMapping("/counsel/counselList")
	public String counselList(Principal principal, Model model){
		System.out.println("tt");
		String prfs_num = principal.getName();
		ArrayList<CnsVO> counselList = null;
		
		try {
			counselList = service.selectCnsList(prfs_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("counselList",counselList);
		return "professor/counsel/counselList";
	}
	
	@RequestMapping("/counsel/counselInsertPage")
	public String counselInsertPage(Principal principal, Model model){
		String prfs_num = principal.getName();
		
		return "professor/counsel/counselInsertPage";
	}
	
	@RequestMapping("/counsel/counselInsert")
	public String counselInsert(@ModelAttribute CounselInsertVO vo, Principal principal, Model model){
		System.out.println(vo.getDate());
		String date = vo.getDate();
		String prfs_num = principal.getName();
		String cns_kind = vo.getKind();
		ArrayList<CnsVO> counselList = null;
		try {
			
			service.counselDateInsert(date,prfs_num,cns_kind);
			counselList = service.selectCnsList(prfs_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		model.addAttribute("counselList",counselList);
		return "professor/counsel/counselList";
	}
	
	@RequestMapping("/counsel/counselDetail")
	public String counselDetail(HttpServletRequest request, Model model){
		String cns_num = request.getParameter("cns_num");
		CnsVO vo = null;
		System.out.println(cns_num);
		try {
			vo = service.cnsDetail(cns_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("cnsDetail",vo);
		return "professor/counsel/counselDetail";
	}
	
	@RequestMapping("/counsel/counselUpdatePage")
	public String counselUpdatePage(HttpServletRequest request, Model model){
		String cns_num = request.getParameter("cns_num");
		CnsVO vo = null;
		System.out.println(cns_num);
		try {
			vo = service.cnsDetail(cns_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("cnsDetail",vo);
		
		return "professor/counsel/counselUpdatePage";
	}
	
	@RequestMapping("/counsel/counselUpdate")
	public String counselUpdate(@ModelAttribute CnsVO cnsVO,  Model model){
		CnsVO vo = null;
		try {
			
			service.updateCns(cnsVO);
			vo = service.cnsDetail(cnsVO.getCns_num());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("cnsDetail",vo);
		return "professor/counsel/counselDetail";
	}
	
}
