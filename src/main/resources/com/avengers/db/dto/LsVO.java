package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생의 자퇴정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 * 2017.07.10 보호자 관련정보 삭제
 */
public class LsVO {
	private String ls_num;//자퇴 고유번호
	private Date ls_appl_date;//자퇴 신청일
	private Date ls_appr_date;//관리자 승인일
	private String ls_appr_check;//관리자 승인여부
	private String ls_ftf_cont;//면담내용
	private String ls_stud;//학생 고유번호
	private String ls_admin;//관리자 아이디
	
	
	public String getLs_num() {
		return ls_num;
	}
	public void setLs_num(String ls_num) {
		this.ls_num = ls_num;
	}
	public Date getLs_appl_date() {
		return ls_appl_date;
	}
	public void setLs_appl_date(Date ls_appl_date) {
		this.ls_appl_date = ls_appl_date;
	}
	public Date getLs_appr_date() {
		return ls_appr_date;
	}
	public void setLs_appr_date(Date ls_appr_date) {
		this.ls_appr_date = ls_appr_date;
	}
	public String getLs_appr_check() {
		return ls_appr_check;
	}
	public void setLs_appr_check(String ls_appr_check) {
		this.ls_appr_check = ls_appr_check;
	}
	public String getLs_ftf_cont() {
		return ls_ftf_cont;
	}
	public void setLs_ftf_cont(String ls_ftf_cont) {
		this.ls_ftf_cont = ls_ftf_cont;
	}
	public String getLs_stud() {
		return ls_stud;
	}
	public void setLs_stud(String ls_stud) {
		this.ls_stud = ls_stud;
	}
	public String getLs_admin() {
		return ls_admin;
	}
	public void setLs_admin(String ls_admin) {
		this.ls_admin = ls_admin;
	}
	
	
}
