package com.avengers.student.main.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.StudentMainVO;
import com.avengers.student.main.service.StudentMainService;

/**
 * 학생 메인 화면
 * StudentMainController
 * @author 이진영
 * 최초작성 2017.07.12
 */
@Controller
public class StudentMainController {

	
	@Autowired
	private StudentMainService studentMainService;
	
	
	@RequestMapping("student/classManage/classMain")
	public String studentClassManage(Principal principal, Model model){
		String view = "student/classManage/classMain";
		
		String stud_num = principal.getName();
		
		ArrayList<Map<String, String>> classList = null;
		
		try {
			classList = studentMainService.selectClassList(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("classList", classList);
		
		return view;
	}
	
	@RequestMapping("student/studentMain")
	public String studentMain(Principal principal, Model model){
		GregorianCalendar today = new GregorianCalendar ( );
        String lct_yr = Integer.toString(today.get ( today.YEAR ));         
        String lct_qtr = "3";
        int month =  today.get ( today.MONTH ) + 1;
        if(  month>=3&&month<=6){
           lct_qtr="1";
        }else if(month>=9&&month<=12){
           lct_qtr="2";
        }
		String stud_num = principal.getName();
		StudVO studVO = null;
		DeptVO deptVO = null;
		ArrayList<PerschdVO> perschdList =null;
		ArrayList<StudentMainVO> studentLectureList=null;
		ArrayList<CnsVO> studentConsult=null;
		
		ArrayList<BoardVO> selectPortalNoticeList = null;
		ArrayList<BoardVO> selectSchoolNoticeList = null;
		ArrayList<BoardVO> selectDepartmentNoticeList = null;
		ArrayList<PerschdVO> selectSchoolScheduleList = null;
		String bc_dept = "";
		String allLevelComplete = "";
		try {
	    	
	        
	        
			studVO = studentMainService.selectStudInfo(stud_num);
			deptVO = studentMainService.selectDept(studVO.getStud_dept());
		    bc_dept = "b"+deptVO.getDept_nm();
//			perschdList = studentMainService.selectPerschd(stud_num);
//			studentLectureList = studentMainService.selectLectureList(stud_num,lct_yr,lct_qtr);
//			studentConsult = studentMainService.selectCnsList(stud_num);
//			
//			selectPortalNoticeList = studentMainService.selectPortalNoticeList();
//			selectSchoolNoticeList = studentMainService.selectSchoolNoticeList();
//			selectDepartmentNoticeList = studentMainService.selectDepartmentNoticeList(bc_dept);
//			selectSchoolScheduleList = studentMainService.selectSchoolScheduleList();
			
//			allLevelComplete = studentMainService.allGrades(stud_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("studentInfo",studVO);
		model.addAttribute("dept",deptVO);
		model.addAttribute("perschdList", perschdList);
		model.addAttribute("lectureList",studentLectureList);
		model.addAttribute("consultList",studentConsult);
		model.addAttribute("portalNoticeList",selectPortalNoticeList);
        model.addAttribute("schoolNoticeList",selectSchoolNoticeList);
        model.addAttribute("departmentNoticeList",selectDepartmentNoticeList);
        model.addAttribute("schoolScheduleList",selectSchoolScheduleList);
//		model.addAttribute("allGrades",allLevelComplete);
		
		return "student/studentMain";
	}
}
