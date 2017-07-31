<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--side Category 2017.07.26수정-->
	<%@include file="common/studentDetailSideCategory.jsp" %>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			상세정보
			</h4>
		</div>
		<div class="panel-body" >
		 <div class="row">
		  	<div class="col-md-12">
     <form enctype="multipart/form-data" action="${pageContext.request.contextPath }/admin/updateStudent" method="post">  
  	  	<div class="col-md-12" style="margin-top:30px;">
  		   <!-- 이미지 미리보기 -->
  		   				<div class="col-md-12"style="margin-left:40px;">
			               <div class="filess" style="margin-bottom:20px;">
			                  <img  style="height:150px;width:130px; margin-left:50px; " alt="User Pic" src="${pageContext.request.contextPath }/resources/admin_student_images/${student.stud_pic}"
			                     id="profile-image" class="img-circle img-responsive">
			                  <input style="width:100px;" id="profile-image-input"  accept="image/png, image/jpeg, image/gif" class="hidden" type="file" name="stud_pic">
			               </div>
              			</div>
              
               
	                   <span class="input-group-btn">
	                   		<div class="col-md-8 col-md-offset-1">
	                   		<div class="col-md-4">
	                   			<input type="text" value="${student.stud_pic}" class="form-control" style="width:292.48px;" id="image-preview-filename" disabled="disabled">
	                   		</div>
	                   		<div class="col-md-1" style="margin-left:-50px;">
		                   		<div class="btn btn-default image-preview-input">
		                           <input type="file" accept="image/png, image/jpeg, image/gif" />
		                           <span class="image-preview-input-title">업로드</span>
		                        </div>
		                   	</div>
	                   		
	                        </div>
	                   </span>
              
  		</div> 
  	  	<div class="col-md-12" id="prof_inform">
				<div class="col-md-4">
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학적상태</label>
							<div class="col-sm-8">
								<input type="hidden" class="form-control" name="stud_schreg_code" value="${student.stud_schreg_code}">
								<input type="text" class="form-control"  value="${student.stud_schreg_code}"  disabled="disabled">
							</div>
						</div>
				</div> 
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학번</label>
							<div class="col-sm-8">
								<input type="hidden" class="form-control" name="stud_num" value="${student.stud_num }" >
								<input type="text" class="form-control" value="${student.stud_num }" disabled="disabled">
							</div>
						</div>
				</div>
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">비밀번호</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="stud_pw" value="${student.stud_pw}">
							</div>
						</div>
				</div>
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학과</label>
							<div class="col-sm-8">
								<select id="select" style="width:254.42px;" name="stud_dept" class="selectpicker show-tick">
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
						</div>
				</div>     
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_nm" value="${student.stud_nm }">
							</div>
						</div>
				</div>
				   
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">영문이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_eng_nm" value="${student.stud_eng_nm }">
							</div>
						</div>
				</div>
				   
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">생년월일</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" name="stud_bir" value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${student.stud_bir}" />'>
							</div>
						</div>
				</div>
				    
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">이메일</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_email" value="${student.stud_email}">
							</div>
						</div>
				</div>
				 
						
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">주민등록번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_regno" value="${student.stud_regno}">
							</div>
						</div>
				</div>  
				
			   <div class="col-md-12">
							<div class="form-group">
								<label class="col-sm-3 control-label text-right">성별</label>
								<div class="col-sm-8">
									<div class="radio" >
									<c:choose>
										<c:when test="${student.stud_gen eq '1'}">
											<div class="col-md-6"><label><input type="radio" name="stud_gen" checked="checked" value="1">남자</label></div>
									      	<div class="col-md-6"><label><input type="radio" name="stud_gen" value="2">여자</label></div>
								      	</c:when>
								      	<c:otherwise>
											<div class="col-md-6"><label><input type="radio" name="stud_gen" value="1">남자</label></div>
									      	<div class="col-md-6"><label><input type="radio" name="stud_gen" checked="checked" value="2">여자</label></div>
								      	</c:otherwise>
							      	</c:choose>
						   	  </div>
								</div>
							</div>
					</div>	  
				 
				 </div>
				 <div class="col-md-4">
				 
				 <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학년</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_grd" value="${student.stud_grd}">
							</div>
						</div>
				</div>    
				 
				 <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학기</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_qtr" value="${student.stud_qtr}">
							</div>
						</div>
				</div>  
				 
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학점</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_max_crd" value="${student.stud_max_crd}">
							</div>
						</div>
				</div> 
				 
				 
				 
			   <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">계좌번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_act_num" value="${student.stud_act_num}">
							</div>
						</div>
				</div>  
				 
				 <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">은행</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_bank" value="${student.stud_bank}">
							</div>
						</div>
				</div>
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">예금주</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_ah" value="${student.stud_ah}">
							</div>
						</div>
				</div>   
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">주소</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_addr" value="${student.stud_addr}">
							</div>
						</div>
				</div>   
				 
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">우편번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_zip" value="${student.stud_zip}">
							</div>
						</div>
				</div>   
				 
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">전화번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_tel" value="${student.stud_tel}">
							</div>
						</div>
				</div>   
				 
			 	<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">휴대폰번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_hp" value="${student.stud_hp}">
							</div>
						</div>
				</div>   
				 
				   
			</div>
			
			
					<div class="col-md-4 detailBtn">
					
						<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">보호자이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_guad_nm" value="${student.stud_guad_nm}">
							</div>
						</div>
				</div>    
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">보호자관계</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_guad_rel" value="${student.stud_guad_rel}">
							</div>
						</div>
				</div>    
				
			   <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">보호자휴대폰번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_guad_hp" value="${student.stud_guad_hp}">
							</div>
						</div>
				</div> 
				
				<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-3 control-label text-right">학점</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_max_crd" value="20">
							</div>
						</div>
				</div>  
					
				<div class="col-md-8 col-md-offset-4" style="margin-top:200px;">
						<input class="submit btn btn-danger" type="submit" value="수정하기">
						<input class="submit btn btn-danger" type="button" value="삭제하기" onclick="location.href='${pageContext.request.contextPath}/admin/deleteStudent?stud_num=${student.stud_num}'">
				</div>	
				
				
