package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생의 휴학정보를 관리 
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class LoaVO {
	private String loa_num;// 휴학 고유번호
	private Date loa_start_date;// 휴학시작일
	private Date loa_end_date;// 휴학종료일
	private String loa_cause;// 휴학사유
	private Date loa_appl_date;// 휴학신청일
	private Date loa_appr_date;// 관리자 승인일
	private String loa_appr_check;// 관리자 승인여부
	private Date loa_rs_shcd_date;// 복학예정일
	private String loa_stud;// 학생 고유번호
	private String loa_admin;// 관리자 아이디

	public String getLoa_num() {
		return loa_num;
	}

	public void setLoa_num(String loa_num) {
		this.loa_num = loa_num;
	}

	public Date getLoa_start_date() {
		return loa_start_date;
	}

	public void setLoa_start_date(Date loa_start_date) {
		this.loa_start_date = loa_start_date;
	}

	public Date getLoa_end_date() {
		return loa_end_date;
	}

	public void setLoa_end_date(Date loa_end_date) {
		this.loa_end_date = loa_end_date;
	}

	public String getLoa_cause() {
		return loa_cause;
	}

	public void setLoa_cause(String loa_cause) {
		this.loa_cause = loa_cause;
	}

	public Date getLoa_appl_date() {
		return loa_appl_date;
	}

	public void setLoa_appl_date(Date loa_appl_date) {
		this.loa_appl_date = loa_appl_date;
	}

	public Date getLoa_appr_date() {
		return loa_appr_date;
	}

	public void setLoa_appr_date(Date loa_appr_date) {
		this.loa_appr_date = loa_appr_date;
	}

	public String getLoa_appr_check() {
		return loa_appr_check;
	}

	public void setLoa_appr_check(String loa_appr_check) {
		this.loa_appr_check = loa_appr_check;
	}

	public Date getLoa_rs_shcd_date() {
		return loa_rs_shcd_date;
	}

	public void setLoa_rs_shcd_date(Date loa_rs_shcd_date) {
		this.loa_rs_shcd_date = loa_rs_shcd_date;
	}

	public String getLoa_stud() {
		return loa_stud;
	}

	public void setLoa_stud(String loa_stud) {
		this.loa_stud = loa_stud;
	}

	public String getLoa_admin() {
		return loa_admin;
	}

	public void setLoa_admin(String loa_admin) {
		this.loa_admin = loa_admin;
	}

}
