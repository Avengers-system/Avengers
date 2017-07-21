<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">
	<h1>과제제출</h1>
	<hr/>
	<div style="background:light-gray">
		<form>
			<input type="text" name="lct_num" value="${asgn.get('lct_num') }"/>
			강의명 : <input type="text" name="lct_nm" value="${asgn.get('lct_nm') }"/>
			분반 : <input type="text" name="lct_nm_class" value="${asgn.get('lct_nm_class') }"/>
			과제명 : <input type="text" name="asgn_nm" value="${asgn.get('asgn_nm') }"/><br/>
			내용 : <br/><textarea cols="100" rows="10" >${asgn.get('asgn_cont') }</textarea><br/>
			제출시작일 : <input type="text" name="asgn_start_date" value="${asgn.get('asgn_start_date') }"/>
			제출마감일 : <input type="text" name="asgn_dl_date" value="${asgn.get('asgn_dl_date') }"/><br/>
			제출양식 : <input type="text" name="asgn_sub_form" value="${asgn.get('asgn_sub_form') }"/>
			제출여부 : <input type="text" name="sub_check" value="${asgn.get('sub_check') }"/>
		</form>
	</div>
	-----------------------------------------------------------------------------------------------
	<form name="submission" id="submission">
		<input type="text" name="asgn_num" value="${asgn_num}"/>
		제목 : <input type="text" name="sub_title"/><br/>
		내용 : <br/><textarea cols="100" rows="10" name="sub_cont"></textarea><br/>
		첨부파일 : <input type="file" name="sub_af">
		<input type="button" onclick="<%=request.getContextPath()%>/student/classManage/lectureAsgnSubmit?lct_num=${asgn.get('lct_num')}" value="제출"/>
		<input type="button" onclick="location.href='${pageContext.request.contextPath}/student/classManage/lectureAsgn'" value="뒤로가기"/>
	</form>
</div>

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