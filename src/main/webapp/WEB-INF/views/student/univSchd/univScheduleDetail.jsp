<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="univScheduleDetail">
<c:set var="alertUnivschd" value="${message}"/>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${!empty message }">
	<script type="text/javascript">alert('${message}');</script>
	<c:remove var="message" scope="session"/>
</c:if>

<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/studHelpDeskSide.jsp"%>
</div>
<c:choose>
		<c:when test="${not empty perschd}">
				<form name="univScheduleDetail" id="scheduleDetail">
					번호:<input type="text" name="perschd_num" value="${perschd.perschd_num}" readonly="readonly"/><br/>
					제목:<input type="text" name="perschd_title" value="${perschd.perschd_title}"/><br/>
					내용:<textarea rows="5" cols="10" name="perschd_cont" >${perschd.perschd_cont}</textarea><br/>
					작성자:<input type="text" name="perschd_writer" value="${perschd.perschd_writer}" readonly="readonly"/><br/>
					시작일:<input type="text" name="perschd_start_date" value="${perschd.perschd_start_date}">
					종료일 <input type="text" name="perschd_end_date" value="${perschd.perschd_end_date}"/><br/>
				<input type="button" id="scheduleMod" value="수정"/>
				<input type="button" id="scheduleDel" value="삭제"/>
				</form>
		</c:when>
	</c:choose>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#scheduleMod").click(function(){
			var formData = $("#scheduleDetail").serialize();
			
			$.ajax({
				type : "post",
				url :"${myContextPath}/admin/univSchd/univScheduleUpdate",
				cache : false,
				data :  formData,
				success: onModSuccess()
			});
		});
	});
	function onModSuccess(){
		location.href="${myContextPath}/admin/univSchd/univSchdedule";
	}
	$(document).ready(function(){
		$("#scheduleDel").click(function(){
			var formData = $("#scheduleDetail").serialize();
				$.ajax({
					type : "post",
					url :"${myContextPath}/admin/univSchd/univScheduleDelete",
					cache : false,
					data :  formData,
					success: onDelSuccess()
				});
		});
	});
	function onDelSuccess(){
		location.href="${myContextPath}/admin/univSchd/univSchdedule";
	}
</script>

