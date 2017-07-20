<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>

<
<button id="adminMain" onclick="adminMain_go()">관리자</button>
<button id="logout" onclick="logout_go()">로그아웃</button><br/>
<button id="myInfo" onclick="myInfo_go()">개인정보</button><br/>
<button id="mySchedule" onclick="mySchedule_go()">개인일정관리</button><br/>



<button id="adminMain" onclick="adminMain_go()">관리자</button><br/>
<button id="myPage" onclick="mypage_go()">mypage</button>
<button id="profPage" onclick="location.href='${pageContext.request.contextPath}/admin/professorManage'" >교수관리</button>
<button id="studPage" onclick="location.href='${pageContext.request.contextPath}/admin/studentManage'">학생관리</button>
<button id="classPage">강의관리</button>
<button id="boardPage">HelpDesk</button>
<button id="logout" onclick="logout_go()">로그아웃</button><br/>
<br/>
<br/>
<br/>
<br/>
<h1>관리자 정보 출력</h1>
아이디 : ${admin.admin_id}<br/>
이름 : ${admin.admin_nm}<br/>
<c:choose>
   <c:when test="${admin.admin_post eq '2' }">
   직책 : 총괄
   </c:when>
   <c:otherwise>
   직책 : 일반
   </c:otherwise>
</c:choose>

<br/>
<br/>

<h1>학생 수 정보 출력</h1>
재학생 수 : ${studStatus.get(0) } <br/>
휴학생 수 : ${studStatus.get(1) } <br/>
자퇴생 수 : ${studStatus.get(2) } <br/>
제적생 수 : ${studStatus.get(3) } <br/>

<br/>
<br/>

<h1>미처리된 휴학신청정보 리스트</h1>
<c:forEach var="loa" items="${untreatedLoaList}" varStatus="status">
   번호 : ${status.count}<br/>
   휴학신청번호 : ${loa.loa_num }<br/>
   학번 : ${loa.loa_stud }<br/><br/>   
</c:forEach>

<h1>미처리된 복학신청정보리스트</h1>
<c:forEach var="rts" items="${untreatedRtsList }" varStatus="status">
   번호 : ${status.count}<br/>
   복학신청번호 : ${rts.rts_num }<br/>
   학번 : ${rts.rts_stud }<br/><br/>   
</c:forEach>

<h1>미처리된 자퇴신청정보리스트</h1>
<c:forEach var="rts" items="${untreatedRtsList }" varStatus="status">
   번호 : ${status.count}<br/>
   복학신청번호 : ${rts.rts_num }<br/>
   학번 : ${rts.rts_stud }<br/><br/>   
</c:forEach>

<h1>관리자 개인일정</h1>
<c:forEach var="schedule" items="${perschdList }" varStatus="status">
   번호 : ${status.count}<br/>
   시퀀스번호 : ${schedule.perschd_num }<br/>
   제목 : ${schedule.perschd_title }<br/>
   내용 : ${schedule.perschd_cont }<br/>
   일정 시작일 : ${schedule.perschd_start_date }<br/>
   일정 종료일 : ${schedule.perschd_end_date }<br/>
   작성자 : ${schedule.perschd_writer }<br/><br/>   
</c:forEach>

<h1>Map으로 장학신청테이블, 학생테이블 조인함</h1>
<c:forEach var="sibal" items="${scrapplList }" varStatus="status">
   번호 : ${status.count }<br/>
   장학신청번호 : ${sibal.get("scrappl_num") }<br/>
   학생 : ${sibal.get("stud_num") }<br/>
   학생이름 : ${sibal.get("stud_nm") }<br/>
</c:forEach>
 
<h1>학과당 교수의 수</h1>
<c:forEach var="dept" items="${prfsOfDeptList }" varStatus="status">
   번호 : ${status.count }<br/>
   ${dept.dept_nm }의 교수의 수 : ${dept.count }<br/><br/>
</c:forEach>

<script type="text/javascript">
   function adminMain_go(){
      location.href="${myContextPath}/admin/main/adminMain";
   }
   function logout_go(){
      location.href="${myContextPath}/common/logout";
   }
   function myInfo_go(){
      location.href="${myContextPath}/admin/mypage/myInfo";
   }
   function mySchedule_go(){
      location.href="${myContextPath}/admin/mypage/mySchedule";
   }

</script>
</body>

