<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<h1>mypage</h1>
<button onclick="myInfo_go()">개인정보</button><br/>
<button onclick="mySchedule_go()">개인일정관리</button><br/>
<br/>
<div class="mypage">
<c:choose>
	<c:when test="${not empty admin}">
		<form name="adminInfo" method="post" enctype="multipart/form-data" action="${myContextPath}/admin/mypage/myInfoUpdate">
			사진:<img src="<%=request.getContextPath()%>/resources/myInfo_images/${admin.admin_pic}" width="100pt"/>
					<input type="hidden" name="myImage" value="${admin.admin_pic}"/>
					 <input type="file"  name="file" onclick="ImageChange_go()"/><br/>
				아이디:<input type="text" name="adminId" value="${admin.admin_id}"/><br/>
				비밀번호:<input type="text" name="amindPw" value="${admin.admin_pw}"/><br/>
				이름:<input type="text" name="adminNm" value="${admin.admin_nm}" readonly="readonly"/><br/>
				직급:<input type="text" name="adminPost" value="${admin.admin_post}" readonly="readonly"/><br/>
				영문이름:<input type="text" name="amdminEngNm" value="${admin.admin_eng_nm}" /><br/>
				생년월일:<fmt:formatDate value="${admin.admin_bir}" type="date" pattern="YYYY/MM/dd" /><br/>
				주민등록번호:<input type="text" name="admin_regno" value="${admin.admin_regno}" readonly="readonly"/><br/>
				성별:<input type="text" name="admin_gen" value="${admin.admin_gen}" readonly="readonly"/><br/>
				이메일:<input type="text" name="adminEmail" value="${admin.admin_email}"/><br/>
				전화번호:<input type="text" name="adminTel" value="${admin.admin_tel}" /><br/>
				휴대폰번호:<input type="text" name="adminHp" value="${admin.admin_hp}"/><br/>
				주소:<input type="text" name="adminAddr" value="${admin.admin_addr}"/><br/>
				우편번호:<input type="text" name="addrZip" value="${admin.admin_zip}"/><br/>
				은행명:<input type="text" name="adminBank" value="${admin.admin_bank}"/><br/>
				계좌번호:<input type="text" name="adminActNum" value="${admin.admin_act_num}"/><br/>
				<input type="submit" value="수정"/>
		</form>
	</c:when>
</c:choose>
</div>
<div class="mySchdule">
	<c:choose>
		<c:when test="${not empty perschdList}">
			<c:forEach var="perschd" items="${perschdList}">
				<tr>
					<td>번호:${perschd.perschd_num}</td>
					<td>제목:${perschd.perschd_title}</td>
					<td>내용:${perschd.perschd_cont}</td>
					<td>작성자:${perschd.perschd_writer}</td>
					<td>작성일:${perschd.perschd_date}</td>
					<td>시작일:${perschd.perschd_start_date}</td>
					<td>종료일:${perschd.perschd_end_date}</td>
				</tr>
				<br/>
			</c:forEach>
		</c:when>
	</c:choose>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	if('${admin.admin_post}' == "총괄"){
			$("input").removeAttr("readonly");
	}
});
//개인정보
function myInfo_go(){
	location.href="${myContextPath}/admin/mypage/";
}
//스케줄보기
function mySchedule_go(){
	location.href="${myContextPath}/admin/mypage/mySchedule";
}
//파일 업로드하면 img tag에 image바뀌기
function ImageChange_go(){
		//파일 가져오기
		var file = this.files[0];
		var reader = new FileReader();
		
		reader.onload = function(e){
			$("input").attr("src",e.target.result);
		}
		
		reader.readAsDataURL(file);	
}

</script>
</body>
</html>