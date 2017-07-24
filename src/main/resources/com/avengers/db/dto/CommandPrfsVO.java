package com.avengers.db.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * 교수에 대한 정보 관리
 * 
 * @author 조영훈 2017.07.10 최초작성
 *
 */
public class CommandPrfsVO {
	private String prfs_num; // 교수번호
	private String prfs_nm;// 이름
	private String prfs_eng_nm;// 영문이름
	private String prfs_bir;// 생년월일
	private String prfs_email;// 이메일
	private String prfs_pw;// 비밀번호
	private String prfs_regno;// 주민등록번호
	private String prfs_gen;// 성별
	private MultipartFile prfs_pic;// 증명사진
	private String prfs_act_num;// 계좌번호
	private String prfs_bank;// 은행명
	private String prfs_ah;// 예금주
	private String prfs_addr;// 주소
	private String prfs_zip;// 우편번호
	private String prfs_tel;// 전화번호
	private String prfs_hp;// 휴대폰번호
	private String prfs_dept;// 학과번호

	

	
	public String getPrfs_num() {
		return prfs_num;
	}

	public void setPrfs_num(String prfs_num) {
		this.prfs_num = prfs_num;
	}

	public String getPrfs_nm() {
		return prfs_nm;
	}

	public void setPrfs_nm(String prfs_nm) {
		this.prfs_nm = prfs_nm;
	}

	public String getPrfs_eng_nm() {
		return prfs_eng_nm;
	}

	public void setPrfs_eng_nm(String prfs_eng_nm) {
		this.prfs_eng_nm = prfs_eng_nm;
	}

	public String getPrfs_bir() {
		return prfs_bir;
	}

	public void setPrfs_bir(String prfs_bir) {
		this.prfs_bir = prfs_bir;
	}

	public String getPrfs_email() {
		return prfs_email;
	}

	public void setPrfs_email(String prfs_email) {
		this.prfs_email = prfs_email;
	}

	public String getPrfs_pw() {
		return prfs_pw;
	}

	public void setPrfs_pw(String prfs_pw) {
		this.prfs_pw = prfs_pw;
	}

	public String getPrfs_regno() {
		return prfs_regno;
	}

	public void setPrfs_regno(String prfs_regno) {
		this.prfs_regno = prfs_regno;
	}

	public String getPrfs_gen() {
		return prfs_gen;
	}

	public void setPrfs_gen(String prfs_gen) {
		this.prfs_gen = prfs_gen;
	}

	public MultipartFile getPrfs_pic() {
		return prfs_pic;
	}

	public void setPrfs_pic(MultipartFile prfs_pic) {
		this.prfs_pic = prfs_pic;
	}

	public String getPrfs_act_num() {
		return prfs_act_num;
	}

	public void setPrfs_act_num(String prfs_act_num) {
		this.prfs_act_num = prfs_act_num;
	}

	public String getPrfs_bank() {
		return prfs_bank;
	}

	public void setPrfs_bank(String prfs_bank) {
		this.prfs_bank = prfs_bank;
	}

	public String getPrfs_ah() {
		return prfs_ah;
	}

	public void setPrfs_ah(String prfs_ah) {
		this.prfs_ah = prfs_ah;
	}

	public String getPrfs_addr() {
		return prfs_addr;
	}

	public void setPrfs_addr(String prfs_addr) {
		this.prfs_addr = prfs_addr;
	}

	public String getPrfs_zip() {
		return prfs_zip;
	}

	public void setPrfs_zip(String prfs_zip) {
		this.prfs_zip = prfs_zip;
	}

	public String getPrfs_tel() {
		return prfs_tel;
	}

	public void setPrfs_tel(String prfs_tel) {
		this.prfs_tel = prfs_tel;
	}

	public String getPrfs_hp() {
		return prfs_hp;
	}

	public void setPrfs_hp(String prfs_hp) {
		this.prfs_hp = prfs_hp;
	}

	public String getPrfs_dept() {
		return prfs_dept;
	}

	public void setPrfs_dept(String prfs_dept) {
		this.prfs_dept = prfs_dept;
	}

	public PrfsVO toPrfsVO() {
		PrfsVO prfsVO = new PrfsVO();
		prfsVO.setPrfs_act_num(prfs_act_num);
		prfsVO.setPrfs_addr(prfs_addr);
		prfsVO.setPrfs_ah(prfs_ah);
		prfsVO.setPrfs_bank(prfs_bank);
		try {
			Date prfs_bir_date=new SimpleDateFormat("yyyy-MM-dd").parse(prfs_bir);
			prfsVO.setPrfs_bir(prfs_bir_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		prfsVO.setPrfs_dept(prfs_dept);
		prfsVO.setPrfs_email(prfs_email);
		prfsVO.setPrfs_eng_nm(prfs_eng_nm);
		prfsVO.setPrfs_gen(prfs_gen);
		prfsVO.setPrfs_hp(prfs_hp);
		prfsVO.setPrfs_nm(prfs_nm);
		prfsVO.setPrfs_num(prfs_num);
		prfsVO.setPrfs_pw(prfs_pw);
		prfsVO.setPrfs_regno(prfs_regno);
		prfsVO.setPrfs_tel(prfs_tel);
		prfsVO.setPrfs_zip(prfs_zip);
		prfsVO.setPrfs_pic(prfs_pic.getOriginalFilename());
		
		
		return prfsVO;
	}
	
	@Override
	public String toString(){
		return  prfs_num+"   "+prfs_nm+"   "+prfs_eng_nm+"   "+
				"   "+prfs_bir+"   "+prfs_email+"   "+prfs_pw+"   "+prfs_regno+"   "+prfs_gen+"   "+prfs_pic+"   "+prfs_act_num+
				"   "+prfs_bank+"   "+prfs_ah+"   "+prfs_addr+"   "+prfs_zip+"   "+prfs_tel+"   "+prfs_hp+"   "+prfs_dept;
	}

}
