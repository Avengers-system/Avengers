package com.avengers.student.registryScholarshipManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.avengers.student.registryScholarshipManage.service.StudentResManageService;

/**
 * 학생 등록/장학관리
 * @author 조영훈
 * @version 0.1
 * @since 2017.07.18
 *
 */
@Controller
public class StudentResManageController {

	@Autowired
	private StudentResManageService stuResService;
	
	
}
