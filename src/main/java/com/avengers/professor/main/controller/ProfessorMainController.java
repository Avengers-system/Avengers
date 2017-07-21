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
		   
		   
		   //오늘 날짜를 구해서 현재학기,현재년도를 구하기 위함입니다. 이걸 왜구하냐? 강의현황부분에서 현재년도,현재학기에 진행중인 강의만 보여줘야하기때문이죠
		   GregorianCalendar today = new GregorianCalendar ( );
		   String view= "/professor/professorMain";
		   
		   //principal 즉 세큐리티에서 로그인한 교수의 아이디를 가져오는 부분입니다.
		   String prfs_num = principal.getName();
		   //위에서 언급했던 현재년도를 구하는겁니다.
		   String lct_yr = Integer.toString(today.get ( today.YEAR ));	
		   //위에서 언급했던 현재 학기를 구하는 로직입니다. null값이 들어가면 오류가나기때문에 디폴트값은 3으로 지정해줍니다.
		   String lct_qtr = "3";
		   int month =  today.get ( today.MONTH ) + 1; //이함수가 월이 0부터11까지여서 우리식으로 계산하기위해 +1을해줍니다.
		   //3월~6월사이면 1학기 9월~12월사이면 2학기라고 지정해주는 로직입니다.
		   if(  month>=3&&month<=6){
			   lct_qtr="1";
		   }else if(month>=9&&month<=12){
			   lct_qtr="2";
		   }
		   
		try {
			//위에서 구했던 교수 아이디로 해당교수의 정보를 구하는 로직이다.
			PrfsVO prfs = professorMainService.selectPrfs(prfs_num);
			
			//이친구가 꽤나 중요한 친군데 우리가 학과공지게시판을 로그인한 본인의 학과공지게시판만 보여주기때문에 이 로그인한 친구가
			//어느학과인지를 구하는 로직이다. 위에서 구한 해당교수정보에서 해당교수의 학과를 입력하여 학과정보들을 가져오고 
			//dept.getDept_nm()으로 최종적으로 학과이름을 구한다. BOARD 게시판에서 각 학과공지게시판을 구별하는 BC코드가
			//b+학과이름 이기에 아래와 같은 처리를해준다.String bc_dept = "b"+dept.getDept_nm();
			DeptVO dept = professorMainService.selectDept(prfs.getPrfs_dept());
			String bc_dept = "b"+dept.getDept_nm();
			
			//아래로직들은 모두 그저 보여주기위해 필요한 정보를 검색해서 model.addAttribute로 넣어주는 단순반복 작업에 지나지않는다.
			//그냥 아~ 이렇게 쓰면 이렇게 들어가는구나 하고 알아두기만 하길 바란다.
			ArrayList<PerschdVO> perschdList = professorMainService.selectPerschdList(prfs_num);
			List<HashMap<String,String>> lctList= professorMainService.selectLctList(prfs_num, lct_yr, lct_qtr);
			ArrayList<CnsVO> cnsList  = professorMainService.selectCnsList(prfs_num);
			ArrayList<BoardVO> portalNoticeList  = professorMainService.selectPortalNoticeList();
//			ArrayList<BoardVO> schoolNoticeList  = professorMainService.selectSchoolNoticeList();
//			ArrayList<BoardVO> departmentNoticeList  = professorMainService.selectDepartmentNoticeList(bc_dept);
			ArrayList<PerschdVO> schoolScheduleList  = professorMainService.selectSchoolScheduleList();
			model.addAttribute("prfs",prfs );
			model.addAttribute("perschdList",perschdList );
			model.addAttribute("lctList",lctList );
			model.addAttribute("cnsList",cnsList );
			model.addAttribute("portalNoticeList",portalNoticeList );
//			model.addAttribute("schoolNoticeList",schoolNoticeList );
//			model.addAttribute("departmentNoticeList",departmentNoticeList );
			model.addAttribute("schoolScheduleList",schoolScheduleList );
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e){
			return view;
			
		}
		   return view;
	   }
	   
	   
	   
}
