<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String comments = request.getParameter("comments");
	int num = Integer.parseInt(request.getParameter("num"));
	int views = Integer.parseInt(request.getParameter("views"));
	views++;
%>

<%@ include file="dbconn.jsp" %>

<%
	Statement stmt = null;
	
	try {
		String query = "UPDATE bbs ";
		query += "SET title = '" + title + "', ";
		query += "comments = '" + comments + "', ";
		query += "views = " + views + " ";
		query += "WHERE num = " + num + " ";
		
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(query);
		
		if (result > 0) {
			out.println("정상적으로 게시물이 수정되었습니다.");
		}
	}
	catch (SQLException ex) {
		out.println("게시물 수정에 오류가 발생했습니다.<br>");
		out.println("SQLException : " + ex.getMessage());
	}
	finally {
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}
	}
%>