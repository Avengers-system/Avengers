<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <%@include file="../common/mainSideCategory.jsp" %>   
</div>
<div class="col-md-10" id="commonRightSide">
                     
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
                     
</div>
