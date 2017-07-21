<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
[


<c:forEach var="vo" items="${voList}" varStatus="status">

	<c:if test="${voList.size > 0 }">
		,
		{
			<c:choose>
				
				<c:when test="${!empty professorList }">
					"dept"   : "${professor.prfs_dept}%>"
				</c:when>
				
				<c:otherwise>
					"dept"   : "${student.prfs_dept}%>"
				</c:otherwise>
			
			</c:choose>
		}
	</c:if>
</c:forEach> 

]

