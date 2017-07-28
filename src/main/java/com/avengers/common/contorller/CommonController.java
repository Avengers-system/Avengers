package com.avengers.common.contorller;

import java.io.File;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.sql.SQLException;
import java.util.Random;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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
    private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
    private static String RSA_INSTANCE = "RSA"; // rsa transformation
    public static final int KEY_SIZE = 1024;
	
	
	@Autowired
	CommonServiceImpl service;	
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.context=(WebApplicationContext)applicationContext;		
	}
	
	@RequestMapping("download")
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
	
	@RequestMapping("/login")
	public ModelAndView login(
		HttpSession session,		
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout,
		@RequestParam(value = "sessionEnd", required = false) String sessionEnd
		,HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, InvalidKeySpecException {
		
		ModelAndView model = new ModelAndView();
		System.out.println("login폼 들어오나요?");
		if (error != null && logout==null) {
			model.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			model.addObject("logout", "You've been logged out successfully.");
		}
		if(sessionEnd!=null){
			model.addObject("sessionEnd","중복로그인");
		}
		

		
    	KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
    	generator.initialize(KEY_SIZE);

    	KeyPair keyPair = generator.genKeyPair();
    	KeyFactory keyFactory = KeyFactory.getInstance("RSA");

    	PublicKey publicKey = keyPair.getPublic();
    	PrivateKey privateKey = keyPair.getPrivate();

    	session = request.getSession();
    	// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
    	session.setAttribute("__rsaPrivateKey__", privateKey);

    	// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
    	RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

    	String publicKeyModulus = publicSpec.getModulus().toString(16);
    	String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
    	
    	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    	System.out.println(publicKeyModulus);
    	System.out.println(publicKeyExponent);
    	
    	request.setAttribute("publicKeyModulus", publicKeyModulus);
    	request.setAttribute("publicKeyExponent", publicKeyExponent);
 
        model.setViewName("common/commonLogin");
		
		
		
		return model;
	}
	
	@RequestMapping("/test")
	public ModelAndView loginFom(HttpServletRequest request, HttpServletResponse response) throws ServletException{
		ModelAndView model = new ModelAndView();
		model.setViewName("common/commonMain");
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(request.getParameter("securedUsername"));
		System.out.println(request.getParameter("securedPassword"));
		
		
		String securedUsername = request.getParameter("securedUsername");
	    String securedPassword = request.getParameter("securedPassword");

	        HttpSession session = request.getSession();
	        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
	        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

	        if (privateKey == null) {
	            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
	        }
	        try {
	            String username = decryptRsa(privateKey, securedUsername);
	            String password = decryptRsa(privateKey, securedPassword);
	            request.setAttribute("username", username);
	            request.setAttribute("password", password);
	        } catch (Exception ex) {
	            throw new ServletException(ex.getMessage(), ex);
	        }
	 
	        // 로그인 처리
	        request.setAttribute("securedUsername", securedUsername);
	        request.setAttribute("securedUsername", securedPassword);	
		
		
		return model;
	}
	
	
	
	
	 /**
     * 복호화
     * 
     * @param privateKey
     * @param securedValue
     * @return
     * @throws Exception
     */
    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
    	System.out.println("decryptRsa");
    	
        System.out.println("will decrypt : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        System.out.println("확인?"+decryptedValue);
        return decryptedValue;
    }
 
    /**
     * 16진 문자열을 byte 배열로 변환한다.
     * 
     * @param hex
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
    	System.out.println("hexToByteArray");
    	
        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
 
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
 
    /**
     * rsa 공개키, 개인키 생성
     * 
     * @param request
     */
    public void initRsa(HttpServletRequest request) {
    	
    	System.out.println("initRsa");
        HttpSession session = request.getSession();
 
        KeyPairGenerator generator;
        try {
            generator = KeyPairGenerator.getInstance(CommonController.RSA_INSTANCE);
            generator.initialize(1024);
 
            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(CommonController.RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            session.setAttribute(CommonController.RSA_WEB_KEY, privateKey); // session에 RSA 개인키를 세션에 저장
 
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
 
            request.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 를 request 에 추가
            request.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
        } catch (Exception e) {
            e.printStackTrace();
        }
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
