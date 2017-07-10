package com.avengers.db.dto;


/**
 * 학과에 대한 정보를 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 *
 *
 */
public class DeptVO {
	private String dept_num;//학과번호
	private String dept_nm;//학과이름
	private int dept_qua_num;//학과정원수
	private int dept_entr_fee;//학과 입학금
	private int dept_ttn;//학과 수업료
	private int dept_rf;//학과 기성회비
	private String dept_col;//단과대학 번호
	public String getDept_num() {
		return dept_num;
	}
	public void setDept_num(String dept_num) {
		this.dept_num = dept_num;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public int getDept_qua_num() {
		return dept_qua_num;
	}
	public void setDept_qua_num(int dept_qua_num) {
		this.dept_qua_num = dept_qua_num;
	}
	public int getDept_entr_fee() {
		return dept_entr_fee;
	}
	public void setDept_entr_fee(int dept_entr_fee) {
		this.dept_entr_fee = dept_entr_fee;
	}
	public int getDept_ttn() {
		return dept_ttn;
	}
	public void setDept_ttn(int dept_ttn) {
		this.dept_ttn = dept_ttn;
	}
	public int getDept_rf() {
		return dept_rf;
	}
	public void setDept_rf(int dept_rf) {
		this.dept_rf = dept_rf;
	}
	public String getDept_col() {
		return dept_col;
	}
	public void setDept_col(String dept_col) {
		this.dept_col = dept_col;
	}
	
	
	
	
}
