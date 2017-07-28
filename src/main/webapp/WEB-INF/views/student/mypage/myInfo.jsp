<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 템플릿 페이지 -->

<!-- Counsel Content -->
<!-- Counsel Left Side -->
 <%@include file="../common/studentMypageSide.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			
			개인정보
			</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
		  <div>
				<div class="row">
					<div class="col-md-12">
						<c:choose>
							<c:when test="${not empty stud}">
						<form name="stud" method="post"
							action="${pageContext.request.contextPath}/student/mypage/myInfoUpdate"
							enctype="multipart/form-data">
							<div class="col-md-12" style="margin-top: 30px;">
								<!-- 이미지 미리보기 -->
								<div class="col-md-12">
									<div class="files" style="margin-bottom: 20px;">
										<img style="height: 150px; width: 130px; margin-left: 50px;"
											alt="User Pic"
											src="${pageContext.request.contextPath}/resources/myInfo_images/${stud.stud_pic}"
											id="profile-image" class="img-circle img-responsive"> 
										<input
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
													name="file" /> <span class="image-preview-input-title">업로드</span>
											</div>
										</div>
									</div>
								</span>

							</div>


							<div class="col-md-12" id="prof_inform">
								<div class="col-md-5">
								
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">학번</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_num" value="${stud.stud_num}" readonly="readonly">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">비밀번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_pw" value="${stud.stud_pw}">
											</div>
										</div>
									</div>
									
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">이름</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_nm" value="${stud.stud_nm}" readonly="readonly">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">영문이름</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_eng_nm" value="${stud.stud_eng_nm}">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">생년월일</label>
											<div class="col-sm-8">
												<fmt:formatDate value="${stud.stud_bir}" pattern="yyyy/mm/dd"/>
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">주민등록번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_regno" value="${stud.stud_regno}" readonly="readonly">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">학과</label>
											<div class="col-sm-8">
											 <c:choose>
											 
											 	<c:when test="${stud.stud_dept eq 'DEPT1'}">
											 		<input type="text"  class="form-control"  value="멀티미디어공학과" readonly="readonly"/>
											 	</c:when>
											 	
											 	<c:when test="${stud.stud_dept eq 'DEPT2'}">
											 		<input type="text"  class="form-control"  value="컴퓨터공학과" readonly="readonly"/>
											 	</c:when>
											 	
											 	<c:when test="${stud.stud_dept eq 'DEPT3'}">
											 		<input type="text"  class="form-control"  value="영어영문학과" readonly="readonly"/>
											 	</c:when>
											 	
											 	<c:when test="${stud.stud_dept eq 'DEPT4'}">
											 		<input type="text"  class="form-control"  value="문예창작학과" readonly="readonly"/>
											 	</c:when>
											 	
											 	<c:when test="${stud.stud_dept eq 'DEPT5'}">
											 		<input type="text"  class="form-control"  value="경영학과" readonly="readonly"/>
											 	</c:when>
											 	
											 	<c:when test="${stud.stud_dept eq 'DEPT6'}">
											 		<input type="text"  class="form-control"  value="회계학과" readonly="readonly"/>
											 	</c:when>
											 	
											 		
											 	<c:when test="${stud.stud_dept eq 'DEPT7'}">
											 		<input type="text"  class="form-control"  value="간호학과" readonly="readonly"/>
											 	</c:when>
											 
											 
												 <c:when test="${pstud.stud_dept eq 'DEPT8'}">
											 		<input type="text"  class="form-control"  value="생활체육학과" readonly="readonly"/>
											 	 </c:when>
											 
											 	 <c:when test="${stud.stud_dept eq 'DEPT9'}">
											 		<input type="text"  class="form-control"  value="국어교육과" readonly="readonly"/>
											 	 </c:when>
											 
											 	 <c:when test="${stud.stud_dept eq 'DEPT10'}">
											 		<input type="text"  class="form-control"  value="수학교육과" readonly="readonly"/>
											 	 </c:when>
											 
											 </c:choose>
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">학적상태</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_schreg_code" value="${stud.stud_schreg_code}" readonly="readonly">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">현재학년</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_grd" value="${stud.stud_grd}" readonly="readonly">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">현재학기</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_qtr" value="${stud.stud_qtr}" readonly="readonly">
											</div>
										</div>
									</div>
									
								</div>

									

									
								



								<div class="col-md-5">
								
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">은행명</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_bank" value="${stud.stud_bank}">
											</div>
										</div>
									</div>


									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">예금주</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_ah" value="${stud.stud_ah}">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">계좌번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_act_num" value="${stud.stud_act_num}">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">주소</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_addr" value="${stud.stud_addr}">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">우편번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_zip" value="${stud.stud_zip}">
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">전화번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_tel" value="${stud.stud_tel}">
											</div>
										</div>
									</div>
									
								
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">휴대폰번호</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_hp" value="${stud.stud_hp}">
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">이메일</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_email" value="${stud.stud_email }">
											</div>
										</div>
									</div>
					
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">신청가능학점</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="stud_max_crd" value="${stud.stud_max_crd }" readonly="readonly">
											</div>
										</div>
									</div>
									

									<div class="col-md-12">
										<div class="form-group">
											<label class="col-sm-4 control-label text-right">성별</label>
											<div class="col-sm-8">
												<c:choose>
												
													<c:when test="${stud.stud_gen eq '1'}">
														<input type="text" class="form-control" value="남자" readonly="readonly">
													</c:when>
													
													<c:when test="${stud.stud_gen eq '2'}">
														<input type="text" class="form-control" value="여자" readonly="readonly">
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
				</form>
				</c:when>
				</c:choose>
					</div>
				</div>
		  </div>
		</div>
	</div>
</div>
