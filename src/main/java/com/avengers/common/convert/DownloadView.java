package com.avengers.common.convert;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{

	
	public DownloadView(){
		setContentType("application/download;charset=utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		File file=(File)model.get("downloadFile");	
		 
		response.setContentLength((int)file.length());

		String fileName = URLEncoder.encode(file.getName(),"utf-8");
		
		response.setHeader("Content-Disposition", "attrachment;filename=\""+fileName+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try{
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		}finally{
			if(fis!=null){
				fis.close();
			}
		}
		out.flush();
		
	}

}
