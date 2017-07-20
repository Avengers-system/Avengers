<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
    //페이지 이동
    function fn_movePage(val){
        jQuery("input[name=pageNo]").val(val);
        jQuery("form[name=frm]").attr("method", "post");
        jQuery("form[name=frm]").attr("action","").submit();
    }
    //검색 버튼
    function fn_search(){
        if( jQuery("#searchS").val() == "" ){
            return;
        }else{
            jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
        }
        var searchValue = jQuery("#searchI").val();
        jQuery("input[name=searchValue]").val(searchValue);
   
        jQuery("input[name=pageNo]").val("1");
        jQuery("form[name=frm]").attr("method", "post");
        jQuery("form[name=frm]").attr("action","").submit();
    }
</script> 
	

<h1>FAQ게시판 글 출력</h1>
 <form action="<%=request.getContextPath()%>/admin/faqSearch?board_title=
      ${faqSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>
  
       <a href="<%=request.getContextPath()%>/admin/faqWriteForm">글쓰기</a>
       <form name="frm">
<input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
<input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
<input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
<c:choose>
      <c:when test="${not empty faqNoticeList}">      
      <c:forEach var="faqNoticeList" items="${faqNoticeList }">
      <hr color="black">
         <tr>
            <td>게시판번호:${faqNoticeList.board_num}</td><br/>
           <a href="${pageContext.request.contextPath}/admin/faqDetail?board_num=${faqNoticeList.board_num}
           &board_count=${faqNoticeList.board_count}">
           <td>제목:${faqNoticeList.board_title}</td></a><br/>
            <td>내용:${faqNoticeList.board_cont}</td><br/>
            <td>날짜:${faqNoticeList.board_date}</td><br/>
            <td>작성자:${faqNoticeList.board_writer}</td><br/>
            <td>첨부파일:${faqNoticeList.board_af}</td><br/>
            <td>게시판분류 고유번호:${faqNoticeList.board_bc}</td><br/>
            <td>조회수:${faqNoticeList.board_count}</td><br/>
         </tr>
        
      </c:forEach>
         <div id="page">
    <c:if test="${pageVO.pageNo != 0}">
        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
            <a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">[첫 페이지]</a>
       </c:if>
       <c:if test="${pageVO.pageNo != 1}">
           <a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;">[이전]</a>
        </c:if>
        <span>
            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
                <c:choose>
                    <c:when test="${i eq pageVO.pageNo}">
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">
                            <font style="font-weight: bold;">${i}</font>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </span>
        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
            <a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;">[다음]</a>
        </c:if>
        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
            <a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">[마지막 페이지]</a>
        </c:if>
    </c:if>
    </div>
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

