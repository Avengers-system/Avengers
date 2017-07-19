package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생이 제출한 과목정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class SubVO {
	private String sub_num; // 제출 고유번호
	private String sub_check; // 과제를 제출한 여부
	private String sub_title; // 제출제목
	private String sub_cont; // 제출내용
	private int sub_sjt_point; // 과제 제출점수
	private Date sub_date; // 제출일
	private String sub_af; // 첨부파일
	private String sub_stud; // 학생 고유번호
	private String sub_asgn; // 과제 고유번호
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
	public String getSub_check() {
		return sub_check;
	}
	public void setSub_check(String sub_check) {
		this.sub_check = sub_check;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	public String getSub_cont() {
		return sub_cont;
	}
	public void setSub_cont(String sub_cont) {
		this.sub_cont = sub_cont;
	}
	public int getSub_sjt_point() {
		return sub_sjt_point;
	}
	public void setSub_sjt_point(int sub_sjt_point) {
		this.sub_sjt_point = sub_sjt_point;
	}
	public Date getSub_date() {
		return sub_date;
	}
	public void setSub_date(Date sub_date) {
		this.sub_date = sub_date;
	}
	public String getSub_af() {
		return sub_af;
	}
	public void setSub_af(String sub_af) {
		this.sub_af = sub_af;
	}
	public String getSub_stud() {
		return sub_stud;
	}
	public void setSub_stud(String sub_stud) {
		this.sub_stud = sub_stud;
	}
	public String getSub_asgn() {
		return sub_asgn;
	}
	public void setSub_asgn(String sub_asgn) {
		this.sub_asgn = sub_asgn;
	}
 
}
