<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<title>Music Base</title>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="./include/header.jsp" %>
	</header>
	<c:if test="${member!=null }">
		<nav id="nav">
			<%@ include file="../views/include/nav.jsp" %>
		</nav>
		<div class="form-group mt-3">
			어서오세요 ${member.userName}님!
			<form role="logout" action="member/logout" method="get" autocomplete="off">
				<button type="submit" class="btn btn-default">로그아웃</button>
				<button type="button" class="btn btn-default" onclick="location.href='/member/modify'">비밀번호변경</button>
			</form>
		</div>
	</c:if>
	<c:if test="${member==null }">
		<form role="form" method="post" autocomplete="off" action="member/login">
			<div class="form-group">
				 <label for="userId" class="control-label">아이디 </label>
				 <input type="text" id="userId" name="userId" class="form-control"/>
			</div>
			<div class="form-group">
				 <label for="userPass" class="control-label">비밀번호 </label>
				 <input type="password" id="userPass" name="userPass" class="form-control"/>
			</div>
		<div class="form-group mt-3">
			<button type="submit" class="btn btn-primary">로그인</button>
			<button type="button" class="btn btn-warning" onclick="location.href='/member/register'">회원가입</button>
		</div>
		</form>
	</c:if>
	<c:if test="${member!=null }">
		<div class="jumbotrom text-center">
			<img src="https://i.imgur.com/rpi4pnH.png" class="img-responsive center-block">
			${serverTime}
		</div>
	</c:if>
	<c:if test="${msg==false }">
		<p style="color:#f00;">로그인에 실패하였습니다.</p>
	</c:if>
</div>
</body>
</html>
