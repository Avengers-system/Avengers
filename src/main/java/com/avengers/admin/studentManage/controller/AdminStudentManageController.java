package com.avengers.admin.studentManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.CommandStudVO;
import com.avengers.db.dto.StudVO;

@Controller
@RequestMapping("/admin")
public class AdminStudentManageController {

	@Autowired
	private AdminStudentManageService adminStudentManageService;
	
	
	/**
	 * 학생등록하기
	 * @param commandStudVO
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/insertStudent")
	public String insertStudent(CommandStudVO commandStudVO, 
			HttpSession session,
			HttpServletRequest request){
		
		System.out.println("?????????????????????????");
		StudVO studVO =  commandStudVO.toStudVO();
		
		
		// 깃 경로 (동일)
				String path = request.getSession().getServletContext().getRealPath("/resources/admin_student_images");
				String filename = studVO.getStud_pic();
				
				System.out.println("path: "+path);
				System.out.println("filename: "+filename);
				
				if (!studVO.getStud_pic().isEmpty()) {
					File file = new File(path, studVO.getStud_pic());
		 
					try {
						commandStudVO.getStud_pic().transferTo(file); // 깃 위치로 전송
						
						adminStudentManageService.insertStud(studVO);
						
						studVO.setStud_num(adminStudentManageService.selectStudNum());
						adminStudentManageService.insertSecurity(studVO);
						
						System.out.println("성공");
					
					} catch (SQLException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					} catch (IllegalStateException e) {
						e.printStackTrace();
					}
				}

				return "redirect:main/studentManage";
	}
	
	
	/**
	 * 학생삭제하기 
	 * @param prfs_num
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("stud_num") String stud_num,
									Model model){
		if(stud_num!=null || stud_num!=""){
			
			try {
				adminStudentManageService.deleteStud(stud_num);
				System.out.println(stud_num + "번 학생 삭제!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//enabled 만 1로 바꾸면 됨 
			String msg = "삭제 완료되었습니다.";
			model.addAttribute("msg",msg);
		}
	return "redirect:studentManage";	
	}
	
	
	/**
	 * 학생 리스트 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("/studentManage")
	public String studentList(Principal principal, Model model){
		List<StudVO> studList = null;

		// key??
		String key = principal.getName();
		try {
			studList = adminStudentManageService.selectStudList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("studentList", studList);
		return "admin/main/studentManage"; 
	}
	
	/**
	 * 학생 상세보기
	 * @param stud_num
	 * @param model
	 * @return
	 */
	@RequestMapping("/studentManage/detail")
	public String studentDetail(
			@RequestParam("stud_num") String stud_num,
			Model model){
		
		StudVO studVO = new StudVO();
		try {
			studVO = adminStudentManageService.selectStud(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("student",studVO);
		return "admin/studentDetail";
	}
	
	
}
