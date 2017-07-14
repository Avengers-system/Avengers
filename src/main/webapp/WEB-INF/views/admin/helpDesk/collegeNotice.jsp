<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>학사일정1학기/ 2학기</h1>
<h1>학사일정 입력</h1>
<form name="insertCollegeBoard">
	제목<input type="text" name="perschd_title">
	내용<input type="text" name="perschd_cont">
	시작일<input type="text" name="perschd_start_date">	
	종료일<input type="text" name="perschd_end_date">	
	등록<input type="submit">
</form>
<br/>

<h1>일정보기</h1>
<c:choose>
      <c:when test="${not empty collegeNoticeList}">      
      <c:forEach var="collegeNoticeList" items="${collegeNoticeList }">
         <tr>
            <td>번호  :${collegeNoticeList.perschd_num}</td>
            <td>제목  :${collegeNoticeList.perschd_title}</td>
            <td>내용  :${collegeNoticeList.perschd_cont}</td>
            <td>날짜  :${collegeNoticeList.perschd_date}</td>
            <td>시작일:${collegeNoticeList.perschd_start_date}</td>
            <td>종료일:${collegeNoticeList.perschd_end_date}</td>
            <td>작성자:${collegeNoticeList.perschd_writer}</td>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="5" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
</c:choose>

