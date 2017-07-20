<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url value="/logout" var="logoutUrl" />

 

	<!-- csrt for log out-->

	<form action="${logoutUrl}" method="post" id="logoutForm">

	  <input type="hidden" 

		name="${_csrf.parameterName}"

		value="${_csrf.token}" />

	</form>

 

 	<script>

		function formSubmit() {

			document.getElementById("logoutForm").submit();

		}

	</script>

 

 	<!------------------------     navigation   ------------------------>

	 ....

         <form class="navbar-form navbar-right" >

       	     <span style="color: gray;" ><h5> ${username} 님 반갑습니다. 

                                <a href = "javascript:formSubmit()"> 로그아웃 </a> </h5></span>

   	  </form>



