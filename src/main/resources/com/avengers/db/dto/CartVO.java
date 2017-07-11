package com.avengers.db.dto;


/**
 * 장바구니vo
 * @author 조영훈
 * 2017.07.11
 *
 */
public class CartVO {
	private String cart_stud;//학생번호
	private String cart_lct;//강의번호
	private String cart_appl_check;//신청여부
	
	
	public String getCart_stud() {
		return cart_stud;
	}
	public void setCart_stud(String cart_stud) {
		this.cart_stud = cart_stud;
	}
	public String getCart_lct() {
		return cart_lct;
	}
	public void setCart_lct(String cart_lct) {
		this.cart_lct = cart_lct;
	}
	public String getCart_appl_check() {
		return cart_appl_check;
	}
	public void setCart_appl_check(String cart_appl_check) {
		this.cart_appl_check = cart_appl_check;
	}
	
	
}
