<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<h1>교수목록 리스트 </h1>
 
 <c:forEach var="professor" items="${professorList }">
	교수 이름 : ${professor.prfs_nm}<br/>
	교수 영문이름 : ${professor.prfs_eng_nm}<br/>
	학과번호 : ${professor.prfs_dept}<br/>
	생년월일 : ${professor.prfs_bir}<br/>
	주민등록번호 : ${professor.prfs_regno}<br/>
	성별 : ${professor.prfs_gen}<br/>
	휴대폰번호 : ${professor.prfs_hp}<br/>
 </c:forEach>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
 
 
 
<h1>교수 등록하기</h1>
<form name="insertProfessor"  enctype="multipart/form-data">
		 교수번호                 <input type="text" name="prfs_num"/> <br>
		 이름                     <input type="text" name="prfs_nm"/> <br>
		 영문이름                 <input type="text" name="prfs_eng_nm"/> <br>
		 생년월일                 <input type="text" name="prfs_bir"/> <br>
		 이메일                   <input type="text" name="prfs_email"/> <br>
		 비밀번호                 <input type="text" name="prfs_pw"/> <br>
		 주민등록번호             <input type="text" name="prfs_regno"/> <br>
		 성별                     <input type="text" name="prfs_gen"/> <br>
		 
		 증명사진                 <div><img>사진들어가는부분</img></div> <br>
<!-- 		 					<input type="file" name="file"> -->

		 사진경로                 <input type="file" name="prgs_pic"/> <br>
		 					
		
		 계좌번호                 <input type="text" name="prfs_act_num"/> <br>
		 은행명                   <input type="text" name="prfs_bank"/> <br>
		 예금주                   <input type="text" name="prfs_ah"/> <br>
		 주소                     <input type="text" name="prfs_addr"/> <br>
		 우편번호                 <input type="text" name="prfs_zip"/> <br>
		 전화번호                 <input type="text" name="prfs_tel"/> <br>
		 휴대폰번호               <input type="text" name="prfs_hp"/> <br>
		 시큐리티                 <input type="text" name="prfs_security"/> <br>
		 교수학과번호                 <input type="text" name="prfs_dept"/> <br>
		 
		 
		 <input type="submit" id="insertProfessor" value="등록하기">
		 
</form>
 
 