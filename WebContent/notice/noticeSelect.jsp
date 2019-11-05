<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
	.contents {
		background-color: lightgray;
		width: 100%;
		height: 200px;
		padding: 20px;
		font-size: 15px;
		margin-bottom: 20px;
	}
</style>
</head>
<body>

	<div class="container">
		<h2>Notice Select Page</h2>
		<br>
	  <table class="table">
	    <thead>
	      <tr class="info"><th>SUBJECT</th><th>NAME</th><th>DATE</th><th>HIT</th></tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>${requestScope.dto.title}</td>
	        <td>${requestScope.dto.writer}</td>
	        <td>${requestScope.dto.reg_date}</td>
	        <td>${requestScope.dto.hit}</td>
	      </tr>
	    </tbody>
	  </table>
	  <div class="contents">
		${requestScope.dto.contents}
	  </div>
	  
	  	<a href="./noticeUpdate.notice?num=${requestScope.dto.num}" class="btn btn-info">Update</a>
	 	<a href="./noticeDeleteResult.notice?num=${requestScope.dto.num}" class="btn btn-danger">Delete</a>
		<a href="./noticeList.notice" class="btn btn-primary">List</a>
	</div>
	
</body>
</html>