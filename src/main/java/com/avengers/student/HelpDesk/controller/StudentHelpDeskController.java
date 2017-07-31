package com.avengers.student.HelpDesk.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.avengers.admin.mypage.service.AdminMypageService;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.student.HelpDesk.service.StudentHelpDeskService;
import com.avengers.student.mypage.service.StudentMypageService;

@RequestMapping("/student/helpDesk")
@Controller
public class StudentHelpDeskController {

	@Autowired
	private StudentMypageService myPageService;
	
	
	@Autowired
	public StudentHelpDeskService service;

	/**
	 * 파일 다운로드
	 * @param request
	 * @param fileName
	 * @return
	 */
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

		String url="student/univSchd/univSchdedule";
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
				message="일정수정을 성공하였습니다";
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
	
	@RequestMapping("/studentFAQList")
	public String studentFAQList(Model model, @ModelAttribute BoardVO boardVO) {
		//검색조건, 검색어

		//--페이징 처리
		int totalCount = service.getFAQListCount(boardVO); //게시물 총갯수를 구한다
		boardVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
		model.addAttribute("pageVO", boardVO);
		//--페이징 처리


		List<BoardVO> empList = service.getFAQList(boardVO);
		model.addAttribute("resultList", empList);

		return "/student/helpDesk/studentFAQList";

	}

	@RequestMapping("/studentFAQDetail")
	public String studentFAQDetail(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo = boardVO.getPageNo();
		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());

