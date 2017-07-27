package com.avengers.admin.main.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	   List<HashMap<String, String>> selectLeaveDeptList = null;//학과당 휴학생의 수 가져오기
	   List<HashMap<String, String>> getDropOffDeptList = null;//학과당 자퇴학생의 수 가져오기
	   List<HashMap<String, String>> getReinstatementDeptList = null;//복학한 학생의 수와 학과명
	   ArrayList<String> adminMainDateContent = null;
	   
	   
	   try {
		    adminMainDateContent = adminMainService.selectSchedule(adminId);
			adminVO = adminMainService.selectAdminInfo(adminId);
			studStatus = adminMainService.getStudStatus();
			untreatedLoaList = adminMainService.getUntreatedLoa(); 
			untreatedRtsList = adminMainService.getUntreatedRts();
			perschdList = adminMainService.getPerschdList(adminId);
			scrapplList = adminMainService.getScrapplList();
			prfsOfDeptList = adminMainService.getPrfsOfDeptList();
			selectLeaveDeptList = adminMainService.getLeaveDeptList();
			getDropOffDeptList = adminMainService.getDropOffDeptList();
			getReinstatementDeptList = adminMainService.getReinstatementDeptList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   model.addAttribute("adminMainDateContent",adminMainDateContent);
	   model.addAttribute("admin", adminVO);
	   model.addAttribute("studStatus", studStatus);
	   model.addAttribute("untreatedLoaList", untreatedLoaList);
	   model.addAttribute("untreatedRtsList", untreatedRtsList);
	   model.addAttribute("perschdList", perschdList);
	   model.addAttribute("scrapplList", scrapplList);
	   model.addAttribute("prfsOfDeptList", prfsOfDeptList);
	   model.addAttribute("selectLeaveDeptList",selectLeaveDeptList);
	   model.addAttribute("getDropOffDeptList",getDropOffDeptList);
	   model.addAttribute("getReinstatementDeptList",getReinstatementDeptList);
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
      String view="/admin/main/studentManage";
      return view;
   }
   @RequestMapping("/admin/professorManage")
   public String professorManage(){
	  String view="/admin/main/professorManage";
      return view;
   }
   
    
   @RequestMapping("/professorInsert")
   public String professorInsert(Model model){
	   String view="/admin/professorInsert"; // '/'가 없으면 web-inf/views가 붙음
	   return view;
   }
   
   @RequestMapping("/studentInsert")
   public String studentInsert(Model model){
	   String view = "/admin/studentInsert";
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
