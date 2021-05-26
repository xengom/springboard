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
	<div id="nav">
		<%@ include file="../include/nav.jsp" %>
	</div>
		<p>
		<label>제목</label>
		${view.title }<br />
		
		<label>가수</label>
		${view.singer }<br />
		
		<label>추천 이유</label><br/>
		${view.content }<br/>
		
		<p>
		<hr>
		<div>
			<a href="/music/modify?bno=${view.bno }">정보 수정</a>, <a href="/music/delete?bno=${view.bno }">정보 삭제</a>
		</div>
</body>
</html>