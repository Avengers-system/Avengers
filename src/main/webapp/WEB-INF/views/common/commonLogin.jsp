 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty sessionEnd}">
		<div
			class="alert alert-warning col-md-12 col-sm-12 alert-icon alert-dismissible fade in"
			role="alert">
			<div class="col-md-2 col-sm-2 icon-wrapper text-center">
				<span class="fa fa-exclamation-triangle fa-2x"></span>
			</div>
			<div class="col-md-10 col-sm-10">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<p>
					<strong>세션이 만료되었습니다.</strong>
				</p>
				<p>다른 사용자가 해당아이디로 접속했습니다.</p>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty logout}">
		<div
			class="alert alert-success col-md-12 col-sm-12 alert-icon alert-dismissible fade in"
			role="alert">
			<div class="col-md-2 col-sm-2 icon-wrapper text-center">
				<span class="fa fa-check fa-2x"></span>
			</div>
			<div class="col-md-10 col-sm-10">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<p>
					<strong>로그아웃이 성공하였습니다.</strong>
				</p>
			</div>
		</div>
	</c:if>


<c:if test="${not empty error}">
		<div
			class="alert alert-warning col-md-12 col-sm-12 alert-icon alert-dismissible fade in"
			role="alert">
			<div class="col-md-2 col-sm-2 icon-wrapper text-center">
				<span class="fa fa-exclamation-triangle fa-2x"></span>
			</div>
			<div class="col-md-10 col-sm-10">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<p>
					<strong>로그인이 실패하였습니다</strong>
				</p>
				<p>아이디 혹은 비밀번호를 다시한번 확인해주세요.</p>
			</div>
		</div>
</c:if>
<c:if test="${not empty resultTitle}">
	
	<c:if test="${resultTitle=='조회실패' }">
		<div class="alert alert-warning col-md-12 col-sm-12 alert-icon alert-dismissible fade in" role="alert">
	</c:if>		
	<c:if test="${resultTitle=='조회성공' }">
		<div class="alert alert-success col-md-12 col-sm-12 alert-icon alert-dismissible fade in" role="alert">
	</c:if>
	<div class="col-md-2 col-sm-2 icon-wrapper text-center">
		<c:if test="${resultTitle=='조회실패' }">
			<span class="fa fa-exclamation-triangle fa-2x"></span>
		</c:if>
		<c:if test="${resultTitle=='조회성공' }">
			<span class="fa fa-check fa-2x"></span>
		</c:if>
	</div>
	<div class="col-md-10 col-sm-10">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">×</span>
		</button>
		<p>
			<strong>${resultTitle}</strong>
		</p>
		<p>${resultMsg}</p>
	</div>
</div>
</c:if>









<div class="container">
        <form class="form-signin" action="<c:url value='/loginForm'/>"	method="post">
          <div class="panel periodic-login">
              <span class="atomic-number">&copy;Avengers</span>
              <div class="panel-body text-center">
                  <h1 class="atomic-symbol">A</h1>
                  <p class="atomic-mass">학사관리시스템</p>
                  <p class="element-name">UNIVERSITY</p>

                  <i class="icons icon-arrow-down"></i>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" required name="id">
                    <span class="bar"></span>
                    <label>Username</label>
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="password" class="form-text" required name="pwd">
                    <span class="bar"></span>
                    <label>Password</label>
                  </div>
     
                  <input type="submit" class="btn col-md-12" value="SignIn"/>
              </div>
                <div class="text-center" style="padding:5px;">
                    <a href="#" data-toggle="modal" data-target="#findId">Forgot Username </a>
                    <a href="a" data-toggle="modal" data-target="#findPwd">| Password</a>
                </div>
          </div>
        </form>

      </div>







	<div class="modal fade" id="findId">
		<div class="modal-dialog">
			<form action="<c:url value='/findId'/>" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"><span class="icons icon-cursor"></span>&nbsp;&nbsp;아이디 찾기</h4>
					</div>
					<div class="modal-body">
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" required name="name">
							<span class="bar"></span> <label>이름</label>
						</div>
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" required name="email">
							<span class="bar"></span> <label>이메일</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">전송</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="findPwd">
		<div class="modal-dialog">
			<form action="<c:url value='/findPwd'/>" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"><span class="icons icon-cursor"></span>&nbsp;&nbsp;비밀번호 찾기</h4>
					</div>
					<div class="modal-body">
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" required name="id">
							<span class="bar"></span> <label>아이디</label>
						</div>
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" required name="email">
							<span class="bar"></span> <label>이메일</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">전송</button>
					</div>
				</div>
			</form>
		</div>
	</div>


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
	

  