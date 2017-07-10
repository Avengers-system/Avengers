package com.avengers.db.dto;


/**
 * 강의실에 대한 정보를 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 *
 *
 */
public class LrVO {
	private String lr_num; //강의실 고유번호
	private String lr_nm;//강의실 이름
	private String lr_date;//강의 요일
	private String lr_hour;//강의 시간
	private String lr_lct;//강의 고유번호
	
	
	public String getLr_num() {
		return lr_num;
	}
	public void setLr_num(String lr_num) {
		this.lr_num = lr_num;
	}
	public String getLr_nm() {
		return lr_nm;
	}
	public void setLr_nm(String lr_nm) {
		this.lr_nm = lr_nm;
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
	
	
}
