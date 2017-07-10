package com.avengers.db.dto;
/**
 * 게시판을 분류하기 위한 정보
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class BcVO {
	private String bc_num;// 게시판분류 고유번호
	private String bc_nm;// 게시판명

	public String getBc_num() {
		return bc_num;
	}

	public void setBc_num(String bc_num) {
		this.bc_num = bc_num;
	}

	public String getBc_nm() {
		return bc_nm;
	}

	public void setBc_nm(String bc_nm) {
		this.bc_nm = bc_nm;
	}

}
