package com.avengers.admin.main.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.avengers.admin.main.service.AdminMainService;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.db.dto.ScrapplVO;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
   @Autowired
   private AdminMainService adminMainService;
   
   public void setAdminMainService(AdminMainService adminMainService){
      this.adminMainService=adminMainService;
   }
   
   @RequestMapping("/main/adminMain")
   public String main(Principal principal, Model model){
	   String view="admin/main/adminMain";
	   String adminId = principal.getName();//security에 담긴 아이디 가져오기
	   AdminVO adminVO = null; //관리자 정보 가져오기
	   ArrayList<Integer> studStatus = null;//재학생 수, 휴학생 수, 자퇴생 수, 제적생 수
	   ArrayList<LoaVO> untreatedLoaList = null;//미처리된 휴학신청정보 가져오기
	   ArrayList<RtsVO> untreatedRtsList = null;//미처리된 복학신청정보 가져오기
	   ArrayList<PerschdVO> perschdList = null;//개인일정 가져오기
	   ArrayList<Map<String, String>> scrapplList = null; //미처리된 장학신청정보 가져오기
	   ArrayList<Map<String, Object>> prfsOfDeptList = null; //학과당 교수의 가져오기
	   try {
			adminVO = adminMainService.selectAdminInfo(adminId);
			studStatus = adminMainService.getStudStatus();
			untreatedLoaList = adminMainService.getUntreatedLoa(); 
			untreatedRtsList = adminMainService.getUntreatedRts();
			perschdList = adminMainService.getPerschdList(adminId);
			scrapplList = adminMainService.getScrapplList();
			prfsOfDeptList = adminMainService.getPrfsOfDeptList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   model.addAttribute("admin", adminVO);
	   model.addAttribute("studStatus", studStatus);
	   model.addAttribute("untreatedLoaList", untreatedLoaList);
	   model.addAttribute("untreatedRtsList", untreatedRtsList);
	   model.addAttribute("perschdList", perschdList);
	   model.addAttribute("scrapplList", scrapplList);
	   model.addAttribute("prfsOfDeptList", prfsOfDeptList);
	   return view;
   }
   @RequestMapping("/admin/myPage")
   public String myPage(){
      String view="";
//    return redirect:admin/main/adminMain; 다른 RequestMapping으로 이동
      return view;
   }
   @RequestMapping("/admin/studentManage")
   public String studentManage(){
      String view="";
      return view;
   }
   @RequestMapping("/admin/professorManage")
   public String professorManage(){
      String view="";
      return view;
   }
   @RequestMapping("/admin/lectureManage")
   public String lectureManage(){
      String view="";
      return view;
   }
   @RequestMapping("/admin/helpDesk")
   public String helpDesk(){
      String view="";
      return view;
   }
      
}