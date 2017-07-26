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
<!-- Content -->
<!-- side menu -->
<%@include file="../common/myPageSideCategory.jsp"%>
<!-- Right content -->
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #CC0000; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				개인정보</h4>
		</div>
		<div class="panel-body" style="text-align: center;">
			<c:choose>
				<c:when test="${not empty admin}">
					<form name="insertProfessor" id="signupForm" method="post"
						action="${myContextPath}/admin/mypage/myInfoUpdate"
						enctype="multipart/form-data">


						<div class="col-md-12">
							<!-- 이미지 미리보기 -->
							<div class="filess">
								<img style="height: 150px; width: 130px;" alt="User Pic"
									src="${myContextPath}/resources/myInfo_images/${admin.admin_pic}"
									id="admin-image"  class="img-circle img-responsive"> 
								<input
									style="width: 100px;" id="profile-image-input"
									accept="image/png, image/jpeg, image/gif" class="hidden"
									type="file">
							</div>

							<label class="control-label">이미지</label> <span
								class="input-group-btn"> <input type="text"
								class="form-control" style="width: 230px;"
								id="image-preview-filename" disabled="disabled">
								<div class="btn btn-default image-preview-input">
									<input type="file" accept="image/png, image/jpeg, image/gif"
										name="file"> <span class="image-preview-input-title"></span>
								</div>
							</span>

						</div>


						<div class="col-md-12" id="admin_inform">
							<div class="col-md-5">
								<label class="control-label">아이디</label> 
								<input type="text" class="form-control" name="admin_id" value="${admin.admin_id}">
								<label class="control-label">비밀번호</label> <input type="text"
									class="form-control" name="admin_pw" value="${admin.admin_pw}">
								<label class="control-label">이름</label><br> <input
									type="text" class="form-control" name="admin_nm"
									value="${admin.admin_nm}"> <label class="control-label">영문이름</label>
								<input type="text" class="form-control" name="admin_eng_nm"
									value="${admin.admin_eng_nm}"> <label
									class="control-label">이메일</label> <input type="text"
									class="form-control" name="admin_email"
									value="${admin.admin_email}"> <label
									class="control-label">직위</label> <input type="text"
									class="form-control" name="admin_post"
									value="${admin.admin_post}"> <label
									class="control-label">생년월일</label> <input type="text"
									class="form-control" name="admin_bir"
									value="${admin.admin_bir}"> <label
									class="control-label">주민등록번호</label> <input type="text"
									class="form-control" name="admin_regno"
									value="${admin.admin_regno}">
							</div>
							<div class="col-md-5">
								<label class="control-label">휴대폰번호</label> <input type="text"
									class="form-control" name="admin_hp" value="${admin.admin_hp}">
								<label class="control-label">집전화번호</label> <input type="text"
									class="form-control" name="admin_tel"
									value="${admin.admin_tel}"> <label
									class="control-label">주소</label> <input type="text"
									class="form-control" name="admin_addr"
									value="${admin.admin_addr}"> <label
									class="control-label">우편번호</label> <input type="text"
									class="form-control" name="admin_zip"
									value="${admin.admin_zip}"> <label
									class="control-label">은행</label> <input type="text"
									class="form-control" name="admin_bank"
									value="${admin.admin_bank}"> <label
									class="control-label">계좌번호</label> <input type="text"
									class="form-control" name="admin_act_num"
									value="${admin.admin_act_num}"> <label class="control-label">계좌주</label>
								<input type="text" class="form-control" name="admin_ah"
									value="${admin.admin_ah}"> <input
									class="submit btn btn-danger" type="submit" value="수정">
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>
