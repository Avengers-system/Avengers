<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="row">
		<div class="col-sm-12" id="studentTopCategory">
			<input type="button" value="My Page"> 
			<input type="button" value="학적관리" onclick="location.href='schoolRegister.jsp'"> 
			<input type="button" value="수업관리" onclick="location.href='lecture.jsp'">
			<input type="button" value="수강신청" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'">
			<input type="button" value="등록/장학"onclick="location.href='scholarshipRegister.jsp'"> 
			<input type="button" value="상담" onclick="location.href='consultGo.jsp'">
			<input type="button" value="Help Desk">
		</div>
	</div>

	<!-- 학생개인정보 -->
	<h3> 개인정보 </h3>
	<br> 이름 : ${studentInfo.stud_nm}
	<br> 학과 : ${studentInfo.stud_dept }
	<br> 학년 : ${studentInfo.stud_grd}
	<br> 학적상태 : ${studentInfo.stud_schreg_code}
	<br> 최대 신청가능 학점 : ${studentInfo.stud_max_crd}
	<br> 현재 신청 학점 : ${cur_score}
	<br> 
	<!-- 시간표보기 -->
	<button onclick="">시간표보기</button> 
	<br><br>
	<!-- 셀렉트박스와 검색 셀렉트박스는 학년,이수구분 -->
	<form action = "${pageContext.request.contextPath}/student/admissionApplication" method="post">
		학년 <select name="sjt_estm_grd">			
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select> 이수구분 <select name="sjt_cd">
			<option selected="selected" value="전%">전공</option>
			<option value="교%">교양</option>
		</select> 강의명: <input type="text" name="lct_nm" />
		<input type = "submit" value="검색">
	</form>
	
	<!-- 강의리스트 -->
	<h3>강의리스트</h3>
	<table>
		<tr>
			<td>장바구니담기</td>
			<td>수강신청</td>
			<td>강의번호</td>
			<td>이수구분</td>
			<td>강의명</td>
			<td>강의실</td>
			<td>교수명</td>
			<td>시간</td>
			<td>학점</td>
			<td>수강제한인원</td>
			<td>수강가능인원</td>
			<td>강의계획서</td>
		</tr>
		<c:choose>
			<c:when test="${not empty lectureList}">
				<c:forEach var="lct" items="${lectureList }" varStatus="status">
					<tr>						
								<td>
								<form action = "${pageContext.request.contextPath}/student/insertCart" method="post">
								<input type="hidden" name="cart_lct" value="${lct.get('lct_num')}" />
								<input type = "submit" value="장바구니담기">
								</form>
								</td>
						<c:choose>		
							<c:when test="${term=='본수강신청' }">								
								<td>
								<form action = "${pageContext.request.contextPath}/student/insertTl" method="post">
								<input type="hidden" name="lct_num" value="${lct.get('lct_num')}" />
								<input type = "submit" value="신청">
								</form>
								</td>
							</c:when>
						</c:choose>
						
						<td>${lct.get("lct_num")}</td>
						<td>${lct.get("sjt_cd")}</td>
						<td>${lct.get("lct_nm") }</td>
						<td>${lct.get("lr_num") }</td>
						<td>${lct.get("prfs_nm") }</td>
						<td>${lct.get("lr_date") }</td>
						<td>${lct.get("lct_crd") }</td>
						<td>${lct.get("lct_qua_num") }</td>
						<td>${lct.get("lct_qua_num") - lct.get("lct_cnt_num") }</td>
						<td><button name="${lct.get('lct_num')}" onclick="">강의계획서</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 강의신청내역리스트(본수강신청기간에만) -->
	<c:choose>
		<c:when test="${term=='본수강신청' }">
		<h3>강의신청내역</h3>
			<table>
				<tr>
					<td>취소</td>
					<td>강의번호</td>
					<td>이수구분</td>
					<td>강의명</td>
					<td>강의실</td>
					<td>교수명</td>
					<td>시간</td>
					<td>학점</td>
					<td>강의계획서</td>
				</tr>
				<c:choose>
					<c:when test="${not empty admissionApplicationList}">
						<c:forEach var="admission" items="${admissionApplicationList }" varStatus="status">
							<tr>
								<td>
								<form action = "${pageContext.request.contextPath}/student/deleteTl" method="post">
								<input type="hidden" name="tl_num" value="${admission.get('tl_num')}" />
								<input type = "submit" value="취소">
								</form>
								</td>
								<td>${admission.get("lct_num")}</td>
								<td>${admission.get("sjt_cd")}</td>
								<td>${admission.get("lct_nm")}</td>
								<td>${admission.get("lr_num") }</td>
								<td>${admission.get("prfs_nm") }</td>
								<td>${admission.get("lr_date") }</td>
								<td>${admission.get("lct_crd") }</td>
								<td><button name="${admission.get('tl_num')}" onclick="">강의계획서</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</c:when>
	</c:choose>
	<!-- 장바구니리스트 -->
	<h3>장바구니리스트</h3>
	<table>
		<tr>
			<td>취소</td>
			<c:choose>				
				<c:when test="${term=='본수강신청' }">
					<td>신청</td>
				</c:when>
			</c:choose>
			<td>강의번호</td>
			<td>이수구분</td>
			<td>강의명</td>
			<td>강의실</td>
			<td>교수명</td>
			<td>시간</td>
			<td>학점</td>
			<td>강의계획서</td>
		</tr>
		<c:choose>
			<c:when test="${not empty cartList}">
				<c:forEach var="cart" items="${cartList }">
					<tr>
						
								<td>
								<form action = "${pageContext.request.contextPath}/student/deleteCart" method="post">
								<input type="hidden" name="cart_lct" value="${cart.get('lct_num')}" />
								<input type = "submit" value="취소">
								</form>
								</td>
						<c:choose>		
							<c:when test="${term=='본수강신청' }">
								<td>
								<form action = "${pageContext.request.contextPath}/student/insertTl" method="post">
								<input type="hidden" name="lct_num" value="${cart.get('lct_num')}" />
								<input type = "submit" value="신청">
								</form>
								</td>
							</c:when>
						</c:choose>
						<td>${cart.get("lct_num")}</td>
						<td>${cart.get("sjt_cd") }</td>
						<td>${cart.get("lct_nm") }</td>
						<td>${cart.get("lr_num") }</td>
						<td>${cart.get("prfs_nm") }</td>
						<td>${cart.get("lr_date") }</td>
						<td>${cart.get("lct_crd") }</td>
						
						<td><button name="${cart.get('lct_num')}" onclick="">강의계획서</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<script>
	
	</script>

</body>
</html>