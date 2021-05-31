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
	<title>회원가입</title> 
</head>
<body>
<div class="container">
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
	<form role="form" method="post" autocomplete="off">
		<div class="form-group">
			<label for="userId" class="control-label">아이디 </label>
			<input type="text" id="userId" name="userId" class="form-control"/>
		</div>
		<div class="form-group">
			 <label for="userPass" class="control-label">비밀번호 </label>
			 <input type="password" id="userPass" name="userPass" class="form-control"/>
		</div>
		<div class="form-group">
			 <label for="userName" class="control-label">닉네임 </label>
			 <input type="text" id="userName" name="userName" class="form-control"/>
		</div>
		
		<div class="form-group mt-3">
			<button type="submit" class="btn btn-primary">가입</button>
			<button type="button" class="btn btn-danger" onclick="location.href='/'">메인화면</button>
		</div>
	</form>
</div>
</body>
</html>