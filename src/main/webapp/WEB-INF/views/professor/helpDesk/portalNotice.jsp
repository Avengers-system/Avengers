<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../common/profHelpDeskSide.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<!--  메뉴제목 -->
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				포탈소식</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: center;">
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
						jQuery("input[name=searchFiled]").val(
								jQuery("#searchS").val());
					}
					var searchValue = jQuery("#searchI").val();
					jQuery("input[name=searchValue]").val(searchValue);

					jQuery("input[name=pageNo]").val("1");
					jQuery("form[name=frm]").attr("method", "post");
					jQuery("form[name=frm]").attr("action", "").submit();
				}
			</script>


								<div class="row">

									<form
										action="<%=request.getContextPath()%>/professor/helpDesk/portalProfSearch?board_title=${portalSearch.board_title}">
										<sec:authorize access="hasRole('ROLE_ADMIN')">

											<div
												style="text-align: right; margin-right: 28px; margin-top: 13px; margin-bottom: -20px;">
												<a
													href="<%=request.getContextPath()%>/professor/helpDesk/portalProfWriteForm">글쓰기</a>
											</div>
										</sec:authorize>
										<div class="col-sm-6" style="float: left; width: 225px;">
											<div id="datatables-example_filter" class="dataTables_filter"
												style="width: 20%;">

												<label><input type="search"
													class="form-control input-sm" placeholder="글 제목을 입력해주세요"
													aria-controls="datatables-example" name="board_title"
													style="width: 200px; text-align: center;"> </label>
												<!-- 검색 -->
											</div>

										</div>
										<div style="margin-bottom: -6px; margin-top: 5px;"
											class="dataTables_paginate paging_simple_numbers"
											id="datatables-example_paginate" style="text-align: center;">
											<input type="submit" value="검색" style="margin-bottom: -6px;">
										</div>
										<div class="col-sm-6"
											style="width: 50px; height: 0px; flaot: right;">
											<div class="dataTables_length" id="datatables-example_length"
												style="margin-bottom: 0px;">

												<!-- 									<div style="width: 700px; float: right; text-align: right; margin-bottom: 0px; margin-top: 0px;"> -->
												<!-- 									</div> -->
											</div>
										</div>
									</form>
								</div>


								<form name="frm">
									<input type="hidden" name="pageNo" />
									<!-- //페이지 번호 -->
									<input type="hidden" name="searchFiled"
										value="${pageVO.searchFiled }" />
									<!-- //검색조건 -->
									<input type="hidden" name="searchValue"
										value="${pageVO.searchValue }" />
									<!-- //검색어 -->

									<!-- 테이블시작 -->
									<div class="row">
										<div class="col-sm-12">
											<table id="datatables-example"
												class="table table-striped table-bordered dataTable no-footer"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="datatables-example_info"
												style="width: 100%; text-align: center;">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Name: activate to sort column descending"
															aria-sort="ascending"
															style="width: 110px; text-align: center;">번호</th>
														<th class="sorting" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 370px; text-align: center;">제목</th>
														<th class="sorting" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 277px; text-align: center;">날짜</th>
														<th class="sorting" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 116px; text-align: center;">작성자</th>
														<th class="sorting" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 220px; text-align: center;">첨부파일</th>
														<th class="sorting" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 176px; text-align: center;">게시판분류</th>
														<th class="sorting" tabindex="0"
															aria-controls="datatables-example" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 176px; text-align: center;">조회수</th>
													</tr>
												</thead>
												<!-- 테이블헤더 -->

												<c:choose>
													<c:when test="${not empty portalNoticeList}">
														<c:forEach var="portalNoticeList"
															items="${portalNoticeList }">
															<tbody>
																<tr role="row" class="odd">
																	<td>${portalNoticeList.board_num}</td>
																	<td><a
																		href="${pageContext.request.contextPath}/professor/helpDesk/portalProfDetail?board_num=${portalNoticeList.board_num}&board_count=${portalNoticeList.board_count}&pageNo=${pageVO.pageNo}">
																			${portalNoticeList.board_title} </a></td>
																	<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${portalNoticeList.board_date}" /></td>
																	<td>${portalNoticeList.board_writer}</td>
																	<td>${portalNoticeList.board_af}</td>
																	<td>${portalNoticeList.board_bc}</td>
																	<td>${portalNoticeList.board_count}</td>
																</tr>
															</tbody>
														</c:forEach>
											</table>
										</div>
									</div>
									<!-- 페이징처리 -->
									<div class="dataTables_paginate paging_simple_numbers"
										id="datatables-example_paginate" style="text-align: center;">
										<ul class="pagination">
											<li class="paginate_button previous disabled"
												id="datatables-example_previous"><c:if
													test="${pageVO.pageNo != 1}">
													<a href="javascript:fn_movePage(${pageVO.prevPageNo})"
														aria-controls="datatables-example" data-dt-idx="0"
														tabindex="0"> 이전페이지</a>
												</c:if></li>

											<c:if test="${pageVO.pageNo != 0}">

												<li class="paginate_button active"><c:if
														test="${pageVO.pageNo > pageVO.pageBlock}">
														<a href="javascript:fn_movePage(${pageVO.firstPageNo})"
															aria-controls="datatables-example" data-dt-idx="1"
															tabindex="0">[첫 페이지]</a>
													</c:if></li>



												<li class="paginate_button next disabled"
													id="datatables-example_next"><c:forEach var="i"
														begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}"
														step="1">
														<c:choose>
															<c:when test="${i eq pageVO.pageNo}">
																<a href="javascript:fn_movePage(${i})"
																	aria-controls="datatables-example" data-dt-idx="2"
																	tabindex="0">${i}</a>
															</c:when>
															<c:otherwise>
																<a href="javascript:fn_movePage(${i})"
																	aria-controls="datatables-example" data-dt-idx="2"
																	tabindex="0">${i}</a>
															</c:otherwise>
														</c:choose>
													</c:forEach></li>

												<li class="paginate_button next disabled"
													id="datatables-example_next"><c:if
														test="${pageVO.pageNo != pageVO.finalPageNo }">
														<a href="javascript:fn_movePage(${pageVO.nextPageNo})"
															aria-controls="datatables-example" data-dt-idx="2"
															tabindex="0">다음페이지</a>
													</c:if></li>

												<li class="paginate_button next disabled"
													id="datatables-example_next"><c:if
														test="${pageVO.endPageNo < pageVO.finalPageNo }">
														<a href="javascript:fn_movePage(${pageVO.finalPageNo})"
															aria-controls="datatables-example" data-dt-idx="2"
															tabindex="0">마지막페이지</a></li>
											</c:if>
											</c:if>

										</ul>
									</div>
								</form>
							</div>


							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
								</tr>
							</c:otherwise>


							</c:choose>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>




