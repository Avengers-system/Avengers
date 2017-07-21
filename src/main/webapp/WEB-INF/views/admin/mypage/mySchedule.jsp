<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty message }">
	<script type="text/javascript">alert('${message}');</script>
	<c:remove var="message" scope="session" />
</c:if>

<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/myPageSideCategory.jsp"%>
</div>
<div class="mySchedule">
	<c:choose>
		<c:when test="${not empty perschdList}">
			<c:forEach var="perschd" items="${perschdList}">
				<form name="scheduleDetail" method="post"
					action="${myContextPath}/admin/mypage/myScheduleDetail">
					번호:<input type="text" name="perschd_num"
						value="${perschd.perschd_num}" readonly="readonly"><br />
					제목:<input type="text" name="perschd_title"
						value="${perschd.perschd_title}"><br /> 내용:
					<textarea rows="5" cols="10" name="perschd_cont">${perschd.perschd_cont}</textarea>
					<br /> 작성자:<input type="text" name="perschd_writer"
						value="${perschd.perschd_writer}" readonly="readonly"><br />
					시작일:<input type="text" name="perschd_start_date"
						value="${perschd.perschd_start_date}"> 종료일 <input
						type="text" name="perschd_end_date"
						value="${perschd.perschd_end_date}" /><br /> <input
						type="submit" value="상세보기" /> <br /> <br />
				</form>
			</c:forEach>
		</c:when>
	</c:choose>
</div>

