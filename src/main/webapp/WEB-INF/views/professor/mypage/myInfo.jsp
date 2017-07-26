<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<div class="panel-body" style="height: 580px; text-align: center;">
		<div class="panel panel-default">
			<div class="panel-heading"
				style="background-color: #666666; margin-top: 10px;">
				<h4 style="color: #fff; font-weight: bold; font-size: 20px;">개인정보</h4>
			</div>
			<div class="panel-body" style="height: 580px; text-align: center;">

				<div class="row">
					<div class="col-md-12">
						<form name="insertProfessor" method="post"
							action="${pageContext.request.contextPath }/professor/mypage/myInfoUpdage"
							enctype="multipart/form-data">
							<div class="col-md-12" style="margin-top: 30px;">
								<!-- 이미지 미리보기 -->
								<div class="col-md-12">
									<div class="filess" style="margin-bottom: 20px;">
										<img style="height: 150px; width: 130px; margin-left: 50px;"
											alt="User Pic"
											src="${myContextPath}/resources/myInfo_images/${prfs.prfs_pic}"
											id="profile-image" class="img-circle img-responsive"> <input
											style="width: 100px;" id="profile-image-input"
											accept="image/png, image/jpeg, image/gif" class="hidden"
											type="file">
									</div>
								</div>


								<span class="input-group-btn">
									<div class="col-md-8">
										<div class="col-md-4">
											<input type="text" class="form-control" style="width: 310px;"
												id="image-preview-filename" disabled="disabled">
										</div>
										<div class="col-md-1">
											<div class="btn btn-default image-preview-input">
												<input type="file" accept="image/png, image/jpeg, image/gif"
													name="prfs_pic" /> <span class="image-preview-input-title">업로드</span>
											</div>
										</div>

									</div>
								</span>

							</div>


							<div class="col-md-12" id="prof_inform">
								<div class="col-md-5">
									<input type="hidden" name="prfs_num">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">이름</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_nm" value="${prfs.prfs_nm}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">영문이름</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_eng_nm" value="${prfs.prfs_eng_nm}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">학과</label>
											<div class="col-sm-8">
											 <c:choose>
											 
											 	<c:when test="${prfs.prfs_dept eq 'DEPT1'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="멀티미디어공학과"/>
											 	</c:when>
											 	
											 	<c:when test="${prfs.prfs_dept eq 'DEPT2'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="컴퓨터공학과"/>
											 	</c:when>
											 	
											 	<c:when test="${prfs.prfs_dept eq 'DEPT3'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="영어영문학과"/>
											 	</c:when>
											 	
											 	<c:when test="${prfs.prfs_dept eq 'DEPT4'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="문예창작학과"/>
											 	</c:when>
											 	
											 	<c:when test="${prfs.prfs_dept eq 'DEPT5'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="경영학과"/>
											 	</c:when>
											 	
											 	<c:when test="${prfs.prfs_dept eq 'DEPT6'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="회계학과"/>
											 	</c:when>
											 	
											 		
											 	<c:when test="${prfs.prfs_dept eq 'DEPT7'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="간호학과"/>
											 	</c:when>
											 
											 
												 <c:when test="${prfs.prfs_dept eq 'DEPT8'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="생활체육학과"/>
											 	 </c:when>
											 
											 	 <c:when test="${prfs.prfs_dept eq 'DEPT9'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="국어교육과"/>
											 	 </c:when>
											 
											 	 <c:when test="${prfs.prfs_dept eq 'DEPT10'}">
											 		<input type="text"  class="form-control" name="prfs_dept" value="수학교육과"/>
											 	 </c:when>
											 
											 </c:choose>
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">주민등록번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_regno" value="${prfs.prfs_regno}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">생년월일</label>
											<div class="col-sm-8">
												<fmt:formatDate value="${prfs.prfs_bir}"  pattern="yyyy-MM-dd"/>
												<input type="date" class="form-control" name="prfs_bir" value="${prfs.prfs_bir}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">전화번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_tel" value="${prfs.prfs_tel}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">계좌번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_act_num" value="${prfs.prfs_act_num}">
											</div>
										</div>
									</div>

								</div>



								<div class="col-md-5">


									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">은행명</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_bank" value="${prfs.prfs_bank}">
											</div>
										</div>
									</div>


									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">예금주</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_ah" value="${prfs.prfs_ah}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">우편번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_zip" value="${prfs.prfs_zip}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">주소</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_addr" value="${prfs.prfs_addr}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">휴대폰번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_hp" value="${prfs.prfs_hp}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">이메일</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_email" value="${prfs.prfs_email }">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">비밀번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="prfs_pw" value="${prfs.prfs_pw}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">성별</label>
											<div class="col-sm-8">
												<c:choose>
												
													<c:when test="${prfs_gen eq '1'}">
														<input type="text" class="form-control" name="prfs_gen" value="남자">
													</c:when>
													
													<c:when test="${prfs_gen eq '2'}">
														<input type="text" class="form-control" name="prfs_gen" value="여자">
													</c:when>
													
												</c:choose>
											</div>
										</div>
									</div>

								</div>
								<div class="col-md-2" style="margin-top: 225px;">
									<input class="submit btn btn-danger" type="submit" value="수정하기">
								</div>
							</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>

