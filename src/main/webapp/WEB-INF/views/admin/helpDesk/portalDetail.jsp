<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>포털 소식 출력</h1>

<script>
	function updatePortal(){
		location.href='portalUpdate.jsp';
	}
</script>


<c:choose>
      <c:when test="${not empty portalNoticeList}">      
         <tr>
            <td>번호:${portalNoticeList.board_num}</td><br>
            <td>제목:${portalNoticeList.board_title}</td></a><br>
            <td>내용:${portalNoticeList.board_cont}</td><br>
            <td>날짜:${portalNoticeList.board_date}</td><br>
            <td>작성자:${portalNoticeList.board_writer}</td><br>
            <td>첨부일:${portalNoticeList.board_af}</td><br>
            <td>게시판분류 고유번호:${portalNoticeList.board_bc}</td><br>
         </tr>
         
         <input type="button" value="수정" onlick=""> 
		<input type="button" value="삭제">
         
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="5" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
</c:choose>

