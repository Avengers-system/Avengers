package com.avengers.db.dto;

import java.util.Date;

/**
 * 휴/복학 날짜,학번을 담는 VO
 * @author 조영훈
 * @since 2017.07.20
 */
public class LoaRtsVO {
    private Date LOA_START_DATE;//"휴학시작일"
    private Date LOA_END_DATE;//"휴학종료일"
    private Date RTS_APPL_DATE;//"복학신청일"
    private Date RTS_DATE;//"복학일"
    private Date LOA_STUD;//"학번"
   public Date getLOA_START_DATE() {
      return LOA_START_DATE;
   }
   public void setLOA_START_DATE(Date lOA_START_DATE) {
      LOA_START_DATE = lOA_START_DATE;
   }
   public Date getLOA_END_DATE() {
      return LOA_END_DATE;
   }
   public void setLOA_END_DATE(Date lOA_END_DATE) {
      LOA_END_DATE = lOA_END_DATE;
   }
   public Date getRTS_APPL_DATE() {
      return RTS_APPL_DATE;
   }
   public void setRTS_APPL_DATE(Date rTS_APPL_DATE) {
      RTS_APPL_DATE = rTS_APPL_DATE;
   }
   public Date getRTS_DATE() {
      return RTS_DATE;
   }
   public void setRTS_DATE(Date rTS_DATE) {
      RTS_DATE = rTS_DATE;
   }
   public Date getLOA_STUD() {
      return LOA_STUD;
   }
   public void setLOA_STUD(Date lOA_STUD) {
      LOA_STUD = lOA_STUD;
   }
}