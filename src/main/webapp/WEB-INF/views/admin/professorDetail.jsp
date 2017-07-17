<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>교수 상세정보 보기</h1>
	
	<form enctype="multipart/form-data" action="updateProfessor">
	
<%-- 		<input type="hidden" name="prfs_num" value="${professor.prfs_num}"/><br />  --%>
		교수 번호 : <input type="text" name="prfs_num" value="${professor.prfs_num}" disabled="disabled"> <br /> 
		교수 이름 : <input type="text" name="prfs_nm" value="${professor.prfs_nm}"><br />
		교수 영문이름 <input type="text" name="prfs_eng_nm" value="${professor.prfs_eng_nm}">  <br /> 
		학과번호 : <input type="text" name="prfs_dept" value="${professor.prfs_dept}"><br />
		생년월일 : <input type="text" name="prfs_bir" value="${professor.prfs_bir}"><br /> 
		주민등록번호 <input type="text" name="prfs_regno" value="${professor.prfs_regno}">  <br />
		성별 : <input type="text" name="prfs_gen" value="${professor.prfs_gen}"><br /> 
		휴대폰번호 <input type="text" name="prfs_hp" value="${professor.prfs_hp}">  <br />
		<hr />
		
		<input type="submit" value="수정하기" >
		
		
	</form>
		<button onclick="location.href='<%=request.getContextPath()%>/admin/deleteProfessor?prfs_num=${professor.prfs_num}'">삭제하기</button>

<br />
<br />
<br />
<br />
<br />
<br />