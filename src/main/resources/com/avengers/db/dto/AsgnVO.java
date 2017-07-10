package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생이 수강하는 과목에 대한 과제 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class AsgnVO {
	private String asgn_num; // 과제 고유번호
	private String asgn_nm; // 과제명
	private String asgn_cont; // 과제의 내용
	private String asgn_sub_form; // 과제 제출양식
	private Date asgn_start_date; // 과제 제출시작일
	private Date asgn_dl_date; // 과제 제출마감일
	private String asgn_lct; // 강의 고유번호

	public String getAsgn_num() {
		return asgn_num;
	}

	public void setAsgn_num(String asgn_num) {
		this.asgn_num = asgn_num;
	}

	public String getAsgn_nm() {
		return asgn_nm;
	}

	public void setAsgn_nm(String asgn_nm) {
		this.asgn_nm = asgn_nm;
	}

	public String getAsgn_cont() {
		return asgn_cont;
	}

	public void setAsgn_cont(String asgn_cont) {
		this.asgn_cont = asgn_cont;
	}

	public String getAsgn_sub_form() {
		return asgn_sub_form;
	}

	public void setAsgn_sub_form(String asgn_sub_form) {
		this.asgn_sub_form = asgn_sub_form;
	}

	public Date getAsgn_start_date() {
		return asgn_start_date;
	}

	public void setAsgn_start_date(Date asgn_start_date) {
		this.asgn_start_date = asgn_start_date;
	}

	public Date getAsgn_dl_date() {
		return asgn_dl_date;
	}

	public void setAsgn_dl_date(Date asgn_dl_date) {
		this.asgn_dl_date = asgn_dl_date;
	}

	public String getAsgn_lct() {
		return asgn_lct;
	}

	public void setAsgn_lct(String asgn_lct) {
		this.asgn_lct = asgn_lct;
	}

}
