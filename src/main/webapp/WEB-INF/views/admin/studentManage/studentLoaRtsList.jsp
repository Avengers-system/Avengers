<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--side Category-->
	<%@include file="../common/studentDetailSideCategory.jsp" %>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">복학/휴학신청 미처리 내역</h4>			
			<form action = "${pageContext.request.contextPath}/admin/studentLoaRtsList" method="post">			
					신청년도<select name="untreat_year" id="untreat_year">
						<option selected="selected">전체</option>				
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>			
						</c:choose>
					</select>
					<input type = "submit" value="검색">
					</form>
			<ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v1" role="tablist"
			style=" font-size: 15px;">
			<li role="presentation" class="active"><a
				href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab"
				data-toggle="tab" aria-expanded="true">휴학</a></li>
			<li role="presentation" class=""><a href="#tabs-demo4-area2"
				role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="true">복학</a>
			</li>
			</ul>		
				</div>
			<div class="panel-body">			
			<div class="responsive-table">
			<div id="tabsDemo4Content" class="tab-content tab-content-v3">

			<!-- 휴학 -->
			<div role="tabpanel" class="tab-pane fade active in"
				id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1"
				style="height: 290px;">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인</td>
					<td>반려</td>
					<td>휴학시작일</td>
					<td>휴학종료일</td>
					<td>복학예정일</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>휴학사유</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty untreatLoaList}">
						<c:forEach var="loa" items="${untreatLoaList}" varStatus="status">
							<tr>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateLoaList" method="post">
									<input type="hidden" name="loa_num" value="${loa.get('loa_num')}" />
									<input type="hidden" name="loa_appr_check" value="1" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인">
									</form>
								</td>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateLoaList" method="post">
									<input type="hidden" name="loa_num" value="${loa.get('loa_num')}" />
									<input type="hidden" name="loa_appr_check" value="2" />
									<input class="btn btn-outline btn-primary" type = "submit" value="반려">
									</form>
								</td>													
								<td>${loa.get("loa_start_date")}</td>
								<td>${loa.get("loa_end_date")}</td>
								<td>${loa.get("loa_rs_shcd_date")}</td>
								<td>${loa.get("stud_num")}</td>
								<td>${loa.get("stud_nm") }</td>
								<td>${loa.get("dept_nm") }</td>								
								<td>${loa.get("loa_cause") }</td>
								<td>${loa.get("loa_appl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
			<!-- 복학 -->
			<div role="tabpanel" class="tab-pane fade "
				id="tabs-demo4-area2" aria-labelledby="tabs-demo4-area2"
				style="height: 290px;">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인</td>
					<td>반려</td>
					<td>복학일</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>복학사유</td>
					<td>복학신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty untreatRtsList}">
						<c:forEach var="rts" items="${untreatRtsList}" varStatus="status">
							<tr>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateRtsList" method="post">
									<input type="hidden" name="rts_num" value="${rts.get('rts_num')}" />
									<input type="hidden" name="rts_appr_check" value="1" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인">
									</form>
								</td>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateRtsList" method="post">
									<input type="hidden" name="rts_num" value="${rts.get('rts_num')}" />
									<input type="hidden" name="rts_appr_check" value="2" />
									<input class="btn btn-outline btn-primary" type = "submit" value="반려">
									</form>
								</td>												
								<td>${rts.get("rts_date")}</td>
								<td>${rts.get("stud_num")}</td>
								<td>${rts.get("stud_nm")}</td>
								<td>${rts.get("dept_nm") }</td>
								<td>${rts.get("rts_cause") }</td>								
								<td>${rts.get("rts_appl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>
        </div>
        </div>


<div class="col-md-2">
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">복학/휴학신청 처리내역</h4>
			<form action = "${pageContext.request.contextPath}/admin/studentLoaRtsList" method="post">
			신청년도<select name="treat_year" id="treat_year">
						<option selected="selected" >전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 
					<input type = "submit" value="검색">
			</form>		
			<ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v1" role="tablist"
			style=" font-size: 15px;">
			<li role="presentation" class="active"><a
				href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab"
				data-toggle="tab" aria-expanded="true">휴학</a></li>
			<li role="presentation" class=""><a href="#tabs-demo4-area2"
				role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="true">복학</a>
			</li>
			</ul>		
				</div>
			<div class="panel-body">			
			<div class="responsive-table">
			<div id="tabsDemo4Content" class="tab-content tab-content-v3">

			<!-- 휴학 -->
			<div role="tabpanel" class="tab-pane fade active in"
				id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1"
				style="height: 290px;">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인취소</td>
					<td>휴학시작일</td>
					<td>휴학종료일</td>
					<td>복학예정일</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>휴학사유</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty treatLoaList}">
						<c:forEach var="loa" items="${treatLoaList}" varStatus="status">
							<tr>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateLoaList" method="post">
									<input type="hidden" name="loa_num" value="${loa.get('loa_num')}" />
									<input type="hidden" name="loa_appr_check" value="3" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인취소">
									</form>
								</td>											
								<td>${loa.get("loa_start_date")}</td>
								<td>${loa.get("loa_end_date")}</td>
								<td>${loa.get("loa_rs_shcd_date")}</td>
								<td>${loa.get("stud_num")}</td>
								<td>${loa.get("stud_nm") }</td>
								<td>${loa.get("dept_nm") }</td>								
								<td>${loa.get("loa_cause") }</td>
								<td>${loa.get("loa_appl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
			<!-- 복학 -->
			<div role="tabpanel" class="tab-pane fade "
				id="tabs-demo4-area2" aria-labelledby="tabs-demo4-area2"
				style="height: 290px;">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인취소</td>
					<td>복학일</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>복학사유</td>
					<td>복학신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty treatRtsList}">
						<c:forEach var="rts" items="${treatRtsList}" varStatus="status">
							<tr>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateRtsList" method="post">
									<input type="hidden" name="rts_num" value="${rts.get('rts_num')}" />
									<input type="hidden" name="rts_appr_check" value="3" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인취소">
									</form>
								</td>											
								<td>${rts.get("rts_date")}</td>
								<td>${rts.get("stud_num")}</td>
								<td>${rts.get("stud_nm")}</td>
								<td>${rts.get("dept_nm") }</td>
								<td>${rts.get("rts_cause") }</td>								
								<td>${rts.get("rts_appl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>
        </div>
        </div>
<div class="col-md-2">
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">복학/휴학신청 반려내역</h4>
			<form action = "${pageContext.request.contextPath}/admin/studentLoaRtsList" method="post">
			신청년도<select name="cancel_year" id="cancel_year">
						<option selected="selected" >전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 
					<input type = "submit" value="검색">
			</form>		
			<ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v1" role="tablist"
			style=" font-size: 15px;">
			<li role="presentation" class="active"><a
				href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab"
				data-toggle="tab" aria-expanded="true">휴학</a></li>
			<li role="presentation" class=""><a href="#tabs-demo4-area2"
				role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="true">복학</a>
			</li>
			</ul>		
				</div>
			<div class="panel-body">			
			<div class="responsive-table">
			<div id="tabsDemo4Content" class="tab-content tab-content-v3">

			<!-- 휴학 -->
			<div role="tabpanel" class="tab-pane fade active in"
				id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1"
				style="height: 290px;">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인취소</td>
					<td>휴학시작일</td>
					<td>휴학종료일</td>
					<td>복학예정일</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>휴학사유</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty cancelLoaList}">
						<c:forEach var="loa" items="${cancelLoaList}" varStatus="status">
							<tr>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateLoaList" method="post">
									<input type="hidden" name="loa_num" value="${loa.get('loa_num')}" />
									<input type="hidden" name="loa_appr_check" value="3" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인취소">
									</form>
								</td>												
								<td>${loa.get("loa_start_date")}</td>
								<td>${loa.get("loa_end_date")}</td>
								<td>${loa.get("loa_rs_shcd_date")}</td>
								<td>${loa.get("stud_num")}</td>
								<td>${loa.get("stud_nm") }</td>
								<td>${loa.get("dept_nm") }</td>								
								<td>${loa.get("loa_cause") }</td>
								<td>${loa.get("loa_appl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
			<!-- 복학 -->
			<div role="tabpanel" class="tab-pane fade "
				id="tabs-demo4-area2" aria-labelledby="tabs-demo4-area2"
				style="height: 290px;">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>반려취소</td>
					<td>복학일</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>복학사유</td>
					<td>복학신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty cancelRtsList}">
						<c:forEach var="rts" items="${cancelRtsList}" varStatus="status">
							<tr>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateRtsList" method="post">
									<input type="hidden" name="rts_num" value="${rts.get('rts_num')}" />
									<input type="hidden" name="rts_appr_check" value="3" />
									<input class="btn btn-outline btn-primary" type = "submit" value="반려취소">
									</form>
								</td>												
								<td>${rts.get("rts_date")}</td>
								<td>${rts.get("stud_num")}</td>
								<td>${rts.get("stud_nm")}</td>
								<td>${rts.get("dept_nm") }</td>
								<td>${rts.get("rts_cause") }</td>								
								<td>${rts.get("rts_appl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>
        </div>
        </div>