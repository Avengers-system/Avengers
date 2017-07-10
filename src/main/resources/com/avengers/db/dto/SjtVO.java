package com.avengers.db.dto;


/**
 * 과목에 대한 정보를 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 *
 *
 */
public class SjtVO {
	private String sjt_num;//과목 고유번호
	private String sjt_nm;//과목 이름
	private String sjt_smy;//과목 설명
	public String getSjt_num() {
		return sjt_num;
	}
	public void setSjt_num(String sjt_num) {
		this.sjt_num = sjt_num;
	}
	public String getSjt_nm() {
		return sjt_nm;
	}
	public void setSjt_nm(String sjt_nm) {
		this.sjt_nm = sjt_nm;
	}
	public String getSjt_smy() {
		return sjt_smy;
	}
	public void setSjt_smy(String sjt_smy) {
		this.sjt_smy = sjt_smy;
	}
	
	
}
