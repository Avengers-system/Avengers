package com.avengers.db.dto;
/**
 * 학생의 보호자 정보를 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class GuadVO {
	private String guad_num; // 보호자 고유번호
	private String guad_nm; // 보호자 성명
	private String guad_rel; // 보호자 관계
	private String guad_hp;// 보호자 전화번호
	private String guad_stud; // 학생 고유번호

	public String getGuad_num() {
		return guad_num;
	}

	public void setGuad_num(String guad_num) {
		this.guad_num = guad_num;
	}

	public String getGuad_nm() {
		return guad_nm;
	}

	public void setGuad_nm(String guad_nm) {
		this.guad_nm = guad_nm;
	}

	public String getGuad_rel() {
		return guad_rel;
	}

	public void setGuad_rel(String guad_rel) {
		this.guad_rel = guad_rel;
	}

	public String getGuad_hp() {
		return guad_hp;
	}

	public void setGuad_hp(String guad_hp) {
		this.guad_hp = guad_hp;
	}

	public String getGuad_stud() {
		return guad_stud;
	}

	public void setGuad_stud(String guad_stud) {
		this.guad_stud = guad_stud;
	}

}
