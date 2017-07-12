package com.avengers.professor.main.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.main.serviceImpl.ProfessorMainServiceImpl;

@Controller
@RequestMapping("/professor")
public class ProfessorMainController {
	   @Autowired
	   private ProfessorMainServiceImpl professorMainService;
	   
	   public void setAdminMainService(ProfessorMainServiceImpl professorMainService){
	      this.professorMainService=professorMainService;
	   }

	   @RequestMapping("/main")
	   public String professorMain(Model model,Principal principal){
		   
		   GregorianCalendar today = new GregorianCalendar ( );
		   String view= "/professor/professorMain";
		   String prfs_num = principal.getName();
		   String lct_yr = Integer.toString(today.get ( today.YEAR ));		   
		   String lct_qtr = "3";
		   int month =  today.get ( today.MONTH ) + 1;
		   if(  month>=3&&month<=6){
			   lct_qtr="1";
		   }else if(month>=9&&month<=12){
			   lct_qtr="2";
		   }
		   
		try {		
			PrfsVO prfs = professorMainService.selectPrfs(prfs_num);
			
			DeptVO dept = professorMainService.selectDept(prfs.getPrfs_dept());
			String bc_dept = "b"+dept.getDept_nm();
			
			ArrayList<PerschdVO> perschdList = professorMainService.selectPerschdList(prfs_num);
			List<HashMap<String,String>> lctList= professorMainService.selectLctList(prfs_num, lct_yr, lct_qtr);
			ArrayList<CnsVO> cnsList  = professorMainService.selectCnsList(prfs_num);			
			ArrayList<BoardVO> portalNoticeList  = professorMainService.selectPortalNoticeList();
			ArrayList<BoardVO> schoolNoticeList  = professorMainService.selectSchoolNoticeList();
			ArrayList<BoardVO> departmentNoticeList  = professorMainService.selectDepartmentNoticeList(bc_dept);
			ArrayList<PerschdVO> schoolScheduleList  = professorMainService.selectSchoolScheduleList();
			model.addAttribute("prfs",prfs );
			model.addAttribute("perschdList",perschdList );
			model.addAttribute("lctList",lctList );
			model.addAttribute("cnsList",cnsList );
			model.addAttribute("portalNoticeList",portalNoticeList );
			model.addAttribute("schoolNoticeList",schoolNoticeList );
			model.addAttribute("departmentNoticeList",departmentNoticeList );
			model.addAttribute("schoolScheduleList",schoolScheduleList );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   return view;
	   }
	   
	   
	   
}
