package com.avengers.db.dto;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
 
//여긴 그냥 복붙하셈~~~~~~~~~~~~
public class DownloadView extends AbstractView {
 
 
    public void Download(){
         
        setContentType("application/download1; utf-8");
         
    }
         
    protected void renderMergedOutputModel(Map<String, Object> model,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub
         
        File file = (File)model.get("downloadFile");
        System.out.println("DownloadView --> file.getPath() : " + file.getPath());
        System.out.println("DownloadView --> file.getName() : " + file.getName());
         
        response.setContentType(getContentType());
        response.setContentLength((int)file.length());
         
        String userAgent = request.getHeader("User-Agent");
         
        boolean ie = userAgent.indexOf("MSIE") > -1;
        boolean chrome = userAgent.indexOf("Chrome") > -1;
        boolean firefox = userAgent.indexOf("Firefox") > -1;
        String fileName = null;
         
        if(ie){
           fileName = URLEncoder.encode(file.getName(), "utf-8");
        } else if(chrome){
           fileName = URLEncoder.encode(file.getName(), "utf-8");
        } else if(firefox){
           fileName = URLEncoder.encode(file.getName(), "utf-8");
        } else {
            fileName = new String(file.getName().getBytes("utf-8"));
        }// end if;
        
         
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
         
        response.setHeader("Content-Transfer-Encoding", "binary");
         
        OutputStream out = response.getOutputStream();
         
        FileInputStream fis = null;
         
        try {
             
            fis = new FileInputStream(file);
             
            FileCopyUtils.copy(fis, out);
             
             
        } catch(Exception e){
             
            e.printStackTrace();
             
        }finally{
             
            if(fis != null){
                 
                try{
                    fis.close();
                }catch(Exception e){}
            }
             
        }// try end;
         
        out.flush();
         
        //1. 업로드용 폴더를 공통으로 만들든가.
        //2. 
    }// render() end;

}