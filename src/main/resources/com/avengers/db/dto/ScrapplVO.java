package com.avengers.db.dto;

import java.util.Date;
/**
 * 학생이 장학을 신청한 정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class ScrapplVO {
	private String scrappl_num; // 장학신청 고유번호
	private String scrappl_yr; // 장학이 적용될 년도
	private String scrappl_qtr; // 장학이 적용될 학기
	private String scrappl_cause; // 장학을 신청한 사유
	private Date scrappl_date; // 장학을 신청한 날짜
	private String scrappl_appr_check; // 장학 승인여부
	private String scrappl_stud; // 학생 고유번호
	private String scrappl_admin; // 관리자 아이디
	private String scrappl_scr; // 장학 고유번호

	public String getScrappl_num() {
		return scrappl_num;
	}

	public void setScrappl_num(String scrappl_num) {
		this.scrappl_num = scrappl_num;
	}

	public String getScrappl_yr() {
		return scrappl_yr;
	}

	public void setScrappl_yr(String scrappl_yr) {
		this.scrappl_yr = scrappl_yr;
	}

	public String getScrappl_qtr() {
		return scrappl_qtr;
	}

	public void setScrappl_qtr(String scrappl_qtr) {
		this.scrappl_qtr = scrappl_qtr;
	}

	public String getScrappl_cause() {
		return scrappl_cause;
	}

	public void setScrappl_cause(String scrappl_cause) {
		this.scrappl_cause = scrappl_cause;
	}

	public Date getScrappl_date() {
		return scrappl_date;
	}

	public void setScrappl_date(Date scrappl_date) {
		this.scrappl_date = scrappl_date;
	}

	public String getScrappl_appr_check() {
		return scrappl_appr_check;
	}

	public void setScrappl_appr_check(String scrappl_appr_check) {
		this.scrappl_appr_check = scrappl_appr_check;
	}

	public String getScrappl_stud() {
		return scrappl_stud;
	}

	public void setScrappl_stud(String scrappl_stud) {
		this.scrappl_stud = scrappl_stud;
	}

	public String getScrappl_admin() {
		return scrappl_admin;
	}

	public void setScrappl_admin(String scrappl_admin) {
		this.scrappl_admin = scrappl_admin;
	}

	public String getScrappl_scr() {
		return scrappl_scr;
	}

	public void setScrappl_scr(String scrappl_scr) {
		this.scrappl_scr = scrappl_scr;
	}

}
