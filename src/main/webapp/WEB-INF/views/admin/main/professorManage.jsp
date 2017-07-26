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
</style>


 
 <!-- 페이지 이동 스크립트 -->
 <script type="text/javascript">
    function fn_movePage(val){
    	alert('누른 페이지 : '+val);
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

 <%@include file="../common/adminManageCategory.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
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
						                       		<option value="prfs_dept">학과</option>
						                       </select>
						                       
						                       <input type="search" id="searchI" name="searchValue" style="margin-bottom:7px;" class="form-control input-sm" placeholder="" aria-controls="datatables-example"> 
						                       <!-- 검색버튼  -->
						                       <button id ="searchProf" style="margin-bottom:7px;" class="btn btn-primary" onclick="fn_search();">검색</button>
						                       <!-- 추가버튼  -->
						                       
						                       <button id ="addProf" style="margin-bottom:7px;" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가하기</button>
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
								 <c:choose>
									 <c:when test="${pageVO.finalPageNo eq pageVO.pageNo}">
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('1')" class="font" style="text-decoration: none;">처음으로</a></li>
									 </c:when>
									 <c:otherwise>
<%-- 									 	<c:if test="${pageVO.pageNo ne 1}"> --%>
<%-- 									 		<li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.pageNo -4}')" class="font" style="text-decoration: none;">이전</a></li> --%>
<%-- 									 	</c:if> --%>

										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.pageNo }')" class="font" style="text-decoration: none;">${pageVO.pageNo }</a></li>
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.pageNo +1}')" class="font" style="text-decoration: none;">${pageVO.pageNo +1}</a></li>
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.pageNo +2}')"  class="font" style="text-decoration: none;">${pageVO.pageNo +2}</a></li>
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.pageNo +3}')" class="font" style="text-decoration: none;">${pageVO.pageNo +3}</a></li>
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.pageNo +4}')" class="font" style="text-decoration: none;">${pageVO.pageNo +4}</a></li>
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.nextPageNo }')" style="text-decoration: none;">다음</a></li>
										 <li class="paginate_button previous disabled"><a href="javascript:fn_movePage('${pageVO.finalPageNo }')" style="text-decoration: none;">마지막</a></li>
									 
									 
									 </c:otherwise>
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
 

 