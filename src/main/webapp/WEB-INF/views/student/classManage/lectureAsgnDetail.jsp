<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--side Category-->
<%@include file="../common/classManageLectureSideCategory.jsp" %>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">과제제출</h4>
		</div>
		<div class="panel-body" >
			<div style="margin-bottom:10px">
				<form  class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-1" for="lct_nm">강의명:</label>
						<div class="col-sm-2">
							<input type="text" readonly class="form-control" name="lct_nm" value="${asgn.get('lct_nm') }">
						</div>
						<label class="control-label col-sm-1" for="lct_nm_class">분반:</label>
						<div class="col-sm-2">
							<input type="text" readonly class="form-control" name="lct_nm_class" value="${asgn.get('lct_nm_class') }">
						</div>
				    </div>
				    <div class="form-group">
				    <label class="control-label col-sm-1" for="asgn_start_date">제출시작일:</label>
						<div class="col-sm-2">
							<input type="text" readonly class="form-control" name="asgn_start_date" value="${asgn.get('asgn_start_date') }">
						</div>
						<label class="control-label col-sm-1" for="asgn_dl_date">제출마감일:</label>
						<div class="col-sm-2">
							<input type="text" readonly class="form-control" name="asgn_dl_date" value="${asgn.get('asgn_dl_date') }">
						</div>
				    </div>
				    <div class="form-group">
				    <label class="control-label col-sm-1" for="asgn_nm">과제명:</label>
						<div class="col-sm-8">
							<input type="text" readonly class="form-control" name="asgn_nm" value="${asgn.get('asgn_nm') }">
						</div>
				    </div>
				    <div class="form-group">
						<label class="control-label col-sm-1" for="asgn_cont">과제내용:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="10" cols="100" readonly>${asgn.get('asgn_cont') }</textarea><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-1" for="">제출양식</label>
						<div class="col-sm-2">
							<a style="font-size:20px" href="${pageContext.request.contextPath}/student/download?fileName=${asgn.get('asgn_sub_form')}">${asgn.get('asgn_sub_form')}</a>
						</div>
						<label class="control-label col-sm-1" for="sub_check">제출여부</label>
						<div class="col-sm-2">
							<input type="text" readonly class="form-control" name="sub_check" value="${asgn.get('sub_check') }">
						</div>
				    </div>
				</form>
			</div>
			<hr color="grey"/>
			<form name="submission" method="post" action="lectureAsgnSubmit" enctype="multipart/form-data" class="form-horizontal">
				<input type="text" hidden="true" name="asgn_num" value="${asgn_num}"/>
				<div class="form-group">
					<label class="control-label col-sm-1" for="sub_title">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="sub_title">
					</div>
			    </div>
			     <div class="form-group">
					<label class="control-label col-sm-1" for="sub_cont">과제내용:</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="10" cols="100" name="sub_cont"></textarea><br/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="sub_af">첨부파일</label>
					<div class="col-sm-3">
						<input type="file" name="sub_af" style="font-size:15px"/>
					</div>
		    	</div>
		    	<div class="form-group">
					<label class="control-label col-sm-1" for=""></label>
					<div class="col-sm-3">
						<input type="submit" class="btn btn-outline btn-primary" value="제출"/>
						<input type="button" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath}/student/classManage/lectureAsgn'" value="뒤로가기"/>
					</div>
		    	</div>
			</form>
		</div>
	</div>
</div>
<!-- Content -->

<script>
// 	$(function(){
// 		$("#submitBtn").click(function(){
// 			var asgn = '<c:out value="${asgn_num}"/>';
// 			asgn = encodeURIComponent(asgn);
// 			asgn = asgn.replace("'", "%27");
// 			var formData = $("#submission").serialize();
// 			alert(asgn+""+formData);
// 			$.post({
// 				url : '/student/classManage/lectureAsgnSubmit'
// 				, type :'post'
// 				, cache : false
// 				, data : {
// 					 	"submission" : formData
// 						,"asgn_num" : asgn
// 					}
// 				,success : onSuccess()
// 			});
			
			
// 		})
// 	});
	
// 	function onSuccess(){
// 		var lct_num = document.getElementsByName("lct_num")[0].value;
		
<%-- 		location.href="<%=request.getContextPath()%>/student/classManage/lectureAsgn?lct_num="+lct_num; --%>
// 	}
</script>
