<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!--side Category-->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/resSchSideCategory.jsp" %>
</div>

<form>


<div class="col-md-10 padding-0">

		<div class="panel">
    	 <div class="panel-heading">
       		<h3>기본정보 입력</h3>
       		 </div> 
       	<div class="panel-body" style="font-size:16px;">		
		<div class="col-md-5 padding-0">		             
		
		<label class='control-label'>이름</label>
					  <input required type="text" class="form-control" name="stud_nm" >
		
		<label class='control-label'>영문이름</label>
					  <input type="text" class="form-control"  name="stud_eng_nm">
		
		<label class='control-label'>장학금명</label><br/>
					  <select required name="scr_nm" name="scr_nm">
						<c:choose>
					<c:when test="${not empty scr_nm}">
						<c:forEach var="scr" items="${scr_nm}" varStatus="status">
							<option value="${scr}">${scr}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					 </select>
			 <br>
									
					<label class='control-label'>주민등록번호</label>
				  	<input required type="text" class="form-control" name="stud_regno"  >
									
					<label class='control-label'>전화번호</label>
				  	<input type="text" class="form-control" name="stud_tel"  >							
						
						
					<label class='control-label'>휴대폰번호</label>
					<input type="text" class="form-control" name="stud_hp"  >
					
					 <label class='control-label'>학과</label>
					 <input required type="text" class="form-control" name="dept_nm"  >
				
					 <label class='control-label'>현재학년</label>
					 <input required type="text" class="form-control" name="stud_grd"  >
					 <label class='control-label'>성별</label>
					 <div class="radio"  >
					      <label><input required type="radio" name="stud_gen" value="1">남자</label>
					      <label><input required type="radio" name="stud_gen" value="2">여자</label>
				     </div>
					 
					 
					 
					 
					</div>
					<div class="col-md-1 padding-0">
					</div>			 
				 <div class="col-md-5 padding-0">
					<label class='control-label'>이메일</label>
					<input type="text" class="form-control" name="std_email"  >										 

					 <label class='control-label'>계좌번호</label>
					 <input required type="text" class="form-control" name="stud_act_num"  >
					 <label class='control-label'>은행명</label>
					 <input required type="text" class="form-control" name="stud_bank"  >
					 <label class='control-label'>예금주</label>
					 <input required type="text" class="form-control" name="stud_ah"  >
					 <label class='control-label'>주소</label>
					 <input type="text" class="form-control" name="stud_addr"  >
					 <label class='control-label'>우편번호</label>
					 <input type="text" class="form-control" name="stud_zip"  >
					 <label class='control-label'>보호자 이름</label>
					 <input type="text" class="form-control" name="stud_guad_nm"  >
					 <label class='control-label'>보호자 관계</label>
					 <input type="text" class="form-control" name="stud_guad_rel"  >
					 <label class='control-label'>보호자 핸드폰</label>
					 <input type="text" class="form-control" name="stud_guad_hp"  >
					
				    </div>	  	 
</div>
</div>
</div>
<div class="col-md-2 padding-0">
</div>
<div class="col-md-10 padding-0">

		<div class="panel">
    	 <div class="panel-heading">
       		<h3>신청사유</h3>
       		 </div> 
       	<div class="panel-body" style="font-size:16px;">       			
		<div class="box-v5 panel">
		<div class="panel-heading padding-0 bg-white border-none">	             
		<textarea required placeholder="신청사유를 적어주세요." name="scrappl_cause">
					 
		</textarea>
		</div>
		</div>		
		</div>
</div>
		<input class="btn btn-round pull-right" type="submit" value="신청하기">	  	 
</div>

</form>
<!-- start: Javascript -->
<script type="text/javascript">
	$(document).ready(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_flat-aero',
			radioClass : 'iradio_flat-aero'
		});
	});
</script>
<!-- end: Javascript -->		
