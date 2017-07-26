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
<form name="StudentAsgnDetail" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryAsgn" enctype="multipart/form-data">
	<input type="text" hidden="true" name="asgn_num" value="${subDetail.get('asgn_num') }"/>
	<input type="text" hidden="true" name="sub_num" value="${subDetail.get('sub_num') }"/>
	단과대학<input type="text" readonly name="col_nm" value="${subDetail.get('col_nm') }"/>
	학과<input type="text" readonly name="dept_nm" value="${subDetail.get('dept_nm') }"/><br/>
	학번<input type="text" readonly name="stud_num" value="${subDetail.get('stud_num') }"/>
	이름<input type="text" readonly name="stud_nm" value="${subDetail.get('stud_nm') }"/>
	HP<input type="text" readonly name="stud_hp" value="${subDetail.get('stud_hp') }"/><br/>
	제목<input type="text" readonly name="sub_title" value="${subDetail.get('sub_title') }"/><br/>
	내용<textarea rows="10" readonly cols="50">${subDetail.get('sub_cont') }</textarea><br/>
	점수<input type="text" name="sub_sjt_point" value="${subDetail.get('sub_sjt_point') }"/><br/>
	제출일<input type="text" readonly name="sub_date" value="${subDetail.get('sub_date') }"/><br/>
	<div style="border:1px solid lightgrey;font-size:20px">
		첨부파일
		<a href="${pageContext.request.contextPath}/professor/download?fileName=${subDetail.get('sub_af')}">${subDetail.get('sub_af')}</a>
	</div>
	<input type="button" onclick="javascript:score_check()" value="제출"/>
</form>