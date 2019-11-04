package com.test.notice;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.arc.notice.NoticeDAO;
import com.arc.util.DBConnector;

public class NoticeDAOTest {

	private NoticeDAO noticeDAO;
	private Connection con;
	
	public NoticeDAOTest() {
		noticeDAO = new NoticeDAO();
	}
	
	@BeforeClass
	public static void beforeClass() { //전체적으로 한 번만 실행 "static" 꼭 써줄 것
		System.out.println("Before Class");
	}
	
	@AfterClass
	public static void afterClass() {
		System.out.println("After Class");
	}
	
	@Before
	public void before() throws Exception { //각 test method하기 전에 무조건 실행
		System.out.println("before");
		con = DBConnector.getConnection();
		
		con.setAutoCommit(false); //test할 거니까 DB에는 넣지 말자
	}
	
	@After
	public void after() throws Exception {
		System.out.println("after");
		//con.commit();
		con.rollback();
		con.setAutoCommit(true); //순서 애매해지니까 rollback 후 commit
		con.close();
	}
	
	@Test
	public void listTest() throws Exception {
		Connection con = DBConnector.getConnection();
		noticeDAO.selectList(con);
		
		con.close();
	}

	public void selectTest() throws Exception {
		Connection con = DBConnector.getConnection();
		noticeDAO.selectOne(con, 1);
		
		con.close();
	}
}
