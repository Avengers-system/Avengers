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
<script>
Morris.Donut({
element: ‘donut_example’,     //그래프가 들어갈 위치의 ID를 적어주세요
data: [                                     //그래프에 들어갈 data를 적어주세요
{label: ‘v1′, value: 25 },
{label: ‘v2′, value: 40 },
{label: ‘v3′, value: 25 },
{label: ‘v4′, value: 10 }
],
colors: [“#30a1ec”, “#76bdee”, “#387bb4″, “#c4dafe”], //그래프 color를 지정해줍니다.
formatter: function (y) { return y + “%” }  //y값 뒤에 %를 추가해줍니다.
});
</script>
<div class="col-md-10" id="commonRightSide">
<div id="donut_example" style="height: 250px;"></div>
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
