package com.avengers.db.dto;

import java.util.Date;

/**
 * 학생에 대한 정보 관리
 * @author 조영훈
 * 2017.07.10 최초작성
 * 2017.07.10 보호자정보 추가 
 *
 */
public class StudVO extends PageVO{
   private String stud_num;//학생 고유번호
   private String stud_nm;//이름
   private String stud_eng_nm; //영문이름
   private Date stud_bir;//생년월일
   private String stud_email;//이메일
   private String stud_pw;//비밀번호
   private String stud_grd;//현재학년
   private String stud_regno;//주민등록번호
   private String stud_gen;//성별
   private String stud_qtr;//현재학기
   private String stud_schreg_code;//학적상태
   private String stud_pic;//증명사진
   private String stud_act_num;//계좌번호
   private String stud_bank;//은행명
   private String stud_ah;//예금주
   private String stud_addr;//주소
   private String stud_zip;//우편번호
   private String stud_tel;//전화번호
   private String stud_hp;//휴대폰번호
   private String stud_dept;//학과번호
   private String stud_guad_nm;//보호자 이름
   private String stud_guad_rel;//보호자 관계
   private String stud_guad_hp;//보호자 핸드폰
   private String stud_max_crd;//최대신청가능 학점
   private String enabled;// 2017.07.30추가 
   
   
   public String getEnabled() {
      return enabled;
   }
   public void setEnabled(String enabled) {
      this.enabled = enabled;
   }
   @Override
   public String toString() {
      return "StudVO [stud_num=" + stud_num + ", stud_nm=" + stud_nm
            + ", stud_eng_nm=" + stud_eng_nm + ", stud_bir=" + stud_bir
            + ", stud_email=" + stud_email + ", stud_pw=" + stud_pw
            + ", stud_grd=" + stud_grd + ", stud_regno=" + stud_regno
            + ", stud_gen=" + stud_gen + ", stud_qtr=" + stud_qtr
            + ", stud_schreg_code=" + stud_schreg_code + ", stud_pic="
            + stud_pic + ", stud_act_num=" + stud_act_num + ", stud_bank="
            + stud_bank + ", stud_ah=" + stud_ah + ", stud_addr="
            + stud_addr + ", stud_zip=" + stud_zip + ", stud_tel="
            + stud_tel + ", stud_hp=" + stud_hp + ", stud_dept="
            + stud_dept + ", stud_guad_nm=" + stud_guad_nm
            + ", stud_guad_rel=" + stud_guad_rel + ", stud_guad_hp="
            + stud_guad_hp + ", stud_max_crd=" + stud_max_crd + "]";
   }
   public String getStud_num() {
      return stud_num;
   }
   public void setStud_num(String stud_num) {
      this.stud_num = stud_num;
   }
   public String getStud_nm() {
      return stud_nm;
   }
   public void setStud_nm(String stud_nm) {
      this.stud_nm = stud_nm;
   }
   public String getStud_eng_nm() {
      return stud_eng_nm;
   }
   public void setStud_eng_nm(String stud_eng_nm) {
      this.stud_eng_nm = stud_eng_nm;
   }
   public Date getStud_bir() {
      return stud_bir;
   }
   public void setStud_bir(Date stud_bir) {
      this.stud_bir = stud_bir;
   }
   
   public String getStud_email() {
      return stud_email;
   }
   public void setStud_email(String stud_email) {
      this.stud_email = stud_email;
   }
   public String getStud_pw() {
      return stud_pw;
   }
   public void setStud_pw(String stud_pw) {
      this.stud_pw = stud_pw;
   }
   public String getStud_grd() {
      return stud_grd;
   }
   public void setStud_grd(String stud_grd) {
      this.stud_grd = stud_grd;
   }
   public String getStud_regno() {
      return stud_regno;
   }
   public void setStud_regno(String stud_regno) {
      this.stud_regno = stud_regno;
   }
   public String getStud_gen() {
      return stud_gen;
   }
   public void setStud_gen(String stud_gen) {
      this.stud_gen = stud_gen;
   }
   public String getStud_qtr() {
      return stud_qtr;
   }
   public void setStud_qtr(String stud_qtr) {
      this.stud_qtr = stud_qtr;
   }
   public String getStud_schreg_code() {
      return stud_schreg_code;
   }
   public void setStud_schreg_code(String stud_schreg_code) {
      this.stud_schreg_code = stud_schreg_code;
   }
   public String getStud_pic() {
      return stud_pic;
   }
   public void setStud_pic(String stud_pic) {
      this.stud_pic = stud_pic;
   }
   public String getStud_act_num() {
      return stud_act_num;
   }
   public void setStud_act_num(String stud_act_num) {
      this.stud_act_num = stud_act_num;
   }
   public String getStud_bank() {
      return stud_bank;
   }
   public void setStud_bank(String stud_bank) {
      this.stud_bank = stud_bank;
   }
   public String getStud_ah() {
      return stud_ah;
   }
   public void setStud_ah(String stud_ah) {
      this.stud_ah = stud_ah;
   }
   public String getStud_addr() {
      return stud_addr;
   }
   public void setStud_addr(String stud_addr) {
      this.stud_addr = stud_addr;
   }
   public String getStud_zip() {
      return stud_zip;
   }
   public void setStud_zip(String stud_zip) {
      this.stud_zip = stud_zip;
   }
   public String getStud_tel() {
      return stud_tel;
   }
   public void setStud_tel(String stud_tel) {
      this.stud_tel = stud_tel;
   }
   public String getStud_hp() {
      return stud_hp;
   }
   public void setStud_hp(String stud_hp) {
      this.stud_hp = stud_hp;
   }
   public String getStud_dept() {
      return stud_dept;
   }
   public void setStud_dept(String stud_dept) {
      this.stud_dept = stud_dept;
   }
   public String getStud_guad_nm() {
      return stud_guad_nm;
   }
   public void setStud_guad_nm(String stud_guad_nm) {
      this.stud_guad_nm = stud_guad_nm;
   }
   public String getStud_guad_rel() {
      return stud_guad_rel;
   }
   public void setStud_guad_rel(String stud_guad_rel) {
      this.stud_guad_rel = stud_guad_rel;
   }
   public String getStud_guad_hp() {
      return stud_guad_hp;
   }
   public void setStud_guad_hp(String stud_guad_hp) {
      this.stud_guad_hp = stud_guad_hp;
   }
   public String getStud_max_crd() {
      return stud_max_crd;
   }
   public void setStud_max_crd(String stud_max_crd) {
      this.stud_max_crd = stud_max_crd;
   }
   

}