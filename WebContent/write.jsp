<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<label for="title">제목 : </label>
		<input type="text" id="title" name="title"><br>
		<label for="writer">작성자 : </label>
		<input type="text" id="writer" name="writer"><br>
		<label for="comment">글내용 : </label>
		<textarea rows="5" cols="80" id="comment" name="comment"></textarea><br><br>
		<button type="submit">확인</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>