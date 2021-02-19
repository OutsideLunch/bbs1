<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
%>

<%@ include file="dbconn.jsp" %>

<%
	Statement stmt = null;

	try {
		String query = "delete from bbs where num = " + num + " "; 
		
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(query);
		
		if (result > 0) {
			out.println("게시물이 정상적으로 삭제되었습니다.");
		}
	}
	catch (SQLException ex) {
		out.println("게시물 삭제 중 오류가 발생했습니다.");
		out.println("SQLException : " + ex.getMessage());
	}
	finally {
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		response.setHeader("Refresh", "3;URL=./list.jsp");
	}
%>