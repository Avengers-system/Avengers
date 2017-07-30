<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@include file="../common/profHelpDeskSide.jsp"%>
	


<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
<!-- 제목 -->
				FAQ</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: left;">
<!-- 		내용 -->
<c:choose>
      <c:when test="${not empty faqProfNoticeList}">
      <form name="updatefaqProfBoard" action="faqProfUpdate">
         
          숫자:<input type="text" name="board_num" value="${faqProfNoticeList.board_num}" readonly><br>
          제목:<input type="text" name="board_title" value="${faqProfNoticeList.board_title}"><br>
          내용:<input type="text" name="board_cont" value="${faqProfNoticeList.board_cont}"><br>
          작성자:<input type="text" name="board_writer" value="${faqProfNoticeList.board_writer}" readonly><br>
          게시판분류고유번호:<input type="text" name="board_bc" value="${faqProfNoticeList.board_bc}" readonly><br>
    
    <sec:authorize access="hasRole('ROLE_ADMIN')">     
        <input type="submit" value="수정"> 
		<a href="faqProfDelete?board_num=${faqProfNoticeList.board_num}"><input type="button" value="삭제"></a>
	</sec:authorize>
	<input type="button" value="목록으로" onclick="history.go(-1)">
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

		</div>
		
	</div>
</div>
<h1>FAQ </h1>


