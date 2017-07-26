package com.avengers.admin.HelpDesk.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.admin.mypage.service.AdminMypageService;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.PerschdVO;

@RequestMapping("/admin")
@Controller
public class AdminHelpDeskController implements ApplicationContextAware{


	@Autowired
	private AdminMypageService myPageService;

	@Autowired
	private AdminHelpDeskService adminHelpDeskService;

	@RequestMapping("/main/download")
	public ModelAndView download(HttpServletRequest request
			,@RequestParam("fileName")String fileName){
		System.out.println(fileName);
		String Path = "D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/"
				+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept/" + fileName;
		File file = new File(Path);
		return new ModelAndView("download", "downloadFile", file);
	}
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
			deptList = adminHelpDeskService.selectBoardList(deptVO,1,2); // 학과리스트
			portalList = adminHelpDeskService.selectBoardList(portalVO,1,2); //포털리스트
			univSchdList = adminHelpDeskService.selectBoardList(univSchdVO, 1,2);//학부리스트
			univList = adminHelpDeskService.selectBoardList(univVO, 1,2);// 학교리스트
			faqList = adminHelpDeskService.selectBoardList(faqVO, 1, 2);//faq리스트
			qnaList = adminHelpDeskService.selectBoardList(qnaVO, 1, 2);//qna리스트

		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("deptNoticeList", deptList);// 학과리스트
		model.addAttribute("portalNoticeList", portalList); // 포털리스트
		model.addAttribute("univSchdNoticeList", univSchdList);// 학부리스트
		model.addAttribute("univNoticeList", univList);// 학교리스트
		model.addAttribute("faqNoticeList", faqList);// faq리스트
		model.addAttribute("qnaNoticeList", qnaList);//qna리스트


