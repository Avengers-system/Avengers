<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function score_check(){
		var regNumber = /^[0-9]*$/;
		
		if(!regNumber.test(StudentAsgnDetail.sub_sjt_point.value)){
			alert("점수를 제대로 입력해주세요");
		} else {
			location.href="${pageContext.request.contextPath}/professor/classManage/updateSubSjtPoint?sub_num="+StudentAsgnDetail.sub_num.value+"&sub_sjt_point="+StudentAsgnDetail.sub_sjt_point.value+"&asgn_num="+StudentAsgnDetail.asgn_num.value;
		}
	}
</script>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">학생과제 상세페이지</h4>
		</div>
		<div class="panel-body">
			<form name="StudentAsgnDetail" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryAsgn" enctype="multipart/form-data">
				<input type="text" hidden="true" name="asgn_num" value="${subDetail.get('asgn_num') }"/>
				<input type="text" hidden="true" name="sub_num" value="${subDetail.get('sub_num') }"/>
				<div class="form-group">
					<label class="control-label col-sm-1" for="col_nm">단과대학:</label>
					<div class="col-sm-2">
						<input type="text" readonly class="form-control" name="col_nm" value="${subDetail.get('col_nm') }">
					</div>
					<label class="control-label col-sm-1" for="dept_nm">학과:</label>
					<div class="col-sm-2">
						<input type="text" readonly class="form-control" name="dept_nm" value="${subDetail.get('dept_nm') }">
					</div>
					<label class="control-label col-sm-1" for="stud_num">학번:</label>
					<div class="col-sm-2">
						<input type="text" readonly class="form-control" name="stud_num" value="${subDetail.get('stud_num') }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="stud_nm">이름:</label>
					<div class="col-sm-2">
						<input type="text" readonly class="form-control" name="stud_nm" value="${subDetail.get('stud_nm') }">
					</div>
					<label class="control-label col-sm-1" for="dept_nm">HP:</label>
					<div class="col-sm-2">
						<input type="text" readonly class="form-control" name="stud_hp" value="${subDetail.get('stud_hp') }">
					</div>
					<label class="control-label col-sm-1" for="dept_nm">제출일:</label>
					<div class="col-sm-2">
						<input type="text" readonly class="form-control" name="sub_date" value="${subDetail.get('sub_date') }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="stud_nm">제목:</label>
					<div class="col-sm-8">
						<input type="text" readonly class="form-control" name="sub_title" value="${subDetail.get('sub_title')}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="sub_cont">내용:</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="10" cols="100" readonly>${subDetail.get('sub_cont') }</textarea><br/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="sub_sjt_point">점수:</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="sub_sjt_point" value="${subDetail.get('sub_sjt_point') }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="sub_sjt_point">첨부파일:</label>
					<div class="col-sm-2">
						<a style="font-size:20px" href="${pageContext.request.contextPath}/professor/download?fileName=${subDetail.get('sub_af')}">${subDetail.get('sub_af')}</a>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" ></label>
					<div class="col-sm-2">
						<input type="button" class="btn btn-outline btn-primary" onclick="javascript:score_check()" value="채점"/>
						<input type="button" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureTakeAsgnStudent?asgn_num=${subDetail.get('asgn_num') }'" value="돌아가기"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>