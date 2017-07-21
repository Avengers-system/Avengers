<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <div id="search">
        <select id="searchS">
            <option value="BOARD_NUM">BOARD_NUM</option>
            <option value="BOARD_WRITER">BOARD_WRITER</option>
        </select>
        <input type="text" id="searchI"/>
        <input type="button" value="SEARCH" onclick="fn_search();"/>
    </div>
<div id="wrap">
    <div id="table">
        <table class="table table-striped table-bordered dataTable no-footer">
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
    	<div class="col-sm-5">
			<div class="dataTables_info" id="datatables-example_info"
				role="status" aria-live="polite">Showing 1 to 10 of 57
				entries
			</div>
		</div>
	<ul class="pagination">		
	    <c:if test="${pageVO.pageNo != 0}">
	    	
	        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
	            <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">[첫 페이지]</a></li>
	       </c:if>
	       <c:if test="${pageVO.pageNo != 1}">
	           <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;">[이전]</a></li>
	        </c:if>
	            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
	                <c:choose>
	                    <c:when test="${i eq pageVO.pageNo}">
	                         <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${i})" style="text-decoration: none;">
	                            <font style="font-weight: bold;">${i}</font>
	                        </a>
	                        </li>
	                    </c:when>
	                    <c:otherwise>
	                        <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${i})" style="text-decoration: none;">${i}</a></li>
	                    </c:otherwise>
	                </c:choose>
	            </c:forEach>
	        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
	             <li class="paginate_button previous disabled"><li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;">[다음]</a></li>
	        </c:if>
	        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
	             <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">[마지막 페이지]</a></li>
	        </c:if>
	    </c:if>
	</ul>
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
	function fn_movePage(val) {
		jQuery("input[name=pageNo]").val(val);
		jQuery("form[name=frm]").attr("method", "post");
		jQuery("form[name=frm]").attr("action", "").submit();
	}
	//검색 버튼
	function fn_search() {
		if (jQuery("#searchS").val() == "") {
			return;
		} else {
			jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
		}
		var searchValue = jQuery("#searchI").val();
		jQuery("input[name=searchValue]").val(searchValue);

		jQuery("input[name=pageNo]").val("1");
		jQuery("form[name=frm]").attr("method", "post");
		jQuery("form[name=frm]").attr("action", "").submit();
	}
</script> 