<!-- 				<div class="col-md-2" style="margin-top:225px;"> -->
<!-- 					<input class="submit btn btn-danger" type="submit" value="수정하기"> -->
<!-- 					<input class="submit btn btn-danger" type="button" value="삭제하기" onclick="location.href='/avengers/admin/deleteProfessor?prfs_num=2017064'"> -->
<!-- 				</div> -->
				
					 
					</div>
			 
			</form>
</div>
		</div>
	</div>
</div>

<script>
	$(function() {
	   //그림 클릭 시 업로드 창 띄워 업로드 후 미리보기
	   $('#profile-image').on('click', function() {
	      $('#profile-image-input').click();
	      
	      $("#profile-image-input").change(function (){     
	           
	           var file = this.files[0];
	           var reader = new FileReader();
	           // Set preview image into the popover data-content
	           reader.onload = function (e) {
	               $(".image-preview-input-title").text("변경");
	                $("#image-preview-filename").val(file.name);            
	               $("#profile-image").attr('src', e.target.result);
	           }        
	           reader.readAsDataURL(file);
	       });
	   });
	   
	   // 업로드 버튼으로 그림피일 업로드 후 미리보기
	   $(".image-preview-input input:file").change(function (){     
	        
	        var file = this.files[0];
	        var reader = new FileReader();
	        //Set preview image into the popover data-content
	        reader.onload = function (e) {
	            $(".image-preview-input-title").text("변경");
	            $("#image-preview-filename").val(file.name);            
	            $("#profile-image").attr('src', e.target.result);
	        }        
	        reader.readAsDataURL(file);
	    });
	 
	});
	
	
	
	//학과 select 선택되도록 추가
	
	  $('#select option').each(function(){

  if($(this).val()=="${student.stud_dept}"){

    $(this).attr("selected","selected"); // attr적용안될경우 prop으로 

  }

});
	
</script>
 

<style>
 	div.col-md-4>div.col-md-12{
 	margin-bottom:20px;
 	
 	}
 
 
 
    .table-bordered>thead>tr>th {
	text-align: center;
	}
	
	div>.filess{
	margin-left:60px;width:130px; height:150px;
	}
	
	div>#profile-image{
    border: 1px solid gray;
    margin: 0 auto;
    height: 150px;
    width: 130px;
	}

 
	
	fieldset {
    min-width: 0;
    padding: 0;
    border: 2px solid #b5bdd0;
/*     width: 400px; */
    margin: 0 auto;
}
	
	
.checkbox label, .radio label {
    min-height: 20px;
    padding-left: 40px;
    padding-right: 10px;
    font-weight: 400;
    cursor: pointer;
}

 .image-preview-input {
    position: relative;
    overflow: hidden;
    margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
   }
   .image-preview-input input[type=file] {
      position: absolute;
      top: 0;
      right: 0;
      margin: 0;
      padding: 0;
      font-size: 20px;
      cursor: pointer;
      opacity: 0;
      filter: alpha(opacity=0);
   }
   .image-preview-input-title {
       margin-left:2px;
   }
 
   img {
      cursor:pointer;
   }
   .files-crw {
      width : 165px;
      height: 220px;
   }

 	 


.input-group .form-control:last-child, .input-group-addon:last-child {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}

	div#prof_inform{
		margin-top:50px;
	}

</style>


