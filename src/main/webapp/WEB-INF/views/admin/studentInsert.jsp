<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<h1>학생 등록하기</h1>
<form name="insertStudent"  method="post"
		action="${pageContext.request.contextPath }/admin/insertStudent" 
		enctype="multipart/form-data">
				                      
		<input type="hidden" name="stud_num"/>  
		이름                             <input type="text" name="stud_nm">              <br>
		영문이름                         <input type="text" name="stud_eng_nm">          <br>
		생년월일                         <input type="text" name="stud_bir">             <br>
		이메일                           <input type="text" name="std_email">            <br>
		비밀번호                         <input type="text" name="stud_pw">              <br>
		현재학년                         <input type="text" name="stud_grd">             <br>
		주민등록번호                     <input type="text" name="stud_regno">           <br>
		성별                             <input type="text" name="stud_gen">             <br>
		현재학기                         <input type="text" name="stud_qtr">             <br>
		학적상                           <input type="text" name="stud_schreg_code">     <br>
		증명사진                         <input type="file" name="stud_pic">             <br>
		계좌번호                         <input type="text" name="stud_act_num">         <br>
		은행명                           <input type="text" name="stud_bank">            <br>
		예금주                           <input type="text" name="stud_ah">              <br>
		주소                             <input type="text" name="sutd_addr">            <br>
		우편번호                         <input type="text" name="stud_zip">             <br>
		전화번호                         <input type="text" name="stud_tel">             <br>
		휴대폰번호                       <input type="text" name="stud_hp">              <br>
		학과번호                         <input type="text" name="stud_dept">            <br>
		보호자 이름                      <input type="text" name="stud_guad_nm">         <br>
		보호자 관계                      <input type="text" name="stud_guad_rel">        <br>
		보호자 핸드폰                    <input type="text" name="stud_guad_hp">         <br>
		  	 
		<input type="submit" value="등록하기">

</form>
 
 