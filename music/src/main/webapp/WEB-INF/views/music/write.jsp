<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>추천 음악 추가</title>
</head>
<body>
<div class="container mt-5">
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
	<nav id="nav">
		<%@ include file="../include/nav.jsp" %>
	</nav>
	<form method="post" >
		<div class="form-group">
			 <label for="title" class="control-label">제목 </label>
			 <input type="text" id="title" name="title" class="form-control"/>
		</div>
		<p>
		<div class="form-group">
			 <label for="singer" class="control-label">가수 </label>
			 <input type="text" id="singer" name="singer" class="form-control"/>
		</div>
		<div class="form-group">
			 <label for="writer" class="control-label">작성자 </label>
			 <input type="text" id="writer" name="writer" value="${member.userName }" readonly="readonly" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="content" class="control-label">추천 이유</label>
			<textarea id="content" name="content" class="form-control col-sm-5" rows="5"></textarea>
		</div>	
	<div class="form-group mt-3">
		<button type="submit" class="btn btn-success">작성</button>
	</div>
	</form>
</div>
</body>
</html>