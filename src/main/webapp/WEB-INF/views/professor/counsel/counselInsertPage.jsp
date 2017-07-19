<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
달력있는 페이지

2017/07/14

<form action="${pageContext.request.contextPath}/professor/counsel/counselInsert">
	<select name="date">
		<option value="2017/07/01">2017/07/01</option>
		<option value="2017/07/02">2017/07/02</option>
		<option value="2017/07/03">2017/07/03</option>
		<option value="2017/07/04">2017/07/04</option>
	</select>
	

	<select name="kind">
		<option value="개인상담">개인상담</option>
		<option value="진로상담">개인상담</option>
	</select>
	
	<input type="submit" value="등록">
	
</form>