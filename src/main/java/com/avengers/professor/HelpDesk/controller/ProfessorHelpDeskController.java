package com.avengers.professor.HelpDesk.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.avengers.db.dto.BoardVO;
import com.avengers.professor.HelpDesk.service.ProfessorHelpDeskService;

@Controller
@RequestMapping("/professor/helpDesk")
public class ProfessorHelpDeskController {

	@Autowired
	public ProfessorHelpDeskService service;

	@RequestMapping("/main/helpDeskProfMain")
	public String helpDeskProfMain(Model model, Principal principal){

		String key = principal.getName();

		//학과테이블
		BoardVO deptVO = new BoardVO();
		ArrayList<BoardVO> deptList = new ArrayList<BoardVO>();

		String bc_num = "B";
		try {
			bc_num += service.selectProfDept(key);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		deptVO.setBoard_bc(bc_num);
		deptVO.setBoard_writer(key);

		//포털테이블
		BoardVO portalVO = new BoardVO();
		ArrayList<BoardVO> portalList = new ArrayList<BoardVO>();
		String portal_nm="PORTAL";
		portalVO.setBoard_bc(portal_nm);
		portalVO.setBoard_writer(key);

		//학사일정(풀캘)
		BoardVO univSchdVO = new BoardVO();
		ArrayList<BoardVO> univSchdList = new ArrayList<BoardVO>();
		String col_nm = "UNIVSCHD";
		univSchdVO.setBoard_bc(col_nm);
		univSchdVO.setBoard_writer(key);

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

		try {
			deptList = service.selectBoardList(deptVO,1,2); // 학과리스트
			portalList = service.selectBoardList(portalVO,1,2); //포털리스트
			univSchdList = service.selectBoardList(univSchdVO, 1,2);//학부리스트
			univList = service.selectBoardList(univVO, 1,2);// 학교리스트
			faqList = service.selectBoardList(faqVO, 1, 2);//faq리스트
			qnaList = service.selectBoardList(qnaVO, 1, 2);//qna리스트

		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("deptNoticeList", deptList);// 학과리스트
		model.addAttribute("portalNoticeList", portalList); // 포털리스트
		model.addAttribute("univSchdNoticeList", univSchdList);// 학부리스트
		model.addAttribute("univNoticeList", univList);// 학교리스트
		model.addAttribute("faqNoticeList", faqList);// faq리스트
		model.addAttribute("qnaNoticeList", qnaList);//qna리스트


		return "professor/helpDeskMain";
	}


	@RequestMapping("/portalProfNoticeList")//포털게시판조회
	public String profPortalList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "PORTAL";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;
		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("portalNoticeList", boardList);
		return "professor/helpDesk/portalNotice";

	}

	@RequestMapping("/deptProfNoticeList")//학과게시판조회
	public String profDeptList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "B";

		try {
			bc_num += service.selectProfDept(key);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("deptNoticeList", boardList);
		return "professor/helpDesk/deptNotice";

	}





	@RequestMapping("faqProfNoticeList")//교수님용 FAQ게시판조회
	public String faqProNoticefList(Model model, Principal principal, String pageNo){
		
		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;
		
		String key = principal.getName();
		String bc_num = "FAQ_PROF";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		
		int totalCount = 0;
		
		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("faqProfNoticeList", boardList);
		return "professor/helpDesk/faqProfNotice";
		
	}
	
	@RequestMapping("qnaProfNoticeList")// 교수님용 Q&A 게시판조회
	public String profQnaList(Model model, Principal principal, String pageNo){
		
		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;
		
		String key = principal.getName();
		String bc_num = "QNA_PROF";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);
		
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		
		int totalCount = 0;
		
		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("qnaProfNoticeList", boardList);
		return "professor/helpDesk/qnaProfNotice";
		
	}
	
	
	@RequestMapping("univProfNoticeList")// 학교게시판조회
	public String profUnivList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "UNIV";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("univNoticeList", boardList);
		return "professor/helpDesk/univNotice";

	}

	@RequestMapping("univProfSchdNoticeList")// 학사일정조회
	public String profunivSchdList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "univSchd";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("univSchdNoticeList", boardList);
		return "professor/helpDesk/univSchdNotice";

	}
	/***
	 * 2.게시판 글쓰기
	 * */
	@RequestMapping("/portalProfWriteForm")//포털게시판 글쓰기 양식
	public String profPortalWriteForm(
			@ModelAttribute BoardVO boardVO
			,Model model,
			String bc_num){

		BoardVO boardVo=null;

		System.out.println("controller" + bc_num);
		try {
			boardVo = service.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		return "professor/helpDesk/portalWrite";
	}

	@RequestMapping("/deptProfWriteForm")// 학과게시판 글쓰기 양식
	public String profDeptWriteForm(@ModelAttribute BoardVO boardVO, Model model){
		BoardVO boardVo=null;

		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String key = user.getUsername();

		String bc_num = "B";

		try {
			bc_num += service.selectProfDept(key);
			boardVo = service.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		boardVo.setBoard_bc(bc_num);
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "professor/helpDesk/deptWrite";
	}

	@RequestMapping("/qnaProfWriteForm")// Q&A게시판 글쓰기 양식
	public String profQnaWriteForm(@ModelAttribute BoardVO boardVO, Model model){
		BoardVO boardVo=null;

		String bc_num = "QNA_PROF";
		System.out.println("controller" + bc_num);
		try {
			boardVo = service.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "professor/helpDesk/qnaProfWrite";
	}

	@RequestMapping("/univProfWriteForm")// 학교게시판 글쓰기 양식
	public String profUnivWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = service.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "professor/helpDesk/univWrite";
	}

	@RequestMapping("/univProfSchdWriteForm")// 학사일정등록하기 양식
	public String profunivSchdWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = service.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "professor/helpDesk/univSchdWrite";
	}

	/**글쓰기 저장하는 곳*/
	@RequestMapping(value = "/portalProfWrite", method = RequestMethod.POST)// 포털게시판 글쓰기 저장
	public String profPortalWrite(HttpServletRequest req
			,@RequestParam("boardaf") MultipartFile af
			,Model model
			, HttpSession sesssion){
		BoardVO boardVO = new BoardVO();
		String url = "redirect:portalProfNoticeList";
		String upload = "D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
		System.out.println("파일경로"+upload);
		boardVO.setBoard_bc(req.getParameter("board_bc"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		if (!af.isEmpty()) {
			File file = new File(upload, af.getOriginalFilename());
			System.out.println("파일이름"+af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				service.insertBoard(boardVO);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return url;
	}

	@RequestMapping(value="/deptProfWrite", method = RequestMethod.POST)// 학과게시판 글쓰기 저장
	public String profDeptWrite(HttpServletRequest req
			, @RequestParam("boardaf") MultipartFile af
			, Model model
			, HttpSession session){
		BoardVO boardVO = new BoardVO();
		String url="redirect:deptProfNoticeList";
		String upload="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
		System.out.println("파일경로"+upload);
		boardVO.setBoard_bc(req.getParameter("board_bc"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));

		if (!af.isEmpty()) {
			File file = new File(upload, af.getOriginalFilename());
			System.out.println("파일이름"+af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				service.insertBoard(boardVO);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return url;
	}

	@RequestMapping(value="/univProfWrite", method = RequestMethod.POST)// 학교게시판 글쓰기 저장
	public String profUnivWrite(HttpServletRequest req
			, @RequestParam("boardaf") MultipartFile af
			, Model model 
			, HttpSession session){
		BoardVO boardVO = new BoardVO();
		String url = "redirect:univProfNoticeList";
		String upload ="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
		System.out.println("파일경로"+upload);

		boardVO.setBoard_bc(req.getParameter("board_bc"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));

		if (!af.isEmpty()) {
			File file = new File(upload, af.getOriginalFilename());
			System.out.println("파일이름"+af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				service.insertBoard(boardVO);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return url;
	}





	@RequestMapping("/qnaProfWrite")// Q&A게시판 글쓰기 저장
	public String profQnaWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc("QNA_PROF");


		try {
			service.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:qnaProfNoticeList";
	}



	@RequestMapping("/univProfSchdWrite")// 학사일정등록 
	public String profunivSchdWrite(HttpServletRequest req, Model model,
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
			service.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:univProfSchdNoticeList";
	}

	/**
	 * 3.게시판 수정
	 * **/

	@RequestMapping(value="/portalProfUpdate", method = RequestMethod.POST )// 포털게시판수정
	public String profportalUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:portalProfNoticeList";
		String upload = "D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		if (!af.isEmpty()) {
			File file = new File(upload, af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				service.updateBoard(boardVO);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return url;
	}

	@RequestMapping(value="/deptProfUpdate", method=RequestMethod.POST)// 학과게시판수정
	public String profdeptUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:deptProfNoticeList";
		String upload="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		if (!af.isEmpty()) {
			File file = new File(upload, af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				service.updateBoard(boardVO);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return url;
	}

	@RequestMapping(value="/univProfUpdate", method=RequestMethod.POST)// 대학게시판수정
	public String profunivUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:univProfNoticeList";
		String upload = "D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		if (!af.isEmpty()) {
			File file = new File(upload, af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				service.updateBoard(boardVO);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return url;
	}



	@RequestMapping("/qnaProfUpdate")// Q&A게시판수정
	public String profqnaUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			service.updateBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:qnaProfNoticeList";
	}



	@RequestMapping("/univProfSchdUpdate")// 학사일정수정
	public String profunivSchdUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			service.updateBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univProfSchdNoticeList";
	}

	/**
	 * 4.글 삭제
	 * 
	 * **/
	@RequestMapping("portalProfDelete")// 포털게시판 글 삭제
	public String profportalDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:portalProfNoticeList";
	}

	@RequestMapping("deptProfDelete")// 학과게시판 글 삭제
	public String profdeptDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:deptProfNoticeList";
	}

	@RequestMapping("qnaProfDelete")// QNA게시판 글 삭제
	public String profqnaDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:qnaProfNoticeList";
	}

	@RequestMapping("univProfDelete")// 대학게시판 글 삭제
	public String profunivDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univProfNoticeList";
	}
	@RequestMapping("univProfSchdDelete")//학사일정 삭제
	public String profunivSchdDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univProfSchdNoticeList";
	}

	/**
	 *5.상세보기
	 * 
	 * */
	@RequestMapping("/portalProfDetail") // 포털게시판 글 상세보기
	public String profdetailPortal(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateBoardCount(board_num, board_count);
			boardVo = service.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList",boardVo);
		return "professor/helpDesk/portalDetail";
	}

	@RequestMapping("/deptProfDetail")// 학과게시판 글 상세보기
	public String profdetailDept(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateBoardCount(board_num, board_count);
			boardVo = service.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptNoticeList",boardVo);
		return "professor/helpDesk/deptDetail";
	}
	
	
	@RequestMapping("/faqProfDetail")// 교수용 FAQ게시판 글 상세보기
	public String detailFaqProf(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateBoardCount(board_num, board_count);
			boardVo = service.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqProfNoticeList",boardVo);
		return "professor/helpDesk/faqProfDetail";
	}
	
		
	


	@RequestMapping("/qnaProfDetail")// QNA게시판 글 상세보기
	public String profdetailQna(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateBoardCount(board_num, board_count);
			boardVo = service.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaProfNoticeList",boardVo);
		return "professor/helpDesk/qnaProfDetail";
	}

	@RequestMapping("/univProfDetail")// 대학게시판 글 상세보기
	public String profdetailUniv(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateBoardCount(board_num, board_count);
			boardVo = service.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univNoticeList",boardVo);
		return "professor/helpDesk/univDetail";
	}

	@RequestMapping("/univProfSchdDetail")// 학사일정 상세보기
	public String profdetailunivSchd(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateBoardCount(board_num, board_count);
			boardVo = service.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univSchdNoticeList",boardVo);
		return "professor/helpDesk/univSchdDetail";
	}


	/**
	 * 6.검색 search
	 * **/

	@RequestMapping("portalProfSearch") // 포털게시판 글 검색
	public String profportalSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal,String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "PORTAL";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchBoardList(boardVO);
			//boardList = service.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);

		return "professor/helpDesk/portalNotice";

	}

	@RequestMapping("deptProfSearch")// 학과게시판 글 검색
	public String profdeptSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "B";
		String key = principal.getName();
		int totalCount = 0;

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		try {
			bc_num += service.selectProfDept(key);
			boardVO.setBoard_bc(bc_num);
			boardVO.setBoard_title(board_title);

			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("deptNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "professor/helpDesk/deptNotice";

	}
	
	
	@RequestMapping("faqProfSearch")// 교수용 FAQ 글 검색
	public String faqProfSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){
		
		ArrayList<BoardVO> boardList = null;
		
		BoardVO boardVO = new BoardVO();
		String bc_num = "FAQ_PROF";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;
		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqProfNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "professor/helpDesk/faqProfNotice";
		
	}
	

	@RequestMapping("qnaProfSearch")// QNA 글 검색
	public String profqnaSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;


		BoardVO boardVO = new BoardVO();
		int totalCount = 0;
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		String bc_num = "QNA_PROF";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaProfNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "professor/helpDesk/qnaProfNotice";

	}


	@RequestMapping("univProfSearch")// 대학 글 검색
	public String profunivSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "UNIV";
		int totalCount = 0;
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {
			totalCount = service.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "professor/helpDesk/univNotice";

	}
	@RequestMapping("univProfSchdSearch")// 학사일정 검색
	public String profunivSchdSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal){

		ArrayList<BoardVO> boardList = null;
		

		BoardVO boardVO = new BoardVO();
		String bc_num = "UNIVSCHD";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {

			boardList = service.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univSchdNoticeList", boardList);
		return "professor/helpDesk/univSchdNotice";

	}

	
	
	
	
	
	
}
