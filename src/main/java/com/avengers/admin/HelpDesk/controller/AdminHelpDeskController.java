package com.avengers.admin.HelpDesk.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.db.dto.BoardVO;

@RequestMapping("/admin")
@Controller
public class AdminHelpDeskController {
	@Autowired
	private AdminHelpDeskService adminHelpDeskService;

	/**
	 * helpDeskMain 페이지
	 * 
	 * */
	@RequestMapping("/main/helpDeskMain")
	public String helpDeskMain(Model model, Principal principal){

		String key = principal.getName();

		//학과테이블
		BoardVO deptVO = new BoardVO();
		ArrayList<BoardVO> deptList = new ArrayList<BoardVO>();
		String dept_nm="DEPT";
		deptVO.setBoard_bc(dept_nm);
		deptVO.setBoard_writer(key);

		//포털테이블
		BoardVO portalVO = new BoardVO();
		ArrayList<BoardVO> portalList = new ArrayList<BoardVO>();
		String portal_nm="PORTAL";
		portalVO.setBoard_bc(portal_nm);
		portalVO.setBoard_writer(key);

		//학부테이블
		BoardVO collegeVO = new BoardVO();
		ArrayList<BoardVO> collegeList = new ArrayList<BoardVO>();
		String col_nm = "COLLEGE";
		collegeVO.setBoard_bc(col_nm);
		collegeVO.setBoard_writer(key);

		//학교정보테이블
		BoardVO univVO = new BoardVO();
		ArrayList<BoardVO> univList = new ArrayList<BoardVO>();
		String univ_nm="UNIV";
		univVO.setBoard_bc(univ_nm);
		univVO.setBoard_writer(key);

		//FAQ테이블
		BoardVO faqVO = new BoardVO();
		ArrayList<BoardVO> faqList = new ArrayList<BoardVO>();
		String faq_nm="FAQ";
		faqVO.setBoard_bc(faq_nm);
		faqVO.setBoard_writer(key);

		//Qna테이블
		BoardVO qnaVO = new BoardVO();
		ArrayList<BoardVO> qnaList = new ArrayList<BoardVO>();
		String qna_nm="QNA";
		qnaVO.setBoard_bc(qna_nm);
		qnaVO.setBoard_writer(key);

		System.out.println(key);
		System.out.println("main1 컨트롤러 시작전");
		try {
			deptList = adminHelpDeskService.selectBoardList(deptVO,1,2); // 학과리스트
			portalList = adminHelpDeskService.selectBoardList(portalVO,1,2); //포털리스트
		    collegeList = adminHelpDeskService.selectBoardList(collegeVO, 1,2);//학부리스트
		  univList = adminHelpDeskService.selectBoardList(univVO, 1,2);// 학교리스트
		  faqList = adminHelpDeskService.selectBoardList(faqVO, 1, 2);//faq리스트
		  qnaList = adminHelpDeskService.selectBoardList(qnaVO, 1, 2);//qna리스트

		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("deptNoticeList", deptList);// 학과리스트
		model.addAttribute("portalNoticeList", portalList); // 포털리스트
		model.addAttribute("collegeNoticeList", collegeList);// 학부리스트
		model.addAttribute("schoolNoticeList", univList);// 학교리스트
		model.addAttribute("faqNoticeList", faqList);// faq리스트
		model.addAttribute("qnaNoticeList", qnaList);//qna리스트


		return "admin/main/helpDeskMain";
	}

	/**
	 * 학과게시판조회
	 * 
	 * */
	@RequestMapping("/deptNoticeList")
	public String adminDeptList(Model model, Principal principal){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();

		String key = principal.getName();
		String bc_num = "DEPT";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		try {
			boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptNoticeList", boardList);

		return "admin/helpDesk/deptNotice";

	}

	/**
	 * faq게시판조회
	 * 
	 * */
	@RequestMapping("/faqNoticeList")
	public String adminFaqList(Model model, Principal principal){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();

		String key = principal.getName();
		String bc_num = "UNIV";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		try {
			boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqNoticeList", boardList);

		return "admin/helpDesk/faqNotice";

	}

	/**
	 * portal게시판조회
	 * 
	 * */
	@RequestMapping("portalNoticeList")
	public String adminPortalList(Model model, Principal principal){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "PORTAL";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		try {
			boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList", boardList);
		System.out.println(boardList.get(0).getBoard_date());
		return "admin/helpDesk/portalNotice";

	}

	/**
	 * 포털게시판  글쓰기
	 * 
	 * */

	@RequestMapping("/portalWriteForm")
	public String adminPortalWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		System.out.println("controller" + bc_num);
		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "admin/helpDesk/portalWrite";
	}

	/**
	 * 포털게시판  글쓰기
	 * 
	 * */

	@RequestMapping("/portalWrite")
	public String adminPortalWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc(req.getParameter("board_bc"));

		System.out.println(boardVO.getBoard_cont()+"service");

		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:portalNoticeList";
	}

	/**
	 * 포털 update
	 * **/

	@RequestMapping("/portalUpdate")
	public String portalUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			adminHelpDeskService.updateBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:portalNoticeList";
	}

	@RequestMapping("portalDelete")
	public String portalDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:portalNoticeList";
	}
	
