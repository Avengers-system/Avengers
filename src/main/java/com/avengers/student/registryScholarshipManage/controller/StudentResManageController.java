package com.avengers.student.registryScholarshipManage.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.resSchStudentVO;
import com.avengers.student.registryScholarshipManage.service.StudentResManageService;

/**
 * 학생 등록/장학관리
 * @author 조영훈
 * @version 0.1
 * @since 2017.07.18
 *
 */
@Controller
@RequestMapping("/student/resSchManage")
public class StudentResManageController {

	@Autowired
	private StudentResManageService stuResService;
	
	@RequestMapping("/studRes")
	public String studRes(Principal princiapl,Model model){
		String url="student/registryScholarshipManage/registryScholarshipManageMain";
		String stud_num= princiapl.getName();
		String message="";
		int grades = 0 ;// 학점
		double average_rating=0.0;//평균평점
		
		resSchStudentVO resSchStudent = new resSchStudentVO();
		ArrayList<resSchStudentVO> stuRes = null;
		try {
			stuRes =stuResService.selectResSchHistory(stud_num);
			if(stuRes == null){
				message="조회된 결과가 없습니다.";
			}else{
				for (int i = 0; i < stuRes.size(); i++) {
					if(stuRes.get(i).getTl_asmt_check().equals("2")){//강의평가를 완료했다면
						//각 과목의 평점 * 학점을 더한다
						average_rating  += stuRes.get(i).getTl_mark() * Integer.parseInt(stuRes.get(i).getLct_crd());
						grades += Integer.parseInt(stuRes.get(i).getLct_crd());
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//최종 평균평점 = (각 과목의 평점*학점을 더한값)/과목의 모든 학점을 더한 값
		average_rating = average_rating/grades;
		resSchStudent.setCol_nm(stuRes.get(0).getCol_nm());//공과대
		resSchStudent.setDept_nm(stuRes.get(0).getDept_nm());//전공
		resSchStudent.setStud_grd(stuRes.get(0).getStud_grd());//학년
		resSchStudent.setStud_nm(stuRes.get(0).getStud_nm());//이름
		model.addAttribute("grades",grades);//취득학점
		model.addAttribute("average_rating", average_rating);//평균평점
		model.addAttribute("message",message);
		return url; 
	}
	
}
