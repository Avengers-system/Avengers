<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<h1>교수 등록하기</h1>
<form name="insertProfessor"  method="post"
	action="${pageContext.request.contextPath }/admin/insertProfessor" 
	  enctype="multipart/form-data">
		
		 <input type="hidden" name="prfs_num" ><br>
		 이름                     <input type="text" name="prfs_nm"/> <br>
		 영문이름                 <input type="text" name="prfs_eng_nm"/> <br>
		 생년월일                 <input type="data" name="prfs_bir"/> <br>
		 이메일                   <input type="text" name="prfs_email"/> <br>
		 비밀번호                 <input type="text" name="prfs_pw"/> <br>
		 주민등록번호             <input type="text" name="prfs_regno"/> <br>
		 성별                     <input type="text" name="prfs_gen"/> <br>
		 사진경로                 <input type="file" name="prfs_pic"/> <br>
		 계좌번호                 <input type="text" name="prfs_act_num"/> <br>
		 은행명                   <input type="text" name="prfs_bank"/> <br>
		 예금주                   <input type="text" name="prfs_ah"/> <br>
		 주소                     <input type="text" name="prfs_addr"/> <br>
		 우편번호                 <input type="text" name="prfs_zip"/> <br>
		 전화번호                 <input type="text" name="prfs_tel"/> <br>
		 휴대폰번호               <input type="text" name="prfs_hp"/> <br>
<!-- dept_num뽑아야됨 -->
		 교수학과번호                 
		 <select name="prfs_dept">
		 </select>
		 
		 <input type="submit" value="등록하기">
		 
</form>
 
 