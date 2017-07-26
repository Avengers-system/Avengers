package com.avengers.db.dto;

/**
 * 시험의 문제들을 관리
 * @author 배진
 * 2017.07.10 최초작성
 */
public class EqVO {
	private String eq_num; // 시험문제 고유번호
	private int eq_qtna; // 시험문항
	private String eq_qtn; // 시험문제
	private String eq_qtn_type; // 시험유형
	private String eq_ans; // 시험정답
	private String eq_exmp_one; // 시험 보기문항1
	private String eq_exmp_two; // 시험 보기문항2
	private String eq_exmp_three; // 시험 보기문항3
	private String eq_exmp_four; // 시험 보기문항4
	private String eq_exam; // 시험 고유번호
	private int eq_score;

	public String getEq_num() {
		return eq_num;
	}

	public int getEq_score() {
		return eq_score;
	}

	public void setEq_score(int eq_score) {
		this.eq_score = eq_score;
	}

	public void setEq_num(String eq_num) {
		this.eq_num = eq_num;
	}

	public int getEq_qtna() {
		return eq_qtna;
	}

	public void setEq_qtna(int eq_qtna) {
		this.eq_qtna = eq_qtna;
	}

	public String getEq_qtn() {
		return eq_qtn;
	}

	public void setEq_qtn(String eq_qtn) {
		this.eq_qtn = eq_qtn;
	}

	public String getEq_qtn_type() {
		return eq_qtn_type;
	}

	public void setEq_qtn_type(String eq_qtn_type) {
		this.eq_qtn_type = eq_qtn_type;
	}

	public String getEq_ans() {
		return eq_ans;
	}

	public void setEq_ans(String eq_ans) {
		this.eq_ans = eq_ans;
	}

	public String getEq_exmp_one() {
		return eq_exmp_one;
	}

	public void setEq_exmp_one(String eq_exmp_one) {
		this.eq_exmp_one = eq_exmp_one;
	}

	public String getEq_exmp_two() {
		return eq_exmp_two;
	}

	public void setEq_exmp_two(String eq_exmp_two) {
		this.eq_exmp_two = eq_exmp_two;
	}

	public String getEq_exmp_three() {
		return eq_exmp_three;
	}

	public void setEq_exmp_three(String eq_exmp_three) {
		this.eq_exmp_three = eq_exmp_three;
	}

	public String getEq_exmp_four() {
		return eq_exmp_four;
	}

	public void setEq_exmp_four(String eq_exmp_four) {
		this.eq_exmp_four = eq_exmp_four;
	}

	public String getEq_exam() {
		return eq_exam;
	}

	public void setEq_exam(String eq_exam) {
		this.eq_exam = eq_exam;
	}

}