		return "admin/main/helpDeskMain";
	}

	/**
	 * 학사일정등록
	 * 
	 * @return
	 */
	@RequestMapping("/univSchd/univSchdedule")
	public String univSchedule(
			Principal principal,
			HttpSession session,
			Model model){

		String scheduleId= principal.getName();
		ArrayList<PerschdVO> univschdList = null;
		ArrayList<PerschdVO> univschdList2 = new ArrayList<PerschdVO>();

		String url="admin/univSchd/univSchdedule";
		String message="";



		try {
			univschdList = myPageService.selectPerschdList("UNIVSCHD");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date1 = new Date();
			Date date2 = new Date();
			String start_date="";
			String end_date="";
			String writer="UNIVSCHD";

			PerschdVO univschdVo = new PerschdVO();
			for (int i = 0; i < univschdList.size(); i++) {
				univschdVo = univschdList.get(i);

				try {
					date1 = sdf.parse(univschdList.get(i).getPerschd_start_date());
					date2 = sdf.parse(univschdList.get(i).getPerschd_end_date());
				} catch (Exception e) {
					e.printStackTrace();
				}

				start_date = sdf.format(date1);
				end_date = sdf.format(date2);

				univschdVo.setPerschd_start_date(start_date);
				univschdVo.setPerschd_end_date(end_date);
				//				univschdVo.setPerschd_writer(writer);
				univschdList2.add(univschdVo);
			}
			if (univschdList != null) {
				model.addAttribute("univschdList",univschdList2);
				message = "학사일정이 조회되었습니다.";
			}else{
				message = "입력된 일정이 없습니다.";
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);
		return url;

	}



	/**
	 * 학사일정 세부조회
	 * @param perschd_num
	 * @param model
	 * @return string
	 */
	@RequestMapping("/univSchd/univScheduleDetail")
	@ResponseBody
	public PerschdVO univSchedule(String perschd_title,
			HttpSession session
			, Model model){
		String message="";


		PerschdVO univschd = new PerschdVO();
		if (univschd != null) {
			univschd = myPageService.selectPerschd_title(perschd_title);
			message="해당날짜에 등록된 일정이 없습니다";
			session.setAttribute("message", message);
		}
		return univschd;
	}


	/**
	 * ★일정 등록★
	 * @param perschd
	 * @param model
	 * @return string
	 */
	@RequestMapping("/univScheduleInsert")
	public String myScheduleInsert(
			PerschdVO univschd,
			Principal who,
			HttpSession session,
			@RequestParam("PERSCHD_START_DATE")String perschd_start_date,
			@RequestParam("PERSCHD_END_DATE")String perschd_end_date,
			@RequestParam("PERSCHD_TITLE")String perschd_title,
			@RequestParam("PERSCHD_CONT")String perschd_cont
			){

		String message="일정등록을 실패였습니다.";

		univschd.setPerschd_writer("UNIVSCHD");
		univschd.setPerschd_cont(perschd_cont);
		univschd.setPerschd_start_date(perschd_start_date);
		univschd.setPerschd_end_date(perschd_end_date);
		univschd.setPerschd_title(perschd_title);

		try {
			int success = myPageService.insertPerschd(univschd);
			if (success == 1) {
				message="학사일정등록에 성공하였습니다.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);

		return "redirect:/student/univSchd/univSchdedule";
	}
	/**
	 * 일정 삭제★★★★★★★★★★★★★
	 * @param perschd_num
	 * @param session
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/univSchd/univScheduleDelete")
	public String univScheduleDelete(
			HttpSession session,
			@RequestParam()String perschd_num){
		String url = "redirect:/admin/univSchd/univSchdedule";
		String message = "일정삭제를 실패하였습니다.";

		try {
			int success = myPageService.deletePerschd(Integer.parseInt(perschd_num));
			if (success!=-1) {
				message="일정 삭제를 성공하였습니다.";
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);

		return url;
	}

	/**
	 * 일정수정 
	 * @param perschd
	 * @param session
	 * @return String
	 */
	@RequestMapping("/univSchd/univScheduleUpdate")
	public String univScheduleUpdate(
			@RequestParam("perschd_num")Integer perschd_num,
			@RequestParam("perschd_cont")String perschd_cont,
			@RequestParam("perschd_title")String perschd_title,
			@RequestParam("perschd_start_date")String perschd_start_date,
			@RequestParam("perschd_end_date")String perschd_end_date,
			HttpSession session
			){
		String message="";
		PerschdVO perschd = new PerschdVO();
		perschd.setPerschd_num(perschd_num);
		perschd.setPerschd_cont(perschd_cont);
		perschd.setPerschd_title(perschd_title);
		perschd.setPerschd_start_date(perschd_start_date);
		perschd.setPerschd_end_date(perschd_end_date);

		try {
			int success = myPageService.updatePerschd(perschd);
			if (success !=-1) {
				message="일저정수정을 성공하였습니다";
			}else if(success ==-1){
				message="일정수정을 실패하였습니다.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("message", message);
		return "redirect:/student/univSchd/univSchdedule";
	}



	/**
	 * 1.게시판조회
	 * 
	 * */

	@RequestMapping("/portalNoticeList")//포털게시판조회
	public String adminPortalList(Model model, Principal principal, String pageNo){

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
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("portalNoticeList", boardList);
		return "admin/helpDesk/portalNotice";

	}

	@RequestMapping("/deptNoticeList")//학과게시판조회
	public String adminDeptList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "DEPT";

		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("deptNoticeList", boardList);
		return "admin/helpDesk/deptNotice";

	}

	@RequestMapping("faqNoticeList")//FAQ게시판조회
	public String adminFaqList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "FAQ";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("faqNoticeList", boardList);
		return "admin/helpDesk/faqNotice";

	}

	@RequestMapping("faqProfNoticeList")//교수님용 FAQ게시판조회
	public String adminFaqProfList(Model model, Principal principal, String pageNo){

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
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("faqProfNoticeList", boardList);
		return "admin/helpDesk/faqProfNotice";

	}

	@RequestMapping("qnaNoticeList")//Q&A 게시판조회
	public String adminQnaList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "QNA";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_writer(key);

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		int totalCount = 0;

		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("qnaNoticeList", boardList);
		return "admin/helpDesk/qnaNotice";

	}

	@RequestMapping("qnaProfNoticeList")// 교수님용 Q&A 게시판조회
	public String adminQnaqnaProfList(Model model, Principal principal, String pageNo){

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
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("qnaProfNoticeList", boardList);
		return "admin/helpDesk/qnaProfNotice";

	}

	@RequestMapping("univNoticeList")// 학교게시판조회
	public String adminUnivList(Model model, Principal principal, String pageNo){

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
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("univNoticeList", boardList);
		return "admin/helpDesk/univNotice";

	}

	@RequestMapping("univSchdNoticeList")// 학사일정조회
	public String adminunivSchdList(Model model, Principal principal, String pageNo){

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
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.selectBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("univSchdNoticeList", boardList);
		return "admin/helpDesk/univSchdNotice";

	}
	/***
	 * 2.게시판 글쓰기
	 * */
	@RequestMapping("/portalWriteForm")//포털게시판 글쓰기 양식
	public String adminPortalWriteForm(
			@ModelAttribute BoardVO boardVO
			,Model model,
			String bc_num){

		BoardVO boardVo=null;

		System.out.println("controller" + bc_num);
		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		return "admin/helpDesk/portalWrite";
	}

	@RequestMapping("/deptWriteForm")// 학과게시판 글쓰기 양식
	public String adminDeptWriteForm(@ModelAttribute BoardVO boardVO, Model model,
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
		return "admin/helpDesk/deptWrite";
	}
	@RequestMapping("/faqWriteForm")// FAQ게시판 글쓰기 양식
	public String adminFaqWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "admin/helpDesk/faqWrite";
	}

	@RequestMapping("/faqProfWriteForm")// FAQ게시판 글쓰기 양식
	public String adminFaqProfWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "admin/helpDesk/faqProfWrite";
	}
	@RequestMapping("/qnaWriteForm")// Q&A게시판 글쓰기 양식
	public String adminQnaWriteForm(@ModelAttribute BoardVO boardVO, Model model,
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
		return "admin/helpDesk/qnaWrite";
	}

	@RequestMapping("/qnaProfWriteForm")// 교수님용 Q&A게시판 글쓰기 양식
	public String adminQnaProfWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		return "admin/helpDesk/qnaProfWrite";
	}
	@RequestMapping("/univWriteForm")// 학교게시판 글쓰기 양식
	public String adminUnivWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "admin/helpDesk/univWrite";
	}

	@RequestMapping("/univSchdWriteForm")// 학사일정등록하기 양식
	public String adminunivSchdWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = adminHelpDeskService.selectInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "admin/helpDesk/univSchdWrite";
	}

	/**글쓰기 저장하는 곳*/
	@RequestMapping(value = "/portalWrite", method = RequestMethod.POST)// 포털게시판 글쓰기 저장
	public String adminPortalWrite(HttpServletRequest req
			,@RequestParam("boardaf") MultipartFile af
			,Model model
			, HttpSession sesssion){
		BoardVO boardVO = new BoardVO();
		String url = "redirect:portalNoticeList";

		String upload = sesssion.getServletContext().
				getRealPath("resources/board_dept");
		//	         String upload = "D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept";
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
				adminHelpDeskService.insertBoard(boardVO);
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

	@RequestMapping(value="/deptWrite", method = RequestMethod.POST)// 학과게시판 글쓰기 저장
	public String adminDeptWrite(HttpServletRequest req
			, @RequestParam("boardaf") MultipartFile af
			, Model model
			, HttpSession session){
		BoardVO boardVO = new BoardVO();
		String url="redirect:deptNoticeList";
		boardVO.setBoard_bc(req.getParameter("board_bc"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));

		if (!af.isEmpty()) {
			String upload="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept/";
			File file = new File(upload, af.getOriginalFilename());
			System.out.println("파일이름"+af.getOriginalFilename());
			try {
				af.transferTo(file);
				boardVO.setBoard_af(file.getName());
				adminHelpDeskService.insertBoard(boardVO);
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

	@RequestMapping(value="/univWrite", method = RequestMethod.POST)// 학교게시판 글쓰기 저장
	public String adminUnivWrite(HttpServletRequest req
			, @RequestParam("boardaf") MultipartFile af
			, Model model
			, HttpSession session){
		BoardVO boardVO = new BoardVO();
		String url = "redirect:univNoticeList";
		String upload ="D:/A_TeachingMaterial/8.LastProject/workspace/common/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Avengers/resources/board_dept/";
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
				adminHelpDeskService.insertBoard(boardVO);
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



	@RequestMapping("/faqWrite")// FAQ게시판 글쓰기 저장
	public String adminFaqWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc(req.getParameter("board_bc"));

		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:faqNoticeList";
	}

	@RequestMapping("/faqProfWrite")// 교수님용 FAQ게시판 글쓰기 저장
	public String adminFaqProfWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc(req.getParameter("board_bc"));

		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:faqProfNoticeList";
	}

	@RequestMapping("/qnaWrite")// Q&A게시판 글쓰기 저장
	public String adminQnaWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc("QNA");


		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:qnaNoticeList";
	}

	@RequestMapping("/qnaProfWrite")// 교수님용 Q&A게시판 글쓰기 저장
	public String adminQnaProfWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc("QNA_PROF");

		System.out.println(boardVO.getBoard_cont()+"service");

		try {
			adminHelpDeskService.insertBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:qnaProfNoticeList";
	}


	@RequestMapping("/univSchdWrite")// 학사일정등록 
	public String adminunivSchdWrite(HttpServletRequest req, Model model,
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


		return "redirect:univSchdNoticeList";
	}

	/**
	 * 3.게시판 수정
	 * **/

	@RequestMapping(value="/portalUpdate", method = RequestMethod.POST )// 포털게시판수정
	public String portalUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:portalNoticeList";
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
				adminHelpDeskService.updateBoard(boardVO);
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

	@RequestMapping(value="/deptUpdate", method=RequestMethod.POST)// 학과게시판수정
	public String deptUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:deptNoticeList";
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
				adminHelpDeskService.updateBoard(boardVO);
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

	@RequestMapping(value="/univUpdate", method=RequestMethod.POST)// 대학게시판수정
	public String univUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:univNoticeList";
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
				adminHelpDeskService.updateBoard(boardVO);
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

	@RequestMapping("/faqUpdate")// FAQ게시판수정
	public String faqUpdate(
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
		return "redirect:faqNoticeList";
	}

	@RequestMapping("/faqProfUpdate")// 교수용FAQ게시판수정
	public String faqProfUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		//		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			adminHelpDeskService.updateBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:faqProfNoticeList";
	}

	@RequestMapping("/qnaUpdate")// Q&A게시판수정
	public String qnaUpdate(
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
		return "redirect:qnaNoticeList";
	}

	@RequestMapping("/qnaProfUpdate")// 교수님용 Q&A게시판수정
	public String qnaProfUpdate(
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
		return "redirect:qnaProfNoticeList";
	}


	@RequestMapping("/univSchdUpdate")// 학사일정수정
	public String univSchdUpdate(
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
		return "redirect:univSchdNoticeList";
	}

	/**
	 * 4.글 삭제
	 * 
	 * **/
	@RequestMapping("portalDelete")// 포털게시판 글 삭제
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

	@RequestMapping("deptDelete")// 학과게시판 글 삭제
	public String deptDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:deptNoticeList";
	}
	@RequestMapping("faqDelete")// FAQ게시판 글 삭제
	public String faqDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:faqNoticeList";
	}
	@RequestMapping("faqProfDelete")// 교수용 FAQ게시판 글 삭제
	public String faqProfDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:faqProfNoticeList";
	}

	@RequestMapping("qnaDelete")// QNA게시판 글 삭제
	public String qnaDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:qnaNoticeList";
	}

	@RequestMapping("qnaProfDelete")// 교수님용 QNA게시판 글 삭제
	public String qnaProfDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:qnaProfNoticeList";
	}
	@RequestMapping("univDelete")// 대학게시판 글 삭제
	public String univDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univNoticeList";
	}
	@RequestMapping("univSchdDelete")//학사일정 삭제
	public String univSchdDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			adminHelpDeskService.deleteBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univSchdNoticeList";
	}

	/**
	 *5.상세보기
	 * 
	 * */
	@RequestMapping("/portalDetail") // 포털게시판 글 상세보기
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

	@RequestMapping("/deptDetail")// 학과게시판 글 상세보기
	public String detailDept(
			HttpServletRequest request,
			@RequestParam("board_num")String board_num,
			Model model){
		System.out.println("=========================================================================");
		BoardVO boardVo=null;
		String board_count = request.getParameter("board_count");
		try {
			if(board_count != null){
				adminHelpDeskService.updateBoardCount(board_num, board_count);
			}
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptNoticeList",boardVo);
		model.addAttribute("board_num", board_num);
		return "admin/helpDesk/deptDetail";
	}

	@RequestMapping("/faqDetail")// FAQ게시판 글 상세보기
	public String detailFaq(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqNoticeList",boardVo);
		return "admin/helpDesk/faqDetail";
	}

	@RequestMapping("/faqProfDetail")// 교수용 FAQ게시판 글 상세보기
	public String detailFaqProf(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqProfNoticeList",boardVo);
		return "admin/helpDesk/faqProfDetail";
	}

	@RequestMapping("/qnaDetail")// QNA게시판 글 상세보기
	public String detailQna(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaNoticeList",boardVo);
		return "admin/helpDesk/qnaDetail";
	}

	@RequestMapping("/qnaProfDetail")// 교수님용 QNA게시판 글 상세보기
	public String detailQnaProf(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaProfNoticeList",boardVo);
		return "admin/helpDesk/qnaProfDetail";
	}
	@RequestMapping("/univDetail")// 대학게시판 글 상세보기
	public String detailUniv(
			@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univNoticeList",boardVo);
		return "admin/helpDesk/univDetail";
	}

	@RequestMapping("/univSchdDetail")// 학사일정 상세보기
	public String detailunivSchd(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			adminHelpDeskService.updateBoardCount(board_num, board_count);
			boardVo = adminHelpDeskService.selectBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univSchdNoticeList",boardVo);
		return "admin/helpDesk/univSchdDetail";
	}


	/**
	 * 6.검색 search
	 * **/

	@RequestMapping("portalSearch") // 포털게시판 글 검색
	public String portalSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal,String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "PORTAL";
		boardVO.setBoard_bc(bc_num);
		if(board_title==null){
			boardVO.setBoard_title("");
		}else{
			boardVO.setBoard_title(board_title);
		}

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;

		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
			//boardList = adminHelpDeskService.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);

		return "admin/helpDesk/portalNotice";

	}

	@RequestMapping("deptSearch")// 학과게시판 글 검색
	public String deptSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo, String select){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();

		String bc_num = "DEPT";




		boardVO.setBoard_writer("");
		if(select.equals("글쓴이")){
			boardVO.setBoard_writer(board_title);
		}else if(board_title!=null && !board_title.equals("") && select.equals("학과")){
			bc_num = board_title;
		}else if(select.equals("제목")){
			boardVO.setBoard_title(board_title);
		}
		boardVO.setBoard_bc(bc_num);


		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;

		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "admin/helpDesk/deptNotice";

	}

	@RequestMapping("faqSearch")// FAQ 글 검색
	public String faqSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "FAQ";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;

		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "admin/helpDesk/faqNotice";

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
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("faqProfNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "admin/helpDesk/faqProfNotice";

	}
	@RequestMapping("qnaSearch")// QNA 글 검색
	public String qnaSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal,String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "QNA";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;
		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "admin/helpDesk/qnaNotice";

	}

	@RequestMapping("qnaProfSearch")// 교수님용 QNA 글 검색
	public String qnaProfSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal,String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "QNA_PROF";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;
		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaProfNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "admin/helpDesk/qnaProfNotice";

	}

	@RequestMapping("univSearch")// 대학 글 검색
	public String univSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal,String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "UNIV";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		int totalCount = 0;
		try {
			totalCount = adminHelpDeskService.selectBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "admin/helpDesk/univNotice";

	}
	@RequestMapping("univSchdSearch")// 학사일정 검색
	public String univSchdSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "UNIVSCHD";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {

			boardList = adminHelpDeskService.searchBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univSchdNoticeList", boardList);
		return "admin/helpDesk/univSchdNotice";

	}

	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		// TODO Auto-generated method stub

	}





}
