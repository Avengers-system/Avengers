package com.avengers.db.dto;

import java.util.Date;

/**
 * 강의에 대한 시험 정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class ExamVO {
	private String exam_num; // 시험 고유번호
	private String exam_type; // 시험종류
	private Date exam_date; // 시험일
	private Date exam_start_date; // 시작시간
	private Date exam_end_date; // 종료시간
	private String exam_lct; // 강의 고유번호

	public String getExam_num() {
		return exam_num;
	}

	public void setExam_num(String exam_num) {
		this.exam_num = exam_num;
	}

	public String getExam_type() {
		return exam_type;
	}

	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}

	public Date getExam_date() {
		return exam_date;
	}

	public void setExam_date(Date exam_date) {
		this.exam_date = exam_date;
	}

	public Date getExam_start_date() {
		return exam_start_date;
	}

	public void setExam_start_date(Date exam_start_date) {
		this.exam_start_date = exam_start_date;
	}

	public Date getExam_end_date() {
		return exam_end_date;
	}

	public void setExam_end_date(Date exam_end_date) {
		this.exam_end_date = exam_end_date;
	}

	public String getExam_lct() {
		return exam_lct;
	}

	public void setExam_lct(String exam_lct) {
		this.exam_lct = exam_lct;
	}

}
