<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 음악 조회</title>
</head>
<body>
		<p>
		<label>제목</label>
		${view.title }<br />
		
		<label>가수</label>
		${view.singer }<br />
		
		<label>추천 이유</label><br/>
		${view.content }<br/>
</body>
</html>