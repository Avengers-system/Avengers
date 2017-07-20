 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
  <body id="mimin" class="dashboard form-signin-wrapper bg-white">

      <div class="container" >

        <form class="form-signin" action="<c:url value='/loginForm'/>" method="post">
          <div class="panel periodic-login">
              <span class="atomic-number"></span>
              <div class="panel-body text-center">
<!--                   <div class="col-md-2"> -->
<%-- 				<a href="${pageContext.request.contextPath}/main"><img --%>
<!-- 					class="logo" style="height: 60px; width: 130px;" -->
<%-- 					src="${pageContext.request.contextPath}/resources/images/LOGO.png"></a> --%>
<!-- 			</div> -->
				  <p class="atomic-mass">HANVARD</p>
                  <p class="atomic-mass">UNIVERSITY</p>
                  <p class="element-name"></p>

                  
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" required name="id">
                    <span class="bar"></span>
                    <label>아이디</label>
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="password" class="form-text" required name="pwd">
                    <span class="bar"></span>
                    <label>비밀번호</label>
                  </div>                 
                  <input type="submit" class="btn col-md-12" value="로그인"/>
              </div>
                <div class="text-center" style="padding:5px;">
                    <a href="forgotpass.html">아이디찾기 </a>
                    <a href="reg.html">| 비밀번호찾기</a>
                </div>
          </div>
        </form>

      </div>

      <!-- end: Content -->
      <!-- start: Javascript -->
      <script src="asset/js/jquery.min.js"></script>
      <script src="asset/js/jquery.ui.min.js"></script>
      <script src="asset/js/bootstrap.min.js"></script>

      <script src="asset/js/plugins/moment.min.js"></script>
      <script src="asset/js/plugins/icheck.min.js"></script>

      <!-- custom -->
      <script src="asset/js/main.js"></script>
      <script type="text/javascript">
       $(document).ready(function(){
         $('input').iCheck({
          checkboxClass: 'icheckbox_flat-aero',
          radioClass: 'iradio_flat-aero'
        });
       });
     </script>
     <!-- end: Javascript -->
   </body>
 </html>
  