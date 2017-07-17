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
<br/>
<br/>
<div class="mypage">
<c:choose>
	<c:when test="${not empty admin}">
		<form name="adminInfo" method="post" enctype="multipart/form-data" action="${myContextPath}/admin/mypage/myInfoUpdate">
			사진:<img src="<%=request.getContextPath()%>/resources/myInfo_images/${admin.admin_pic}" width="100pt"/>
					 <input type="file"  name="file" onclick="ImageChange_go()"/><br/>
				아이디:<input type="text" name="admin_id" value="${admin.admin_id}"/><br/>
				비밀번호:<input type="text" name="admin_pw" value="${admin.admin_pw}"/><br/>
				이름:<input type="text" name="admin_nm" value="${admin.admin_nm}" readonly="readonly"/><br/>
				직급:<input type="text" name="admin_post" value="${admin.admin_post}" readonly="readonly"/><br/>
				영문이름:<input type="text" name="admin_eng_nm" value="${admin.admin_eng_nm}" /><br/>
				생년월일:<input  type="text" name="admin_bir" value="${admin.admin_bir}"/><br/>
				주민등록번호:<input type="text" name="admin_regno" value="${admin.admin_regno}" readonly="readonly"/><br/>
				성별:<input type="text" name="admin_gen" value="${admin.admin_gen}" readonly="readonly"/><br/>
				이메일:<input type="text" name="admin_email" value="${admin.admin_email}"/><br/>
				전화번호:<input type="text" name="admin_tel" value="${admin.admin_tel}" /><br/>
				휴대폰번호:<input type="text" name="admin_hp" value="${admin.admin_hp}"><br/>
				주소:<input type="text" name="admin_addr" value="${admin.admin_addr}"/><br/>
				우편번호:<input type="text" name="admin_zip " value="${admin.admin_zip }"/><br/>
				은행명:<input type="text" name="admin_bank" value="${admin.admin_bank}"/><br/>
				계좌번호:<input type="text" name="admin_act_num" value="${admin.admin_act_num}"/><br/>
				예금주:<input type="text" name="admin_ah" value="${admin.admin_ah}"/><br/>
				<input type="submit" value="수정"/>
		</form>
	</c:when>
</c:choose>
</div>
<div class="mySchedule">
	<c:choose>
		<c:when test="${not empty perschdList}">
			<c:forEach var="perschd" items="${perschdList}">
				<form name="scheduleDetail" method="post" action="${myContextPath}/admin/mypage/myScheduleDetail">
					번호:<input type="text" name="perschd_num" value="${perschd.perschd_num}" readonly="readonly"><br/>
					제목:<input type="text" name="perschd_title" value="${perschd.perschd_title}"><br/>
					내용:<textarea rows="5" cols="10" name="perschd_cont">${perschd.perschd_cont}</textarea>	<br/>		
					작성자:<input type="text" name="perschd_writer" value="${perschd.perschd_writer}" readonly="readonly"><br/>
					시작일:<input type="text" name="perschd_start_date" value="${perschd.perschd_start_date}">
					종료일 <input type="text" name="perschd_end_date" value="${perschd.perschd_end_date}"/><br/>
					<input type="submit" value="상세보기"/>
					<br/>
					<br/>
				</form>
			</c:forEach>
		</c:when>
	</c:choose>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
//관리자가 아이디가 admin이면 개인정보를 변경할 수 있다.
//readonly remove
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