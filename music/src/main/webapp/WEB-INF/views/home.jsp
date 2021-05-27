<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>음악 추천 라이브러리</title>
</head>
<body>
<h1>
	음악 추천 라이브러리 
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p><a href="/music/list">추천 음악 목록</a></p>
<p><a href="/music/write">추천 음악 추가</a></p>
<p><a href="/music/listPage">추천 음악 목록(페이징)</a></p>
<p><a href="/music/listSearch">추천 음악 목록(페이징+검색)</a></p>
</body>
</html>
