package com.avengers.db.dto;

import java.util.Date;

/**
 * 게시판의 모든 댓글 정보를 관리 
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class ComtVO {
	private String comt_num;// 댓글의 고유번호
	private String comt_conf;// 댓글 내용
	private String comt_writer;// 댓글 작성자
	private Date comt_date;// 댓글 작성일
	private int comt_board;// 게시판 고유번호

	public String getComt_num() {
		return comt_num;
	}

	public void setComt_num(String comt_num) {
		this.comt_num = comt_num;
	}

	public String getComt_conf() {
		return comt_conf;
	}

	public void setComt_conf(String comt_conf) {
		this.comt_conf = comt_conf;
	}

	public String getComt_writer() {
		return comt_writer;
	}

	public void setComt_writer(String comt_writer) {
		this.comt_writer = comt_writer;
	}

	public Date getComt_date() {
		return comt_date;
	}

	public void setComt_date(Date comt_date) {
		this.comt_date = comt_date;
	}

	public int getComt_board() {
		return comt_board;
	}

	public void setComt_board(int comt_board) {
		this.comt_board = comt_board;
	}

}
