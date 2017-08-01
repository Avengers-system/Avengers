<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
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
      <div class="panel-body">
         <c:choose>
            <c:when test="${not empty admin}">
               <form name="modAdmin" id="modAdmin" action="${pageContext.request.contextPath}/admin/mypage/myInfoUpdate"
                  enctype="multipart/form-data" method="post">
                  
                     <div class="col-md-12" style="margin-top:30px;">
                       <!-- 이미지 미리보기 -->
                       <div class="col-md-12">
                        <div class="filess" style="margin-bottom:20px;">
                           <img  style="height:150px;width:130px; margin-left:50px; " alt="User Pic" src="${pageContext.request.contextPath}/resources/myInfo_images/${admin.admin_pic}"
                              id="profile-image" class="img-circle img-responsive">
                           <input style="width:100px;" id="profile-image-input"  accept="image/png, image/jpeg, image/gif" class="hidden" type="file" name="file" value="${admin.admin_pic}">
                        </div>
                       </div>
                      <span class="input-group-btn">
                            <div class="col-md-8">
                            <div class="col-md-4">
                               <input type="text" value="${admin.admin_pic}" class="form-control" style="width:310px;" id="image-preview-filename" >
                            </div>
                            <div class="col-md-1 col-md-offset-1">
                               <div class="btn btn-default image-preview-input">
                                 <input type="file" accept="image/png, image/jpeg, image/gif" name="file"  style="display: inline-block;"/>
                                 <span class="image-preview-input-title">업로드</span>
                              </div>
                            </div>
                            
                           </div>
                      </span>
        </div> 
                  
                  <div class="col-md-12" id="admin_inform">
                     <div class="col-md-5">
                        <label class="control-label">아이디</label> 
                        <input type="text" class="form-control" name="admin_id" value="${admin.admin_id}" style="width:350px;"/>
                        <label class="control-label">비밀번호</label>
                        <input type="password"
                           class="form-control" name="admin_pw" value="${admin.admin_pw}" style="width:350px;" />
                        <label class="control-label">비밀번호확인</label><br/>
                        <input type="password"
                           class="form-control" name="admin_pw_confirm"
                           value="${admin.admin_pw}" style="width:350px;margin-right: 0px; display: inline-block;">
                        <font name="check"  color="red" size="2" style="width:150px; "></font><br/>
                        <label class="control-label">이름</label> 
                        <input type="text" class="form-control" name="admin_nm"
                           value="${admin.admin_nm}" style="width:350px;">
                        <label class="control-label">영문이름</label>
                        <input type="text" class="form-control" name="admin_eng_nm"
                           value="${admin.admin_eng_nm}" style="width:350px;"> 
                        <label class="control-label">이메일</label> 
                        <input type="email" class="form-control" name="admin_email"
                           value="${admin.admin_email}" style="width:350px;"> 
                        <label class="control-label">직위</label>
                        <input type="text" class="form-control" name="admin_post"
                           value="${admin.admin_post}" style="width:350px;">
                        <label class="control-label">생년월일</label> 
                        <input type="text" class="form-control" name="admin_bir"
                           value="${admin.admin_bir}" style="width:350px;"> 
                     </div>
                     <div class="col-md-5">
                        <label class="control-label">휴대폰번호</label> 
                        <input type="text"
                           class="form-control" name="admin_hp" value="${admin.admin_hp}" style="width:350px;"
                           pattern="010-\d{3,4}-\d{4}"
                           >
                        <label class="control-label">집전화번호</label>
                        <input type="text" class="form-control" name="admin_tel"
                           value="${admin.admin_tel}" style="width:350px;"
                           pattern="0\d{2}--\{3}-\{4}"
                           >
                        <label class="control-label">주소</label>
                        <input type="text" class="form-control" name="admin_addr"
                           value="${admin.admin_addr}" style="width:350px;">
                        <label class="control-label">우편번호</label>
                        <input type="text" class="form-control" name="admin_zip"
                           value="${admin.admin_zip}" style="width:350px;">
                        <label class="control-label">은행</label> 
                        <input type="text" class="form-control" name="admin_bank"
                           value="${admin.admin_bank}" style="width:350px;">
                        <label class="control-label">계좌번호</label> 
                        <input type="text" class="form-control" name="admin_act_num"
                           value="${admin.admin_act_num}" style="width:350px;">
                        <label class="control-label">계좌주</label>
                        <input type="text" class="form-control" name="admin_ah"
                           value="${admin.admin_ah}" style="width:350px;">
                        <input
                           class="submit btn btn-danger" type="button" onclick="admin_mod()" value="수정" style="margin-top:30px;">
                     </div>
                  </div>
               </form>
            </c:when>
         </c:choose>
      </div>
   </div>
</div>
<style>
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
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<script>
$('input[name=admin_pw_confirm]').focusout(function(){
      $(document).ready(function() {
             var admin_pw = $('input[name=admin_pw]').val();
             var admin_pw_confirm = $('input[name=admin_pw_confirm]').val();
             
            if( admin_pw != admin_pw_confirm){
               $('font[name=check]').text();
               $('font[name=check]').html("비밀번호가 일치하지 않습니다.");
            }else{
               $('font[name=check]').text();
               $('font[name=check]').html("비밀번호가 일치합니다.");
            }
            
         });
   });
   
function admin_mod(){
   $(document).ready(function() {
          var admin_pw = $('input[name=admin_pw]').val();
          var admin_pw_confirm = $('input[name=admin_pw_confirm]').val();
          var admin_frm  = document.modAdmin;
          
         if( admin_pw != admin_pw_confirm){
            $('font[name=check]').text();
            $('font[name=check]').html("비밀번호가 일치하지 않습니다.");
            alert('비밀번호가 일치하지 않습니다.');
         }else{
            $('font[name=check]').text();
            $('font[name=check]').html("비밀번호가 일치합니다.");
            
            admin_frm.method='post';
            admin_frm.encoding='multipart/form-data';
            admin_frm.action='${pageContext.request.contextPath}/admin/mypage/myInfoUpdate';
            admin_frm.submit();
            
         }
         
      });
}
</script>
