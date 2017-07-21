<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				 
<div class="col-xs-12">    
		<h3>관리자 정보 출력</h3>
		아이디 : ${admin.admin_id}<br/>
		이름 : ${admin.admin_nm}<br/>
		<c:choose>
		   <c:when test="${admin.admin_post eq '2' }">
		   직책 : 총괄
		   </c:when>
		   <c:otherwise>
		   직책 : 일반
		   </c:otherwise>
		</c:choose>
		
 		<h3>관리자 개인일정</h3>
        <c:forEach var="schedule" items="${perschdList }" varStatus="status">
               번호 : ${status.count}<br/>
               시퀀스번호 : ${schedule.perschd_num }<br/>
               제목 : ${schedule.perschd_title }<br/>
               내용 : ${schedule.perschd_cont }<br/>
               일정 시작일 : ${schedule.perschd_start_date }<br/>
               일정 종료일 : ${schedule.perschd_end_date }<br/>
        </c:forEach>
</div>