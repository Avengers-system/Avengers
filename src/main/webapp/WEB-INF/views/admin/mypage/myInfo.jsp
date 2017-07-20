<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty message }">
	<script type="text/javascript">alert('${message}');</script>
	<c:remove var="message" scope="session" />
</c:if>
<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/myPageSideCategory.jsp"%>
</div>
<div class="col-md-10">
	<c:choose>
		<c:when test="${not empty admin}">
			<div>
	             <img src="<%=request.getContextPath()%>/resources/myInfo_images/${admin.admin_pic}" width="100pt" />
    	         <input type="file" class="form-text" id="validate_userid" name="file"  onclick="ImageChange_go()" aria-required="true">
			</div>
           
			<div class="panel-body" style="padding-bottom:30px;" >
                      <div class="col-md-8">
                        <form class="cmxform" id="signupForm" method="post" action="${myContextPath}/admin/mypage/myInfoUpdate" enctype="multipart/form-data"  novalidate="novalidate">
                        
                          <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text" name="admin_id" value="${admin.admin_id}" aria-required="true">
                              <span class="bar"></span>
                              <label>ID</label>
                            </div>
							</div>
	
                          <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_pw" value="${admin.admin_pw}"  aria-required="true">
                              <span class="bar"></span>
                              <label>Password</label>
                            </div>
                            </div>
                            
                            <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_nm" value="${admin.admin_nm}" aria-required="true">
                              <span class="bar"></span>
                              <label>name</label>
                            </div>
							</div>
							
							<div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_eng_nm" value="${admin.admin_eng_nm}" aria-required="true">
                              <span class="bar"></span>
                              <label>eng_name</label>
                            </div>
							</div>

							 <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_email"  value="${admin.admin_email}" aria-required="true">
                              <span class="bar"></span>
                              <label>Email</label>
                            </div>
                          </div>
                          
                           <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_post"  value="${admin.admin_post}" aria-required="true">
                              <span class="bar"></span>
                              <label>position</label>
                            </div>
                          </div>  
                          
                          <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_bir"  value="${admin.admin_bir}" aria-required="true">
                              <span class="bar"></span>
                              <label>date of birth</label>
                            </div>
                          </div> 
                          
                          <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_regno"   value="${admin.admin_regno}" aria-required="true">
                              <span class="bar"></span>
                              <label>Resident registration number of birth</label>
                            </div>
                          </div>
                          
                           <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_gen"   value="${admin.admin_gen}" aria-required="true">
                              <span class="bar"></span>
                              <label>gender</label>
                            </div>
                          </div>
                          
                           <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_hp" value="${admin.admin_hp}" aria-required="true">
                              <span class="bar"></span>
                              <label>Phone number</label>
                            </div>
                          </div>
                          
                          <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_tel" value="${admin.admin_tel}" aria-required="true">
                              <span class="bar"></span>
                              <label>Tel number</label>
                            </div>
                          </div>
                                    
                            <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_addr" value="${admin.admin_addr}" aria-required="true">
                              <span class="bar"></span>
                              <label>address</label>
                            </div>
                          </div>
                          
                           <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_zip" value="${admin.admin_zip }" aria-required="true">
                              <span class="bar"></span>
                              <label>Zip code</label>
                            </div>
                          </div>
                          
                          <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_bank" value="${admin.admin_bank}" aria-required="true">
                              <span class="bar"></span>
                              <label>Bank</label>
                            </div>
                          </div>
                          
                           <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_act_num" value="${admin.admin_act_num}" aria-required="true">
                              <span class="bar"></span>
                              <label>Account</label>
                            </div>
                          </div>
                          
                            <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                              <input type="text" class="form-text"  name="admin_ah" value="${admin.admin_ah}" aria-required="true">
                              <span class="bar"></span>
                              <label>Account Holder</label>
                            </div>
                          </div>
                                           
                          <div class="col-md-12">
                              <div class="form-group form-animate-checkbox">
                                  <input type="checkbox" class="checkbox" id="validate_agree" name="validate_agree">
                                  <label>confirm</label>
                              </div>
                              <input class="submit btn btn-danger" type="submit" value="수정">
                        </div>
                      </form>

                    </div>
                  </div>
</c:when>
</c:choose>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
//관리자가 아이디가 admin이면 개인정보를 변경할 수 있다.
//readonly remove
$(function(){
	if('${admin.admin_post}' == "총괄"){
			$("input").removeAttr("readonly");
	}
});
//개인정보
function myInfo_go(){
	location.href="${myContextPath}/admin/mypage/";
}
//스케줄보기
function mySchedule_go(){
	location.href="${myContextPath}/admin/mypage/mySchedule";
}
</script>

