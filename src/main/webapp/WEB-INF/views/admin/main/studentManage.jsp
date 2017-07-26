<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
 
<!-- 템플릿 페이지 -->
<!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/adminManageCategory.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			학생목록
			</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >

			<!--  Counsel Right Side -->
 
                  <div class="panel">
                    <form name="frm">
                   						 <input type="hidden" name="searchFiled"	value="${pageVO.searchFiled }" />
											<!-- //검색조건 -->
											<input type="hidden" name="searchValue"	value="${pageVO.searchValue }" />
											<!-- //검색어 -->
                    
                    <div class="panel-body">
                      <div class="responsive-table">
                      <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                      <div class="row"><div class="col-sm-6">
                      		<div class="dataTables_length" id="datatables-example_length">
		                    </div>
		                       </div>
		                       
		                       <div class="col-sm-6">
		                       
				                       <div >
									        <select id="searchS" name="select">
									            <option value="stud_nm">이름</option>
									            <option value="stud_dept">학과</option>
									        </select>
						
						                       <input name="value" id="searchI" type="search" style="margin-bottom:7px;" class="form-control input-sm" aria-controls="datatables-example"> 
						                       <button value="SEARCH" id ="searchStud" style="margin-bottom:7px;" class="btn btn-primary" onclick="fn_search();">검색</button>
						                       <!-- 검색버튼  -->
						                       <!-- 추가버튼  -->
						                                 <button id ="addStid" style="margin-bottom:7px;" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/insertStudent'">학생추가하기</button>
				                       			    </div>
				               </div>
				               
				               
				              
		                       
		                       
		                       </div>
                       
                       </div>
                       <div class="row"><div class="col-sm-12">
                       
                       
                       <table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      <thead>
                      
                        <tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학번: activate to sort column descending" 
							aria-sort="ascending" style="width: 100px;">
							학번</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="이름: activate to sort column ascending" style="width: 150px;">
							이름</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학적상태: activate to sort column ascending" style="width: 100px;">
							학적상태
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학과: activate to sort column ascending" style="width: 130px;">
							학과
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학년: activate to sort column ascending" style="width: 80px;">
							학년
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="학기: activate to sort column ascending" style="width: 80px;">
							학기</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="성별: activate to sort column ascending" style="width: 100px;">
							성별</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="생년월일: activate to sort column ascending" style="width: 176px;">
							생년월일
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="휴대폰번호: activate to sort column ascending" style="width: 176px;">
							휴대폰번호
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="주민등록번호: activate to sort column ascending" style="width: 176px;">
							주민등록번호
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="우편번호: activate to sort column ascending" style="width: 100px;">
							우편번호
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="주소: activate to sort column ascending" style="width: 176px;">
							주소
							</th>
						</tr>
                      </thead>
                      
                      
                      <tbody>
                          <c:forEach var="student" items="${studentList}">
                        
                      <tr role="row" class="odd">
                          <td class="sorting_1">${student.stud_num }</td>
                          <td ><a href="${pageContext.request.contextPath}/admin/studentDetail?stud_num=${student.stud_num}">${student.stud_nm}</a></td>
                          <td >${student.stud_schreg_code }</td>
                          <td >${student.stud_dept }</td>
                          <td >${student.stud_grd }</td>
                          <td >${student.stud_qtr }</td>
                          
                          <c:choose>
								<c:when test="${student.stud_gen == '2'}">
										<td>여자</td>
								</c:when>
								<c:otherwise>
										<td>남자</td>
								</c:otherwise>
						 </c:choose>
						 
                          	<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${student.stud_bir}" /></td>
								<td>${student.stud_hp }</td>
								<td>${student.stud_regno}</td>
								<td>${student.stud_zip}</td>
								<td>${student.stud_addr}</td>
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
																			    </c:if>											</ul>
											</div>
									</div>
								</div>
								</div>
		                      </div>
		                  </div>
						</form>
 </div>
</div>

		</div>
	</div>
</div>







<style>
			button#addStud{
			} 
			 .table-bordered {
			border: 1px solid #dddddd;
			border-collapse: separate;
			border-left: 0;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
			}
			
			.table {
			width: 100%;
			margin-bottom: 20px;
			background-color: transparent;
			border-collapse: collapse;
			border-spacing: 0;
			display: table;
			}
			
			.widget.widget-table .table {
			margin-bottom: 0;
			border: none;
			}
			
			.widget.widget-table .widget-content {
			padding: 0;
			}
			
			.widget .widget-header + .widget-content {
			border-top: none;
			-webkit-border-top-left-radius: 0;
			-webkit-border-top-right-radius: 0;
			-moz-border-radius-topleft: 0;
			-moz-border-radius-topright: 0;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
			}
			
			.widget .widget-content {
			padding: 20px 15px 15px;
			background: #FFF;
			border: 1px solid #D5D5D5;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			border-radius: 5px;
			}
			
			.widget .widget-header {
			position: relative;
			height: 40px;
			line-height: 40px;
			background: #E9E9E9;
			background: -moz-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa), color-stop(100%, #e9e9e9));
			background: -webkit-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: -o-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: -ms-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			text-shadow: 0 1px 0 #fff;
			border-radius: 5px 5px 0 0;
			box-shadow: 0 2px 5px rgba(0,0,0,0.1),inset 0 1px 0 white,inset 0 -1px 0 rgba(255,255,255,0.7);
			border-bottom: 1px solid #bababa;
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
			-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
			border: 1px solid #D5D5D5;
			-webkit-border-top-left-radius: 4px;
			-webkit-border-top-right-radius: 4px;
			-moz-border-radius-topleft: 4px;
			-moz-border-radius-topright: 4px;
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
			-webkit-background-clip: padding-box;
			}
			
			thead {
			display: table-header-group;
			vertical-align: middle;
			border-color: inherit;
			}
			
			.widget .widget-header h3 {
			top: 2px;
			position: relative;
			left: 10px;
			display: inline-block;
			margin-right: 3em;
			font-size: 14px;
			font-weight: 600;
			color: #555;
			line-height: 18px;
			text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
			}
			
			.widget .widget-header [class^="icon-"], .widget .widget-header [class*=" icon-"] {
			display: inline-block;
			margin-left: 13px;
			margin-right: -2px;
			font-size: 16px;
			color: #555;
			vertical-align: middle;
			}
			 
			 
			.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover, .pagination>.disabled>span, .pagination>.disabled>span:focus, .pagination>.disabled>span:hover {
    		color: #777;
		    background-color: #fff;
		    border-color: #ddd;
}
			 </style>




<script>
//검색하기
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
