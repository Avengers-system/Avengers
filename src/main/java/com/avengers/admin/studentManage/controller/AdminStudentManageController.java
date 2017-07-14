package com.avengers.admin.studentManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.CommandPrfsVO;
import com.avengers.db.dto.CommandStudVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;

@Controller
@RequestMapping("/admin/StudentManage")
public class AdminStudentManageController {

	@Autowired
	private AdminStudentManageService adminStudentManageService;
	
	/**
	 * 학생 리스트 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("/adminStudentManage")
	public String studentList(Principal principal, Model model){
		
		
	return "asdf";	
	}
	
	
	
	/**
	 * 학생 등록하기 
	 * @param studVO
	 * @param request
	 * @param multipartFile
	 * @return
	 */
	
	
	@RequestMapping(value = "/insertStudent", 
					method=RequestMethod.POST,
					headers = ("content-type=multipart/*"))
	
	public String insertStudent(
								CommandStudVO commandStudVO,
								MultipartHttpServletRequest request,
								@RequestParam("stud_pic") MultipartFile multipartFile) {

		// 깃 경로 (동일)
		String upload = "C:/Users/pc15/git/Avengers/src/main/webapp/resources/admin_student_images/"+multipartFile.getOriginalFilename();

		if (!multipartFile.isEmpty()) {
			File file = new File(upload, multipartFile.getOriginalFilename()
					+ "$$" + System.currentTimeMillis());

			StudVO studVO = new StudVO();
			studVO = commandStudVO.toStudVO();

			try {
				multipartFile.transferTo(file); //깃 위치로 전송
				adminStudentManageService.insertStud(studVO);
				// security에도 enabled와 role정보 추가해주기
				adminStudentManageService.insertStud(studVO);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("성공");
		}

		int result = 0;

		return "admin/main/studentManage"; //redirect??
	}
	
	
}
