<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 휴복학신청 -->
 <!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/certificateSide.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">휴/복학 신청</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			

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
	</div>
</div>

