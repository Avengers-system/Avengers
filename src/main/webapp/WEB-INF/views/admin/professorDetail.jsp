<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
 
		<div class="col-md-12">
			<legend>상세정보</legend>
	
		<form name="updateProfessor" enctype="multipart/form-data" action="${pageContext.request.contextPath }/admin/updateProfessor" method="post">
	
					<div class="col-md-12" >
			         <!-- 이미지 미리보기 -->
			               <div class="filess" >
			                  <img  style="height:150px;width:130px;" alt="professor Pic" 
			                  src="<%=request.getContextPath()%>/resources/admin_professor_images/${professor.prfs_pic}"
			                     id="profile-image" class="img-circle img-responsive">
			                  <input style="width:100px;" id="profile-image-input"  accept="image/png, image/jpeg, image/gif" class="hidden" type="file">
			               </div>
			               
			               <label class='control-label'>이미지</label>
			                      <span class="input-group-btn">
			                       <input type="text" class="form-control" value="${professor.prfs_pic}" style="width:230px;" id="image-preview-filename" disabled="disabled">
			                            <div class="btn btn-default image-preview-input">
			                              <input type="file" accept="image/png, image/jpeg, image/gif" name="prfs_pic"/>
					                      <span class="image-preview-input-title">업로드</span>
			                           </div>
			                      </span>
			        </div>
	
				<div class="col-md-6">
						<div class="input-group">
					 <span class="input-group-addon" >교수번호 </span>
					  <input type="hidden" class="form-control" name="prfs_num" value="${professor.prfs_num}">
					  ${professor.prfs_num}
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
					  <input type="date" class="form-control" name="prfs_bir" value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${professor.prfs_bir}" />'>
					</div>	
					<br>	
					<div class="input-group">
					 <span class="input-group-addon" >주민등록번호</span>
					  <input type="text" class="form-control" name="prfs_regno" value="${professor.prfs_regno}">
					</div>
					<br>		
					<div class="input-group">
					 <span class="input-group-addon" >성별</span>
					
					 <div class="radio" >
					 
					 <c:choose>
							<c:when test="${professor.prfs_gen eq '1'}">
			                     <label>
			                     <input type="radio"   name="prfs_gen" checked="checked" value="1">남자</label>
			                     <label>
			                     <input type="radio"     value="2">여자</label>
	                  		</c:when>
							<c:otherwise>
			                     <label>
			                     <input type="radio"    value="1">남자</label>
								<label>
			                     <input type="radio"  name="prfs_gen"  checked="checked" value="2">여자</label>
		             		</c:otherwise>
					</c:choose>
					
	                </div>
					
					</div>		
					<br>
						<div class="input-group">
						 <span class="input-group-addon" >휴대폰번호</span>
						  <input type="text" class="form-control" name="prfs_hp" value="${professor.prfs_hp}">
						</div>		
		
	
	</div>
	
	<div class="col-md-6">
	
			<div class="input-group">
					 <span class="input-group-addon" >전화번호</span>
					  <input type="text" class="form-control" name="prfs_tel" value="${professor.prfs_tel}">
			</div>
					
			<div class="input-group">
					 <span class="input-group-addon" >계좌번호</span>
					  <input type="text" class="form-control" name="prfs_act_num" value="${professor.prfs_act_num}">
			</div>

			<div class="input-group">
					 <span class="input-group-addon" >은행명</span>
					  <input type="text" class="form-control" name="prfs_bank" value="${professor.prfs_bank}">
			</div>

			<div class="input-group">
					 <span class="input-group-addon" >예금주</span>
					  <input type="text" class="form-control" name="prfs_ah" value="${professor.prfs_ah}">
			</div>
	
			<div class="input-group">
					 <span class="input-group-addon" >우편번호</span>
					  <input type="text" class="form-control" name="prfs_zip" value="${professor.prfs_zip}">
			</div>

			<div class="input-group">
					 <span class="input-group-addon" >주소</span>
					  <input type="text" class="form-control" name="prfs_addr" value="${professor.prfs_addr}">
			</div>
			
			<div class="input-group">
					 <span class="input-group-addon" >이메일</span>
					  <input type="text" class="form-control" name="prfs_email" value="${professor.prfs_email}">
			</div>

			<div class="input-group">
					 <span class="input-group-addon" >비밀번호</span>
					  <input type="text" class="form-control" name="prfs_pw" value="${professor.prfs_pw}">
			</div>
	
	</div>
		<hr />
			<div class="col-md-5 detailBtn">
				<input type="submit" value="수정하기" >
			</div>
			<div class="col-md-5 detailBtn">
				<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/deleteProfessor?prfs_num=${professor.prfs_num}'">삭제하기</button>
			</div>
	</form>
		
	</div>
