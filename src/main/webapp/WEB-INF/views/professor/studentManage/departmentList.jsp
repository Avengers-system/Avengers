<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-xs-12">
	<div class="panel panel-default">
<div class="panel-heading" style="background-color: #666666;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			학과생 목록
			</h4>
		</div>
		<div class="panel-body" style="height: 580px;" >
			<form name="frm">
				<input type="hidden" name="pageNo" />
				<!-- //페이지 번호 -->
				<input type="hidden" name="searchFiled"
					value="${pageVO.searchFiled }" />
				<!-- //검색조건 -->
				<input type="hidden" name="searchValue"
					value="${pageVO.searchValue }" />
				<!-- //검색어 -->
				<div id="table" style="height: 470px;">
					<div id="search">
						<select id="searchS">
							<option value="STUD_NM">이름</option>
							<option value="STUD_NUM">학번</option>
						</select> <input type="text" id="searchI"> <input type="button"
							value="SEARCH" onclick="fn_search();">
					</div>
					<table
						class="table table-striped table-bordered dataTable no-footer">
						<thead>
							<tr>
								<th>학번</th>
								<th>학년</th>
								<th>이름</th>
								<th>성별</th>
								<th>학적상태</th>
								<th>연락처</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${resultList}" var="resutList">
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/professor/studentManage/departmentDetail?pageNo=${pageVO.pageNo}&stud_num=${resutList.stud_num}">${resutList.stud_num}</a></td>
									<td>${resutList.stud_grd}</td>
									<td>${resutList.stud_nm}</td>
									<td>${resutList.stud_gen}</td>
									<td>${resutList.stud_schreg_code}</td>
									<td>${resutList.stud_tel}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="page">
					<div class="row">
						<div class="col-sm-5"></div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								id="datatables-example_paginate">
								<ul class="pagination">
									<c:if test="${pageVO.pageNo != 0}">
										<c:if test="${pageVO.pageNo > pageVO.pageBlock}">
											<li class="paginate_button "><a
												href="javascript:fn_movePage(${pageVO.firstPageNo})"
												style="text-decoration: none;">[첫 페이지]</a></li>
										</c:if>
										<c:if test="${pageVO.pageNo != 1}">
											<li class="paginate_button "><a
												href="javascript:fn_movePage(${pageVO.prevPageNo})"
												style="text-decoration: none;">[이전]</a></li>
										</c:if>
										<c:forEach var="i" begin="${pageVO.startPageNo}"
											end="${pageVO.endPageNo}" step="1">
											<c:choose>
												<c:when test="${i eq pageVO.pageNo}">
													<li class="paginate_button "><a
														href="javascript:fn_movePage(${i})"
														style="text-decoration: none;">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="paginate_button "><a
														href="javascript:fn_movePage(${i})"
														aria-controls="datatables-example"
														style="text-decoration: none;">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
											<li class="paginate_button "><a
												href="javascript:fn_movePage(${pageVO.nextPageNo})"
												style="text-decoration: none;">[다음]</a></li>
										</c:if>
										<c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
											<li class="paginate_button "><a
												href="javascript:fn_movePage(${pageVO.finalPageNo})"
												style="text-decoration: none;">[마지막 페이지]</a></li>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>

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
