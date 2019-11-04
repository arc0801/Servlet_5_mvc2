<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	ArrayList<NoticeDTO> ar = (ArrayList<NoticeDTO>)request.getAttribute("list");
%>    
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
	  <h2>Notice</h2>
	  <table class="table">
	    <thead>
	      <tr class="info"><th>NO</th><th>SUBJECT</th><th>NAME</th><th>DATE</th><th>HIT</th></tr>
	    </thead>
	    <tbody>
	    	<% for(int i=0;i<ar.size();i++){
	    			NoticeDTO noticeDTO = ar.get(i); %>
	      <tr>
	        <td><%= noticeDTO.getNum() %></td>
	        <td><a href="./noticeSelect.notice?num=<%= noticeDTO.getNum() %>"><%= noticeDTO.getTitle() %></a></td>
	        <td><%= noticeDTO.getWriter() %></td>
	        <td><%= noticeDTO.getReg_date() %></td>
	        <td><%= noticeDTO.getHit() %></td>
	      </tr>
			<% } %>
	    </tbody>
	  </table>
	  <a href="./noticeWrite.notice" class="btn btn-info">Write</a>
	</div>

</body>
</html>