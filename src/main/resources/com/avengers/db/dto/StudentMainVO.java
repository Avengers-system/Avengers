package com.avengers.db.dto;


public class StudentMainVO {

	private String tl_stud;//학생번호
	private String tl_lct;//강의번호
	
	private String lct_num;//강의 고유번호
	private String lct_yr;//개설년도
	private String lct_qtr;//개설학기
	private String lct_nm;//강의명

	private String lr_num; //강의실 고유번호
	private String lr_lrc;//강의실분류 고유번호
	private String lr_date;//강의 요일
	private String lr_hour;//강의 시간
	private String lr_lct;//강의 고유번호
	
	private String lrc_code;//강의실 방번호
	private String lrc_nm; //강의실명
	public String getTl_stud() {
		return tl_stud;
	}
	public void setTl_stud(String tl_stud) {
		this.tl_stud = tl_stud;
	}
	public String getTl_lct() {
		return tl_lct;
	}
	public void setTl_lct(String tl_lct) {
		this.tl_lct = tl_lct;
	}
	public String getLct_num() {
		return lct_num;
	}
	public void setLct_num(String lct_num) {
		this.lct_num = lct_num;
	}
	public String getLct_yr() {
		return lct_yr;
	}
	public void setLct_yr(String lct_yr) {
		this.lct_yr = lct_yr;
	}
	public String getLct_qtr() {
		return lct_qtr;
	}
	public void setLct_qtr(String lct_qtr) {
		this.lct_qtr = lct_qtr;
	}
	public String getLct_nm() {
		return lct_nm;
	}
	public void setLct_nm(String lct_nm) {
		this.lct_nm = lct_nm;
	}
	public String getLr_num() {
		return lr_num;
	}
	public void setLr_num(String lr_num) {
		this.lr_num = lr_num;
	}
	public String getLr_lrc() {
		return lr_lrc;
	}
	public void setLr_lrc(String lr_lrc) {
		this.lr_lrc = lr_lrc;
	}
	public String getLr_date() {
		return lr_date;
	}
	public void setLr_date(String lr_date) {
		this.lr_date = lr_date;
	}
	public String getLr_hour() {
		return lr_hour;
	}
	public void setLr_hour(String lr_hour) {
		this.lr_hour = lr_hour;
	}
	public String getLr_lct() {
		return lr_lct;
	}
	public void setLr_lct(String lr_lct) {
		this.lr_lct = lr_lct;
	}
	public String getLrc_code() {
		return lrc_code;
	}
	public void setLrc_code(String lrc_code) {
		this.lrc_code = lrc_code;
	}
	public String getLrc_nm() {
		return lrc_nm;
	}
	public void setLrc_nm(String lrc_nm) {
		this.lrc_nm = lrc_nm;
	}
	
	
	
}
