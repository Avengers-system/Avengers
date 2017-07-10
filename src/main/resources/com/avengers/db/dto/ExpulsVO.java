package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생의 제적당한 정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class ExpulsVO {
	private String expuls_num; // 제적 고유번호
	private String expuls_vlt_dtls; // 제적당한 사항
	private Date expuls_vlt_date; // 제적당한 날짜
	private String expuls_admin; // 관리자
	private String expuls_stud;// 학생 고유번호

	public String getExpuls_num() {
		return expuls_num;
	}

	public void setExpuls_num(String expuls_num) {
		this.expuls_num = expuls_num;
	}

	public String getExpuls_vlt_dtls() {
		return expuls_vlt_dtls;
	}

	public void setExpuls_vlt_dtls(String expuls_vlt_dtls) {
		this.expuls_vlt_dtls = expuls_vlt_dtls;
	}

	public Date getExpuls_vlt_date() {
		return expuls_vlt_date;
	}

	public void setExpuls_vlt_date(Date expuls_vlt_date) {
		this.expuls_vlt_date = expuls_vlt_date;
	}

	public String getExpuls_admin() {
		return expuls_admin;
	}

	public void setExpuls_admin(String expuls_admin) {
		this.expuls_admin = expuls_admin;
	}

	public String getExpuls_stud() {
		return expuls_stud;
	}

	public void setExpuls_stud(String expuls_stud) {
		this.expuls_stud = expuls_stud;
	}

}
