package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생이 수강하는 과목에 대한 출결을 관리
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class AtdcVO {
	private String atdc_num; // 출결 고유번호
	private String atdc_check; // 출결여부
	private Date atdc_date; // 출결한 날짜
	private String atdc_tl; // 수강 고유번호

	public String getAtdc_num() {
		return atdc_num;
	}

	public void setAtdc_num(String atdc_num) {
		this.atdc_num = atdc_num;
	}

	public String getAtdc_check() {
		return atdc_check;
	}

	public void setAtdc_check(String atdc_check) {
		this.atdc_check = atdc_check;
	}

	public Date getAtdc_date() {
		return atdc_date;
	}

	public void setAtdc_date(Date atdc_date) {
		this.atdc_date = atdc_date;
	}

	public String getAtdc_tl() {
		return atdc_tl;
	}

	public void setAtdc_tl(String atdc_tl) {
		this.atdc_tl = atdc_tl;
	}

}
