<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.text.*" %>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);
	Calendar cal = Calendar.getInstance();
%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<!-- student Header -->
<%@include file="../common/topCategory.jsp" %>

<!--side Category-->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/resSchSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">
	장학이력<br/>
	년도<select>
		 <option value="${cal.get(Calendar.YEAR)}" selected="selected">2017</option>
	   </select>
	학기<select>
		<option value="1" selected="selected">1</option>
	</select>
	대학<input type="text" name="col_nm" value="${col_nm}" readonly="readonly">
	전공<input type="text" name="dept_nm" value="${dept_nm}" readonly="readonly">
	학년<input type="text" name="stud_grd" value="${stud_grd}" readonly="readonly">
	<br/>
	평점평균<input type="text" name="average rating" value="${average_rating}" readonly="readonly">
	취득학점<input type="text" name="grades" value="${grades}" readonly="readonly">
	학번<input type="text" name="stud_num" value="${stud_num}" readonly="readonly">
	이름<input type="text" name="stud_nm" value="${stud_nm}" readonly="readonly"/>
	
</div>







<script type="text/javascript">
	function logout_go(){
		location.href="${myContextPath}/common/logout";
	}
</script>
