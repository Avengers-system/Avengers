<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 템플릿 페이지 -->
<style>
	#professorTable,  #professorTable td{
		border : 2px solid black;
	}
	
	#datatables-example_paginate{
	 margin:0 auto;
	 text-align: center;
 
 }
 
 
button #searchProf, button #addProf{

background-color:#CC0000; 
}

 
</style>


 
 <!-- 페이지 이동 스크립트 -->
 <script type="text/javascript">
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

<!--  Counsel Right Side -->
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			교수목록
			</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >

			<div class="panel">
                    <div class="panel-body">
                      <div class="responsive-table">
                      <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                      <div class="row"><div class="col-sm-6">
                      		<div class="dataTables_length" id="datatables-example_length">
		                    </div>
		                       </div>
		                       
		                       <div class="col-sm-6">
		                       
				                       <div id="datatables-example_filter" class="dataTables_filter">
						                       <!-- 셀렉트 -->
						                       <select id="searchS" name="key">
						                       		<option value="prfs_nm">이름</option>
						                       		<option value="dept_nm">학과</option>
						                       </select>
						                       
						                       <input type="search" id="searchI" name="searchValue" style="margin-bottom:7px;" class="form-control input-sm " placeholder="" aria-controls="datatables-example"> 
						                       <!-- 검색버튼  -->
						                       <button id ="searchProf" style="background-color:#CC0000;  margin-bottom:7px;" class="btn btn-danger" onclick="fn_search();">검색</button>
						                       <!-- 추가버튼  -->
						                       
						                       <button id ="addProf" style="margin-bottom:7px;" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가</button>
				                       </div>
		                       </div>
                       
                       </div>
                       <div class="row"><div class="col-sm-12">
                       
                      
                      
                       <form name="frm">
							<input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
							<input type="hidden" name="searchFiled"	value="${pageVO.searchFiled }" />	<!-- //검색조건 -->
							<input type="hidden" name="searchValue"	value="${pageVO.searchValue }" />	<!-- //검색어 -->
					   </form>
                       
                       
                       <table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      	<thead>
                      
	                        <tr role="row">
	                        	<!-- 활성화여부 컬럼 -->
	                        	<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="교수 번호: activate to sort column descending" 
								aria-sort="ascending" style="width: 90px;">재직여부</th>
								<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="교수 번호: activate to sort column descending" 
								aria-sort="ascending" style="width: 208px;">교수 번호</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="이름: activate to sort column ascending" style="width: 150px;">이름</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="영문이름: activate to sort column ascending" style="width: 218px;">영문이름
								</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학과: activate to sort column ascending" style="width: 190px;">학과</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="생년월일: activate to sort column ascending" style="width: 201px;">생년월일</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="주민등록번호: activate to sort column ascending" style="width: 176px;">주민등록번호
								</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="성별: activate to sort column ascending" style="width: 176px;">성별
								</th>
								<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="휴대폰번호: activate to sort column ascending" style="width: 176px;">휴대폰번호
								</th>
							</tr>
                      	</thead>
                      
                      
                      <tbody>
                      <c:forEach items="${professorList }" var="professor" >
                        
		                      <tr role="row" class="odd">
		                          <c:choose>
		                        	  <c:when test="${professor.enabled eq '1'}">
		                          		<td>Y</td>
		                          	  </c:when>
		                          	  <c:otherwise>
		                        	  	<td>N</td>
		                          	  </c:otherwise>
		                          </c:choose>
		                          <td class="sorting_1">${professor.prfs_num}</td>
		                          <td ><a href="${pageContext.request.contextPath}/admin/professorDetail?prfs_num=${professor.prfs_num}&pageNo=${pageVO.pageNo}">${professor.prfs_nm}</a></td>
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
													<c:choose>
															<c:when test="${pageVO.pageNo != 0}">
															        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
															            <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">처음으로</a></li>
															       	</c:if>
																	<c:if test="${pageVO.pageNo != 1}">
																	    <li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;"> < </a></li>
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
																			             <li class="paginate_button previous disabled"><li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;"> > </a></li>
																	</c:if>
																	<c:if test="${pageVO.endPageNo lt pageVO.finalPageNo }">
																	 		<li class="paginate_button previous disabled"><a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">마지막</a></li>
																	</c:if>
															</c:when>
												</c:choose>									
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
	</div>
</div>
 
<style>
 .btn-danger, .alert-danger, .badge-danger {
    color: #fff !important;
    border: none !important;
    background-color: #CC0000 !important;
  }
</style>

 
