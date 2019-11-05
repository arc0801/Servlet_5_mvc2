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
</head>
<body>

	<div class="container">
	  <h2>Notice Update Page</h2>
	  <form action="./noticeUpdate.notice" method="post">
	  	
	  	<input type="hidden" class="form-control" id="num" value="${requestScope.dto.num}" name="num">
	  	
	    <div class="form-group">
	      <label for="title">Title:</label>
	      <input type="text" class="form-control" id="title" value="${requestScope.dto.title}" name="title">
	    </div>
	    
	    <div class="form-group">
	      <label for="writer">Writer:</label>
	      <input type="text" class="form-control" id="writer" value="${requestScope.dto.writer}" name="writer">
	    </div>
	    
	    <div class="form-group">
	      <label for="contents">Contents:</label>
	      <textarea  rows="20" cols="50" class="form-control" id="title" name="contents">${requestScope.dto.contents}</textarea>
	   </div>
	    
	    <input type="hidden" class="form-control" id="reg_date" value="${requestScope.dto.reg_date}" name="reg_date">
	    
	    <input type="hidden" class="form-control" id="hit" value="${requestScope.dto.hit}" name="hit">
	    
	     <button type="submit" class="btn btn-info">Submit</button>
	    </form>
	</div>
	
</body>
</html>