<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>

#commonRightSide{
margin-top:50px;

}

div.detailBtn>*{
	margin:0 auto;
}

div.input-group{
	width : 400px;
}

div.input-group>span.input-group-addon{
	width:120px;
}

</style>
    
<!-- Admin Header -->
<%-- <%@include file="common/topCategory.jsp"%> --%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%-- 	<%@include file="common/mainSideCategory.jsp" %> --%>
</div>
<div class="col-md-10" id="commonRightSide">


		<div class="col-md-4">
			<legend>상세정보</legend>
		    
     <form enctype="multipart/form-data" action="${pageContext.request.contextPath }/admin/updateStudent" method="post">  
  	  
  	  	
  	  	<div class="col-md-12" >
			         <!-- 이미지 미리보기 -->
			               <div class="filess" >
			                  <img  style="height:150px;width:130px;" alt="student Pic" 
			                  src="<%=request.getContextPath()%>/resources/admin_student_images/${student.stud_pic}"
			                     id="profile-image" class="img-circle img-responsive">
			                  <input style="width:100px;" id="profile-image-input"  accept="image/png, image/jpeg, image/gif" class="hidden" type="file">
			               </div>
			               
			               <label class='control-label'>이미지</label>
			                      <span class="input-group-btn">
			                       <input type="text" class="form-control" value="${student.stud_pic}" style="width:230px;" id="image-preview-filename" disabled="disabled">
			                            <div class="btn btn-default image-preview-input">
			                              <input type="file" accept="image/png, image/jpeg, image/gif" name="stud_pic" value="${student.stud_pic}"/>
					                      <span class="image-preview-input-title" >업로드</span>
			                           </div>
			                      </span>
			        </div>
			        
  	  	
  	  		<div class="input-group">
  	  		<input type="hidden" value="${student.stud_num}" name='stud_num'>
				 <span class="input-group-addon" >학번</span>
				 
				  <input type="text" class="form-control"  value='${student.stud_num}'   disabled="disabled">
			</div>
  	  		<div class="input-group">
				 <span class="input-group-addon" >이름</span>
				  <input type="text" class="form-control" name='stud_nm' value='${student.stud_nm}'   >
			</div>
  	  		<div class="input-group">
				 <span class="input-group-addon" >영문이름</span>
				  <input type="text" class="form-control" name='stud_eng_nm' value='${student.stud_eng_nm}'  >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >생년월일</span>
				  <input type="date" class="form-control" name='stud_bir' value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${student.stud_bir}" />' >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >이메일</span>
				  <input type="text" class="form-control" name='stud_email'  value = "${student.stud_email}" /> 
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >비밀번호</span>
				  <input type="text" class="form-control" name='stud_pw'  value = "${student.stud_pw}" /> 
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >학년</span>
				  <input type="text" class="form-control" name='stud_grd' value='${student.stud_grd}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >주민등록번호</span>
				  <input type="text" class="form-control" name='stud_regno' value='${student.stud_regno}'   >
			</div>
			 
  	  		<div class="input-group">
					 <span class="input-group-addon" >성별</span>
					
					 <div class="radio" >
					 
					 <c:choose>
							<c:when test="${student.stud_gen eq '1'}">
			                     <label>
			                     <input type="radio"   name="stud_gen" checked="checked" value="1">남자</label>
			                     <label>
			                     <input type="radio"     value="2">여자</label>
	                  		</c:when>
							<c:otherwise>
			                     <label>
			                     <input type="radio"    value="1">남자</label>
								<label>
			                     <input type="radio"  name="stud_gen"  checked="checked" value="2">여자</label>
		             		</c:otherwise>
					</c:choose>
	                </div>
					
					</div>
			<div class="input-group">
				 <span class="input-group-addon" >학기</span>
				  <input type="text" class="form-control" name='stud_qtr' value='${student.stud_qtr}'  >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >학적상태</span>
				  <input type="text" class="form-control" name='stud_schreg_code' value='${student.stud_schreg_code}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >계좌번호</span>
				  <input type="text" class="form-control" name='stud_act_num' value='${student.stud_act_num}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >은행</span>
				  <input type="text" class="form-control" name='stud_bank' value='${student.stud_bank}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >예금주</span>
				  <input type="text" class="form-control" name='stud_ah' value='${student.stud_ah}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >주소</span>
				  <input type="text" class="form-control" name='stud_addr' value='${student.stud_addr}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >우편번호</span>
				  <input type="text" class="form-control" name='stud_zip' value='${student.stud_zip}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >전화번호</span>
				  <input type="text" class="form-control" name='stud_tel' value='${student.stud_tel}'   >
			</div>
				<div class="input-group">
				 <span class="input-group-addon" >휴대폰번호</span>
				  <input type="text" class="form-control"  name='stud_hp' value='${student.stud_hp}'   >
			</div>
			 <div class="input-group">
				 <span class="input-group-addon" >학과</span>
				 
				  <input type="text" class="form-control" name='stud_dept' value='${student.stud_dept}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >보호자이름</span>
				  <input type="text" class="form-control" name='stud_guad_nm' value='${student.stud_guad_nm}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >보호자관계</span>
				  <input type="text" class="form-control" name='stud_guad_rel' value='${student.stud_guad_rel}'   >
			</div>
			<div class="input-group">
				 <span class="input-group-addon" >보호자휴대폰번호</span>
				  <input type="text" class="form-control" name='stud_guad_hp' value='${student.stud_guad_hp}'   >
			</div>
					<div class="col-md-5 detailBtn">
						 <input type="submit" value="수정하기" >
					</div>
					<div class="col-md-5 detailBtn">
					<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/deleteStudent?stud_num=${student.stud_num}'">
					삭제하기</button>
					</div>
			</form>

		</div>
	

</div>
