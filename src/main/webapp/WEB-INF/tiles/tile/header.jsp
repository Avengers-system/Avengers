<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
	#commonLoginInformation{
		padding-top: 5px;
		text-align: right;
	}
</style>
<div class="col-md-7">
	<img src="http://placehold.it/180x60" />
</div>
<div class="col-md-4">
	<!--자동로그아웃-->
	<sec:authorize access="isAuthenticated()">
		<div id="commonLoginInformation">
			<input  class="btn btn-lg btn-danger" type="button" onclick="logout();" style="text-align: right;" value="로그아웃"/>
		</div>
	</sec:authorize>
</div>
<div class="col-md-1"></div>
<script>
 function logout(){
	 location.href="${pageContext.request.contextPath}/logout";
 }
</script>
