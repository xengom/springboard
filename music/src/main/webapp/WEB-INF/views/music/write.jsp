<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 음악 추가</title>
</head>
<body>
	<form method="post">
		<p>
		<input type="text" placeholder="제목" name="title" size="40"/><br />
		
		<input type="text" placeholder="가수" name="singer" size="40"/><br /><br />
		
		<textarea cols="50" rows="5" placeholder="추천 이유" name="content"></textarea><br/>
		</p>
		<hr>
	<button type="submit">작성</button>
	</form>
</body>
</html>