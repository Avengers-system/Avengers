<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>myInfo</h1>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<div class="mypage">
<c:choose>
	<c:when test="${not empty admin}">
		<form name="myInfo" method="post" enctype="multipart/form-data">
			사진:<img src="<%=request.getContextPath()%>/resources/myInfo_images/${admin.admin_pic}" width="100pt"/>
			<input type="file" name="myImage"/><br/>
			아이디:<input type="text" name="adminId" value="${admin.admin_id}" readonly="readonly"/><br/>
			생년월일:<fmt:formatDate value="${admin.admin_bir}" type="date" pattern="YYYY/MM/dd"/><br/>
			이메일:<input type="text" name="adminEmail" value="${admin.admin_email}"/><br/>
			전화번호:<input type="text" name="adminTel" value="${admin.admin_tel}"><br/>
			휴대폰번호:<input type="text" name="adminHp" value="${admin.admin_hp}"/><br/>
			직급:<input type="text" name="adminPost" value="${admin.admin_post}" readonly="readonly"><br/>
			은행명:<input type="text" name="adminBank" value="${admin.admin_bank}"><br/>
			<input type="button" value="수정" onclick="myInfoUpdate_go()">
		</form>
	</c:when>
	<c:otherwise>
		등록된 개인정보가 없습니다.
	</c:otherwise>
</c:choose>
</div>
<br/>
<script>
function myInfoUpdate_go(){
	location.href="${myContextPath}/admin/adminMain";
}
</script>
