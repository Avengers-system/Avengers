package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생이 결석한 사유에 대한 정보를 관리
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class AcVO {
	private String ac_num; // 출결사유 고유번호
	private String ac_cause; // 출결사유
	private String ac_cont; // 출결사유 상세내용
	private Date ac_appl_date; // 출결 신청일
	private String ac_appl_stud; // 출결 신청자
	private String ac_ed; // 출결 증빙서류

	public String getAc_num() {
		return ac_num;
	}

	public void setAc_num(String ac_num) {
		this.ac_num = ac_num;
	}

	public String getAc_cause() {
		return ac_cause;
	}

	public void setAc_cause(String ac_cause) {
		this.ac_cause = ac_cause;
	}

	public String getAc_cont() {
		return ac_cont;
	}

	public void setAc_cont(String ac_cont) {
		this.ac_cont = ac_cont;
	}

	public Date getAc_appl_date() {
		return ac_appl_date;
	}

	public void setAc_appl_date(Date ac_appl_date) {
		this.ac_appl_date = ac_appl_date;
	}

	public String getAc_appl_stud() {
		return ac_appl_stud;
	}

	public void setAc_appl_stud(String ac_appl_stud) {
		this.ac_appl_stud = ac_appl_stud;
	}

	public String getAc_ed() {
		return ac_ed;
	}

	public void setAc_ed(String ac_ed) {
		this.ac_ed = ac_ed;
	}

}