		model.addAttribute("detail",detail);
		model.addAttribute("pageNo",pageNo);
		return "/student/helpDesk/studentFAQDetail";
	}

	@RequestMapping("/studentFAQUpdatePage")
	public String studentFAQUpdatePage(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo = boardVO.getPageNo();
		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());

		model.addAttribute("detail",detail);
		model.addAttribute("pageNo",pageNo);
		return "/student/helpDesk/studentFAQUpdatePage";
	}

	@RequestMapping("/studentFAQUpdate")
	public String studentFAQUpdate(Model model, @ModelAttribute BoardVO boardVO,HttpServletRequest request){
		int pageNo =boardVO.getPageNo();
		UUID uuid = UUID.randomUUID();

		String upload = request.getSession().getServletContext()
				.getRealPath("resources/upload");
		String saveName= "";
		if (!boardVO.getFile().isEmpty()) {
			saveName = uuid.toString()+"_"+boardVO.getFile().getOriginalFilename();
			File file = new File(upload, saveName);
			try {
				boardVO.getFile().transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			boardVO.setBoard_af(saveName);
			boardVO.setBoard_aff(boardVO.getFile().getOriginalFilename());

		}


		service.updateStudentFAQ(boardVO);

		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());
		model.addAttribute("detail",detail);
		model.addAttribute("pageNo",pageNo);

		return "/student/helpDesk/studentFAQDetail";
	}

	@RequestMapping("/studentFAQDelete")
	public String studentFAQDelete(Model model, @ModelAttribute BoardVO boardVO){
		boardVO.setPageNo(1);
		service.deleteStudentFAQ(boardVO);
		//--페이징 처리
		int totalCount = service.getFAQListCount(boardVO); //게시물 총갯수를 구한다
		boardVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
		model.addAttribute("pageVO", boardVO);
		//--페이징 처리
		List<BoardVO> empList = service.getFAQList(boardVO);
		model.addAttribute("resultList", empList);

		return "/student/helpDesk/studentFAQList";
	}

	@RequestMapping("/studentFAQWritePage")
	public String studentFAQWritePage(Model model, @ModelAttribute BoardVO boardVO){
		int pageNo =boardVO.getPageNo();

		BoardVO detail = service.getStudentFAQDetail(boardVO.getBoard_num());
		model.addAttribute("detail",detail);

		model.addAttribute("pageNo",pageNo);
		return "/student/helpDesk/studentFAQWritePage";
	}

	@RequestMapping("/studentFAQWrite")
	public String studentFAQWrite(Model model, @ModelAttribute BoardVO boardVO,HttpServletRequest request ){
		boardVO.setPageNo(1);
		UUID uuid = UUID.randomUUID();

		String upload = request.getSession().getServletContext()
				.getRealPath("resources/upload");
		String saveName= "";
		if (!boardVO.getFile().isEmpty()) {
			saveName = uuid.toString()+"_"+boardVO.getFile().getOriginalFilename();
			File file = new File(upload, saveName);
			try {
				boardVO.getFile().transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			boardVO.setBoard_af(saveName);
			boardVO.setBoard_aff(boardVO.getFile().getOriginalFilename());
			System.out.println(upload);
			System.out.println(saveName);
		}

		service.writeStudentFAQ(boardVO);



		//--페이징 처리
		int totalCount = service.getFAQListCount(boardVO); //게시물 총갯수를 구한다
		boardVO.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
		model.addAttribute("pageVO", boardVO);
		//--페이징 처리
		List<BoardVO> empList = service.getFAQList(boardVO);
		model.addAttribute("resultList", empList);


		return "/student/helpDesk/studentFAQList";
	}


	////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/main/helpDeskStudMain")
	public String helpDeskStudMain(Model model, Principal principal){

		String key = principal.getName();

		//학과테이블
		BoardVO deptVO = new BoardVO();
		ArrayList<BoardVO> deptList = new ArrayList<BoardVO>();

		String bc_num = "B";
		try {
			bc_num += service.selectStuDept(key);
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
			deptList = service.selectStuBoardList(deptVO,1,2); // 학과리스트
			portalList = service.selectStuBoardList(portalVO,1,2); //포털리스트
			univSchdList = service.selectStuBoardList(univSchdVO, 1,2);//학부리스트
			univList = service.selectStuBoardList(univVO, 1,2);// 학교리스트
			faqList = service.selectStuBoardList(faqVO, 1, 2);//faq리스트
			qnaList = service.selectStuBoardList(qnaVO, 1, 2);//qna리스트

		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("deptNoticeList", deptList);// 학과리스트
		model.addAttribute("portalNoticeList", portalList); // 포털리스트
		model.addAttribute("univSchdNoticeList", univSchdList);// 학부리스트
		model.addAttribute("univNoticeList", univList);// 학교리스트
		model.addAttribute("faqNoticeList", faqList);// faq리스트
		model.addAttribute("qnaNoticeList", qnaList);//qna리스트


		return "student/main/helpDeskMain";
	}


	@RequestMapping("/portalStudNoticeList")//포털게시판조회
	public String studPortalList(Model model, Principal principal, String pageNo){

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
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectStuBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("portalNoticeList", boardList);
		return "student/helpDesk/portalNotice";

	}

	@RequestMapping("/deptStudNoticeList")//학과게시판조회
	public String studDeptList(Model model, Principal principal, String pageNo){

		BoardVO boardVO = new BoardVO();
		ArrayList<BoardVO> boardList = null;

		String key = principal.getName();
		String bc_num = "B";// 게시판 분류코드 
		String deptName = "";
		
		try {
			bc_num += service.selectStuDept(key);
			deptName = service.selectDeptName(bc_num);
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
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectStuBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptName",deptName);
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("deptNoticeList", boardList);
		return "student/helpDesk/deptNotice";

	}



	@RequestMapping("/qnaStudNoticeList")//Q&A 게시판조회
	public String studQnaList(Model model, Principal principal, String pageNo){

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
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectStuBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("qnaNoticeList", boardList);
		return "student/helpDesk/qnaNotice";

	}


	@RequestMapping("univStudNoticeList")// 학교게시판조회
	public String studUnivList(Model model, Principal principal, String pageNo){

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
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectStuBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("univNoticeList", boardList);
		return "student/helpDesk/univNotice";

	}

	@RequestMapping("univStudSchdNoticeList")// 학사일정조회
	public String studunivSchdList(Model model, Principal principal, String pageNo){

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
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.selectStuBoardList(boardVO,boardVO.getStartRowNo(),boardVO.getEndRowNo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO", boardVO);
		model.addAttribute("univSchdNoticeList", boardList);
		return "student/helpDesk/univSchdNotice";

	}
	/***
	 * 2.게시판 글쓰기
	 * */
	@RequestMapping("/portalStudWriteForm")//포털게시판 글쓰기 양식
	public String studPortalWriteForm(
			@ModelAttribute BoardVO boardVO
			,Model model,
			String bc_num){

		BoardVO boardVo=null;

		System.out.println("controller" + bc_num);
		try {
			boardVo = service.selectStuInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		return "student/helpDesk/portalWrite";
	}

	@RequestMapping("/deptStudWriteForm")// 학과게시판 글쓰기 양식
	public String studDeptWriteForm(@ModelAttribute BoardVO boardVO, Model model){
		BoardVO boardVo=null;

		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String key = user.getUsername();

		String bc_num = "B";

		try {
			bc_num += service.selectStuDept(key);
			boardVo = service.selectStuInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		boardVo.setBoard_bc(bc_num);
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "student/helpDesk/deptWrite";
	}

	@RequestMapping("/qnaStudWriteForm")// Q&A게시판 글쓰기 양식
	public String studQnaWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		System.out.println("controller" + bc_num);
		try {
			boardVo = service.selectStuInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "student/helpDesk/qnaWrite";
	}

	@RequestMapping("/univStudWriteForm")// 학교게시판 글쓰기 양식
	public String studUnivWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = service.selectStuInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "student/helpDesk/univWrite";
	}

	@RequestMapping("/univStudSchdWriteForm")// 학사일정등록하기 양식
	public String studunivSchdWriteForm(@ModelAttribute BoardVO boardVO, Model model,
			String bc_num){
		BoardVO boardVo=null;

		try {
			boardVo = service.selectStuInsertBaseData();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("insertBoard",boardVo);

		System.out.println(boardVo.getBoard_num()+"controller");
		return "student/helpDesk/univSchdWrite";
	}

	/**글쓰기 저장하는 곳*/
	@RequestMapping(value = "/portalStudWrite", method = RequestMethod.POST)// 포털게시판 글쓰기 저장
	public String studPortalWrite(HttpServletRequest req
			,@RequestParam("boardaf") MultipartFile af
			,Model model
			, HttpSession sesssion){
		BoardVO boardVO = new BoardVO();
		String url = "redirect:portalStudNoticeList";
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			boardVO.setBoard_af("");
		}
		try {
			service.insertStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value="/deptStudWrite", method = RequestMethod.POST)// 학과게시판 글쓰기 저장
	public String studDeptWrite(HttpServletRequest req
			, @RequestParam("boardaf") MultipartFile af
			, Model model
			, HttpSession session){
		BoardVO boardVO = new BoardVO();
		String url="redirect:deptStudNoticeList";
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			boardVO.setBoard_af("");
		}
		try {
			service.insertStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value="/univStudWrite", method = RequestMethod.POST)// 학교게시판 글쓰기 저장
	public String studUnivWrite(HttpServletRequest req
			, @RequestParam("boardaf") MultipartFile af
			, Model model 
			, HttpSession session){
		BoardVO boardVO = new BoardVO();
		String url = "redirect:univStudNoticeList";
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			boardVO.setBoard_af("");
		}
		try {
			service.insertStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}





	@RequestMapping("/qnaStudWrite")// Q&A게시판 글쓰기 저장
	public String studQnaWrite(HttpServletRequest req, Model model,
			String bc_num){

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		boardVO.setBoard_writer(req.getParameter("board_writer"));
		boardVO.setBoard_bc("QNA");


		try {
			service.insertStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:qnaStudNoticeList";
	}



	@RequestMapping("/univStudSchdWrite")// 학사일정등록 
	public String studunivSchdWrite(HttpServletRequest req, Model model,
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
			service.insertStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return "redirect:univStudSchdNoticeList";
	}

	/**
	 * 3.게시판 수정
	 * **/

	@RequestMapping(value="/portalStudUpdate", method = RequestMethod.POST )// 포털게시판수정
	public String studportalUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:portalStudNoticeList";
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			boardVO.setBoard_af("");
		}

		try {
			service.updateStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value="/deptStudUpdate", method=RequestMethod.POST)// 학과게시판수정
	public String studdeptUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:deptStudNoticeList";
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			boardVO.setBoard_af("");
		}

		try {
			service.updateStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value="/univStudUpdate", method=RequestMethod.POST)// 대학게시판수정
	public String studunivUpdate(@RequestParam("boardtoa") MultipartFile af, 
			Model model,
			String bc_num, HttpServletRequest req, HttpSession session){
		String url = "redirect:univStudNoticeList";
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			boardVO.setBoard_af("");
		}

		try {
			service.updateStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}



	@RequestMapping("/qnaStudUpdate")// Q&A게시판수정
	public String studqnaUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			service.updateStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:qnaStudNoticeList";
	}



	@RequestMapping("/univStudSchdUpdate")// 학사일정수정
	public String studunivSchdUpdate(
			String bc_num, HttpServletRequest req){
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		boardVO.setBoard_title(req.getParameter("board_title"));
		boardVO.setBoard_cont(req.getParameter("board_cont"));
		boardVO.setBoard_af(req.getParameter("board_af"));
		try {
			service.updateStuBoard(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univStudSchdNoticeList";
	}

	/**
	 * 4.글 삭제
	 * 
	 * **/
	@RequestMapping("portalStudDelete")// 포털게시판 글 삭제
	public String studportalDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteStuBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:portalStudNoticeList";
	}

	@RequestMapping("deptStudDelete")// 학과게시판 글 삭제
	public String studdeptDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteStuBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:deptStudNoticeList";
	}

	@RequestMapping("qnaStudDelete")// QNA게시판 글 삭제
	public String studqnaDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteStuBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:qnaStudNoticeList";
	}

	@RequestMapping("univStudDelete")// 대학게시판 글 삭제
	public String studunivDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteStuBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univStudNoticeList";
	}
	@RequestMapping("univStudSchdDelete")//학사일정 삭제
	public String studunivSchdDelete(String board_num){
		int bNum = Integer.parseInt(board_num);
		System.out.println(bNum);
		try {
			service.deleteStuBoard(bNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:univStudSchdNoticeList";
	}

	/**
	 *5.상세보기
	 * 
	 * */
	@RequestMapping("/portalStudDetail") // 포털게시판 글 상세보기
	public String studdetailPortal(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateStuBoardCount(board_num, board_count);
			boardVo = service.selectStuBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList",boardVo);
		return "student/helpDesk/portalDetail";
	}

	@RequestMapping("/deptStudDetail")// 학과게시판 글 상세보기
	public String studdetailDept(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateStuBoardCount(board_num, board_count);
			boardVo = service.selectStuBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("deptNoticeList",boardVo);
		return "student/helpDesk/deptDetail";
	}



	@RequestMapping("/qnaStudDetail")// QNA게시판 글 상세보기
	public String studdetailQna(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateStuBoardCount(board_num, board_count);
			boardVo = service.selectStuBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaNoticeList",boardVo);
		return "student/helpDesk/qnaDetail";
	}

	@RequestMapping("/univStudDetail")// 대학게시판 글 상세보기
	public String studdetailUniv(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateStuBoardCount(board_num, board_count);
			boardVo = service.selectStuBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univNoticeList",boardVo);
		return "student/helpDesk/univDetail";
	}

	@RequestMapping("/univStudSchdDetail")// 학사일정 상세보기
	public String studdetailunivSchd(@RequestParam("board_num")String board_num,
			@RequestParam("board_count")String board_count, Model model){
		BoardVO boardVo=null;
		try {
			service.updateStuBoardCount(board_num, board_count);
			boardVo = service.selectStuBoard(board_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univSchdNoticeList",boardVo);
		return "student/helpDesk/univSchdDetail";
	}


	/**
	 * 6.검색 search
	 * **/

	@RequestMapping("portalStudSearch") // 포털게시판 글 검색
	public String studportalSearch(@RequestParam("board_title")String board_title,
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
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchStuBoardList(boardVO);
			//boardList = service.selectBoardList(boardVO,1,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("portalNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);

		return "student/helpDesk/portalNotice";

	}

	@RequestMapping("deptStudSearch")// 학과게시판 글 검색
	public String studdeptSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "B";
		String deptName = "";
		
		String key = principal.getName();
		int totalCount = 0;

		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}

		try {
			bc_num += service.selectStuDept(key);
			boardVO.setBoard_bc(bc_num);
			boardVO.setBoard_title(board_title);
			deptName = service.selectDeptName(bc_num); 
					
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchStuBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("deptName",deptName);
		model.addAttribute("deptNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "student/helpDesk/deptNotice";

	}


	@RequestMapping("qnaStudSearch")// QNA 글 검색
	public String studqnaSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;


		BoardVO boardVO = new BoardVO();
		int totalCount = 0;
		if(pageNo!=null && !pageNo.equals("")){
			boardVO.setPageNo(Integer.parseInt(pageNo));
		}
		String bc_num = "QNA";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchStuBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "student/helpDesk/qnaNotice";

	}


	@RequestMapping("univStudSearch")// 대학 글 검색
	public String studunivSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal, String pageNo){

		ArrayList<BoardVO> boardList = null;

		BoardVO boardVO = new BoardVO();
		String bc_num = "UNIV";
		int totalCount = 0;
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {
			totalCount = service.selectStuBoardCount(boardVO);
			boardVO.setTotalCount(totalCount);
			boardList = service.searchStuBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univNoticeList", boardList);
		model.addAttribute("pageVO", boardVO);
		return "student/helpDesk/univNotice";

	}
	@RequestMapping("univStudSchdSearch")// 학사일정 검색
	public String studunivSchdSearch(@RequestParam("board_title")String board_title,
			Model model, Principal principal){

		ArrayList<BoardVO> boardList = null;
		

		BoardVO boardVO = new BoardVO();
		String bc_num = "UNIVSCHD";
		boardVO.setBoard_bc(bc_num);
		boardVO.setBoard_title(board_title);

		try {

			boardList = service.searchStuBoardList(boardVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("univSchdNoticeList", boardList);
		return "student/helpDesk/univSchdNotice";

	}

}
