<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty message }">
	<script type="text/javascript">
		alert('${message}');
	</script>
	<c:remove var="message" scope="session" />
</c:if>
<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/myPageSideCategory.jsp"%>
</div>

<div class="col-md-10">
	<c:choose>
		<c:when test="${not empty admin}">


			<div class="panel-body" style="padding-bottom: 30px;">
				<form class="cmxform" id="signupForm" method="post"
					action="${myContextPath}/admin/mypage/myInfoUpdate"
					enctype="multipart/form-data">
					<div class="col-md-12">
						<div class="form-group">
							<img
								src="<%=request.getContextPath()%>/resources/myInfo_images/${admin.admin_pic}"
								width="100pt" />
							<div class="col-sm-10">
								<input type="file" class="form-control" name="file"
									onclick="ImageChange_go()">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">아이디</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_id"
									value="${admin.admin_id}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">비밀번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_pw"
									value="${admin.admin_pw}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_nm"
									value="${admin.admin_nm}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">영문이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_eng_nm"
									value="${admin.admin_eng_nm}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">이메일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_email"
									value="${admin.admin_email}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">직위</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_post"
									value="${admin.admin_post}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">생년월일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_bir"
									value="${admin.admin_bir}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">주민등록번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_regno"
									value="${admin.admin_regno}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">주민등록번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_gen"
									value="${admin.admin_gen}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">휴대폰번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_hp"
									value="${admin.admin_hp}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">집전화번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_tel"
									value="${admin.admin_tel}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_addr"
									value="${admin.admin_addr}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">우편번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_zip"
									value="${admin.admin_zip }">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">은행</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_bank"
									value="${admin.admin_bank}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">계좌번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_act_num"
									value="${admin.admin_act_num}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-2 control-label text-right">계좌 소유자</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="admin_ah"
									value="${admin.admin_ah}">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group form-animate-checkbox">
							<input type="checkbox" class="checkbox" id="validate_agree"
								name="validate_agree"> <label>confirm</label>
						</div>
						<input class="submit btn btn-danger" type="submit" value="수정">
					</div>



				</form>
			</div>

		</c:when>
	</c:choose>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	//관리자가 아이디가 admin이면 개인정보를 변경할 수 있다.
	//readonly remove
	$(function() {
		if ('${admin.admin_post}' == "총괄") {
			$("input").removeAttr("readonly");
		}
	});
	//개인정보
	function myInfo_go() {
		location.href = "${myContextPath}/admin/mypage/";
	}
	//스케줄보기
	function mySchedule_go() {
		location.href = "${myContextPath}/admin/mypage/mySchedule";
	}
</script>

