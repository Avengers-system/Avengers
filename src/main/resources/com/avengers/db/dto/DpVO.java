package com.avengers.db.dto;

import java.util.Date;
/**
 * 장학금을 나누어 낸 것을 관리
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class DpVO {
	private String dp_num; // 분할납부 고유번호
	private int dp_pymt_fee; // 분할 납부금액
	private Date dp_pymt_date; // 분할 납부일
	private int dp_pymt_round; // 분할 납부회차
	private String dp_reg; // 등록 고유번호

	public String getDp_num() {
		return dp_num;
	}

	public void setDp_num(String dp_num) {
		this.dp_num = dp_num;
	}

	public int getDp_pymt_fee() {
		return dp_pymt_fee;
	}

	public void setDp_pymt_fee(int dp_pymt_fee) {
		this.dp_pymt_fee = dp_pymt_fee;
	}

	public Date getDp_pymt_date() {
		return dp_pymt_date;
	}

	public void setDp_pymt_date(Date dp_pymt_date) {
		this.dp_pymt_date = dp_pymt_date;
	}

	public int getDp_pymt_round() {
		return dp_pymt_round;
	}

	public void setDp_pymt_round(int dp_pymt_round) {
		this.dp_pymt_round = dp_pymt_round;
	}

	public String getDp_reg() {
		return dp_reg;
	}

	public void setDp_reg(String dp_reg) {
		this.dp_reg = dp_reg;
	}

}
