package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생이 응시한 시험에 대한 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class TeVO {
	private String te_num; // 응시 고유번호
	private String te_check; // 응시여부
	private Date te_date; // 시험 응시일
	private int te_exam_point; // 시험점수
	private String te_stud;// 학생 고유번호
	private String te_exam; // 시험 고유번호

	public String getTe_num() {
		return te_num;
	}

	public void setTe_num(String te_num) {
		this.te_num = te_num;
	}

	public String getTe_check() {
		return te_check;
	}

	public void setTe_check(String te_check) {
		this.te_check = te_check;
	}

	public Date getTe_date() {
		return te_date;
	}

	public void setTe_date(Date te_date) {
		this.te_date = te_date;
	}

	public int getTe_exam_point() {
		return te_exam_point;
	}

	public void setTe_exam_point(int te_exam_point) {
		this.te_exam_point = te_exam_point;
	}

	public String getTe_stud() {
		return te_stud;
	}

	public void setTe_stud(String te_stud) {
		this.te_stud = te_stud;
	}

	public String getTe_exam() {
		return te_exam;
	}

	public void setTe_exam(String te_exam) {
		this.te_exam = te_exam;
	}

}
