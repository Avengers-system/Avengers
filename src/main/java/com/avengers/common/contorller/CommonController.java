package com.avengers.common.contorller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.avengers.common.serviceImpl.CommonServiceImpl;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.BoardVO;

@Controller
public class CommonController implements ApplicationContextAware{
	private WebApplicationContext context = null;
	
	
	@Autowired
	CommonServiceImpl service;	
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.context=(WebApplicationContext)applicationContext;		
	}
	
	@RequestMapping("/download")
	public ModelAndView doenload(@ModelAttribute BoardVO boardVO, HttpServletResponse response) throws IOException{
			System.out.println("@@@@@@@@@@@"+boardVO.getBoard_af());
			File downloadFile = getFile(boardVO.getBoard_af());
			
			if(downloadFile==null){
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
			//뷰 ,모델이름, 모델
			return new ModelAndView("downloadView","downloadFile",downloadFile);
	}
	
	private File getFile(String fileId){
		String baseDir = context.getServletContext().getRealPath("/resources/upload");
		System.out.println("!!!!!!!!!!!"+fileId);
		if(!fileId.isEmpty()){
			System.out.println(fileId);
			return new File(baseDir,fileId);
		}
		return null;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
		HttpSession session,		
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout,
		@RequestParam(value = "sessionEnd", required = false) String sessionEnd) {
		ModelAndView model = new ModelAndView();
		
		
		if (error != null && logout==null) {
			model.addObject("error", "Invalid username and password!");
		}
 
		if (logout != null) {
			model.addObject("logout", "You've been logged out successfully.");
		}
		if(sessionEnd!=null){
			model.addObject("sessionEnd","중복로그인");
		}
		
		model.setViewName("common/commonLogin");

		return model;
	}
	
	 // 아이디 찾기
    @RequestMapping(value = "/findId", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String email,@RequestParam String name,  Model model) {
        AdminVO adminVO= new AdminVO();
        adminVO.setAdmin_nm(name);
        adminVO.setAdmin_email(email);
        AdminVO findVO = service.findInfo(adminVO);
        if (findVO != null) {
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + findVO.getAdmin_id() + " 입니다.");
            try {
				service.selectId(subject, sb.toString(),"qowls0527@gmail.com", email, name);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            model.addAttribute("resultMsg", "귀하의 이메일 주소로 가입된 아이디를 발송 하였습니다.");
            model.addAttribute("resultTitle", "조회성공");
        } else {
        	model.addAttribute("resultTitle", "조회실패");
        	model.addAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "common/commonLogin";
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "/findPwd", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, Model model) {
        AdminVO adminVO= new AdminVO();
        adminVO.setAdmin_id(id);
        adminVO.setAdmin_email(email);
        String role = service.findRole(adminVO);
        if (role != null) {          
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            try {
				service.selectPw(subject, sb.toString(), "qowls0527@gmail.com", email, id,password,role);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            model.addAttribute("resultTitle", "조회성공");
            model.addAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
        	model.addAttribute("resultTitle", "조회실패");
        	model.addAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "common/commonLogin";
    }
	
	
	
}