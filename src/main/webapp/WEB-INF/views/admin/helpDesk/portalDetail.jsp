<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>포털소식 상세보기 출력</h1>

<c:choose>
      <c:when test="${not empty portalNoticeList}">
      <form name="updatePortalBoard" action="portalUpdate">
         
          숫자:<input type="text" name="board_num" value="${portalNoticeList.board_num}" readonly><br>
          제목:<input type="text" name="board_title" value="${portalNoticeList.board_title}"><br>
          내용:<input type="text" name="board_cont" value="${portalNoticeList.board_cont}"><br>
<%--           날짜:<input type="text" name="board_date" value="${portalNoticeList.board_date}" readonly> --%>
          작성자:<input type="text" name="board_writer" value="${portalNoticeList.board_writer}" readonly><br>
          첨부파일?:<input type="text" name="board_af" value="${portalNoticeList.board_af}"><br>
          게시판분류고유번호:<input type="text" name="board_bc" value="${portalNoticeList.board_bc}" readonly><br>
         
        <input type="submit" value="수정"> 
		<a href="portalDelete?board_num=${portalNoticeList.board_num}"><input type="button" value="삭제"></a>
      </form>      
         
         
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="5" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
</c:choose>

