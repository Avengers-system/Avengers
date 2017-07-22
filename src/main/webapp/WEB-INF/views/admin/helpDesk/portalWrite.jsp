<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-10">
	<div class="col-md-12 panel">
		<div class="col-md-12 panel-heading">
			<h1>포털 글쓰기</h1>
		</div>


		<div class="col-md-12 panel-body" style="padding-bottom: 30px; margin-left: 70px;">
			<c:set var="myContextPath" value="${pageContext.request.contextPath}" />

			<form name="insertPortalBoard" class="cmxform" id="signupForm"
				action="${myContextPath}/admin/portalWrite" method="post"
				enctype="multipart/form-data">
				
				<div class="col-md-6">
				
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important; width:300px; text-align: center;">
						<label style="text-align: center;">게시판번호</label><br>
						<br> <input type="text" name="board_num" readonly
							class="form-text" id="validate_firstname"
							name="validate_firstname" required
							value="${insertBoard.board_num}" style="width: 150px;"> <span
							class="bar"></span>
					</div>

					<div class="form-group form-animate-text"
						style="margin-top: 40px !important; width:300px; ">
						<label>제목</label><br> <input type="text" name="board_title"
							class="form-text" id="validate_lastname" name="validate_lastname"
							required style="width: 250px; margin-top: 10px;"> <span class="bar"></span>
					</div>


					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<label>내용</label><br> <input type="text" name="board_cont"
							class="form-text" id="validate_lastname" name="validate_lastname"
							required style="width: 250px; margin-top: 10px;"> <span class="bar"></span>
					</div>

					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<label>날짜 </label><br> <br> <input type="text"
							name="board_date" class="form-text" id="validate_lastname"
							name="validate_lastname" required style="width: 250px; margin-top: 10px;"
							value="${insertBoard.board_date}" readonly> <span
							class="bar"></span>
					</div>
					<%
						User user = (User) SecurityContextHolder.getContext()
								.getAuthentication().getPrincipal();
					%>


					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<label>작성자</label><br> <input type="text" name="board_writer"
							class="form-text" id="validate_lastname" name="validate_lastname"
							required style="width: 250px; margin-top: 10px;" value="<%=user.getUsername()%>"> <span class="bar"></span>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">

						<label>첨부파일</label><br>
						<br> <input type="file" name="boardaf" id="validate_password"
							name="validate_password" required
							style="width: 250px; margin-top: 5px; margin-left: 5px;">
						<span class="bar"></span>
					</div>

					
					
						<div class="form-group form-animate-text"
						style="margin-top: 40px !important; width:300px; text-align: center;">
						<label>분류코드</label><br>
						<br> <input type="text" name="board_bc" readonly
							class="form-text" id="validate_firstname"
							name="validate_firstname" required
							value="PORTAL" style="width: 150px;">
						<span class="bar"></span>
					</div>

					<div class="form-group form-animate-text"
						style="margin-top: 40px !important; width:300px; text-align: center;">
						<label>조회수</label><br><br>
					<input type="text" name="board_count" readonly value="0"
					class="form-text" id="validate_firstname"
							name="validate_firstname" required
							 style="width: 150px;">
					<span class="bar"></span>
					</div>
					
					
					
					
				
					
					
					
					
					
					
					
					
					<div>
					<input class="submit btn btn-danger" type="submit" value="등록" style="margin-left: 5px;">
				</div>
					
					
					</div>
					
			</form>
		</div>
	</div>
</div>



<!-- css -->
<div class="col-md-10">
	<div class="col-md-12 panel">
		<div class="col-md-12 panel-heading">
			<h4>Form Validation</h4>
		</div>
		<div class="col-md-12 panel-body" style="padding-bottom: 30px; margin-left: 85px;">
			<div class="col-md-12">
				<form class="cmxform" id="signupForm" method="get" action="">
					<div class="col-md-6" style="width:300px;">
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">

							<input type="text" class="form-text" id="validate_firstname"
								name="validate_firstname" required> <span class="bar"></span>
							<label>Firstname</label>
						</div>

						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" id="validate_lastname"
								name="validate_lastname" required> <span class="bar"></span>
							<label>Lastname</label>
						</div>

						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" id="validate_username"
								name="validate_username" required> <span class="bar"></span>
							<label>Username</label>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="password" class="form-text" id="validate_password"
								name="validate_password" required> <span class="bar"></span>
							<label>Password</label>
						</div>

						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="password" class="form-text"
								id="validate_confirm_password" name="validate_confirm_password"
								required> <span class="bar"></span> <label>Confirm
								Password</label>
						</div>

						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" class="form-text" id="validate_email"
								name="validate_email" required> <span class="bar"></span>
							<label>Email</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group form-animate-checkbox">
							<input type="checkbox" class="checkbox" id="validate_agree"
								name="validate_agree"> <label>Please agree to
								our policy</label>
						</div>
						<input class="submit btn btn-danger" type="submit" value="Submit">
					</div>
				</form>

			</div>
		</div>
	</div>
</div>