package com.avengers.student.classManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.SubVO;
import com.avengers.student.classManage.service.StudentClassManageService;

@Controller
public class StudentClassManageController {

	@Autowired
	public StudentClassManageService scmService;
	
	public void setScmService(StudentClassManageService scmService){
		this.scmService = scmService;
	}
	
	/**
	 * 강의메인
	 * @param request
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("student/classManage/lectureMain")
	public String studentLectureMain(HttpServletRequest request){
		String view = "student/classManage/lectureMain";
		
		HttpSession session = request.getSession();
		if(request.getParameter("lct_num")!=null && !request.getParameter("lct_num").equals("")){
			session.setAttribute("lct_num", request.getParameter("lct_num"));
		}
		
		return view;
	}
	
	/**
	 * 강의리스트를 보여주는 화면
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("student/classManage/lecture")
	public String studentLecture(Principal principal, Model model){
		String view = "student/classManage/lecture";
		
		return view;
	}
	
	/**
	 * 강의계획서 화면
	 * @param request
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("student/classManage/lectureDetail")
	public String studentLectureDetail(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureDetail";
		
		String lct_num = (String) request.getSession().getAttribute("lct_num");
		Map<String, String> detailLct = null;
		try {
			detailLct = scmService.selectDetailLct(lct_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String[] textbook = detailLct.get("lct_tb").split("/");
		
		
		model.addAttribute("detailLct", detailLct);
		model.addAttribute("textbook", textbook);
		
		return view;
	}
	
	/**
	 * 시험리스트를 보여주는 화면
	 * @param request
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("student/classManage/lectureExam")
	public String studentExamMain(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureExam";
		
		String te_stud = principal.getName();
		
		ArrayList<Map<String, String>> examList = null;
		
		Map<String,String> key = new HashMap<String, String>();
		
		key.put("te_stud", te_stud);
		key.put("lct_num", (String) request.getSession().getAttribute("lct_num"));
		try {
			examList = scmService.selectExamList(key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("examList", examList);
		
		return view;
	}
	
	/**
	 * 시험응시화면
	 * @param request
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("student/classManage/lectureTakeExam")
	public String studentLectureTe(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureTakeExam";
		
		String exam_num = request.getParameter("exam_num");
		String lct_num = (String) request.getSession().getAttribute("lct_num");
		ArrayList<EqVO> eqList = null;
		
		try {
			eqList = scmService.selectEqList(exam_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		
		model.addAttribute("eqList", eqList);
		model.addAttribute("te_num",request.getParameter("te_num"));
		
		return view;
	}
	
	/**
	 * ajax로 받아온 데이터를 insert 및 update
	 * @param request
	 * @param principal
	 * @param model
	 * @param qtnaArr
	 * @param answerArr
	 * @param lct_num
	 * @param te_num
	 */
	@RequestMapping(value="student/classManage/lectureExamSubmit", method = RequestMethod.POST)
	@ResponseBody
	public void studentLectureExamSubmit(HttpServletRequest request, Principal principal, Model model,
											@RequestParam(value="qtnaArr[]") List<String> qtnaArr,
											@RequestParam(value="answerArr[]") List<String> answerArr,
											@RequestParam(value="lct_num") String lct_num,
											@RequestParam(value="te_num") String te_num){
		//학생이 푼 정답 저장하고
		ArrayList<Map<String, String>> saList = new ArrayList<Map<String, String>>();
		for(int i=0; i<qtnaArr.size(); i++){
			Map<String, String> temp = new HashMap<String, String>();
			temp.put("qtna", qtnaArr.get(i));
			temp.put("ans", answerArr.get(i));
			temp.put("te", te_num);
			saList.add(temp);
		}
		
		//학생의 응시여부 업데이트 시키고
		String te_stud = principal.getName();
		try {
			scmService.insertSa(saList);
			scmService.updateTeCheck(te_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 시험응시화면에서 제출버튼을 누르면 시험리스트화면으로 돌아감
	 * @param request
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping(value="student/classManage/lectureExamSubmit", method = RequestMethod.GET)
	public String studentLectureExamSubmit(HttpServletRequest request, Principal principal, Model model){
		String view = "redirect:lectureExam?lct_num="+(String) request.getSession().getAttribute("lct_num");
		return view;
	}
	
	/**
	 * 과목리스트를 보여주는 화면
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping(value="student/classManage/lectureAsgn")
	public String studentLectureAsgn(HttpServletRequest request,Principal principal, Model model){
		String view = "student/classManage/lectureAsgn";
	
		Map<String, String> key = new HashMap<String,String>();
		ArrayList<Map<String, String>> asgnList = null;
		key.put("lct_num", (String) request.getSession().getAttribute("lct_num"));
		key.put("stud_num", principal.getName());
		
		try {
			asgnList = scmService.selectAsgnList(key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("asgnList", asgnList);
		return view;
	}
	
	@RequestMapping(value="student/classManage/lectureAsgnDetail")
	public String studentLectureSubmitAsgn(HttpServletRequest request, Principal principal, Model model){
		String view = "student/classManage/lectureAsgnDetail";
		
		String asgn_num = request.getParameter("asgn_num");
		String stud_num = principal.getName();
		
		Map<String, String> key = new HashMap<String, String>();
		Map<String, String> asgnInfo = null;
		key.put("asgn_num", asgn_num);
		key.put("stud_num", stud_num);
		
		try {
			asgnInfo = scmService.selectAsgnInfo(key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("asgn", asgnInfo);
		model.addAttribute("asgn_num", asgn_num);
		
		return view;
	}
	
	@RequestMapping(value="student/classManage/lectureAsgnSubmit")
	public String studentLectureAsgnSubmit(HttpServletRequest request, Principal principal ){
		SubVO subVO = new SubVO();
		subVO.setSub_title((String)request.getParameter("sub_title"));
		subVO.setSub_cont((String)request.getParameter("sub_cont"));
		subVO.setSub_stud(principal.getName());
		subVO.setSub_asgn((String)request.getParameter("asgn_num"));
		
		int result = -1;
		try {
			result = scmService.updateSubmissionCheck(subVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String message = null;
		if(result > 0){
			message = "정상적으로 완료되었습니다.";
		} else {
			message = "비정상적으로 종료되었습니다.";
		}
		return "redirect:lectureAsgn";
	}
	
	@RequestMapping(value="student/classManage/StudExamTimeCheck")
	@ResponseBody
	public String studentExamTimeCheck(@RequestParam(value="exam_num")String exam_num){
		Map<String, String> examTimeInfo = null;
		int result = 0;
		try {
			examTimeInfo = scmService.selectExamTimeInfo(exam_num);
			if(examTimeInfo == null || examTimeInfo.isEmpty()){
				return "-1";
			}
			
			//시험시작일을 비교하기 위해 dateFormat사용
			//년/월/일 시:분 ==> 대소문자 정확하게 써줘야 정확한 date가 나옴
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm", Locale.KOREA);
			
			//시험시작시간과 종료시간을 변수에 저장
			String startTime = examTimeInfo.get("start_time");
			String endTime = examTimeInfo.get("end_time");
			
			System.out.println(startTime);
			System.out.println(endTime);
			//String -> Date
			Date startDateTime = new Date();
			Date endDateTime = new Date();
			Date currentDateTime = new Date();
			
			startDateTime = dateFormat.parse(startTime);
			endDateTime = dateFormat.parse(endTime);
			
			Calendar startTimeCal = Calendar.getInstance();
			Calendar endTimeCal = Calendar.getInstance();
			Calendar currentTimeCal = Calendar.getInstance();
			
			startTimeCal.setTime(startDateTime);
			endTimeCal.setTime(endDateTime);
			currentTimeCal.setTime(currentDateTime);
			
			//시작시간과 현재시간을 비교 ==> 현재날짜가 시험시작시간보다 커야됨
			int compareStartToCurrent = currentTimeCal.compareTo(startTimeCal);
			//종료시간과 현재시간을 비교 ==> 현재날짜가 시험종료시간보다 작아야됨
			int compareCurrentToEnd = currentTimeCal.compareTo(endTimeCal);
			
			System.out.println(compareStartToCurrent);
			System.out.println(compareCurrentToEnd);
			System.out.println(startTimeCal.getTime());
			System.out.println(endTimeCal.getTime());
			System.out.println(currentTimeCal.getTime());
			//현재날짜가 시험시작시간보다 크고 시험종료시간보다 작은 경우
			if(compareStartToCurrent == 1 && compareCurrentToEnd == -1){
				result = 1;
			} else{
				result = -1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return String.valueOf(result);
	}
	
	
	
	
	
	
	
	
}
