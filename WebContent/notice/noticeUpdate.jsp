<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	NoticeDTO noticeDTO = noticeDAO.selectOne(con, num);
	
	con.close();
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
<%@ include file="../layout/nav.jsp" %>
<%
	if(memberDTO == null || !memberDTO.getId().equals(noticeDTO.getWriter())) { 
			request.setAttribute("msg", "해당 권한이 없습니다.");
			request.setAttribute("path", "../index.jsp");
			
			RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
			view.forward(request, response);
	}
%>
	<div class="container">
	  <h2>Notice Update Page</h2>
	  <form action="./noticeUpdateResult.jsp" method="post">
	  	
	  	<input type="hidden" class="form-control" id="num" value="<%= noticeDTO.getNum() %>" name="num">
	  	
	    <div class="form-group">
	      <label for="title">Title:</label>
	      <input type="text" class="form-control" id="title" value="<%= noticeDTO.getTitle() %>" name="title">
	    </div>
	    
	    <div class="form-group">
	      <label for="writer">Writer:</label>
	      <input type="text" class="form-control" id="writer" value="<%= noticeDTO.getWriter() %>" name="writer">
	    </div>
	    
	    <div class="form-group">
	      <label for="contents">Contents:</label>
	      <textarea  rows="20" cols="50" class="form-control" id="title" name="contents"><%= noticeDTO.getContents() %></textarea>
	   </div>
	    
	    <input type="hidden" class="form-control" id="reg_date" value="<%= noticeDTO.getReg_date() %>" name="reg_date">
	    
	    <input type="hidden" class="form-control" id="hit" value="<%= noticeDTO.getHit() %>" name="hit">
	    
	     <button type="submit" class="btn btn-info">Submit</button>
	    </form>
	</div>
	
</body>
</html>