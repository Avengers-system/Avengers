<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

상담목록


<c:forEach var="cnsList" items="${cnsList}">
	제목 : ${cnsList.cns_title}<br>
	상담여부 : ${cnsList.cns_check}<br>

</c:forEach>