<script type="text/javascript">
	function adminMain_go(){
		location.href="${myContextPath}/admin/main/adminMain";
	}
	function logout_go(){
		location.href="${myContextPath}/logout";
	}
	function mypage_go(){
		location.href="${myContextPath}/admin/mypage/";
	}

</script>
=======
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <%@include file="../common/mainSideCategory.jsp" %>   
</div>
<div class="col-md-10" id="commonRightSide">
                     
                     관리자메인
                     <button onclick="location.href='<%=request.getContextPath()%>/admin/adminMain'">관리자</button>
                     <button onclick="location.href='<%=request.getContextPath()%>/professor/professorMain'">교수</button>
                     <button onclick="location.href='<%=request.getContextPath()%>/student/studentMain'">학생</button>
                     <button onclick="location.href='<%=request.getContextPath()%>/common/logout'">로그아웃</button>
                     <button onclick="location.href='<%=request.getContextPath()%>/admin/professorManage'">교수목록</button>
                     <button onclick="location.href='<%=request.getContextPath()%>/admin/studentManage'">학생목록</button>
                     
                     
                     <c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
                     관리자메인
                     
                     <button id="adminMain" onclick="adminMain_go()">관리자</button>
                     <button id="logout" onclick="logout_go()">로그아웃</button><br/>
                     <button id="myInfo" onclick="myInfo_go()">개인정보</button><br/>
                     <button id="mySchedule" onclick="mySchedule_go()">개인일정관리</button><br/>
                     <button id="adminMain" onclick="adminMain_go()">관리자</button><br/>
                     <button id="myPage" onclick="mypage_go()">mypage</button>
                     <button id="profPage">교수관리</button>
                     <button id="studPage">학생관리</button>
                     <button id="classPage">강의관리</button>
                     <button id="boardPage">HelpDesk</button>
                     <button id="logout" onclick="logout_go()">로그아웃</button><br/>
                     <br/>
                     <br/>
                     <br/>
                     <br/>
                     
                     
                     <br/>
                     <br/>
                     
                     <h1>학생 수 정보 출력</h1>
                     재학생 수 : ${studStatus.get(0) } <br/>
                     휴학생 수 : ${studStatus.get(1) } <br/>
                     자퇴생 수 : ${studStatus.get(2) } <br/>
                     제적생 수 : ${studStatus.get(3) } <br/>
                     
                     <br/>
                     <br/>
                     
                     <h1>미처리된 휴학신청정보 리스트</h1>
                     <c:forEach var="loa" items="${untreatedLoaList}" varStatus="status">
                        번호 : ${status.count}<br/>
                        휴학신청번호 : ${loa.loa_num }<br/>
                        학번 : ${loa.loa_stud }<br/><br/>   
                     </c:forEach>
                     
                     <h1>미처리된 복학신청정보리스트</h1>
                     <c:forEach var="rts" items="${untreatedRtsList }" varStatus="status">
                        번호 : ${status.count}<br/>
                        복학신청번호 : ${rts.rts_num }<br/>
                        학번 : ${rts.rts_stud }<br/><br/>   
                     </c:forEach>
                     
                     <h1>미처리된 자퇴신청정보리스트</h1>
                     <c:forEach var="rts" items="${untreatedRtsList }" varStatus="status">
                        번호 : ${status.count}<br/>
                        복학신청번호 : ${rts.rts_num }<br/>
                        학번 : ${rts.rts_stud }<br/><br/>   
                     </c:forEach>
                     
                     <h1>관리자 개인일정</h1>
                     <c:forEach var="schedule" items="${perschdList }" varStatus="status">
                        번호 : ${status.count}<br/>
                        시퀀스번호 : ${schedule.perschd_num }<br/>
                        제목 : ${schedule.perschd_title }<br/>
                        내용 : ${schedule.perschd_cont }<br/>
                        일정 시작일 : ${schedule.perschd_start_date }<br/>
                        일정 종료일 : ${schedule.perschd_end_date }<br/>
                        작성자 : ${schedule.perschd_writer }<br/><br/>   
                     </c:forEach>
                     
                     <h1>Map으로 장학신청테이블, 학생테이블 조인함</h1>
                     <c:forEach var="sibal" items="${scrapplList }" varStatus="status">
                        번호 : ${status.count }<br/>
                        장학신청번호 : ${sibal.get("scrappl_num") }<br/>
                        학생 : ${sibal.get("stud_num") }<br/>
                        학생이름 : ${sibal.get("stud_nm") }<br/>
                     </c:forEach>
                      
                     <h1>학과당 교수의 수</h1>
                     <c:forEach var="dept" items="${prfsOfDeptList }" varStatus="status">
                        번호 : ${status.count }<br/>
                        ${dept.dept_nm }의 교수의 수 : ${dept.count }<br/><br/>
                     </c:forEach>
                     
                     <script type="text/javascript">
                        function adminMain_go(){
                           location.href="${myContextPath}/admin/main/adminMain";
                        }
                        function logout_go(){
                           location.href="${myContextPath}/common/logout";
                        }
                        function myInfo_go(){
                           location.href="<%=request.getContextPath()%>/admin/mypage/myInfo";
                        }
                        function mySchedule_go(){
                           location.href="${myContextPath}/admin/mypage/mySchedule";
                        }
                     
                     </script>
                     
                     
                     <script type="text/javascript">
                        function adminMain_go(){
                           location.href="${myContextPath}/admin/main/adminMain";
                        }
                        function logout_go(){
                           location.href="${myContextPath}/logout";
                        }
                        function mypage_go(){
                           location.href="${myContextPath}/admin/mypage/";
                        }
                     
                     </script>
							<h1>학생 수 정보 출력</h1>
							재학생 수 : ${studStatus.get(0) } <br/>
							휴학생 수 : ${studStatus.get(1) } <br/>
							자퇴생 수 : ${studStatus.get(2) } <br/>
							제적생 수 : ${studStatus.get(3) } <br/>
							
							<br/>
							<br/>
							
							<h1>미처리된 휴학신청정보 리스트</h1>
							<c:forEach var="loa" items="${untreatedLoaList}" varStatus="status">
							   번호 : ${status.count}<br/>
							   휴학신청번호 : ${loa.loa_num }<br/>
							   학번 : ${loa.loa_stud }<br/><br/>   
							</c:forEach>
							
							<h1>미처리된 복학신청정보리스트</h1>
							<c:forEach var="rts" items="${untreatedRtsList }" varStatus="status">
							   번호 : ${status.count}<br/>
							   복학신청번호 : ${rts.rts_num }<br/>
							   학번 : ${rts.rts_stud }<br/><br/>   
							</c:forEach>
							
							<h1>미처리된 자퇴신청정보리스트</h1>
							<c:forEach var="rts" items="${untreatedRtsList }" varStatus="status">
							   번호 : ${status.count}<br/>
							   복학신청번호 : ${rts.rts_num }<br/>
							   학번 : ${rts.rts_stud }<br/><br/>   
							</c:forEach>
							
							<h1>관리자 개인일정</h1>
							<c:forEach var="schedule" items="${perschdList }" varStatus="status">
							   번호 : ${status.count}<br/>
							   시퀀스번호 : ${schedule.perschd_num }<br/>
							   제목 : ${schedule.perschd_title }<br/>
							   내용 : ${schedule.perschd_cont }<br/>
							   일정 시작일 : ${schedule.perschd_start_date }<br/>
							   일정 종료일 : ${schedule.perschd_end_date }<br/>
							   작성자 : ${schedule.perschd_writer }<br/><br/>   
							</c:forEach>
							
							<h1>Map으로 장학신청테이블, 학생테이블 조인함</h1>
							<c:forEach var="sibal" items="${scrapplList }" varStatus="status">
							   번호 : ${status.count }<br/>
							   장학신청번호 : ${sibal.get("scrappl_num") }<br/>
							   학생 : ${sibal.get("stud_num") }<br/>
							   학생이름 : ${sibal.get("stud_nm") }<br/>
							</c:forEach>
							 
							<h1>학과당 교수의 수</h1>
							<c:forEach var="dept" items="${prfsOfDeptList }" varStatus="status">
							   번호 : ${status.count }<br/>
							   ${dept.dept_nm }의 교수의 수 : ${dept.count }<br/><br/>
							</c:forEach>
							
							<script type="text/javascript">
							   function adminMain_go(){
							      location.href="${myContextPath}/admin/main/adminMain";
							   }
							   function logout_go(){
							      location.href="${myContextPath}/common/logout";
							   }
							   function myInfo_go(){
							      location.href="<%=request.getContextPath()%>/admin/mypage/myInfo";
							   }
							   function mySchedule_go(){
							      location.href="${myContextPath}/admin/mypage/mySchedule";
							   }
							 </script>
							
</div>
