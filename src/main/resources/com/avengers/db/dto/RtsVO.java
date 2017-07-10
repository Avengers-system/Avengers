package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생의 복학정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class RtsVO {
	private String rts_num; // 복학 고유번호
	private Date rts_date; // 복학일
	private String rts_cause; // 복학사유
	private Date rts_appl_date; // 복학신청일
	private String rts_appr_check; // 관리자 승인여부
	private Date rts_appr_date; // 관리자 승인일
	private String rts_stud; // 학생 고유번호
	private String rts_admin; // 관리자 아이디
	
	public String getRts_num() {
		return rts_num;
	}
	public void setRts_num(String rts_num) {
		this.rts_num = rts_num;
	}
	public Date getRts_date() {
		return rts_date;
	}
	public void setRts_date(Date rts_date) {
		this.rts_date = rts_date;
	}
	public String getRts_cause() {
		return rts_cause;
	}
	public void setRts_cause(String rts_cause) {
		this.rts_cause = rts_cause;
	}
	public Date getRts_appl_date() {
		return rts_appl_date;
	}
	public void setRts_appl_date(Date rts_appl_date) {
		this.rts_appl_date = rts_appl_date;
	}
	public String getRts_appr_check() {
		return rts_appr_check;
	}
	public void setRts_appr_check(String rts_appr_check) {
		this.rts_appr_check = rts_appr_check;
	}
	public Date getRts_appr_date() {
		return rts_appr_date;
	}
	public void setRts_appr_date(Date rts_appr_date) {
		this.rts_appr_date = rts_appr_date;
	}
	public String getRts_stud() {
		return rts_stud;
	}
	public void setRts_stud(String rts_stud) {
		this.rts_stud = rts_stud;
	}
	public String getRts_admin() {
		return rts_admin;
	}
	public void setRts_admin(String rts_admin) {
		this.rts_admin = rts_admin;
	}
	
	
}
