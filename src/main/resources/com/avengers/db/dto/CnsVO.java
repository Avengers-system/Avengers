package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생과 교수의 상담내역을 관리
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class CnsVO {
	private String cns_num; // 상담 고유번호
	private String cns_kind; // 상담종류
	private String cns_title; // 상담제목
	private String cns_cont; // 상담내용
	private Date cns_appl_date; // 상담을 신청한 날짜
	private Date cns_date; // 상담을 진행할 날짜
	private String cns_check; // 상담여부
	private String cns_stud; // 학생 고유번호
	private String cns_prfs; // 교수 고유번호

	public String getCns_num() {
		return cns_num;
	}

	public void setCns_num(String cns_num) {
		this.cns_num = cns_num;
	}

	public String getCns_kind() {
		return cns_kind;
	}

	public void setCns_kind(String cns_kind) {
		this.cns_kind = cns_kind;
	}

	public String getCns_title() {
		return cns_title;
	}

	public void setCns_title(String cns_title) {
		this.cns_title = cns_title;
	}

	public String getCns_cont() {
		return cns_cont;
	}

	public void setCns_cont(String cns_cont) {
		this.cns_cont = cns_cont;
	}

	public Date getCns_appl_date() {
		return cns_appl_date;
	}

	public void setCns_appl_date(Date cns_appl_date) {
		this.cns_appl_date = cns_appl_date;
	}

	public Date getCns_date() {
		return cns_date;
	}

	public void setCns_date(Date cns_date) {
		this.cns_date = cns_date;
	}

	public String getCns_check() {
		return cns_check;
	}

	public void setCns_check(String cns_check) {
		this.cns_check = cns_check;
	}

	public String getCns_stud() {
		return cns_stud;
	}

	public void setCns_stud(String cns_stud) {
		this.cns_stud = cns_stud;
	}

	public String getCns_prfs() {
		return cns_prfs;
	}

	public void setCns_prfs(String cns_prfs) {
		this.cns_prfs = cns_prfs;
	}

}
