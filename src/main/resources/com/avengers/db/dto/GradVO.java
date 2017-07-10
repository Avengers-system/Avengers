package com.avengers.db.dto;

import java.util.Date;

/**
 * 졸업한 학생에 대한 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class GradVO {
	private String grad_num; // 학위등록번호
	private Date grad_date; // 학위수여일자
	private Date grad_appl_date; // 졸업 승인날짜
	private String grad_stud; // 학생 고유번호
	private String grad_admin; // 관리자 아이디

	public String getGrad_num() {
		return grad_num;
	}

	public void setGrad_num(String grad_num) {
		this.grad_num = grad_num;
	}

	public Date getGrad_date() {
		return grad_date;
	}

	public void setGrad_date(Date grad_date) {
		this.grad_date = grad_date;
	}

	public Date getGrad_appl_date() {
		return grad_appl_date;
	}

	public void setGrad_appl_date(Date grad_appl_date) {
		this.grad_appl_date = grad_appl_date;
	}

	public String getGrad_stud() {
		return grad_stud;
	}

	public void setGrad_stud(String grad_stud) {
		this.grad_stud = grad_stud;
	}

	public String getGrad_admin() {
		return grad_admin;
	}

	public void setGrad_admin(String grad_admin) {
		this.grad_admin = grad_admin;
	}

}
