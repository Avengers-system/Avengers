package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생이 수강하는 강의에 대한 정보를 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 *
 */
public class TlVO {
	private String tl_num;//수강번호
	private Date tl_appl_date;//수강신청날짜
	private String tl_asmt_check;//수강평가여부
	private int tl_point;//강의점수
	private String tl_lev;//강의등급
	private int tl_mark;//강의평점
	private String tl_stud;//학생번호
	private String tl_lct;//강의번호
	
	
	public String getTl_num() {
		return tl_num;
	}
	public void setTl_num(String tl_num) {
		this.tl_num = tl_num;
	}
	public Date getTl_appl_date() {
		return tl_appl_date;
	}
	public void setTl_appl_date(Date tl_appl_date) {
		this.tl_appl_date = tl_appl_date;
	}
	public String getTl_asmt_check() {
		return tl_asmt_check;
	}
	public void setTl_asmt_check(String tl_asmt_check) {
		this.tl_asmt_check = tl_asmt_check;
	}
	public int getTl_point() {
		return tl_point;
	}
	public void setTl_point(int tl_point) {
		this.tl_point = tl_point;
	}
	public String getTl_lev() {
		return tl_lev;
	}
	public void setTl_lev(String tl_lev) {
		this.tl_lev = tl_lev;
	}
	public int getTl_mark() {
		return tl_mark;
	}
	public void setTl_mark(int tl_mark) {
		this.tl_mark = tl_mark;
	}
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
	
	
	
}
