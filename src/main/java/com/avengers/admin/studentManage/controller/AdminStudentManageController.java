package com.avengers.admin.studentManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.CommandStudVO;
import com.avengers.db.dto.PageVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.StudVO;
import com.avengers.student.registryScholarshipManage.serviceImpl.StudentResManageServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminStudentManageController {

	@Autowired
	private AdminStudentManageService adminStudentManageService;
	
	
	
	@RequestMapping("/studentManage")
	public String paging(Model model, @ModelAttribute("StudVO") StudVO studVO,
			HttpServletRequest request){
		System.out.println(">>>> studentManage start!!");
	    //검색조건, 검색어
	    System.out.println("SearchFiled 검색조건 : " + studVO.getSearchFiled());
	    System.out.println("SearchValue 검색어 : " + studVO.getSearchValue());
	  
	    List<StudVO> studList = null;
	    
	    //--페이징 처리
	    int totalCount;
		try {
			totalCount = adminStudentManageService.getEmpListCount(studVO);
			studVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
			model.addAttribute("studVO", studVO);
			System.out.println("PageSize // 한 페이지에 보여줄 게시글 수 : " + studVO.getPageSize());
			System.out.println("PageNo // 페이지 번호 : " + studVO.getPageNo());
			System.out.println("StartRowNo //조회 시작 row 번호 : " + studVO.getStartRowNo());
			System.out.println("EndRowNo //조회 마지막 now 번호 : " + studVO.getEndRowNo());
			System.out.println("FirstPageNo // 첫 번째 페이지 번호 : " + studVO.getFirstPageNo());
			System.out.println("FinalPageNo // 마지막 페이지 번호 : " + studVO.getFinalPageNo());
			System.out.println("PrevPageNo // 이전 페이지 번호 : " + studVO.getPrevPageNo());
			System.out.println("NextPageNo // 다음 페이지 번호 : " + studVO.getNextPageNo());
			System.out.println("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + studVO.getStartPageNo());
			System.out.println("EndPageNo // 끝 페이지 (페이징 네비 기준) : " + studVO.getEndPageNo());
			System.out.println("totalCount // 게시 글 전체 수 : " + totalCount);
			studList  = adminStudentManageService.getEmpList(studVO);
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} //게시물 총갯수를 구한다
	    //--페이징 처리
	  
		model.addAttribute("studentList", studList);
		request.setAttribute("pageVO",studVO);
		return "admin/main/studentManage";
	}
	
	
	
	
	@RequestMapping(value = "/updateStudent")
	public String updateStudent(
				CommandStudVO commandStudVO,
				HttpServletRequest request,
//				@RequestParam("stud_pic")MultipartFile stud_pic,
				HttpSession session
				){
//		commandStudVO.setStud_pic(stud_pic);
		StudVO studVO = commandStudVO.toStudVO();
		String path = request.getSession().getServletContext().getRealPath("resources/admin_student_images");
		String filename= studVO.getStud_pic();
		
		System.out.println("filename : "+filename);
		System.out.println("studVO number : "+ studVO.getStud_num());
		System.out.println(studVO.toString());
		
		if (!studVO.getStud_pic().isEmpty()) {
			File file = new File(path, studVO.getStud_pic());
 
			try {
				commandStudVO.getStud_pic().transferTo(file); // 깃 위치로 전송
				
			} catch (IOException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
			
			
		}
		
		try {
			int result = adminStudentManageService.updateStud(studVO);
			System.out.println("학생수정성공"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:studentManage";
	}
	
	
	
	
 
	
	
	/**
	 * 학생등록하기
	 * @param commandStudVO
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/insertStudent")
	public String insertStudent(CommandStudVO commandStudVO, 
			@RequestParam("stud_max_crd") String stud_max_crd,
			HttpSession session,
			HttpServletRequest request){
		
		
		StudVO studVO =  commandStudVO.toStudVO();
		studVO.setStud_max_crd(stud_max_crd);
		System.out.println("담긴거 : "+studVO.toString());
		
		
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

				return "redirect:studentManage";
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
//	@RequestMapping("/studentManage")
//	public String studentList(Principal principal, Model model){
//		List<StudVO> studList = null;
//
//		// key??
//		String key = principal.getName();
//		try {
//			studList = adminStudentManageService.selectStudList();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		model.addAttribute("studentList", studList);
//		return "admin/main/studentManage"; 
//	}
	
	/**
	 * 학생 상세보기
	 * @param stud_num
	 * @param model
	 * @return
	 */
	@RequestMapping("/studentDetail")
	public String studentDetail(
			@RequestParam("stud_num") String stud_num,
			Model model){
		StudVO studVO = new StudVO();
		try {
			studVO = adminStudentManageService.selectStud(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String path="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/admin_student_images/";
		path += studVO.getStud_pic();
		
		System.out.println("학생 path : "+ path);
		model.addAttribute("path",path);
		model.addAttribute("student",studVO);
		return "admin/studentDetail";
	}
	
	
}
