<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- UserHeader -->
<div class="col-md-12" id="commonUserHeader">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">Main</a></li>
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">학적</a></li>
		<li role="presentation"><a href="#">수업</a></li>
		<li role="presentation"><a href="#">수강신청</a></li>
		<li role="presentation"><a href="#">등록&장학</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQList">Help Desk</a></li>
	</ul>
</div>

<!-- Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">

</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
FAQ 목록
<form name="frm">
    <input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
<div id="wrap">
    <div id="table" style="height: 470px;">
        <table>
            <thead>
                <tr>
                    <th>BOARD_NUM</th>
                    <th>BOARD_TITLE</th>
                    <th>BOARD_WRITER</th>
                    <th>BOARD_DATE</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${resultList }" var="resutList">
                <tr>
                    <td>${resutList.board_num}</td>
                    <td><a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQDetail?pageNo=${pageVO.pageNo}&board_num=${resutList.board_num}">${resutList.board_title}</a></td>
                    <td>${resutList.board_writer}</td>
                    <td>${resutList.board_date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
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
    <div id="search">
        <select id="searchS">
            <option value="BOARD_NUM">BOARD_NUM</option>
            <option value="BOARD_WRITER">BOARD_WRITER</option>
        </select>
        <input type="text" id="searchI"/>
        <input type="button" value="SEARCH" onclick="fn_search();"/>
    </div>
</div>
</form>

<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQWritePage" method="post">
	<input type="hidden" name="pageNo" value="${pageVO.pageNo}">
	<input type="submit" value="글쓰기">
</form>


</div>

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

