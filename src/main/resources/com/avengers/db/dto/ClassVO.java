package com.avengers.db.dto;

import java.util.Date;


/**
 * 강의에 대한 휴강&보강의 여부를 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 *
 */
public class ClassVO {
	private String class_num;//휴보강번호
	private Date class_nc_date;//휴강날짜
	private Date class_ac_date;//보강날짜
	private Date class_reg_date;//등록날짜
	private String class_lct;//강의 고유번호
	
	
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public Date getClass_nc_date() {
		return class_nc_date;
	}
	public void setClass_nc_date(Date class_nc_date) {
		this.class_nc_date = class_nc_date;
	}
	public Date getClass_ac_date() {
		return class_ac_date;
	}
	public void setClass_ac_date(Date class_ac_date) {
		this.class_ac_date = class_ac_date;
	}
	public Date getClass_reg_date() {
		return class_reg_date;
	}
	public void setClass_reg_date(Date class_reg_date) {
		this.class_reg_date = class_reg_date;
	}
	public String getClass_lct() {
		return class_lct;
	}
	public void setClass_lct(String class_lct) {
		this.class_lct = class_lct;
	}
	
	
	
}
