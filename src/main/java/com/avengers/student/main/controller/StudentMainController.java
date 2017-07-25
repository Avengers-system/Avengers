package com.avengers.student.main.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.AdmissionApplicationVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.StudentMainVO;
import com.avengers.db.dto.TlVO;
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
		
		ArrayList<Map<String, String>> classList = new ArrayList<Map<String, String>> () ;
		
		try {
			classList = studentMainService.selectClassList(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("classList", classList);
		
		return view;
	}
	
	@RequestMapping("student/studentMain")
	public String studentMain(Principal principal, Model model, AdmissionApplicationVO admissionVO){
			String studentMainDateContent = null;
		 if(admissionVO==null){
			   admissionVO=new AdmissionApplicationVO();
		   }		  
		   String stud_num = principal.getName();
		   String deptNum = null;
		   
		   ArrayList<BoardVO> studMainSchoolNotice = null;
		   ArrayList<BoardVO> studMainDepartNotice = null;
		   ArrayList<BoardVO> studMainPotalNotice = null;
		   
		   
		   try {
				   deptNum = studentMainService.getDeptNum(stud_num);
				   studMainSchoolNotice = studentMainService.getStudMainSchoolNotice();
			   studMainDepartNotice = studentMainService.getStudMainDepartNotice(deptNum);
				studMainPotalNotice = studentMainService.getStudMainPotalNotice();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		   
		   model.addAttribute("studMainPotalNotice",studMainPotalNotice);
		   model.addAttribute("studMainDepartNotice",studMainDepartNotice);
		   model.addAttribute("studMainSchoolNotice",studMainSchoolNotice);
		   
		   
		   
		   
		   
		   
		   admissionVO.setStud_num(stud_num);
		   int cur_score = 0;
		   try {
			   
			studentMainDateContent = studentMainService.selectSchedule(stud_num);
			List<HashMap<String,String>> cartList=studentMainService.selectCartList(admissionVO);
			List<HashMap<String,String>> lectureList=studentMainService.selectLctList(admissionVO);
			List<HashMap<String,String>> admissionApplicationList=studentMainService.selectTlList(admissionVO);
			StudVO studentInfo = studentMainService.selectStudMaxCrd(stud_num);
			TlVO tlVO = new TlVO();
			tlVO.setTl_stud(stud_num);
			ArrayList<TlVO> tlList = studentMainService.selectTl_LCTList(tlVO);
			for(TlVO tl:tlList){
				LctVO lct =studentMainService.selectLct(tl.getTl_lct());
				cur_score+=Integer.parseInt(lct.getLct_crd());				
			}
			model.addAttribute("scheduleContent",studentMainDateContent);
			model.addAttribute("term","본수강신청");
			model.addAttribute("cartList",cartList);
			model.addAttribute("lectureList",lectureList);
			model.addAttribute("admissionApplicationList",admissionApplicationList);
			model.addAttribute("cur_score",cur_score);
			model.addAttribute("studentInfo",studentInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}			   
		
		
		
		
		
		
		
		
		GregorianCalendar today = new GregorianCalendar ( );
        String lct_yr = Integer.toString(today.get ( today.YEAR ));         
        String lct_qtr = "3";
        int month =  today.get ( today.MONTH ) + 1;
        if(  month>=3&&month<=6){
           lct_qtr="1";
        }else if(month>=9&&month<=12){
           lct_qtr="2";
        }
		StudVO studVO = new StudVO();
		DeptVO deptVO = new DeptVO();
		ArrayList<PerschdVO> perschdList =new ArrayList<PerschdVO>() ;
		ArrayList<StudentMainVO> studentLectureList=new ArrayList<StudentMainVO>() ;
		ArrayList<CnsVO> studentConsult=new ArrayList<CnsVO>() ;
		
		
		ArrayList<BoardVO> selectPortalNoticeList = new ArrayList<BoardVO>();
		ArrayList<BoardVO> selectSchoolNoticeList = new ArrayList<BoardVO>();
		ArrayList<BoardVO> selectDepartmentNoticeList = new ArrayList<BoardVO>();
		ArrayList<PerschdVO> selectSchoolScheduleList = new ArrayList<PerschdVO>();
		String bc_dept = "";
		String allLevelComplete = "";
		try {
	    	
	        
	        
			studVO = studentMainService.selectStudInfo(stud_num);
			deptVO = studentMainService.selectDept(studVO.getStud_dept());
		    bc_dept = "b"+deptVO.getDept_nm();
			perschdList = studentMainService.selectPerschd(stud_num);
			studentLectureList = studentMainService.selectLectureList(stud_num,lct_yr,lct_qtr);
			studentConsult = studentMainService.selectCnsList(stud_num);
			
			selectPortalNoticeList = studentMainService.selectPortalNoticeList();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("studentInfo",studVO);
		model.addAttribute("dept",deptVO);
		model.addAttribute("perschdList", perschdList);
		model.addAttribute("lectureList",studentLectureList);
		model.addAttribute("consultList",studentConsult);
		model.addAttribute("portalNoticeList",selectPortalNoticeList);
		
		return "student/studentMain";
	}
}
