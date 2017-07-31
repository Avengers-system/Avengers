package com.avengers.admin.professorManage.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
@RequestMapping("/admin")
public class AdminProfessorManageController {

	@Autowired
	private AdminProfessorManageService adminProfessorManageService;

	
	@RequestMapping("/professorManage")
	public String paging(Model model, @ModelAttribute("PrfsVO") PrfsVO prfsVO,
			HttpServletRequest request) {
		System.out.println(">>>> professorManage start!!");
	    //검색조건, 검색어
	    System.out.println("SearchFiled 검색조건 : " + prfsVO.getSearchFiled());
	    System.out.println("SearchValue 검색어 : " + prfsVO.getSearchValue());
	  
	    List<PrfsVO> prfsList = null;
	    
	    //--페이징 처리
	    int totalCount;
		try {
			totalCount = adminProfessorManageService.getEmpListCount(prfsVO);
			prfsVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
			model.addAttribute("pageVO", prfsVO);
			System.out.println("PageSize // 한 페이지에 보여줄 게시글 수 : " + prfsVO.getPageSize());
			System.out.println("PageNo // 페이지 번호 : " + prfsVO.getPageNo());
			System.out.println("StartRowNo //조회 시작 row 번호 : " + prfsVO.getStartRowNo());
			System.out.println("EndRowNo //조회 마지막 now 번호 : " + prfsVO.getEndRowNo());
			System.out.println("FirstPageNo // 첫 번째 페이지 번호 : " + prfsVO.getFirstPageNo());
			System.out.println("FinalPageNo // 마지막 페이지 번호 : " + prfsVO.getFinalPageNo());
			System.out.println("PrevPageNo // 이전 페이지 번호 : " + prfsVO.getPrevPageNo());
			System.out.println("NextPageNo // 다음 페이지 번호 : " + prfsVO.getNextPageNo());
			System.out.println("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + prfsVO.getStartPageNo());
			System.out.println("EndPageNo // 끝 페이지 (페이징 네비 기준) : " + prfsVO.getEndPageNo());
			System.out.println("totalCount // 게시 글 전체 수 : " + totalCount);
			 prfsList  = adminProfessorManageService.getEmpList(prfsVO);
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} //게시물 총갯수를 구한다
	    //--페이징 처리
	  
		model.addAttribute("professorList", prfsList);
		request.setAttribute("pageVO",prfsVO);
	    return "admin/main/professorManage";
	}
	
	/**
	 * 교수리스트 조회
	 * @param principal
	 * @param model
	 * @return
	 */
//	@RequestMapping("/professorManage")
//	public String professorList(Principal principal, Model model) {
//
//		List<PrfsVO> professorList = null;
//
//		String key = principal.getName();
//		try {
////			professorList = adminProfessorManageService.selectPrfsList(key, 1,	10);
//			professorList = adminProfessorManageService.selectPrfsList();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		model.addAttribute("professorList", professorList);
//
//		return "admin/main/professorManage";
//	}

	
	/**
	 * 교수 상세보기
	 * @param prfs_num
	 * @param model
	 * @return
	 */
	@RequestMapping("/professorDetail")
	public String professorDetail(
			@RequestParam("prfs_num") String prfs_num,
//			@RequestParam("pageNo")Integer pageNo,
			Model model){
		
	 
		PrfsVO prfsVO = new PrfsVO();
		try {
			prfsVO = adminProfessorManageService.selectPrfs(prfs_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String path="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/admin_professor_images/";
		path += prfsVO.getPrfs_pic();
//		prfsVO.setPageNo(pageNo);
		System.out.println("교수 디테일 이미지 경로 : "+path);
//		System.out.println("교수 디테일 페이지번호 : "+pageNo);
		model.addAttribute("path",path);
		model.addAttribute("professor",prfsVO);
		return "admin/professorDetail";
	}
	
	/**
	 * 교수 삭제하기 
	 * @param prfs_num
	 * @return
	 */
	@RequestMapping("/deleteProfessor")
	public String deleteProfessor(@RequestParam("prfs_num") String prfs_num,
									Model model){
			
			try {
				adminProfessorManageService.updatePrfsEnabled(prfs_num);
				adminProfessorManageService.deletePrfs(prfs_num);
				System.out.println(prfs_num + "번 교수 삭제!");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("교수삭제실패");
			}
			//enabled 만 1로 바꾸면 됨 
	return "redirect:professorManage";	
	}
	
	
	/**
	 * 교수수정하기 
	 * @param commandPrfsVO
	 * @param prfs_num
	 * @param request
	 * @param multipartFile
	 * @return
	 */
	@RequestMapping(value = "/updateProfessor")
	public String updateProfessor(
						CommandPrfsVO commandPrfsVO,
						@RequestParam("prfs_pic")MultipartFile prfs_pic,
//						@RequestParam("pageNo")Integer pageNo,
						HttpServletRequest request,
						HttpSession session
						){
		
		commandPrfsVO.setPrfs_pic(prfs_pic);
		PrfsVO prfsVO = commandPrfsVO.toPrfsVO();
		
		String path = request.getSession().getServletContext().getRealPath("resources/admin_professor_images");		
		String filename= prfsVO.getPrfs_pic();
		
		System.out.println("filename : "+filename);
//		prfsVO.setPageNo(pageNo);
//		System.out.println("교수 수정 페이지번호 : "+pageNo );
		System.out.println(commandPrfsVO.toString());
 
		
		
		if (!prfsVO.getPrfs_pic().isEmpty()) {
			File file = new File(path, prfsVO.getPrfs_pic());
 
			try {
				commandPrfsVO.getPrfs_pic().transferTo(file); // 깃 위치로 전송
			}  catch (IOException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
		}
		
		String message ="실패";
		try {
			adminProfessorManageService.updatePrfs(prfsVO);
			System.out.println("성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(message);
		}
		
		return "redirect:professorManage";
	}
	
	
	/**
	 * 교수등록하기
	 * @param prfsVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/insertProfessor")
	public String insertProfessor(CommandPrfsVO commandPrfsVO,
			HttpSession session,
			HttpServletRequest request){

		PrfsVO prfsVO = commandPrfsVO.toPrfsVO();		

	    
		// 깃 경로 (동일)
		String path = request.getSession().getServletContext().getRealPath("/resources/admin_professor_images");
		String filename = prfsVO.getPrfs_pic();
		
		System.out.println("path"+path);
		System.out.println("filename:"+filename);
	
		if (!prfsVO.getPrfs_pic().isEmpty()) {
			File file = new File(path, prfsVO.getPrfs_pic());
 
			try {
				commandPrfsVO.getPrfs_pic().transferTo(file); // 깃 위치로 전송
				
				adminProfessorManageService.insertPrfs(prfsVO);
				prfsVO.setPrfs_num(adminProfessorManageService.selectPrfsNum());
				adminProfessorManageService.insertSecurity(prfsVO);
				System.out.println("성공");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("실패");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
		}

		return "redirect:professorManage";
	}
	
}
