<%@page import="java.sql.Date"%>
<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setContents(request.getParameter("contents"));
	noticeDTO.setReg_date(Date.valueOf(request.getParameter("reg_date")));
	noticeDTO.setHit(Integer.parseInt(request.getParameter("hit")));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	int result = noticeDAO.update(con, noticeDTO);
	
	con.close();
	
	if(result>0){
		response.sendRedirect("./noticeList.jsp");
	}else {
		String msg = "Update Fail";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>