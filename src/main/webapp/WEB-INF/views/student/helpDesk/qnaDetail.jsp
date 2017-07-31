<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@include file="../common/studHelpDeskSide.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
<!-- 제목 -->
				Q&A</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: left;">
<!-- 		내용 -->
<c:choose>
      <c:when test="${not empty qnaNoticeList}">
      <form name="updateQnaBoard" action="qnaStudUpdate">
         
          번호:<input type="text" name="board_num" value="${qnaNoticeList.board_num}" readonly><br>
          제목:<input type="text" name="board_title" value="${qnaNoticeList.board_title}"><br>
          내용:<input type="text" name="board_cont" value="${qnaNoticeList.board_cont}"><br>
          작성자:<input type="text" name="board_writer" value="${qnaNoticeList.board_writer}" readonly><br>
          게시판분류고유번호:<input type="text" name="board_bc" value="${qnaNoticeList.board_bc}" readonly><br>
         
        <input type="submit" value="수정"> 
		<a href="qnaStudDelete?board_num=${qnaNoticeList.board_num}"><input type="button" value="삭제"></a>
		<input type="button" value="목록으로" 



onclick="history.go(-1)">
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



