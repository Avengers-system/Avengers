<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
     
<form name="insertProfessor"  method="post" 
	action="${pageContext.request.contextPath }/admin/insertProfessor" 
	  enctype="multipart/form-data">
	  
	  <fieldset>
		<legend>교수 등록</legend>
				<div class="input-group">
				<input type="hidden" name="prfs_num">
				 <span class="input-group-addon" >이름</span>
				  <input type="text" class="form-control" name="prfs_nm" >
				</div>
				<br>
				<div class="input-group">
				 <span class="input-group-addon" >영문이름</span>
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

		                  <input type="text" name="prfs_eng_nm"/> <br>
		 생년월일                 <input type="data" name="prfs_bir"/> <br>
		 이메일                   <input type="text" name="prfs_email"/> <br>
		 비밀번호                 <input type="text" name="prfs_pw"/> <br>
		 주민등록번호             <input type="text" name="prfs_regno"/> <br>
		 성별                     <input type="text" name="prfs_gen"/> <br>
		 사진경로                 <input type="file" name="prfs_pic"/> <br>
		 계좌번호                 <input type="text" name="prfs_act_num"/> <br>
		 은행명                   <input type="text" name="prfs_bank"/> <br>
		 예금주                   <input type="text" name="prfs_ah"/> <br>
		 주소                     <input type="text" name="prfs_addr"/> <br>
		 우편번호                 <input type="text" name="prfs_zip"/> <br>
		 전화번호                 <input type="text" name="prfs_tel"/> <br>
		 휴대폰번호               <input type="text" name="prfs_hp"/> <br>
<!-- dept_num뽑아야됨 -->
		 학과                 
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
		 
		 <input type="submit" value="등록하기">
		 
</form>
  
   <form action="#">
   
      
      <div class="container">
         <div class="essen">
            <div class="imfom">
               <div class="form-group">
                  <label class="control-label col-sm-2" for="id">아이디</label>
                  <div class="col-sm-6">
                    <div class="input-group">
                      <input type="text" class="form-control" id="mem_id" name="id" placeholder="아이디를 입력하세요.">
                      <span class="input-group-btn">
                        <button class="btn btn-default" id="idCheck" type="button">중복확인</button>
                         <span class="msgCheckId"></span>
                      </span>
                    </div>
                  </div>
                  
               </div>

               <div class="form-group">
                  <label class="control-label col-sm-2" for="pwd1">비밀번호</label>
                  <div class="col-sm-6">
                     <input type="password" class="form-control" id="pwd1"
                        placeholder="비밀번호를 입력하세요." name="pwd1">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-2" for="pwd1">비밀번호확인</label>
                  <div class="col-sm-6">
                     <input type="password" class="form-control" id="pwd2"
                        placeholder="위와 같은 비밀번호를 입력하세요." name="pwd2">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-2" for="name">이름</label>
                  <div class="col-lg-6">
                    <div class="input-group">
                      <input type="text" class="form-control" id="name"
                        placeholder="이름을 입력하세요." name="name" aria-label="name">
                      <span class="input-group-addon">
                      <label><input type="checkbox" aria-label="name">&nbsp;&nbsp;공개</label>
                      </span>
                    </div>
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-2" for="birth">생년월일</label>
                  <div class="col-sm-6">
                     <input type="date" class="form-control" id="bir"
                        placeholder="year" name="bir">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-2" for="name">전화번호</label>
                  <div class="col-lg-6">
                    <div class="input-group">
                      <input type="tel" class="form-control" id="tel"
                        placeholder="전화번호를 입력하세요." name="tel" aria-label="tel">
                    </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="control-label col-sm-2" for="email">이메일</label>
                  <div class="col-lg-6">
                    <div class="input-group">
                      <input type="email" class="form-control" id="email"
                        placeholder="이메일을 입력하세요." name="email" aria-label="email">
                    </div>
                  </div>
               </div>
               
<script>
//우편번호 검색
$(function(){
   $('#zip-btn').on('click',function(){
      var url = "signup/zipSearch.jsp";
      window.open(url,"우편번호검색","width=500 height=400");      
   });
});
</script>

               <div class="form-group">
                  <label class="control-label col-sm-2" for="zip">우편번호</label>
                  <div class="col-sm-6">
                    <div class="input-group">
                      <input type="text" class="form-control" id="zip" 
                         placeholder="우편번호 버튼을 눌러주세요" name="zip" disabled>
                      <span class="input-group-btn">
                        <button id="zip-btn"class="btn btn-default" type="button">우편번호</button>
                      </span>
                    </div>
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-2" for="addr">주소</label>
                  <div class="col-sm-6">
                     <input type="text" class="form-control" id="add1"
                        placeholder="주소는 자동으로 입력 됩니다." name="addr" disabled>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="addr">상세주소</label>
                  <div class="col-sm-6">
                     <input type="text" class="form-control" id="add2"
                        placeholder="상세주소 입력하세요" name="addr">
                  </div>
               </div>
            </div>
         </div>
         </div>
      </fieldset>
      </form>

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
                $(".image-preview-filename").val(file.name);            
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
            $(".image-preview-filename").val(file.name);            
            $("#profile-image").attr('src', e.target.result);
        }        
        reader.readAsDataURL(file);
    });
   
     
});
</script>

   <!-- 선택사항 -->
   <form class="form-horizontal" action="#">
   <fieldset class="signup_cas_fs">
      <legend id="choice" class="signup_cas_ld">선택사항<span> : 클릭!</span></legend>
      <div class="contSelect hide">
         <div class="box-body">
            <div class="col-sm-3">
               <div class="filess" style="width:290px; height:400px;">
                  <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
                     id="profile-image" class="img-circle img-responsive">
                  <input id="profile-image-input"  accept="image/png, image/jpeg, image/gif" class="hidden" type="file">
                  <div style="color:#999;">그림을 클릭하여 이미지를 변경합니다.</div>   
               </div>
            </div>
             
            <div class="form-group">
               <label class="control-label col-sm-1" for="upload">이미지</label>
               <div class="col-sm-4">
                 <div class="input-group">
                   <input type="text" class="form-control image-preview-filename" placeholder="사진 파일을 업로드 하세요." disabled="disabled">
                   <span class="input-group-btn">
                     <div class="btn btn-default image-preview-input">
                           <span class="glyphicon glyphicon-folder-open" />
                           <span class="image-preview-input-title">업로드</span>
                           <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
                        </div>
                   </span>
                 </div>
               </div>
                
               <p id="enter"></p>
               <p id="enter"></p>
               
               <label class="control-label col-sm-1" for="nickname">닉네임</label>
               <div class="col-sm-4">
                 <div class="input-group">
                   <input type="text" class="form-control" id="nick" name="id" placeholder="닉네임을 입력하세요.">
                   <span class="input-group-btn">
                     <button class="btn btn-default" id="nickCheck" type="button">중복확인</button>
                       <span class="msgCheckNick"></span>
                   </span>
                 </div>
               </div>
               
               <p id="enter"></p>
               <div id="add-textField"></div>
               <p id="enter"></p>
 
               
            </div>
         </div>
  
    
      </div>
   </fieldset>
   
 
   </form>
 