package com.avengers.student.schoolRegister.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.schoolRegister.service.StudentSchoolRegisterService;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
@RequestMapping("/student")
public class StudentSchoolRegisterController {

	@Autowired
	private StudentSchoolRegisterService service;
	
	
	@RequestMapping("/schoolRegister/certificate")
	public String certificate(){
		return "/student/schoolRegister/certificate";
	}
	
	@RequestMapping("/schoolRegister/gradeCertificate")
	public String gradeCertificate(Principal principal, Model model , HttpServletRequest request){
		String stud_num = principal.getName();
		HashMap<String,String> gradeInfo = null; //성명,학번,학과,학적상태
		List<HashMap<String,String>> gradeList = null;//학기, 과목명, 취득학점,성적
		int allGrade = 0; //총 취득학점
		int allGradeCount = 0; // 총취득학점/allGradeCount = 총평점평균
		try {
			gradeInfo = service.selectGradeInfo(stud_num);
			gradeList = service.selectGradeList(stud_num);
			allGrade = service.selectAllGrade(stud_num);
			allGradeCount = service.selectAllGradeCount(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String path =request.getSession().getServletContext().getRealPath("/");
		 
		try {
			createGradeCertificate(gradeInfo, gradeList, allGrade, allGradeCount,path);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/student/schoolRegister/gradeCertificate";
	}
	
	@RequestMapping("/schoolRegister/enrollmentCertificate")
	public String enrollmentCertificate(Principal principal, Model model , HttpServletRequest request){
		String stud_num = principal.getName();
		HashMap<String,String> gradeInfo = null; //성명,학번,학과,학적상태
		try {
			gradeInfo = service.selectGradeInfo(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String path =request.getSession().getServletContext().getRealPath("/");
		try {
			createEnrollmentCertificate(gradeInfo, path);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/student/schoolRegister/enrollmentCertificate";
	}
	
	@RequestMapping("/schoolRegister/graduatedCertificate")
	public String graduatedCertificate(Principal principal, Model model,HttpServletRequest request){
		
		String stud_num = principal.getName();
		HashMap<String,String> gradeInfo = null; //성명,학번,학과,학적상태
		try {
			gradeInfo = service.selectGradeInfo(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String path =request.getSession().getServletContext().getRealPath("/");
		try {
			createGraduatedCertificate(gradeInfo, path);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		
		
		return "/student/schoolRegister/graduatedCertificate";
	}
	
	
	@RequestMapping("/schoolRegister/leaveBackList")
	public String leaveBack(Principal principal, Model model){
		String stud_num = principal.getName();
		ArrayList<LoaVO> leaveList = null;
		ArrayList<RtsVO> backList = null;
		try {
			leaveList = service.selectLeaveList(stud_num);
			backList = service.selectBackList(stud_num);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		model.addAttribute("leaveList",leaveList);
		model.addAttribute("backList",backList);
		return "/student/schoolRegister/leaveBackList";
	}
	
	@RequestMapping("/schoolRegister/leaveBackApplyPage")
	public String leaveBackApplyPage(Principal principal, Model model){
		
		
		return "/student/schoolRegister/leaveBackApplyPage";
	}
	
	@RequestMapping("/schoolRegister/leaveApply")
	public String leaveApply(@ModelAttribute LoaVO vo  ,Principal principal){
		String loa_stud = principal.getName();
		vo.setLoa_stud(loa_stud);
		
		try {
			service.applyLeave(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "/student/schoolRegister/leaveBackList";
	}
	
	@RequestMapping("/schoolRegister/backApply")
	public String backApply(@ModelAttribute RtsVO vo , Principal principal){
		String rts_stud = principal.getName();
		vo.setRts_stud(rts_stud);
		
		try {
			service.applyBack(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "/student/schoolRegister/leaveBackList";
	}
	
	@RequestMapping("/schoolRegister/dropOff")
	public String dropOffPage(Principal principal, Model model){
		String stud_num = principal.getName();
		ArrayList<LsVO> list = null;
		try {
			list = service.selectDropOffList(stud_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("dropOffList",list);
		
		
		return "/student/schoolRegister/dropOff";
	}
	@RequestMapping("/schoolRegister/dropOffApply")
	public String dropOffApply(@ModelAttribute LsVO vo , Principal principal, Model model){
		String ls_stud = principal.getName();
		vo.setLs_stud(ls_stud);
		ArrayList<LsVO> list = null;
		try {
			service.applyDropOff(vo);
			list = service.selectDropOffList(ls_stud);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("dropOffList",list);
		return "/student/schoolRegister/dropOff";
	}
	
	
	   public void createGraduatedCertificate(HashMap<String,String> gradeInfo, String path)throws DocumentException, IOException{
		      //pdf 만들기

		            String filename = path+"resources/upload/graduated.pdf";
		            
		            
		            
		            Document document = new Document();
		            PdfWriter.getInstance(document, new FileOutputStream(filename));

		            document.open();

		            Rectangle rect = new Rectangle(550, 800, 50, 70);
		            rect.setBorder(Rectangle.BOX);
		            rect.setBorderWidth(2);
		            rect.setBorderColor(BaseColor.BLACK);
		            document.add(rect);

		            BaseFont basefont = BaseFont.createFont(path+"resources/upload/malgun.TTF",
		                  BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		            Font font1 = new Font(basefont, 50);
		            Font font = new Font(basefont, 20);
		            Font font2 = new Font(basefont, 35);
		            Font font3 = new Font(basefont, 15);
		            document.add(new Paragraph("증명서"));

		            Paragraph paragraph2 = new Paragraph();
		            Paragraph paragraph3 = new Paragraph();
		            Paragraph paragraph4 = new Paragraph();
		            Paragraph paragraph5 = new Paragraph();

		            paragraph2.setSpacingAfter(25);
		            paragraph2.setSpacingBefore(25);
		            paragraph2.setAlignment(Element.ALIGN_CENTER);
		            paragraph2.setIndentationLeft(50);
		            paragraph2.setIndentationRight(50);

		            paragraph3.setSpacingAfter(25);
		            paragraph3.setSpacingBefore(25);
		            paragraph3.setAlignment(Element.ALIGN_CENTER);
		            paragraph3.setIndentationLeft(50);
		            paragraph3.setIndentationRight(50);
		            
		            
		            paragraph4.setAlignment(Element.ALIGN_CENTER);
		            paragraph4.setIndentationLeft(50);
		            paragraph4.setIndentationRight(50);
		            
		            paragraph5.setSpacingAfter(25);
		            paragraph5.setSpacingBefore(25);
		            paragraph5.setAlignment(Element.ALIGN_CENTER);
		            paragraph5.setIndentationLeft(50);
		            paragraph5.setIndentationRight(50);

		            document.addTitle("졸업 증명서");
		            // 제목
		            Chunk chunk = new Chunk("졸 업 증 명 서", font1);
		            
		            paragraph2.add(chunk);
		            document.add(paragraph2);

		            // 내용
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("    "+"성             명 : " + gradeInfo.get("stud_nm"), font));
		            document.add(new Paragraph("    "+"학             번 : "+ gradeInfo.get("stud_num"), font));
		            document.add(new Paragraph("    "+"학             과 : "+ gradeInfo.get("dept_nm"), font));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "+" 위 사람은 학점인정 등에 관한 법률 제 9조 및 학칙",font));
		            document.add(new Paragraph("   "+"제 35조의 2규정에 의하여 위의 사실을 증명합니다 ",font));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            document.add(new Paragraph("   "));
		            // 증명서 날짜 출력
		            Date today = new Date();
		            SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		            
		            Chunk chunk5 = new Chunk("  " + sdf.format(today), font3);
//		            document.add(new Paragraph("  " + sdf.format(today), font));
		            paragraph5.add(chunk5);
		            document.add(paragraph5);
		            Chunk chunk3 = new Chunk("", font);
//		            document.add(new Paragraph2("  위의 사실을 증명합니다.", font));
		            document.add(new Paragraph("   "));
		            paragraph4.add(chunk3);   
		                document.add(paragraph4);
		                
		            // ㅇㅇ 대학교
		            Chunk chunk2 = new Chunk("[A]  U N I V E R S I T Y", font2);
		            paragraph3.add(chunk2);
		            document.add(paragraph3);

		               
		            // 도장 추가
		            Image image2 = Image.getInstance(path+"resources/upload/sign.png");
		            image2.setAbsolutePosition(450f, 95f);
		            image2.scaleAbsolute(50, 50);
		            document.add(image2);

		            // step 5
		            document.close();
		            
		            
		            
		      
		   }
	
	
	
	
	
	public void createEnrollmentCertificate(HashMap<String,String> gradeInfo, String path)throws DocumentException, IOException{
		//pdf 만들기

				String filename = path+"resources/upload/enrollment.pdf";
				
				
				
				Document document = new Document();
				PdfWriter.getInstance(document, new FileOutputStream(filename));

				document.open();

				Rectangle rect = new Rectangle(550, 800, 50, 70);
				rect.setBorder(Rectangle.BOX);
				rect.setBorderWidth(2);
				rect.setBorderColor(BaseColor.BLACK);
				document.add(rect);

				BaseFont basefont = BaseFont.createFont(path+"resources/upload/malgun.TTF",
						BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
				Font font = new Font(basefont, 20);

				document.add(new Paragraph("증명서"));

				Paragraph paragraph2 = new Paragraph();
				Paragraph paragraph3 = new Paragraph();

				paragraph2.setSpacingAfter(25);
				paragraph2.setSpacingBefore(25);
				paragraph2.setAlignment(Element.ALIGN_CENTER);
				paragraph2.setIndentationLeft(50);
				paragraph2.setIndentationRight(50);

				paragraph3.setSpacingAfter(25);
				paragraph3.setSpacingBefore(25);
				paragraph3.setAlignment(Element.ALIGN_CENTER);
				paragraph3.setIndentationLeft(50);
				paragraph3.setIndentationRight(50);

				document.addTitle("재학 증명서");
				// 제목
				Chunk chunk = new Chunk("재 학 증 명 서", font);
				paragraph2.add(chunk);
				document.add(paragraph2);

				// 내용
				document.add(new Paragraph("  성             명 : " + gradeInfo.get("stud_nm"), font));
				document.add(new Paragraph("  학             번 : "+ gradeInfo.get("stud_num"), font));
				document.add(new Paragraph("  학             과 : "+ gradeInfo.get("dept_nm"), font));
				
				document.add(new Paragraph("  위의 사실을 증명합니다.", font));

				// 증명서 날짜 출력
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
				document.add(new Paragraph("  " + sdf.format(today), font));

				// ㅇㅇ 대학교
				Chunk chunk2 = new Chunk("[A]  U N I V E R S I T Y", font);
				paragraph3.add(chunk2);
				document.add(paragraph3);

					
				// 도장 추가
				Image image2 = Image.getInstance(path+"resources/upload/sign.png");
				image2.setAbsolutePosition(450f, 95f);
				image2.scaleAbsolute(50, 50);
				document.add(image2);

				// step 5
				document.close();
				
				
				
		
	}
	
	
	public void createGradeCertificate(HashMap<String,String> gradeInfo,List<HashMap<String,String>> gradeList, int allGrade, int allGradeCount,String path) throws DocumentException, IOException{
		//pdf 만들기

		String filename = path+"resources/upload/grade.pdf";
		
		
		
		Document document = new Document();
		PdfWriter.getInstance(document, new FileOutputStream(filename));

		document.open();

		Rectangle rect = new Rectangle(550, 800, 50, 70);
		rect.setBorder(Rectangle.BOX);
		rect.setBorderWidth(2);
		rect.setBorderColor(BaseColor.BLACK);
		document.add(rect);

		BaseFont basefont = BaseFont.createFont(path+"resources/upload/malgun.TTF",
				BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(basefont, 20);

		document.add(new Paragraph("증명서"));

		Paragraph paragraph2 = new Paragraph();
		Paragraph paragraph3 = new Paragraph();

		paragraph2.setSpacingAfter(25);
		paragraph2.setSpacingBefore(25);
		paragraph2.setAlignment(Element.ALIGN_CENTER);
		paragraph2.setIndentationLeft(50);
		paragraph2.setIndentationRight(50);

		paragraph3.setSpacingAfter(25);
		paragraph3.setSpacingBefore(25);
		paragraph3.setAlignment(Element.ALIGN_CENTER);
		paragraph3.setIndentationLeft(50);
		paragraph3.setIndentationRight(50);

		document.addTitle("성적 증명서");
		// 제목
		Chunk chunk = new Chunk("성 적 증 명 서", font);
		paragraph2.add(chunk);
		document.add(paragraph2);

		// 내용
		document.add(new Paragraph("  성             명 : " + gradeInfo.get("stud_nm"), font));
		document.add(new Paragraph("  학             번 : "+ gradeInfo.get("stud_num"), font));
		document.add(new Paragraph("  학             과 : "+ gradeInfo.get("dept_nm"), font));
		document.add(new Paragraph("년도 / 학기 / 과목명 / 과목구분 / 학점 / 평점 ", font));
		
		for(int i=0;i<gradeList.size();i++){
			document.add(new Paragraph(gradeList.get(i).get("lct_yr")+"/"
					+gradeList.get(i).get("lct_qtr") +"/"
					+gradeList.get(i).get("lct_nm") +"/"
					+gradeList.get(i).get("sjt_cd") +"/"
					+gradeList.get(i).get("lct_crd") +"/"
					+gradeList.get(i).get("tl_mark")
					, font));
		}
		
		document.add(new Paragraph("  총    취 득 학 점 : "+ allGrade, font));
		document.add(new Paragraph("  총    평 점 평 균 : "+ (allGrade/allGradeCount) , font));
		document.add(new Paragraph("  위의 사실을 증명합니다.", font));

		// 증명서 날짜 출력
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		document.add(new Paragraph("  " + sdf.format(today), font));

		// ㅇㅇ 대학교
		Chunk chunk2 = new Chunk("[A]  U N I V E R S I T Y", font);
		paragraph3.add(chunk2);
		document.add(paragraph3);

			
		// 도장 추가
		Image image2 = Image.getInstance(path+"resources/upload/sign.png");
		image2.setAbsolutePosition(450f, 95f);
		image2.scaleAbsolute(50, 50);
		document.add(image2);

		// step 5
		document.close();
		
		
		
	}
	
}
