<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <!-- 테스트용 사이드 -->
<%@include file="../common/admin_side.jsp" %>   
</div>
<div class="col-md-10" id="commonRightSide">
 
 
헬프데스크메인<br><hr color="orange">
<button onclick="location.href='<%=request.getContextPath()%>/admin/univNoticeList'">학교공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/deptNoticeList'">학과공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/collegeNoticeList'">학사일정</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/portalNoticeList'">포털소식</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/faqNoticeList'">FAQ</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/qnaNoticeList'">Q&A</button>

<br/>

 <a href="${pageContext.request.contextPath}/admin/deptNoticeList">학과게시판</a>
<div>
<c:choose>
      <c:when test="${not empty deptNoticeList}">      
      <c:forEach var="deptNoticeList" items="${deptNoticeList }" >
         <tr>
             <td>번호:${deptNoticeList.board_num}</td>
             <td><a href="<%=request.getContextPath()%>/admin/deptNoticeList">제목:${deptNoticeList.board_title}</a></td>
              <td>작성일:${deptNoticeList.board_date}</td>
             <td>작성자:${deptNoticeList.board_writer}</td><br>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
</c:choose>

</div>
		<div class="col-md-12">
		
					<h2>헬프데스크메인</h2>
		
		</div>


		<div id="exTab2" class="">	
				<ul class="nav nav-tabs">
					<li class="active">
		        	<a  href="#1" data-toggle="tab">학과게시판</a>
					</li>
					<li><a href="#2" data-toggle="tab">포털게시판</a>
					</li>
					<li><a href="#3" data-toggle="tab">학부게시판</a>
					</li>
					<li><a href="#4" data-toggle="tab">학교게시판</a>
					</li>
					<li><a href="#5" data-toggle="tab">FAQ</a>
					</li>
					<li><a href="#6" data-toggle="tab">Q&A</a>
					</li>
				</ul>






		<!-- 각 게시판 탭 별 테이블 -->

			
			<div class="tab-content ">
			  
			  
			  
			  
			  
			  
			  <!-- 1. 학과게시판 탭 -->
			  
			  
			  
			  	
			  	<div class="tab-pane active" id="1">
          			
                   <h3>학과게시판</h3>
                      <div class="responsive-table">
                      <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                       <div class="row">
                       	<div class="col-sm-12">
                       		<table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      <thead>
                        <tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="번호: activate to sort column descending" 
							aria-sort="ascending" style="width: 100px;">
							번호</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="제목: activate to sort column ascending" style="width: 150px;">
							제목</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성일: activate to sort column ascending" style="width: 100px;">
							작성일
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성자: activate to sort column ascending" style="width: 218px;">
							작성자
							</th>
						</tr>
                      </thead>
                      
                      <tbody>
                      <c:choose>
						      <c:when test="${not empty deptNoticeList}">   
			                          <c:forEach var="deptNoticeList" items="${deptNoticeList }" >
			                        
						                      <tr role="row" class="odd">
						                          <td class="sorting_1">${deptNoticeList.board_num}</td>
						                          <td ><a href="<%=request.getContextPath()%>/admin/deptNoticeList">${deptNoticeList.board_title}</a></td>
						                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${deptNoticeList.board_date}" /></td>
						                          <td >${deptNoticeList.board_writer}</td>
						                          	 
						                     </tr>
									</c:forEach>
							</c:when>
							<c:otherwise>
								            <tr role="row" class="odd">
								               <td colspan="2" style="text-align:center;">
								                  	해당 내용이 없습니다.
								               </td>
								            </tr>
						         </c:otherwise>
							</c:choose>
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
				
				
				
				
				
				
				
				
				<!-- 2. 포털게시판 탭 -->
				
				<div class="tab-pane" id="2">
          			<h3>포털게시판</h3>
          			<div class="responsive-table">
                      <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                       <div class="row">
                       	<div class="col-sm-12">
                       		<table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      <thead>
                        <tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="번호: activate to sort column descending" 
							aria-sort="ascending" style="width: 100px;">
							번호</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="제목: activate to sort column ascending" style="width: 150px;">
							제목</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성일: activate to sort column ascending" style="width: 100px;">
							작성일
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성자: activate to sort column ascending" style="width: 218px;">
							작성자
							</th>
						</tr>
                      </thead>
                      
                      <tbody>
                      <c:choose>
						      <c:when test="${not empty portalNoticeList}">    
			                          <c:forEach var="portalNoticeList" items="${portalNoticeList }" >
			                        
						                      <tr role="row" class="odd">
						                          <td class="sorting_1">${portalNoticeList.board_num}</td>
						                          <td ><a href="<%=request.getContextPath()%>/admin/portalNoticeList">${portalNoticeList.board_title}</a></td>
						                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${portalNoticeList.board_date}" /></td>
						                          <td >${portalNoticeList.board_writer}</td>
						                          	 
						                     </tr>
									</c:forEach>
							</c:when>
							<c:otherwise>
								            <tr role="row" class="odd">
								               <td colspan="2" style="text-align:center;">
								                  	해당 내용이 없습니다.
								               </td>
								            </tr>
						         </c:otherwise>
							</c:choose>
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
<a href="${pageContext.request.contextPath}/admin/portalNoticeList">포털게시판</a>
<div>
<c:choose>
      <c:when test="${not empty portalNoticeList}">      
      <c:forEach var="portalNoticeList" items="${portalNoticeList }" >
         <tr>
            <td>번호:${portalNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/admin/portalNoticeList">제목:${portalNoticeList.board_title}</a></td>
            <td>작성일:${portalNoticeList.board_date}</td>
            <td>작성자:${portalNoticeList.board_writer}</td><br>          
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="4" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
        
</c:choose>

</div>
<a href="${pageContext.request.contextPath}/admin/collegeNoticeList">학부게시판</a>
<div>
<c:choose>
      <c:when test="${not empty collegeNoticeList}">      
      <c:forEach var="collegeNoticeList" items="${collegeNoticeList }" >
         <tr>
            <td>번호:${collegeNoticeList.board_num}</td>
             <td><a href="<%=request.getContextPath()%>/admin/collegeNoticeList">제목:${collegeNoticeList.board_title}</a></td>
            <td>내용:${collegeNoticeList.board_cont}</td>
            <td>작성일:${collegeNoticeList.board_date}</td>
            <td>작성자:${collegeNoticeList.board_writer}</td><br>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
</c:choose>

>>>>>>> refs/heads/piopio
</div>

<<<<<<< HEAD
=======

<a href="${pageContext.request.contextPath}/admin/univNoticeList">학교게시판</a>
<div>
<c:choose>
      <c:when test="${not empty univNoticeList}">      
      <c:forEach var="univNoticeList" items="${univNoticeList }" >
         <tr>
            <td>번호:${univNoticeList.board_num}</td>
           <td><a href="<%=request.getContextPath()%>/admin/univNoticeList">제목:${univNoticeList.board_title}</a></td>
            <td>내용:${univNoticeList.board_cont}</td>
            <td>작성일:${univNoticeList.board_date}</td>
            <td>작성자:${univNoticeList.board_writer}</td><br>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        	<!-- 3. 학부게시판 탭 -->
        
        			
        		<div class="tab-pane" id="3">
          			<h3>학부게시판</h3>
						<div class="responsive-table">
                      	<div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                       <div class="row">
                       	<div class="col-sm-12">
                       		<table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      <thead>
                        <tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="번호: activate to sort column descending" 
							aria-sort="ascending" style="width: 100px;">
							번호</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="제목: activate to sort column ascending" style="width: 150px;">
							제목</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성일: activate to sort column ascending" style="width: 100px;">
							작성일
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성자: activate to sort column ascending" style="width: 218px;">
							작성자
							</th>
						</tr>
                      </thead>
                      
                      <tbody>
                      <c:choose>
						      <c:when test="${not empty collegeNoticeList}">     
			                          <c:forEach var="collegeNoticeList" items="${collegeNoticeList }" >
			                        
						                      <tr role="row" class="odd">
						                          <td class="sorting_1">${collegeNoticeList.board_num}</td>
						                          <td ><a href="<%=request.getContextPath()%>/admin/collegeNoticeList">${collegeNoticeList.board_title}</a></td>
						                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${collegeNoticeList.board_date}" /></td>
						                          <td >${collegeNoticeList.board_writer}</td>
						                          	 
						                     </tr>
									</c:forEach>
							</c:when>
							<c:otherwise>
								            <tr role="row" class="odd">
								               <td colspan="2" style="text-align:center;">
								                  	해당 내용이 없습니다.
								               </td>
								            </tr>
						         </c:otherwise>
							</c:choose>
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




			<!-- 4. 학교게시판 탭 -->




        		<div class="tab-pane" id="4">
          			<h3>학교게시판</h3>
	          			<div class="responsive-table">
			                      	<div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			                       <div class="row">
			                       	<div class="col-sm-12">
			                       		<table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
			                      <thead>
			                        <tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="번호: activate to sort column descending" 
										aria-sort="ascending" style="width: 100px;">
										번호</th>
										<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="제목: activate to sort column ascending" style="width: 150px;">
										제목</th>
										<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성일: activate to sort column ascending" style="width: 100px;">
										작성일
										</th>
										<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성자: activate to sort column ascending" style="width: 218px;">
										작성자
										</th>
									</tr>
			                      </thead>
			                      
			                      <tbody>
			                      <c:choose>
									      	<c:when test="${not empty schoolNoticeList}">     
						                          <c:forEach var="schoolNoticeList" items="${schoolNoticeList }" >
						                        
									                      <tr role="row" class="odd">
									                          <td class="sorting_1">${schoolNoticeList.board_num}</td>
									                          <td ><a href="<%=request.getContextPath()%>/admin/schoolNoticeList">${schoolNoticeList.board_title}</a></td>
									                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${schoolNoticeList.board_date}" /></td>
									                          <td >${schoolNoticeList.board_writer}</td>
									                     </tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
											            <tr role="row" class="odd">
											               <td colspan="2" style="text-align:center;">
											                  	해당 내용이 없습니다.
											               </td>
											            </tr>
									         </c:otherwise>
										</c:choose>
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





				<!-- 5. FAQ 탭 -->

        		<div class="tab-pane" id="5">
          			<h3>FAQ 내용여기</h3>
          			
          			<div class="responsive-table">
                      	<div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                       <div class="row">
                       	<div class="col-sm-12">
                       		<table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
                      <thead>
                        <tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="번호: activate to sort column descending" 
							aria-sort="ascending" style="width: 100px;">
							번호</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="제목: activate to sort column ascending" style="width: 150px;">
							제목</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성일: activate to sort column ascending" style="width: 100px;">
							작성일
							</th>
							<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성자: activate to sort column ascending" style="width: 218px;">
							작성자
							</th>
						</tr>
                      </thead>
                      
                      <tbody>
                      <c:choose>
						      <c:when test="${not empty faqNoticeList}">   
			                          <c:forEach var="faqNoticeList" items="${faqNoticeList }" >
			                        
						                      <tr role="row" class="odd">
						                          <td class="sorting_1">${faqNoticeList.board_num}</td>
						                          <td ><a href="<%=request.getContextPath()%>/admin/faqNoticeList">제목:${faqNoticeList.board_title}</a></td>
						                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${faqNoticeList.board_date}" /></td>
						                          <td >${faqNoticeList.board_writer}</td>
						                          	 
						                     </tr>
									</c:forEach>
							</c:when>
							<c:otherwise>
								            <tr role="row" class="odd">
								               <td colspan="2" style="text-align:center;">
								                  	해당 내용이 없습니다.
								               </td>
								            </tr>
						         </c:otherwise>
							</c:choose>
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
				
				
				
				
				
				<!-- 6. Q&A 탭 -->
				
				
				
        		<div class="tab-pane" id="6">
          			<h3>Q&A</h3>
          			
		          			<div class="responsive-table">
		                      	<div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
		                       <div class="row">
		                       	<div class="col-sm-12">
		                       		<table id="datatables-example" class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0" role="grid" aria-describedby="datatables-example_info" style="width: 100%;">
		                      <thead>
		                        <tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="번호: activate to sort column descending" 
									aria-sort="ascending" style="width: 100px;">
									번호</th>
									<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="제목: activate to sort column ascending" style="width: 150px;">
									제목</th>
									<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성일: activate to sort column ascending" style="width: 100px;">
									작성일
									</th>
									<th class="sorting" tabindex="0" aria-controls="datatables-example" rowspan="1" colspan="1" aria-label="작성자: activate to sort column ascending" style="width: 218px;">
									작성자
									</th>
								</tr>
		                      </thead>
		                      
		                      <tbody>
		                      <c:choose>
								      <c:when test="${not empty qnaNoticeList}">   
					                          <c:forEach var="qnaNoticeList" items="${qnaNoticeList }" >
								                      <tr role="row" class="odd">
								                          <td class="sorting_1">${qnaNoticeList.board_num}</td>
								                          <td ><a href="<%=request.getContextPath()%>/admin/qnaNoticeList">${qnaNoticeList.board_title}</a></td>
								                          <td ><fmt:formatDate pattern = "yyyy-MM-dd" value = "${qnaNoticeList.board_date}" /></td>
								                          <td >${qnaNoticeList.board_writer}</td>
								                          	 
								                     </tr>
											</c:forEach>
									</c:when>
									<c:otherwise>
										            <tr role="row" class="odd">
										               <td colspan="2" style="text-align:center;">
										                  	해당 내용이 없습니다.
										               </td>
										            </tr>
								         </c:otherwise>
									</c:choose>
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

			<br><hr color="orange">
			<button onclick="location.href='${pageContext.request.contextPath}/admin/deptNoticeList'">학과게시판</button>
			<button onclick="location.href='${pageContext.request.contextPath}/admin/portalNoticeList'">포털게시판</button>
			<button onclick="location.href='${pageContext.request.contextPath}/admin/collegeNoticeList'">학부게시판</button>
			<button onclick="location.href='${pageContext.request.contextPath}/admin/univNoticeList'">학교게시판</button>
			<button onclick="location.href='${pageContext.request.contextPath}/admin/faqNoticeList'">FAQ</button>
			<button onclick="location.href='${pageContext.request.contextPath}/admin/qnaNoticeList'">Q&A</button>

</div>
         
</c:choose>

</div>


>>>>>>> refs/heads/piopio
