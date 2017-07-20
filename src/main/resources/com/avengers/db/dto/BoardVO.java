package com.avengers.db.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * 게시판의 모든 정보를 관리 
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class BoardVO extends PageVO{
	private int board_num;// 게시판 고유번호
	private String board_title;// 게시판제목
	private String board_cont;// 게시판내용
	private String board_writer;// 게시판 작성자
	private Date board_date;// 게시판 작성일
	private String board_af;// 첨부일
	private String board_aff;
	private String board_bc;// 게시판분류 고유번호
	private String board_count;// 게시판분류 고유번호
	private MultipartFile file; // 파일 업로드
	

	
	public String getBoard_aff() {
		return board_aff;
	}

	public void setBoard_aff(String board_aff) {
		this.board_aff = board_aff;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getBoard_count() {
		return board_count;
	}

	public void setBoard_count(String board_count) {
		this.board_count = board_count;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_cont() {
		return board_cont;
	}

	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_af() {
		return board_af;
	}

	public void setBoard_af(String board_af) {
		this.board_af = board_af;
	}

	public String getBoard_bc() {
		return board_bc;
	}

	public void setBoard_bc(String board_bc) {
		this.board_bc = board_bc;
	}

}
