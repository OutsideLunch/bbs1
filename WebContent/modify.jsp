<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	
	<%@ include file="dbconn.jsp" %>
	
	<%
		ResultSet rs = null;
		Statement stmt = null;	
	
		try {
			String query = "select title, comments, cdate, views, likes ";
			query += "from bbs ";
			query += "where num = " + num;
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			rs.next();
			
			%>
			<form action="update.jsp" method="post">
				<label for="title">제목 : </label>
				<input type="text" id="title" name="title" value='<%=rs.getString("title") %>'><br>
				<label for="comments">내용 : </label>
				<textarea rows="5" cols="80" id="comments" name="comments"><%=rs.getString("comments") %></textarea><br>
				<button type="submit">수정</button>
				<button type="reset">취소</button>
			</form>
			<%
		}
		catch (SQLException ex) {
			out.println("데이터를 불러오는데 실패했습니다.");
			out.println("SQLException : " + ex.getMessage());
		}
		finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>