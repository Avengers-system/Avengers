package com.avengers.db.dto;

public class RegistryExamVO {
	private String exam_type;
	private String exam_date;
	private String startHour;
	private String startMi;
	private String endHour;
	private String endMi;
	public String getExam_type() {
		return exam_type;
	}
	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getStartHour() {
		return startHour;
	}
	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}
	public String getStartMi() {
		return startMi;
	}
	public void setStartMi(String startMi) {
		this.startMi = startMi;
	}
	public String getEndHour() {
		return endHour;
	}
	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	public String getEndMi() {
		return endMi;
	}
	public void setEndMi(String endMi) {
		this.endMi = endMi;
	}
}
