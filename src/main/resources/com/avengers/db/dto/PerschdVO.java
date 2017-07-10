package com.avengers.db.dto;

import java.util.Date;
/**
 * 개인일정의 모든 정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 * 
 */
public class PerschdVO {
	private int perschd_num; // 개인일정 고유번호
	private String perschd_title; // 개인일정 제목
	private String perschd_cont; // 개인일정 내용
	private Date perschd_date; // 개인일정 작성일
	private Date perschd_start_date; // 개인일정 시작일
	private Date perschd_end_date; // 개인일정 종료일
	private String perschd_psc; // 개인일정분류 고유번호

	public int getPerschd_num() {
		return perschd_num;
	}

	public void setPerschd_num(int perschd_num) {
		this.perschd_num = perschd_num;
	}

	public String getPerschd_title() {
		return perschd_title;
	}

	public void setPerschd_title(String perschd_title) {
		this.perschd_title = perschd_title;
	}

	public String getPerschd_cont() {
		return perschd_cont;
	}

	public void setPerschd_cont(String perschd_cont) {
		this.perschd_cont = perschd_cont;
	}

	public Date getPerschd_date() {
		return perschd_date;
	}

	public void setPerschd_date(Date perschd_date) {
		this.perschd_date = perschd_date;
	}

	public Date getPerschd_start_date() {
		return perschd_start_date;
	}

	public void setPerschd_start_date(Date perschd_start_date) {
		this.perschd_start_date = perschd_start_date;
	}

	public Date getPerschd_end_date() {
		return perschd_end_date;
	}

	public void setPerschd_end_date(Date perschd_end_date) {
		this.perschd_end_date = perschd_end_date;
	}

	public String getPerschd_psc() {
		return perschd_psc;
	}

	public void setPerschd_psc(String perschd_psc) {
		this.perschd_psc = perschd_psc;
	}

}
