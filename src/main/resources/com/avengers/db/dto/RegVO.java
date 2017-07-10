package com.avengers.db.dto;
/**
 * 학생의 등록현황에 대한 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class RegVO {
	private String reg_num; // 등록 고유번호
	private String reg_pymt_act; // 등록 시 납부계좌
	private String reg_pymt_bank; // 계좌의 은행명
	private String reg_ah; // 계좌의 예금주
	private int reg_div_pymt_times; // 분할납부횟수
	private String reg_pymt_method; // 분할방법
	private String reg_stud; // 학생 고유번호
	private String reg_admin; // 관리자 아이디

	public String getReg_num() {
		return reg_num;
	}

	public void setReg_num(String reg_num) {
		this.reg_num = reg_num;
	}

	public String getReg_pymt_act() {
		return reg_pymt_act;
	}

	public void setReg_pymt_act(String reg_pymt_act) {
		this.reg_pymt_act = reg_pymt_act;
	}

	public String getReg_pymt_bank() {
		return reg_pymt_bank;
	}

	public void setReg_pymt_bank(String reg_pymt_bank) {
		this.reg_pymt_bank = reg_pymt_bank;
	}

	public String getReg_ah() {
		return reg_ah;
	}

	public void setReg_ah(String reg_ah) {
		this.reg_ah = reg_ah;
	}

	public int getReg_div_pymt_times() {
		return reg_div_pymt_times;
	}

	public void setReg_div_pymt_times(int reg_div_pymt_times) {
		this.reg_div_pymt_times = reg_div_pymt_times;
	}

	public String getReg_pymt_method() {
		return reg_pymt_method;
	}

	public void setReg_pymt_method(String reg_pymt_method) {
		this.reg_pymt_method = reg_pymt_method;
	}

	public String getReg_stud() {
		return reg_stud;
	}

	public void setReg_stud(String reg_stud) {
		this.reg_stud = reg_stud;
	}

	public String getReg_admin() {
		return reg_admin;
	}

	public void setReg_admin(String reg_admin) {
		this.reg_admin = reg_admin;
	}

}
