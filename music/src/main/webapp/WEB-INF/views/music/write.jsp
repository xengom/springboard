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
	
		<label>제목</label>
		<input type="text" name="title" /><br />
		
		<label>가수</label>
		<input type="text" name="singer" /><br />
	
	<button type="submit">작성</button>
	</form>
</body>
</html>