<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="xml" uri="http://java.sun.com/jsp/jstl/xml" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="../layout/nav.jsp"></c:import>
	<div class="container">
	  <h2>Notice</h2>
	  <table class="table">
	    <thead>
	      <tr class="info"><th>NO</th><th>SUBJECT</th><th>NAME</th><th>DATE</th><th>HIT</th></tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${requestScope.list}" var="dto" varStatus="st">
		      <tr>
		        <td>${pageScope.dto.num}</td>
		        <td><a href="./noticeSelect.notice?num=${pageScope.dto.num}">${pageScope.dto.title}</a></td>
		        <td>${pageScope.dto.writer}</td>
		        <td>${pageScope.dto.reg_date}</td>
		        <td>${pageScope.dto.hit}</td>
		      </tr>
	    	</c:forEach>
	    </tbody>
	  </table>
	  
	  <div>
	  	<c:forEach begin="1" end="10" step="2" var="i">
	  		${pageScope.i}
	  	</c:forEach>
	  	
	  	<c:choose>
	  		<c:when test=""></c:when>
	  		<c:when test=""></c:when>
	  		<c:otherwise></c:otherwise>
	  	</c:choose>
	  </div>
	  
	  <!-- session member, memberDTO -->
	  <c:if test="${not empty sessionScope.member}">
	  	<a href="./noticeWrite.notice" class="btn btn-info">Write</a>
	  </c:if>
	</div>

</body>
</html>