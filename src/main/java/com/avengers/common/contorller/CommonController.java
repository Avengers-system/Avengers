package com.avengers.common.contorller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.avengers.db.dto.BoardVO;

@Controller
public class CommonController implements ApplicationContextAware{
	private WebApplicationContext context = null;
	
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
}