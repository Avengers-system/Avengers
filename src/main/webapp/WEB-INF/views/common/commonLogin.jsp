 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<body id="mimin" class="dashboard form-signin-wrapper bg-white">
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
				<p>아무런 행동없이 10분이지나면 자동으로 로그아웃됩니다.</p>
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
	
	<c:if test="${not empty resultTitle}">
	<c:if test="${resultTitle=='조회실패' }">
		<div
			class="alert alert-warning col-md-12 col-sm-12 alert-icon alert-dismissible fade in"
			role="alert">
	 </c:if>		
	<c:if test="${resultTitle=='조회성공' }">
		<div
			class="alert alert-success col-md-12 col-sm-12 alert-icon alert-dismissible fade in"
			role="alert">
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

		<form class="form-signin" action="<c:url value='/loginForm'/>"
			method="post">
			<div class="panel periodic-login">
				<span class="atomic-number"></span>
				<div class="panel-body text-center">
					<p class="atomic-mass">HANVARD</p>
					<p class="atomic-mass">UNIVERSITY</p>
					<p class="element-name"></p>


					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="text" class="form-text" required name="id"> <span
							class="bar"></span> <label>아이디</label>
					</div>
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="password" class="form-text" required name="pwd">
						<span class="bar"></span> <label>비밀번호</label>
					</div>
					<input type="submit" class="btn col-md-12" value="로그인" />
				</div>
				<div class="text-center" style="padding: 5px;">
					<a href="#" data-toggle="modal" data-target="#findId">아이디찾기&nbsp;&nbsp;&nbsp;</a>
					<a href="a" data-toggle="modal" data-target="#findPwd">비밀번호
						찾기 </a>
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
						<h4 class="modal-title">아이디 찾기</h4>
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
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="findPwd">
		<div class="modal-dialog">
			<form action="<c:url value='/findPwd'/>" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">비밀번호 찾기</h4>
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
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

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
      		
      
							$(document).ready(function() {
								$('input').iCheck({
									checkboxClass : 'icheckbox_flat-aero',
									radioClass : 'iradio_flat-aero'
								});
							});
						</script>
	<!-- end: Javascript -->
</body>
</html>
  