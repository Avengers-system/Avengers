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
    <div id="search">
        <select id="searchS">
            <option value="BOARD_NUM">BOARD_NUM</option>
            <option value="BOARD_WRITER">BOARD_WRITER</option>
        </select>
        <input type="text" id="searchI">
        <input type="button" value="SEARCH" onclick="fn_search();">
    </div>
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
    	  <div class="row">
			<div class="col-sm-5">
				<div class="dataTables_info" id="datatables-example_info" role="status" aria-live="polite">Showing 1 to 10 of 57
					entries</div>
			</div>
			<div class="col-sm-7">
				<div class="dataTables_paginate paging_simple_numbers" id="datatables-example_paginate">
					<ul class="pagination">
					<li class="paginate_button "><a href="#" >3</a></li>
				    <c:if test="${pageVO.pageNo != 0}">
				        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
				           <li class="paginate_button "> <a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">[첫 페이지]</a></li>
				       </c:if>
				       <c:if test="${pageVO.pageNo != 1}">
				           <li class="paginate_button ">  <a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;">[이전]</a></li>
				        </c:if>
				            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
				                <c:choose>
				                    <c:when test="${i eq pageVO.pageNo}">
				                       <li class="paginate_button "><a href="javascript:fn_movePage(${i})"  style="text-decoration: none;">${i}</a></li>
				                        11111111
				                    </c:when>
				                    <c:otherwise>
				                    2222222
				                        <li class="paginate_button "><a href="javascript:fn_movePage(${i})" aria-controls="datatables-example" style="text-decoration: none;">${i}</a></li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
				            <li class="paginate_button "><a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;">[다음]</a></li>
				        </c:if>
				        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
				            <li class="paginate_button "><a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">[마지막 페이지]</a></li>
				        </c:if>
				    </c:if>
				    </ul>
				   </div>
			</div>
    <div class="row">
			<div class="col-sm-5">
				<div class="dataTables_info" id="datatables-example_info" role="status" aria-live="polite">Showing 1 to 10 of 57
					entries</div>
			</div>
			<div class="col-sm-7">
				<div class="dataTables_paginate paging_simple_numbers" id="datatables-example_paginate">
					<ul class="pagination">
						<li class="paginate_button previous disabled" id="datatables-example_previous"><a href="#" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a></li>
						<li class="paginate_button active"><a href="#" aria-controls="datatables-example" data-dt-idx="1" tabindex="0">1</a></li>
						<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="2" tabindex="0">2</a></li>
						<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="3" tabindex="0">3</a></li>
						<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="4" tabindex="0">4</a></li>
						<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="5" tabindex="0">5</a></li>
						<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="6" tabindex="0">6</a></li>
						<li class="paginate_button next" id="datatables-example_next"><a href="#" aria-controls="datatables-example" data-dt-idx="7" tabindex="0">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
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

	1111111111111111111111111111


	<div class="col-md-12">
		<div class="panel">
			<div class="panel-heading">
				<h3>Data Tables</h3>
			</div>
			<div class="panel-body">
				<div class="responsive-table">
					<div id="datatables-example_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row">
							<div class="col-sm-6">
								<div class="dataTables_length" id="datatables-example_length">
									<label>Show <select name="datatables-example_length"
										aria-controls="datatables-example"
										class="form-control input-sm"><option value="10">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option></select> entries
									</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div id="datatables-example_filter" class="dataTables_filter">
									<label>Search:<input type="search"
										class="form-control input-sm" placeholder=""
										aria-controls="datatables-example"></label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="datatables-example"
									class="table table-striped table-bordered dataTable no-footer"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="datatables-example_info" style="width: 100%;">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0"
												aria-controls="datatables-example" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 278px;">Name</th>
											<th class="sorting" tabindex="0"
												aria-controls="datatables-example" rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 421px;">Position</th>
											<th class="sorting" tabindex="0"
												aria-controls="datatables-example" rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 218px;">Office</th>
											<th class="sorting" tabindex="0"
												aria-controls="datatables-example" rowspan="1" colspan="1"
												aria-label="Age: activate to sort column ascending"
												style="width: 116px;">Age</th>
											<th class="sorting" tabindex="0"
												aria-controls="datatables-example" rowspan="1" colspan="1"
												aria-label="Start date: activate to sort column ascending"
												style="width: 201px;">Start date</th>
											<th class="sorting" tabindex="0"
												aria-controls="datatables-example" rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 176px;">Salary</th>
										</tr>
									</thead>
									<tbody>

										<tr role="row" class="odd">
											<td class="sorting_1">Airi Satou</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>33</td>
											<td>2008/11/28</td>
											<td>$162,700</td>
										</tr>
										<tr role="row" class="even">
											<td class="sorting_1">Angelica Ramos</td>
											<td>Chief Executive Officer (CEO)</td>
											<td>London</td>
											<td>47</td>
											<td>2009/10/09</td>
											<td>$1,200,000</td>
										</tr>
										<tr role="row" class="odd">
											<td class="sorting_1">Ashton Cox</td>
											<td>Junior Technical Author</td>
											<td>San Francisco</td>
											<td>66</td>
											<td>2009/01/12</td>
											<td>$86,000</td>
										</tr>
										<tr role="row" class="even">
											<td class="sorting_1">Bradley Greer</td>
											<td>Software Engineer</td>
											<td>London</td>
											<td>41</td>
											<td>2012/10/13</td>
											<td>$132,000</td>
										</tr>
										<tr role="row" class="odd">
											<td class="sorting_1">Brenden Wagner</td>
											<td>Software Engineer</td>
											<td>San Francisco</td>
											<td>28</td>
											<td>2011/06/07</td>
											<td>$206,850</td>
										</tr>
										<tr role="row" class="even">
											<td class="sorting_1">Brielle Williamson</td>
											<td>Integration Specialist</td>
											<td>New York</td>
											<td>61</td>
											<td>2012/12/02</td>
											<td>$372,000</td>
										</tr>
										<tr role="row" class="odd">
											<td class="sorting_1">Bruno Nash</td>
											<td>Software Engineer</td>
											<td>London</td>
											<td>38</td>
											<td>2011/05/03</td>
											<td>$163,500</td>
										</tr>
										<tr role="row" class="even">
											<td class="sorting_1">Caesar Vance</td>
											<td>Pre-Sales Support</td>
											<td>New York</td>
											<td>21</td>
											<td>2011/12/12</td>
											<td>$106,450</td>
										</tr>
										<tr role="row" class="odd">
											<td class="sorting_1">Cara Stevens</td>
											<td>Sales Assistant</td>
											<td>New York</td>
											<td>46</td>
											<td>2011/12/06</td>
											<td>$145,600</td>
										</tr>
										<tr role="row" class="even">
											<td class="sorting_1">Cedric Kelly</td>
											<td>Senior Javascript Developer</td>
											<td>Edinburgh</td>
											<td>22</td>
											<td>2012/03/29</td>
											<td>$433,060</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="datatables-example_info"
									role="status" aria-live="polite">Showing 1 to 10 of 57
									entries</div>
							</div>
							<div class="col-sm-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="datatables-example_paginate">
									<ul class="pagination">
										<li class="paginate_button previous disabled"
											id="datatables-example_previous"><a href="#"
											aria-controls="datatables-example" data-dt-idx="0"
											tabindex="0">Previous</a></li>
										<li class="paginate_button active"><a href="#"
											aria-controls="datatables-example" data-dt-idx="1"
											tabindex="0">1</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="datatables-example" data-dt-idx="2"
											tabindex="0">2</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="datatables-example" data-dt-idx="3"
											tabindex="0">3</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="datatables-example" data-dt-idx="4"
											tabindex="0">4</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="datatables-example" data-dt-idx="5"
											tabindex="0">5</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="datatables-example" data-dt-idx="6"
											tabindex="0">6</a></li>
										<li class="paginate_button next" id="datatables-example_next"><a
											href="#" aria-controls="datatables-example" data-dt-idx="7"
											tabindex="0">Next</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	22222222222222222222222222

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

