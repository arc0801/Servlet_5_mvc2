package com.arc.notice;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arc.action.ActionFoward;
import com.arc.util.DBConnector;

public class NoticeService {

	private NoticeDAO noticeDAO;
	
	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}	
	
	public ActionFoward selectList(HttpServletRequest request, HttpServletResponse response) {
		//DAO 보내기 전 전처리 작업
		//DAO 호출 후 후처리 작업
		ActionFoward actionfoward = new ActionFoward();
		try {
			Connection con = DBConnector.getConnection();
			ArrayList<NoticeDTO> ar = noticeDAO.selectList(con);
			con.close();
			request.setAttribute("list", ar);
			actionfoward.setFlag(true);
			actionfoward.setPath("./noticeList.jsp");
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return actionfoward;
	}
	
	public ActionFoward selectOne(HttpServletRequest request, HttpServletResponse response) {
		//DAO 보내기 전 전처리 작업
		//DAO 호출 후 후처리 작업
		ActionFoward actionFoward = new ActionFoward();
		try {
			Connection con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			NoticeDTO noticeDTO = noticeDAO.selectOne(con, num);
			if(noticeDTO != null) {
				request.setAttribute("dto", noticeDTO);
				actionFoward.setFlag(true);
				actionFoward.setPath("./noticeSelect.jsp");
			}else {
				actionFoward.setFlag(false);
				actionFoward.setPath("./noticeList.notice");
			}
			con.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return actionFoward;
	}
	
	public ActionFoward write(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		String method = request.getMethod(); //method get/post
		//System.out.println(method);
		if(method.equals("POST")) {
			try {
			Connection con = DBConnector.getConnection();
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setTitle(request.getParameter("title"));
			noticeDTO.setWriter(request.getParameter("writer"));
			noticeDTO.setContents(request.getParameter("contents"));
			
			int result = noticeDAO.write(con, noticeDTO);
			con.close();
			
			if(result>0) {
				request.setAttribute("msg", "Write Success");
			}else {
				request.setAttribute("msg", "Write Fail");
			}
			request.setAttribute("path", "./noticeList.notice");
			
			RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
			view.forward(request, response);
			
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			actionFoward.setFlag(true);
			actionFoward.setPath("./noticeWrite.jsp");
		}
		
		return actionFoward;
	}
	
	public void update() {
		
		
	}
	
	public void delete() {
		
	}
}
