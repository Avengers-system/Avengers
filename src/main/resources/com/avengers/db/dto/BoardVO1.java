package com.avengers.db.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO1 {
	private int board_num;// 게시판 고유번호
	private String board_title;// 게시판제목
	private String board_cont;// 게시판내용
	private String board_writer;// 게시판 작성자
	private Date board_date;// 게시판 작성일
	private MultipartFile board_af;// 첨부일
	private String board_bc;// 게시판분류 고유번호
	private String board_count;// 게시판분류 고유번호
	
}
