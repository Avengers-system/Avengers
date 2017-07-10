package com.avengers.db.dto;
/**
 * 개인일정을 분류하기 위한 정보
 * @author 배진
 * 2017.07.10 최초작성
 * 
 */
public class PscVO {
	private String psc_num; // 개인일정분류 고유번호
	private String psc_writer; // 작성자ID

	public String getPsc_num() {
		return psc_num;
	}

	public void setPsc_num(String psc_num) {
		this.psc_num = psc_num;
	}

	public String getPsc_writer() {
		return psc_writer;
	}

	public void setPsc_writer(String psc_writer) {
		this.psc_writer = psc_writer;
	}

}
