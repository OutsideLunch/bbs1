<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String comment = request.getParameter("comment");
	
	Statement stmt = null;
	
	try {
		String query = "insert into bbs ";
		query += "(title, comments, writer, cdate) ";
		query += "values ('" + title + "', '" + comment + "', '";
		query += writer + "', now())";
			   
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(query);
			   
		out.println("게시물을 등록하였습니다.");
	}
	catch (SQLException ex) {
		out.println("게시물을 등록하는데 실패하셨습니다.");
		out.println("SQLException : " + ex.getMessage());
	}
	finally {
		if (stmt != null) {
			stmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
		/* 지정한 시간 이후에 페이지 이동 */
		response.setHeader("Refresh", "3;URL=lists.jsp");
	}
%>