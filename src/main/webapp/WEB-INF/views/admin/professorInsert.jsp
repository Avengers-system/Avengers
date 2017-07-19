<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  
  
<style>
div.input-group{
width : 400px;
}

div.input-group>span.input-group-addon{
width:120px;
}
</style>


 
<!-- <input type="text" name="" class="postcodify_postcode5" value="" /> -->
<!-- <button id="postcodify_search_button">검색</button><br /> -->
<!-- <input type="text" name="" class="postcodify_address" value="" /><br /> -->
<!-- <input type="text" name="" class="postcodify_details" value="" /><br /> -->
<!-- <input type="text" name="" class="postcodify_extra_info" value="" /><br /> -->



<!-- <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 --> -->
<script> 
$(function() {
$("#postcodify_search_button").postcodifyPopUp(); 
}); 
	
</script> 
 
 
 
<div id="postcodify"></div>

<script type="text/javascript">
 $("#postcodify").postcodify();
</script>
  
 
 
 
<form name="insertProfessor"  method="post" 
	action="${pageContext.request.contextPath }/admin/insertProfessor" 
	  enctype="multipart/form-data">
	  
	  <fieldset>
		<legend>교수 등록</legend>
				<div class="input-group">
				<input type="hidden" name="prfs_num" >
				
				 <span class="input-group-addon" >이름</span>
				  <input type="text" class="form-control" name="prfs_nm" >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >영문이름</span>
				  <input type="text" class="form-control" name="prfs_eng_nm" >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >생년월일</span>
				  <input type="date" class="form-control" name="prfs_bir" >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >이메일</span>
				  <input type="text" class="form-control" name="prfs_email"  >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >비밀번호</span>
				  <input type="text" class="form-control" name="prfs_pw"  >
				</div><br>
				<div class="input-group">
				 <span class="input-group-addon" >주민등록번호</span>
				  <input type="text" class="form-control" name="prfs_regno"  >
				</div>
				<br> 
<!-- 				라디오넣기!!! -->
				<div class="input-group">
				 <span class="input-group-addon" >성별</span>
				  <input type="text" class="form-control" name="prfs_gen"  >
				</div>
				
				
				
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >사진</span>
				  <input type="file" class="form-control" name="prfs_pic"  accept="image/png, image/jpeg, image/gif">
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >계좌번호</span>
				  <input type="text" class="form-control" name="prfs_act_num"  >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >은행명</span>
				  <input type="text" class="form-control" name="prfs_bank"  >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >예금주</span>
				  <input type="text" class="form-control" name="prfs_ah"  >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >주소</span>
				  <input type="text" class="form-control" name="prfs_addr"  >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >우편번호</span>
				  <input type="text" class="form-control" name="prfs_zip"  >
				</div>
						<br>
				<div class="input-group">
				 <span class="input-group-addon" >전화번호</span>
				  <input type="text" class="form-control" name="prfs_tel"  >
				</div>
						<br>
				<div class="input-group">
				 <span class="input-group-addon" >휴대폰번호</span>
				  <input type="text" class="form-control" name="prfs_hp"  >
				</div>
				 <br>
				 <div class="input-group">
				 <span class="input-group-addon" >학과</span>
				  <select name="prfs_dept" class="selectpicker">
					<option value="DEPT1">멀티미디어공학과</option> 
					<option value="DEPT2">컴퓨터공학과</option> 
					<option value="DEPT3">영어영문학과</option> 
					<option value="DEPT4">문예창작학과</option> 
					<option value="DEPT5">경영학과</option> 
					<option value="DEPT6">회계학과</option> 
					<option value="DEPT7">간호학과</option> 
					<option value="DEPT8">생활체육학과</option> 
					<option value="DEPT9">국어교육과</option> 
					<option value="DEPT10">수학교육과</option> 
				 </select>
				  
				  
				</div>
		            
		                    
<!-- dept_num뽑아야됨 -->
		                  
		 
		 
		 <input type="submit" value="등록하기">
		 
</form>
  
  
 