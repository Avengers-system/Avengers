package com.avengers.db.dto;
/**
 * 학생이 시험을 푼 답안정보 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class SaVO {
	private String sa_num; // 학생답안 고유번호
	private int sa_qtna;// 문항
	private String sa_ans; // 학생의 답
	private String sa_te; // 응시 고유번호

	public String getSa_num() {
		return sa_num;
	}

	public void setSa_num(String sa_num) {
		this.sa_num = sa_num;
	}

	public int getSa_qtna() {
		return sa_qtna;
	}

	public void setSa_qtna(int sa_qtna) {
		this.sa_qtna = sa_qtna;
	}

	public String getSa_ans() {
		return sa_ans;
	}

	public void setSa_ans(String sa_ans) {
		this.sa_ans = sa_ans;
	}

	public String getSa_te() {
		return sa_te;
	}

	public void setSa_te(String sa_te) {
		this.sa_te = sa_te;
	}

}
