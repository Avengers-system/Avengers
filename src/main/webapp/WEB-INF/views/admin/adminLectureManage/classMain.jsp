<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function find(){
		alert(findForm.find_key.value);
		alert(findForm.find_value.value);
		
	}
</script>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #CC0000; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				강의목록</h4>
		</div>
		<div class="panel-body">
			<div style="float:right">
				<form name="findForm">
					<select style="padding:7px" name="find_key">
						<option value="lct_yr">년도</option>
						<option value="lct_qtr">학기</option>
						<option value="lct_nm">강의명</option>
						<option value="sjt_cd">이수구분</option>
					</select>
					<input style="padding:6px;height:33px;padding-bottom:1px" type="text" name="find_value" value=""/>
					<input style="height:33px;padding-top:6px; margin-top:-7px" type="button" onclick="find();" value="검색" class="btn btn-outline btn-primary"/>
				</form>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>년도</th>
						<th>학기</th>
						<th>강의명</th>
						<th>이수구분</th>
						<th>개설학년</th>
						<th>학점</th>
						<th>교수명</th>
						<th>개설학과</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lctList }" var="lct" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${lct.get('lct_yr') }</td>
							<td>${lct.get('lct_qtr') }</td>
							<td>${lct.get('lct_nm') }</td>
							<td>${lct.get('sjt_cd') }</td>
							<td>${lct.get('sjt_estm_grd') }</td>
							<td>${lct.get('sjt_crd') }</td>
							<td>${lct.get('prfs_nm') }</td>
							<td>${lct.get('sjt_dept') }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

