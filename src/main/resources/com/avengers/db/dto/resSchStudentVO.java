package com.avengers.db.dto;

public class resSchStudentVO {
	private String stud_num; //학번
	private String stud_nm;//이름
	private String stud_qtr;//현재학기
	private String stud_bank;//은행
	private String stud_grd;//학년
	private String stud_act_num;//계좌번호
	private String stud_dept;//학과번호
	private String stud_schreg_code;//학적상태
	private String stud_addr ;//주소
	private String dept_nm;//학과이름
	private String col_nm;//단과
	private String tl_lct;//수강번호
	private int tl_point ;//강의점수
	private String tl_lev;//등급
	private float tl_mark;//평점
	private String lct_crd;//학점
	private String lct_yr;// "개설년도"
    private String lct_qtr;//L.LCT_QTR "개설학기",
	private String tl_asmt_check; // 강의평가여부
	
	
	
	public String getLct_yr() {
		return lct_yr;
	}
	public void setLct_yr(String lct_yr) {
		this.lct_yr = lct_yr;
	}
	public String getLct_qtr() {
		return lct_qtr;
	}
	public void setLct_qtr(String lct_qtr) {
		this.lct_qtr = lct_qtr;
	}
	public String getStud_grd() {
		return stud_grd;
	}
	public void setStud_grd(String stud_grd) {
		this.stud_grd = stud_grd;
	}
	public String getTl_asmt_check() {
		return tl_asmt_check;
	}
	public void setTl_asmt_check(String tl_asmt_check) {
		this.tl_asmt_check = tl_asmt_check;
	}
	public String getStud_num() {
		return stud_num;
	}
	public void setStud_num(String stud_num) {
		this.stud_num = stud_num;
	}
	public String getStud_nm() {
		return stud_nm;
	}
	public void setStud_nm(String stud_nm) {
		this.stud_nm = stud_nm;
	}
	public String getStud_qtr() {
		return stud_qtr;
	}
	public void setStud_qtr(String stud_qtr) {
		this.stud_qtr = stud_qtr;
	}
	public String getStud_bank() {
		return stud_bank;
	}
	public void setStud_bank(String stud_bank) {
		this.stud_bank = stud_bank;
	}
	public String getStud_act_num() {
		return stud_act_num;
	}
	public void setStud_act_num(String stud_act_num) {
		this.stud_act_num = stud_act_num;
	}
	public String getStud_dept() {
		return stud_dept;
	}
	public void setStud_dept(String stud_dept) {
		this.stud_dept = stud_dept;
	}
	public String getStud_schreg_code() {
		return stud_schreg_code;
	}
	public void setStud_schreg_code(String stud_schreg_code) {
		this.stud_schreg_code = stud_schreg_code;
	}
	public String getStud_addr() {
		return stud_addr;
	}
	public void setStud_addr(String stud_addr) {
		this.stud_addr = stud_addr;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getCol_nm() {
		return col_nm;
	}
	public void setCol_nm(String col_nm) {
		this.col_nm = col_nm;
	}
	public String getTl_lct() {
		return tl_lct;
	}
	public void setTl_lct(String tl_lct) {
		this.tl_lct = tl_lct;
	}
	public int getTl_point() {
		return tl_point;
	}
	public void setTl_point(int tl_point) {
		this.tl_point = tl_point;
	}
	public String getTl_lev() {
		return tl_lev;
	}
	public void setTl_lev(String tl_lev) {
		this.tl_lev = tl_lev;
	}
	public float getTl_mark() {
		return tl_mark;
	}
	public void setTl_mark(float tl_mark) {
		this.tl_mark = tl_mark;
	}
	public String getLct_crd() {
		return lct_crd;
	}
	public void setLct_crd(String lct_crd) {
		this.lct_crd = lct_crd;
	}
}
