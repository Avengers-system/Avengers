package com.avengers.db.dto;

import java.util.Date;

/**
 * 증명서의 모든 정보를 관리
 * @author 배진 
 * 2017.07.10 최초작성
 */
public class CertVO {
	private String cert_num; // 증명서 번호
	private String cert_nm; // 증명서명
	private Date cert_issue_date; // 증명서 발급일
	private String cert_stud; // 학생 고유번호

	public String getCert_num() {
		return cert_num;
	}

	public void setCert_num(String cert_num) {
		this.cert_num = cert_num;
	}

	public String getCert_nm() {
		return cert_nm;
	}

	public void setCert_nm(String cert_nm) {
		this.cert_nm = cert_nm;
	}

	public Date getCert_issue_date() {
		return cert_issue_date;
	}

	public void setCert_issue_date(Date cert_issue_date) {
		this.cert_issue_date = cert_issue_date;
	}

	public String getCert_stud() {
		return cert_stud;
	}

	public void setCert_stud(String cert_stud) {
		this.cert_stud = cert_stud;
	}

}