	/**
	 *포탈상세보기
	 * 
	 * */
	@RequestMapping("/portalDetail")
	public String detailPortal(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList",boardVo);
		return "admin/helpDesk/portalDetail";
	}
	

	/**
	 * 포털 search
	 * **/

	@RequestMapping("portalSearch")
	public String portalSearch(@RequestParam("board_title")String board_title,
														   Model model, Principal principal){

		ArrayList<BoardVO> boardList = null;
		
		BoardVO boardVO = new BoardVO();
		String bc_num = "PORTAL";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);
		
		System.out.println("서치하러드러왔다"+board_title);
		try {
			
			boardList = adminHelpDeskService.searchBoardList(boardVO);
			//boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList", boardList);
		return "admin/helpDesk/portalNotice";
		
	}
	//	@RequestMapping("/insertDeptBoard")
	//	public String adminDeptWrite(Model model, Principal principal){
	//		
	//
	//	  	BoardVO boardVO = new BoardVO();
	//	  	String key = principal.getName();
	//	  	String bc_num = "UNIV";
	//	  	boardVO.setBoard_bc(bc_num);
	//	  	boardVO.setBoard_writer(key);
	//	  	int insertBoard =0;
	//	  	try {
	//			insertBoard= adminHelpDeskService.insertBoard(boardVO);
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		}
	//	  	model.addAttribute("insertDeptBoard",insertBoard);
	//	  	
	//	  	return "admin/helpDesk/deptWrite";
	//	    
	//	}
	/**
	 * 학과등록하기
	 * 
	 * **/

	// 입력받는 곳
	@RequestMapping("/insertDeptBoard")
	public String insertDeptBoard(@ModelAttribute BoardVO boardVO, Model model, String bc_num){

		return "admin/helpDesk/deptWrite";
	}

	/**
	 * 학과등록내용보내기
	 * 
	 * **/
	@RequestMapping("/insertDeptBoard2")
	public String insertDeptBoard2(@ModelAttribute BoardVO boardVO, Model model, 
			@RequestParam("bc_num")String bc_num){

		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "admin/helpDesk/deptWrite";
	}



	/**
	 * Faq등록하기
	 * 
	 * **/
	// 입력받는 곳
	@RequestMapping("/insertFaqBoard")
	public String insertFaqBoard(@ModelAttribute BoardVO boardVO, Model model, String bc_num){

		//		boardVO.setBoard_title(bc_num);
		//		boardVO.setBoard_cont(bc_num);
		//		boardVO.setBoard_writer(bc_num);
		//		boardVO.setBoard_bc(bc_num);
		//		
		//		try {
		//			adminHelpDeskService.insertBoard(boardVO);
		//		} catch (SQLException e) {
		//			e.printStackTrace();
		//		}
		return "admin/helpDesk/faqWrite";
	}

	/**
	 * 학과등록내용보내기
	 * 
	 * **/
	@RequestMapping("/insertFaqBoard2")
	public String insertFaqBoard2(@ModelAttribute BoardVO boardVO, Model model, String bc_num){

		//		boardVO.setBoard_title(bc_num);
		//		boardVO.setBoard_cont(bc_num);
		//		boardVO.setBoard_writer(bc_num);
		//		boardVO.setBoard_bc(bc_num);

		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "admin/helpDesk/faqWrite";
	}

	
}
