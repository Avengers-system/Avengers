<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#professorTable,  #professorTable td{
		border : 2px solid black;
	}
	
	#datatables-example_paginate{
	 margin:0 auto;
	 text-align: center;
 
 }
</style>


<c:if test="${msg !=null}">
		<script>
		 alert('zz');
		</script>

</c:if> 
 
<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<!-- 테스트용 사이드 -->
<%@include file="../common/admin_side.jsp" %>   
</div>


<div class="col-md-10" id="commonRightSide">
 
	<div class="col-md-10 col-md-offset-1">
                  <div class="panel">
                    <div class="panel-heading"><h3>교수목록</h3></div>
                    <div class="panel-body">
                      <div class="responsive-table">
                      <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                      <div class="row"><div class="col-sm-6">
                      		<div class="dataTables_length" id="datatables-example_length">
			                      <label>Show 
				                      <select name="datatables-example_length" aria-controls="datatables-example" class="form-control input-sm">
					                      <option value="10">10</option>
					                      <option value="25">25</option>
					                      <option value="50">50</option>
					                      <option value="100">100</option>
				                      </select>
			                       		entries
			                      </label>
		                    </div>
		                       </div>
		                       
		                       <div class="col-sm-6">
		                       
				                       <div id="datatables-example_filter" class="dataTables_filter">
				                       
						                       <!-- 셀렉트 -->
						                       <select name="key">
						                       		<option value="choice">이름</option>
						                       		<option value="choice">학과</option>
						                       </select>
						                       
						                       
						                       <input type="search" style="margin-bottom:7px;" class="form-control input-sm" placeholder="" aria-controls="datatables-example"> 
						                       
						                       <!-- 검색버튼  -->
						                       <button id ="searchProf" style="margin-bottom:7px;" class="btn btn-primary" onclick="location.href='#'">검색</button>
						                       <!-- 추가버튼  -->
						                       
						                       <button id ="addProf" style="margin-bottom:7px;" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가하기</button>
				                       </div>
		                       </div>
                       
                       </div>
                       <div class="row"><div class="col-sm-12">
                       
                       
                       <table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      <thead>
                      
                        <tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="교수 번호: activate to sort column descending" 
							aria-sort="ascending" style="width: 208px;">
							교수 번호</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="이름: activate to sort column ascending" style="width: 150px;">
							이름</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="영문이름: activate to sort column ascending" style="width: 218px;">
							영문이름
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학과: activate to sort column ascending" style="width: 256px;">
							학과</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="생년월일: activate to sort column ascending" style="width: 201px;">
							생년월일</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="주민등록번호: activate to sort column ascending" style="width: 176px;">
							주민등록번호
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="성별: activate to sort column ascending" style="width: 176px;">
							성별
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="휴대폰번호: activate to sort column ascending" style="width: 176px;">
							휴대폰번호
							</th>
						</tr>
                      </thead>
                      
                      
                      <tbody>
                          <c:forEach var="professor" items="${professorList }">
                        
                      <tr role="row" class="odd">
                          <td class="sorting_1">${professor.prfs_num}</td>
                          <td ><a href="${pageContext.request.contextPath}/admin/professorDetail?prfs_num=${professor.prfs_num}">${professor.prfs_nm}</a></td>
                          <td >${professor.prfs_eng_nm}</td>
                          <td >${professor.prfs_dept}</td>
                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${professor.prfs_bir}" /></td>
                          <td >${professor.prfs_regno}</td>
                          <c:choose>
									<c:when test="${professor.prfs_gen == '2'}">
										<td>여자</td>
									</c:when>
									<c:otherwise>
										<td>남자</td>
									</c:otherwise>
								</c:choose>
								<td>${professor.prfs_hp}</td>
                     </tr>
					              </c:forEach>
                      </tbody>
                        </table>
						</div>
						</div>
						<div class="row">
							
							<div class="col-md-6 col-md-offset-3">
									<div class="dataTables_paginate paging_simple_numbers" id="datatables-example_paginate">
											<ul class="pagination">
												<li class="paginate_button previous disabled" id="datatables-example_previous"><a href="#" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a></li>
												<li class="paginate_button active"><a href="#" aria-controls="datatables-example" data-dt-idx="1" tabindex="0">1</a></li>
												<li class="paginate_button next disabled" id="datatables-example_next"><a href="#" aria-controls="datatables-example" data-dt-idx="2" tabindex="0">Next</a></li>
											</ul>
									</div>
							</div>
						
						</div>
						</div>
                      </div>
                  </div>
                </div>
              </div>
              
  
	<div class="col-md-8 col-md-offset-2">
    				
</div>
