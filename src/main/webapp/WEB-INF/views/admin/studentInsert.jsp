<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

 
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
</script>
<style>


.form-control {
    display: block;
    width: 334px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;



	.col-sm-4{
	padding-top: 5px;
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
  
<!-- 사이드없는 페이지 -->    
    
<div class="col-xs-12">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">학생 등록</h4>
		</div>
		<div class="panel-body" style="height: 900px;">
		
			<div class="row">
     <div class="col-md-12">
<form name="insertStudent"  method="post" action="${pageContext.request.contextPath }/admin/insertStudent" 
      enctype="multipart/form-data">
      
      <div class="col-md-12" style="margin-top:30px;">
         <!-- 이미지 미리보기 -->
  		   				<div class="col-md-12">
  		   				<div class="col-md-4 col-md-offset-3">
			               <div class="filess" style="margin-bottom:20px;">
			                  <img  style="height:150px;width:130px; margin-left:50px; " alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
			                     id="profile-image" class="img-circle img-responsive">
			                  <input style="width:100px;" id="profile-image-input"  accept="image/png, image/jpeg, image/gif" class="hidden" type="file">
			               </div>
						</div>
						
  		   				<div class="col-md-12">
	  		   				<span class="input-group-btn">
		                   		<div class="col-md-6 col-md-offset-2">
		                   			<input type="text" class="form-control" style="width:310px;" id="image-preview-filename" disabled="disabled">
		                   		<div class="btn btn-default image-preview-input">
			                           <input type="file" accept="image/png, image/jpeg, image/gif" name="stud_pic" />
			                           <span class="image-preview-input-title">업로드</span>
								</div>
		                   		</div>
		                   </span>
  		   				</div>
		                   
              			</div>
	                   
              
        </div>
        
         <div class="col-md-12" id="stud_inform" style="margin-top:80px;">
            <div class="col-md-5">
            	<!-- hidden -->
              <input type="hidden" name="stud_num"/>  
      
      			<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_nm" >
							</div>
						</div>
				</div>
      
      			<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">영문이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_eng_nm" >
							</div>
						</div>
				</div>
      
      			<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">학과</label>
							<div class="col-sm-8">
								<select style="width:334px;" name="stud_dept" class="selectpicker show-tick">
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
							<label class="col-sm-4 control-label text-right">주민등록번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_regno" >
							</div>
						</div>
				</div>
      
             	<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">생년월일</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" name="stud_bir" >
							</div>
						</div>
				</div>
      
             	<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">전화번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_tel" >
							</div>
						</div>
				</div>
      
             	<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">휴대폰번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_hp" >
							</div>
						</div>
				</div>
      
             	<div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">현재학년</label>
							<div class="col-sm-8">
								<div class="radio" >
				                     <label><input type="radio" name="stud_grd" value="1">1</label>
				                     <label><input type="radio" name="stud_grd" value="2">2</label>
				                     <label><input type="radio" name="stud_grd" value="3">3</label>
				                     <label><input type="radio" name="stud_grd" value="4">4</label>
				                </div>
							</div>
						</div>
				</div>
      
           
                <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">현재학기</label>
							<div class="col-sm-8">
								<div class="radio" >
				                     <label><input type="radio" name="stud_qtr" value="1">1</label>
				                     <label><input type="radio" name="stud_qtr" value="2">2</label>
				                </div>
							</div>
						</div>
				</div>
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">학적상태</label>
							<div class="col-sm-8">
								<div class="radio" >
				                     <label><input type="radio" name="stud_schreg_code" checked="checked" value="재학">재학</label>
				<!--                      <label><input type="radio" name="stud_schreg_code" value="휴학">휴학</label> -->
				<!--                      <label><input type="radio" name="stud_schreg_code" value="자퇴">자퇴</label> -->
				                </div>
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">이메일</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_email" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">비밀번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_pw" >
							</div>
						</div>
				</div>      
                
                
                </div>
                <div class="col-md-5">

               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right" style="padding-top:5px;">성별</label>
							<div class="col-sm-8">
								<div class="radio" >
									<div class="col-md-6" style="text-align: center; padding-bottom: 10px;">
				                     <label><input type="radio" name="stud_gen" value="1">남자</label>
				                    </div>
									<div class="col-md-6" style="text-align: left; padding-bottom: 10px;">
				                     <label><input type="radio" name="stud_gen" value="2">여자</label>
				                    </div>
				                 </div>
							</div>
						</div>
				</div>      
                
 
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">계좌번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_act_num" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">은행명</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_bank" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">예금주</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_ah" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">주소</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_addr" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">우편번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_zip" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">보호자 이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_guad_nm" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">보호자 관계</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_guad_rel" >
							</div>
						</div>
				</div>      
                
               <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">보호자 핸드폰</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_guad_hp" >
							</div>
						</div>
				</div>      
                
                
                <div class="col-md-12">
						<div class="form-group">
							<label class="col-sm-4 control-label text-right">학점</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="stud_max_crd" >
							</div>
						</div>
				</div>
                
                
						      
           		 </div>
           		 <div class="col-md-8 col-md-offset-2 input-group">
				            	   <div class="col-md-2 col-md-offset-11" style="margin-top:50px;">
				                		<input class="submit btn btn-danger" type="submit" value="등록하기">
					  		 		</div>
				       		  </div>
            </form>
            </div>
            </div>
</div>
		
		</div>
	</div>
</div>

 
  