package com.avengers.db.dto;

import java.util.Date;

/**
 * 강의에 대한 평가를 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 *
 */
public class LaVO {
	private String la_num;//강의평가고유번호
	private int la_qtna_one;//강의평가문항1
	private int la_qtna_two;//강의평가문항2
	private int la_qtna_three;//강의평가문항3
	private int la_qtna_four;//강의평가문항4
	private int la_qtna_five;//강의평가문항5
	private String la_rcmd;//강의 건의사항
	private Date la_asmt_date;//강의 평가날짜
	private String la_lct;//강의 고유번호
	public String getLa_num() {
		return la_num;
	}
	public void setLa_num(String la_num) {
		this.la_num = la_num;
	}
	public int getLa_qtna_one() {
		return la_qtna_one;
	}
	public void setLa_qtna_one(int la_qtna_one) {
		this.la_qtna_one = la_qtna_one;
	}
	public int getLa_qtna_two() {
		return la_qtna_two;
	}
	public void setLa_qtna_two(int la_qtna_two) {
		this.la_qtna_two = la_qtna_two;
	}
	public int getLa_qtna_three() {
		return la_qtna_three;
	}
	public void setLa_qtna_three(int la_qtna_three) {
		this.la_qtna_three = la_qtna_three;
	}
	public int getLa_qtna_four() {
		return la_qtna_four;
	}
	public void setLa_qtna_four(int la_qtna_four) {
		this.la_qtna_four = la_qtna_four;
	}
	public int getLa_qtna_five() {
		return la_qtna_five;
	}
	public void setLa_qtna_five(int la_qtna_five) {
		this.la_qtna_five = la_qtna_five;
	}
	public String getLa_rcmd() {
		return la_rcmd;
	}
	public void setLa_rcmd(String la_rcmd) {
		this.la_rcmd = la_rcmd;
	}
	public Date getLa_asmt_date() {
		return la_asmt_date;
	}
	public void setLa_asmt_date(Date la_asmt_date) {
		this.la_asmt_date = la_asmt_date;
	}
	public String getLa_lct() {
		return la_lct;
	}
	public void setLa_lct(String la_lct) {
		this.la_lct = la_lct;
	}
	
	
	
}
