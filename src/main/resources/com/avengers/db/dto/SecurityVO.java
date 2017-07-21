package com.avengers.db.dto;
/**
 * 사용자들의 권한에 대한 내용이 있는 security테이블의 VO 
 * 각 사용자들을 등록할때 자동으로 함께 등록해주어야 하며
 * 업데이트,삭제도 마찬가지다
 * @author 배진
 * 2017.07.21 최초생성
 */
public class SecurityVO {
private String id;
private String pwd;
private String enabled;
private String authority;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getEnabled() {
	return enabled;
}
public void setEnabled(String enabled) {
	this.enabled = enabled;
}
public String getAuthority() {
	return authority;
}
public void setAuthority(String authority) {
	this.authority = authority;
}

}
