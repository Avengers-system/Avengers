package com.avengers.db.dto;
/**
 * 장학의 기본 정보들을 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class ScrVO {
	private String scr_num; // 장학 고유번호
	private String scr_nm; // 장학명
	private int scr_money; // 장학금액
	private String scr_cont; // 장학에 대한 설명

	public String getScr_num() {
		return scr_num;
	}

	public void setScr_num(String scr_num) {
		this.scr_num = scr_num;
	}

	public String getScr_nm() {
		return scr_nm;
	}

	public void setScr_nm(String scr_nm) {
		this.scr_nm = scr_nm;
	}

	public int getScr_money() {
		return scr_money;
	}

	public void setScr_money(int scr_money) {
		this.scr_money = scr_money;
	}

	public String getScr_cont() {
		return scr_cont;
	}

	public void setScr_cont(String scr_cont) {
		this.scr_cont = scr_cont;
	}

}
