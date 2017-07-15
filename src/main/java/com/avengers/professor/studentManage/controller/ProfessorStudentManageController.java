package com.avengers.professor.studentManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.CounselInsertVO;
import com.avengers.db.dto.StudVO;
import com.avengers.professor.studentManage.service.ProfessorStudentManageService;

@Controller
@RequestMapping("/professor")
public class ProfessorStudentManageController {

	
	@Autowired
	private ProfessorStudentManageService service;
	
	@RequestMapping("/studentManage/departmentList")
	public String departmentList(Principal principal, Model model){
		String prfs_num = principal.getName();
		ArrayList<StudVO> departmentStudentList = null;
		try {
			departmentStudentList = service.selectStudList(prfs_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("departmentStudentList",departmentStudentList);
		return "professor/studentManage/departmentList";
	}
	
	@RequestMapping("/studentManage/departmentDetail")
	public String departmentDetail(HttpServletRequest request, Model model){
		String stud_num = request.getParameter("stud_num");
		StudVO studDetail = null;
		try {
			studDetail = service.selectStud(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
