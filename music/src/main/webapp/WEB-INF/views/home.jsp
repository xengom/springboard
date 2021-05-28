<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<title>음악 추천 라이브러리</title>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="./include/header.jsp" %>
	</header>
	<nav id="nav">
		<%@ include file="./include/nav.jsp" %>
	</nav>
	
	<div class="jumbotrom text-center">
	<img src="https://i.imgur.com/rpi4pnH.png" class="img-responsive">
	${serverTime}
	</div>
</div>
</body>
</html>
