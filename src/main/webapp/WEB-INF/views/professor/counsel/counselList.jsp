<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- Content -->
<div class="col-md-2">
	<a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담목록</a>
	<a href="${pageContext.request.contextPath}/professor/counsel/counselInsertPage">상담등록</a>
</div>
<div class="col-md-10">
	<div class="panel panel-default">
	<div class="panel-heading"><h1>상담 목록</h1></div>
	<div class="panel-body">
                      <div class="responsive-table">
			<div id="datatables-example_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap no-footer">
				<div class="row">
					<div class="col-sm-6">
						<div class="dataTables_length" id="datatables-example_length">
							<label>Show <select name="datatables-example_length"
								aria-controls="datatables-example" class="form-control input-sm"><option
										value="10">10</option>
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
						<br>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="datatables-example"
							class="table table-striped table-bordered dataTable no-footer"
							width="400px" cellspacing="0" role="grid"
							aria-describedby="datatables-example_info" style="width: 1000px;">
							<thead>
								<tr role="row">
									<th class="sorting" tabindex="0"
										aria-controls="datatables-example" rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending"
										style="width: 50px;">상담진행일자</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatables-example" rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 50px;">상담신청일자</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatables-example" rowspan="1" colspan="1"
										aria-label="Start date: activate to sort column ascending"
										style="width: 50px;">상담학생이름</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatables-example" rowspan="1" colspan="1"
										aria-label="Salary: activate to sort column ascending"
										style="width: 50px;">상담여부</th>
								</tr>
							</thead>
							<tbody>

								<tr role="row" class="odd">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>이보라</td>
									<td>미완료</td>
								</tr>
								<tr role="row" class="even">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>표혜진</td>
									<td>미완료</td>
								</tr>
								<tr role="row" class="odd">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>조영훈</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="even">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>배진</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="odd">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>배현상</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="even">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>이진영</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="odd">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>이보라</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="even">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>표혜진</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="odd">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>조영훈</td>
									<td>완료</td>
								</tr>
								<tr role="row" class="even">
									<td>2008/11/28</td>
									<td>2008/11/25</td>
									<td>배진</td>
									<td>완료</td>
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
									aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a></li>
								<li class="paginate_button active"><a href="#"
									aria-controls="datatables-example" data-dt-idx="1" tabindex="0">1</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="datatables-example" data-dt-idx="2" tabindex="0">2</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="datatables-example" data-dt-idx="3" tabindex="0">3</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="datatables-example" data-dt-idx="4" tabindex="0">4</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="datatables-example" data-dt-idx="5" tabindex="0">5</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="datatables-example" data-dt-idx="6" tabindex="0">6</a></li>
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


   