<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
				 
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
</div>