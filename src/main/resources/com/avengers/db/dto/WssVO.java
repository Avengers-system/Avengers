package com.avengers.db.dto;

import java.util.Date;

/**
 * 근로장학생에 대한 정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class WssVO {
	private String wss_num; // 근로장학 고유번호
	private int wss_work_hour; // 근무시간
	private String wss_stus; // 근로장학생의 현재 상태
	private Date wss_date; // 승인일
	private String wss_check; // 승인여부
	private Date wss_appl_date; // 신청일
	private String wss_stud; // 학생 고유번호
	private String wss_admin; // 관리자 아이디

	public String getWss_num() {
		return wss_num;
	}

	public void setWss_num(String wss_num) {
		this.wss_num = wss_num;
	}

	public int getWss_work_hour() {
		return wss_work_hour;
	}

	public void setWss_work_hour(int wss_work_hour) {
		this.wss_work_hour = wss_work_hour;
	}

	public String getWss_stus() {
		return wss_stus;
	}

	public void setWss_stus(String wss_stus) {
		this.wss_stus = wss_stus;
	}

	public Date getWss_date() {
		return wss_date;
	}

	public void setWss_date(Date wss_date) {
		this.wss_date = wss_date;
	}

	public String getWss_check() {
		return wss_check;
	}

	public void setWss_check(String wss_check) {
		this.wss_check = wss_check;
	}

	public Date getWss_appl_date() {
		return wss_appl_date;
	}

	public void setWss_appl_date(Date wss_appl_date) {
		this.wss_appl_date = wss_appl_date;
	}

	public String getWss_stud() {
		return wss_stud;
	}

	public void setWss_stud(String wss_stud) {
		this.wss_stud = wss_stud;
	}

	public String getWss_admin() {
		return wss_admin;
	}

	public void setWss_admin(String wss_admin) {
		this.wss_admin = wss_admin;
	}

}
