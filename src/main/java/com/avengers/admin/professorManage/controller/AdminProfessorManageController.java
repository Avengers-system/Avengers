package com.avengers.admin.professorManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

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
import com.avengers.admin.professorManage.service.AdminProfessorManageService;
import com.avengers.db.dto.CommandPrfsVO;
import com.avengers.db.dto.PrfsVO;

@Controller
public class AdminProfessorManageController {

	@Autowired
	private AdminProfessorManageService adminProfessorManageService;

	/**
	 * 교수리스트 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/professorManage")
	public String professorList(Principal principal, Model model) {

		List<PrfsVO> professorList = null;

		// key??
		String key = principal.getName();
		try {
			professorList = adminProfessorManageService.selectPrfsList(key, 1,	10);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("professorList", professorList);

		return "admin/adminProfessorManage.jsp";
	}

	/**
	 * 교수등록하기
	 * 
	 * @param prfsVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/admin/insertProfessor", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	public String insertStudent(CommandPrfsVO commandPrfsVO,
			MultipartHttpServletRequest request,
			@RequestParam("prgs_pic") MultipartFile multipartFile) {

		// 깃 경로 (동일)
		String upload = "C:/Users/pc15/git/Avengers/src/main/webapp/resources/admin_professor_images/"
				+ multipartFile.getOriginalFilename();

		if (!multipartFile.isEmpty()) {
			File file = new File(upload, multipartFile.getOriginalFilename()
					+ "$$" + System.currentTimeMillis());

			PrfsVO prfsVO = new PrfsVO();
			prfsVO = commandPrfsVO.toPrfsVO();

			try {
				multipartFile.transferTo(file); // 깃 위치로 전송
				adminProfessorManageService.insertPrfs(prfsVO);
				// security에도 enabled와 role정보 추가해주기
				adminProfessorManageService.insertPrfs(prfsVO);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
			System.out.println("성공");
		}

		int result = 0;

		return "admin/main/professorManage"; // redirect??
	}
}
