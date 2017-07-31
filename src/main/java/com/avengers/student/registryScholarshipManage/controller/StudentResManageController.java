package com.avengers.student.registryScholarshipManage.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avengers.db.dto.LoaRtsVO;
import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.resSchStudentVO;
import com.avengers.student.registryScholarshipManage.serviceImpl.StudentResManageServiceImpl;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.lowagie.text.Cell;
/**
 * 학생 등록/장학관리
 * @author 조영훈
 * @version 0.1
 * @since 2017.07.18
 *
 */
@Controller
@RequestMapping("/student")
public class StudentResManageController {

	@Autowired
	private StudentResManageServiceImpl stuResService;
	
	@RequestMapping("/studRes")
	public String studRes(Principal princiapl
			,Model model
			,@RequestParam(value="lct_yr",defaultValue="2016")String lct_yr
			,@RequestParam(value="scr_year",required=false)String scr_year
			,@RequestParam(value="scr_qtr",required=false)String scr_qtr
			,@RequestParam(value="scrappl_year",required=false)String scrappl_year
			,@RequestParam(value="scrappl_qtr",required=false)String scrappl_qtr
			){
		String url="student/registryScholarshipManage/registryScholarshipManageMain";
		String loa_stud= princiapl.getName();
		String entrance_year = loa_stud.substring(0,4);//입학년도
		GregorianCalendar today = new GregorianCalendar ( );
		int today_year = today.get ( today.YEAR );	
		ArrayList<String> yearList = new ArrayList<String>();
		int IntegerEntrance_year = 2016;
		try {
			IntegerEntrance_year = Integer.parseInt(entrance_year);
		} catch (Exception e) {
			
		}
		for (int i = IntegerEntrance_year; i < today_year+1 ; i++) {
			yearList.add(Integer.toString(i));
		}
		model.addAttribute("yearList",yearList);
		
		String message="";
		int grades = 0 ;// 학점
		double average_rating=0.0;//평균평점
		
		resSchStudentVO resSchStudent = new resSchStudentVO();
		ArrayList<resSchStudentVO> stuRes = null;
		ArrayList<LoaRtsVO> LoaRts = null; 
		resSchStudentVO studInfo = new resSchStudentVO();
		try {
			stuRes =stuResService.selectResSchHistory(loa_stud,lct_yr);
			LoaRts = stuResService.selectLoaRts(loa_stud);//휴학 및 복학 
			studInfo = stuResService.selectStudInfo(loa_stud);
			if(stuRes == null || stuRes.size()==0){
				message="조회된 결과가 없습니다.";
			}else{
				for (int i = 0; i < LoaRts.size(); i++) {
					for (int j = 0; j < stuRes.size(); j++) {
						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
						String year = transFormat.format(LoaRts.get(i).getLOA_START_DATE());//강의 개설년도
						
						//강의개설년도와 휴학년도가 같이 않다면,그 해 년도 학점을 계산한다.
						if(!year.equals(stuRes.get(j).getLct_yr())){
							if(stuRes.get(j).getTl_asmt_check().equals("2")){//강의평가를 완료했다면
								
								//각 과목의 평점 * 학점을 더한다
								average_rating  += stuRes.get(j).getTl_mark() * Integer.parseInt(stuRes.get(j).getLct_crd());
					
								grades += Integer.parseInt(stuRes.get(j).getLct_crd());
							}
						}
					}
				}
				//최종 평균평점 = (각 과목의 평점*학점을 더한값)/과목의 모든 학점을 더한 값
				average_rating = average_rating/grades;
				average_rating = ((int)(average_rating*100+0.5))/100d;
			}
			resSchStudent.setCol_nm(studInfo.getCol_nm());//공과대
			resSchStudent.setDept_nm(studInfo.getDept_nm());//전공
			resSchStudent.setStud_grd(studInfo.getStud_grd());//학년
			resSchStudent.setStud_nm(studInfo.getStud_nm());//이름
			resSchStudent.setStud_num(studInfo.getStud_num());//학번
			ScrapplVO scrApplVO = new ScrapplVO();
			scrApplVO.setScrappl_stud(loa_stud);
			scrApplVO.setScrappl_yr(scr_year);
			scrApplVO.setScrappl_qtr(scr_qtr);
			List<HashMap<String,String>> selectScrList =stuResService.selectScrList(scrApplVO); 		 
			scrApplVO.setScrappl_yr(scrappl_year);
			scrApplVO.setScrappl_qtr(scrappl_qtr);			
			List<HashMap<String,String>> selectScrApplList =  stuResService.selectScrApplList(scrApplVO);
			model.addAttribute("scrList", selectScrList);
			model.addAttribute("scrApplList", selectScrApplList);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
			
		model.addAttribute("resSchStudent",resSchStudent);
		model.addAttribute("grades",grades);//취득학점
		model.addAttribute("average_rating", average_rating);//평균평점
		model.addAttribute("message",message);
		return url; 
	}
	/**
	 * 장학금신청 페이지
	 * @return
	 */
	@RequestMapping("/schAppl")
	public String schAppl(Model model){	
		String url="student/registryScholarshipManage/registryScholarshipApplication";
		try {
			ArrayList<ScrVO> scrList = stuResService.selectScrVO();
			model.addAttribute("scrList",scrList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return url;		
	}
	/**
	 * 신청등록했을시에 insert해주고 그결과를 
	 * schAppl에 다시 보여준다.
	 * @return
	 */
	@RequestMapping(value="/insertSchAppl",method=RequestMethod.POST)
	public String insertSchAppl(Principal principal,@RequestParam(value="scr_nm")String scr_nm,Model model,@RequestParam(value="scrappl_cause")String scrappl_cause){
		ScrapplVO scrapplVO = new ScrapplVO();
		try {
			GregorianCalendar today = new GregorianCalendar ( );
			int today_year = today.get ( today.YEAR );
			int qtr = today.get(today.MONTH)+1;
			if(qtr>=1&&qtr<=5){
				qtr=1;
			}else if(qtr>=11){
				qtr=1;
				today_year+=1;
			}else{
				qtr=2;
			}
			
			String stud_num = principal.getName();
			scrapplVO.setScrappl_stud(stud_num);			
			scrapplVO.setScrappl_scr(scr_nm);
			scrapplVO.setScrappl_cause(scrappl_cause);
			scrapplVO.setScrappl_yr(Integer.toString(today_year));
			scrapplVO.setScrappl_qtr(Integer.toString(qtr));
			stuResService.insertScrappl(scrapplVO);	
			model.addAttribute("insertScrappl","success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:schAppl";	
	}
	/**
	 * 등록현황 조회
	 * @param princiapl
	 * @param model
	 * @return
	 */
	@RequestMapping("/tuition")
	public String tuition(Principal princiapl
			,Model model
			,@RequestParam(value="lct_yr",defaultValue="2016")String lct_yr
			,@RequestParam(value="reg_yr",required=false)String reg_yr
			,@RequestParam(value="reg_qtr",required=false)String reg_qtr){		
		String url="student/registryScholarshipManage/registryScholarshipTuition";
		String loa_stud= princiapl.getName();
		String entrance_year = loa_stud.substring(0,4);//입학년도
		GregorianCalendar today = new GregorianCalendar ( );
		int today_year = today.get ( today.YEAR );	
		ArrayList<String> yearList = new ArrayList<String>();
		int IntegerEntrance_year = 2016;
		try {
			IntegerEntrance_year = Integer.parseInt(entrance_year);
		} catch (Exception e) {
			
		}
		for (int i = IntegerEntrance_year; i < today_year+1 ; i++) {
			yearList.add(Integer.toString(i));
		}
		model.addAttribute("yearList",yearList);
		
		String message="";
		int grades = 0 ;// 학점
		double average_rating=0.0;//평균평점
		
		resSchStudentVO resSchStudent = new resSchStudentVO();
		ArrayList<resSchStudentVO> stuRes = null;
		ArrayList<LoaRtsVO> LoaRts = null; 
		resSchStudentVO studInfo = new resSchStudentVO();
		try {
			stuRes =stuResService.selectResSchHistory(loa_stud,lct_yr);
			LoaRts = stuResService.selectLoaRts(loa_stud);//휴학 및 복학 
			studInfo = stuResService.selectStudInfo(loa_stud);
			if(stuRes == null || stuRes.size()==0){
				message="조회된 결과가 없습니다.";
			}else{
				for (int i = 0; i < LoaRts.size(); i++) {
					for (int j = 0; j < stuRes.size(); j++) {
						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
						String year = transFormat.format(LoaRts.get(i).getLOA_START_DATE());//강의 개설년도
						
						//강의개설년도와 휴학년도가 같이 않다면,그 해 년도 학점을 계산한다.
						if(!year.equals(stuRes.get(j).getLct_yr())){
							if(stuRes.get(j).getTl_asmt_check().equals("2")){//강의평가를 완료했다면
								
								//각 과목의 평점 * 학점을 더한다
								average_rating  += stuRes.get(j).getTl_mark() * Integer.parseInt(stuRes.get(j).getLct_crd());
					
								grades += Integer.parseInt(stuRes.get(j).getLct_crd());
							}
						}
					}
				}
				//최종 평균평점 = (각 과목의 평점*학점을 더한값)/과목의 모든 학점을 더한 값
				average_rating = average_rating/grades;
				average_rating = ((int)(average_rating*100+0.5))/100d;
			}
			resSchStudent.setCol_nm(studInfo.getCol_nm());//공과대
			resSchStudent.setDept_nm(studInfo.getDept_nm());//전공
			resSchStudent.setStud_grd(studInfo.getStud_grd());//학년
			resSchStudent.setStud_nm(studInfo.getStud_nm());//이름
			resSchStudent.setStud_num(studInfo.getStud_num());//학번
			
			RegVO regVO = new RegVO();
			regVO.setReg_stud(loa_stud);
			regVO.setReg_yr(reg_yr);
			regVO.setReg_qtr(reg_qtr);
			List<HashMap<String,String>> selectRegList =stuResService.selectRegList(regVO); 		 
			model.addAttribute("tuitionList", selectRegList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
			
		model.addAttribute("resSchStudent",resSchStudent);
		model.addAttribute("grades",grades);//취득학점
		model.addAttribute("average_rating", average_rating);//평균평점
		model.addAttribute("message",message);
		
		return url;		
	}
	/**
	 * 등록금 관리
	 * @param princiapl
	 * @param model
	 * @return
	 */
	@RequestMapping("/tuitionManage")
	public String tuitionManage(Principal princiapl,Model model,HttpServletRequest request){		
		String url="student/registryScholarshipManage/registryScholarshipTuitionManage";
		String path =request.getSession().getServletContext().getRealPath("/");
		GregorianCalendar today = new GregorianCalendar ( );
		String reg_yr = Integer.toString(today.get(today.YEAR));
		String reg_qtr = "1";
		int month= today.get(today.MONTH)+1;
		if(  month>=1&&month<=6){
			reg_qtr="1";
		   }else if(month>=7&&month<=12){
			   reg_qtr="2";
		   }
		
		RegVO regVO = new RegVO();
		regVO.setReg_stud(princiapl.getName());
		regVO.setReg_yr(reg_yr);
		regVO.setReg_qtr(reg_qtr);
		try {
			List<HashMap<String,String>> tuitionList = stuResService.selectReg(regVO);
			createGradeCertificate(tuitionList,path);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return url;		
	}
	
	
	
	
	public void createGradeCertificate(List<HashMap<String,String>> tuitionList,String path) throws DocumentException, IOException{
		//pdf 만들기

		String filename = path+"resources/upload/tuition.pdf";
		
		String entrance_year = tuitionList.get(0).get("stud_num").substring(0,4);//입학년도
		
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

		document.add(new Paragraph("고지서"));
		
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

		document.addTitle("등록금 고지서");
		
		
		
		
		
		
		PdfPTable table = new PdfPTable(4);
		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setVerticalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setPaddingBottom(2f);
		table.getDefaultCell().setMinimumHeight(18f);
		table.setWidths(new int[]{50,50,50,50});	
		
		PdfPCell cell = new PdfPCell(new Paragraph("등록금     납입    고지서",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		cell.setColspan(4);
		table.addCell(cell);
		
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("reg_yr")+"   학년도    "
				 +tuitionList.get(0).get("reg_qtr")+"   학기     납입금 ",font));
		 cell.setColspan(4);
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setMinimumHeight(18f);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph("학    과",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("dept_nm"),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(3);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph("학    번",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("stud_num"),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph("성    명",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("stud_nm"),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph("구    분",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph("등  록  금",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph("장  학  금",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph("납입금액",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph("입  학  금",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 if(entrance_year.equals(tuitionList.get(0).get("reg_yr"))
				 &&tuitionList.get(0).get("reg_qtr").equals("1")){
			 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("dept_entr_fee"),font));
		 }else{
			 cell = new PdfPCell(new Paragraph("0",font));
		 }
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph("0",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 if(entrance_year.equals(tuitionList.get(0).get("reg_yr"))
				 &&tuitionList.get(0).get("reg_qtr").equals("1")){
			 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("dept_entr_fee"),font));
		 }else{
			 cell = new PdfPCell(new Paragraph("0",font));
		 }
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph("수  업  료",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("dept_ttn"),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("scr_money"),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph(
				 Integer.toString(Integer.parseInt(tuitionList.get(0).get("dept_ttn"))-Integer.parseInt(tuitionList.get(0).get("scr_money"))),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 cell = new PdfPCell(new Paragraph("계",font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 if(entrance_year.equals(tuitionList.get(0).get("reg_yr"))
				 &&tuitionList.get(0).get("reg_qtr").equals("1")){
			 cell = new PdfPCell(new Paragraph(
			Integer.toString(Integer.parseInt(tuitionList.get(0).get("dept_entr_fee")
			+Integer.parseInt(tuitionList.get(0).get("dept_ttn")))),font));
		 }else{
			 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("dept_ttn"),font));			 
		 }
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 cell = new PdfPCell(new Paragraph(tuitionList.get(0).get("scr_money"),font));
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 if(entrance_year.equals(tuitionList.get(0).get("reg_yr"))
				 &&tuitionList.get(0).get("reg_qtr").equals("1")){
			 cell = new PdfPCell(new Paragraph(
			 Integer.toString(Integer.parseInt(tuitionList.get(0).get("dept_entr_fee"))
			+Integer.parseInt(tuitionList.get(0).get("dept_ttn"))-Integer.parseInt(tuitionList.get(0).get("scr_money"))),font));
		 }else{
			 cell = new PdfPCell(new Paragraph(
					 Integer.toString(Integer.parseInt(tuitionList.get(0).get("dept_ttn"))-Integer.parseInt(tuitionList.get(0).get("scr_money"))),font));
		 }
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(1);
		 table.addCell(cell);
		 
		 if(tuitionList.get(0).get("reg_qtr").equals("1")){
			 cell = new PdfPCell(new Paragraph(
					 "납부기간 : 02월 20일 ~ 02월 23일 "+"\n"
					+"납부은행 : "+ tuitionList.get(0).get("reg_pymt_bank")+"\n"
					+"납부계좌 : "+ tuitionList.get(0).get("reg_pymt_act")+"\n\n"
					+"* 반드시 본인 명의로 입금하셔야 합니다."+"\n"
					+"* 문의사항은 학사관리실로 연락바랍니다. (042-629-7114)",font));			 
		 }else{
			 cell = new PdfPCell(new Paragraph(
					 "납부기간 : 08월 21일  ~ 08월 24일"+"\n"
					+"납부은행 : "+ tuitionList.get(0).get("reg_pymt_bank")+"\n"
					+"납부계좌 : "+tuitionList.get(0).get("reg_pymt_act")+"\n\n"
					+"* 반드시 본인 명의로 입금하셔야 합니다."+"\n"
					+"* 문의사항은 학사관리실로 연락바랍니다. (042-629-7114)",font));
		 }
		 cell.setVerticalAlignment(Element.ALIGN_CENTER);
		 cell.setColspan(4);
		 table.addCell(cell);
		 
		 
		 
		 document.add(table);
		
		
		
		// ㅇㅇ 대학교
		Chunk chunk2 = new Chunk("[A]  U N I V E R C I T Y", font);
		paragraph3.add(chunk2);
		document.add(paragraph3);

			
		// 도장 추가
		Image image2 = Image.getInstance(path+"resources/upload/sign.png");
		image2.setAbsolutePosition(340f, 95f);
		image2.scaleAbsolute(150,150 );
		document.add(image2);

		// step 5
		document.close();
		
		
		
	}

	
}



