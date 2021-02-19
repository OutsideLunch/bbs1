<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 글 확인</title>
<style>
	table {
		width : 100%;
		border : 1px solid black;
		border-collapse : collapse;
	}
	
	td, th {
		border : 1px solid black;
	}
	
	.container {
		width : 960px;
		margin : 0px auto 0px auto;
		/* 중앙 정렬 마진 right left 값을 auto로 주면 중앙정렬됨 */
		/* 마진 순서 탑 / 라이트 / 바텀 / 레프트 */
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String number = request.getParameter("num");
		int num = Integer.parseInt(number);
		/* 주소창에 http://localhost:8080/bbs1/select.jsp?num=글번호 입력 */
	%>
	<%@ include file="dbconn.jsp" %>
	<!-- select문을 사용하여 지정한 1개의 글 내용을 가져오기 -->
	<%
		ResultSet rs = null;
		Statement stmt = null;
		/* PreparedStatement psmt = null; */
		
		try { 
			String query = "select title, comments, writer, cdate, ";
			query += "views, likes ";
			query += "from bbs ";
			query += "where num = " + num;
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			rs.next();
			String title = rs.getString("title");
			String comments = rs.getString("comments");
			String writer = rs.getString("writer");
			String cdate = rs.getString("cdate");
			String views = rs.getString("views");
			String likes = rs.getString("likes");
			/* while (rs.next()) {
				String title = rs.getString("title");
				String comments = rs.getString("comments");
				String writer = rs.getString("writer");
				String cdate = rs.getString("cdate");
				String views = rs.getString("views");
				String likes = rs.getString("likes");
				
				out.println(title + "<br>");
				out.println(comments + "<br>");
				out.println(writer + "<br>");
				out.println(cdate + "<br>");
				out.println(views + "<br>");
				out.println(likes + "<br>");
			} */
			%>
			<div class="container">
				<table>
					<thead>
						<tr>
							<th colspan=3><%= rs.getString("title") %></th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td><%= rs.getString("writer") %></td>
							<td><%= rs.getString("views") %></td>
							<td><%= rs.getString("likes") %></td>
						</tr>
						<tr>
							<td colspan=3><%= rs.getString("comments") %></td>
						</tr>
					</tbody>
				</table>
			</div>
			<a href="./list.jsp">목록으로</a>
			<a href="./modify.jsp?num=<%= num %>">수정하기</a>
			<a href="./delete.jsp?num=<%= num %>">삭제하기</a>
			<%
		}
		catch (SQLException ex) {
			out.println("글 조회를 실패했습니다.<br>");
			out.println("SQLException : " + ex.getMessage());
		}
		finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			/* if (psmt != null) {
				stmt.close();
			} */
			if (conn != null) {
				conn.close();
			}
		}
		
	%>
</body>
</html>