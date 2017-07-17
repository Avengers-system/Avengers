<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- UserHeader -->
<div class="col-md-12" id="commonUserHeader">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">Main</a></li>
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">학적</a></li>
		<li role="presentation"><a href="#">수업</a></li>
		<li role="presentation"><a href="#">수강신청</a></li>
		<li role="presentation"><a href="#">등록&장학</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="#">Help Desk</a></li>
	</ul>
</div>
<!-- Counsel Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">
<a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">증명서발급</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackList">휴/복학 내역</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackApplyPage">휴/복학 신청</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/dropOff">자퇴 신청</a>
</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
휴복학 신청 페이지
<p>휴학</p>
	<form action="${pageContext.request.contextPath}/student/schoolRegister/leaveApply">
		<input type="text" name="loa_num" placeholder="휴학고유번호">
		<input type="text" name="loa_start_date" placeholder="휴학시작일">
		<input type="text" name="loa_end_date" placeholder="휴학종료일">
		<input type="text" name="loa_cause" placeholder="휴학사유">
		<input type="text" name="loa_appl_date" placeholder="휴학신청일">
		<input type="text" name="loa_appr_date" placeholder="관리자승인일">
		<input type="text" name="loa_appr_check" placeholder="관리자승인여부">
		<input type="text" name="loa_rs_shcd_date" placeholder="복학예정일">
		<input type="text" name="loa_admin" placeholder="관리자아이디">
		<input type="submit" value="휴학신청">
	</form>
<p>복학</p>
	<form action="${pageContext.request.contextPath}/student/schoolRegister/leaveApply">
		<input type="text" name="rts_num" placeholder="복학고유번호">
		<input type="text" name="rts_date" placeholder="복학일">
		<input type="text" name="rts_cause" placeholder="복학사유">
		<input type="text" name="rts_appl_date" placeholder="복학신청일">
		<input type="text" name="rts_appr_check" placeholder="관리자 승인여부">
		<input type="text" name="rts_appr_date" placeholder="관리자승인일">
		<input type="text" name="rts_admin" placeholder="관리자아이디">
		<input type="submit" value="복학신청">
	</form>


</div>