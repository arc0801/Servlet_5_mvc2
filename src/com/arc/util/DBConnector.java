package com.arc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	
	public static Connection getConnection() throws Exception {
		Connection con = null;
		
		//DB 접속
		//1. 로그인 4가지 정보
		String user = "user13";
		String password = "user13";
		String url = "jdbc:oracle:thin:@211.238.142.32:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		//2. driver를 메모리에 로딩
		Class.forName(driver);
		
		//3. 로그인 후 Connection 객체 반환
		con = DriverManager.getConnection(url, user, password);
		
		return con;
	}
	
}
