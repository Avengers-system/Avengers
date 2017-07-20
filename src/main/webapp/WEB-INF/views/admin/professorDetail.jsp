<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@include file="common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <%@include file="common/mainSideCategory.jsp" %>   
</div>
<div class="col-md-10" id="commonRightSide">


		<div class="col-md-4">
			<legend>상세정보</legend>
	
		<form enctype="multipart/form-data" action="updateProfessor">
	
				<div class="input-group">
				 <span class="input-group-addon" >교수번호 </span>
				  <input type="text" class="form-control" name="prfs_num" value="${professor.prfs_num}" disabled="disabled" >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >이름 </span>
				  <input type="text" class="form-control" placeholder="홍길동" name="prfs_nm" value="${professor.prfs_nm}">
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >영문이름</span>
				  <input type="text" class="form-control" name="prfs_eng_nm" value="${professor.prfs_eng_nm}">
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >학과번호</span>
				  <input type="text" class="form-control" name="prfs_dept" value="${professor.prfs_dept}">
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >생년월일</span>
				 
				  <input type="text" class="form-control" name="prfs_bir" value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${professor.prfs_bir}" />'>
				</div>	
				<br>	
				<div class="input-group">
				 <span class="input-group-addon" >주민등록번호</span>
				  <input type="text" class="form-control" name="prfs_regno" value="${professor.prfs_regno}">
				</div>
				<br>		
				<div class="input-group">
				 <span class="input-group-addon" >성별</span>
				
					<c:choose>
					<c:when test="${professor.prfs_gen == '2'} ">
					  	<input type="text" class="form-control" name="prfs_gen" value="여자">
					</c:when>
					<c:otherwise>
				  		<input type="text" class="form-control" name="prfs_gen" value="남자">
				  	</c:otherwise>
				  	</c:choose>
				</div>		
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >휴대폰번호</span>
				  <input type="text" class="form-control" name="prfs_hp" value="${professor.prfs_hp}">
				</div>		
		<hr />
		
	</form>
			<div class="col-md-5 detailBtn">
				<input type="submit" value="수정하기" >
			</div>
			<div class="col-md-5 detailBtn">
				<button onclick="location.href='<%=request.getContextPath()%>/admin/deleteProfessor?prfs_num=${professor.prfs_num}'">삭제하기</button>
			</div>
		
	</div>
</div>
