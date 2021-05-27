<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 음악 삭제</title>
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<div class="container mt-5">
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
	<nav id="nav">
		<%@ include file="../include/nav.jsp" %>
	</nav>
	<form role="form" method="post" autocomplete="off">
		<div class="form-group">
			<label for="bno" class="control-label">정말로 ${delete }번 추천곡을 삭제시겠습니까?</label>
		</div>
		<div class="form-group mt-3">
			<button type="submit" class="btn btn-danger">삭제</button>
			<button type="button" id="cancel_btn" class="btn btn-default">취소</button>
		</div>
	</form>
	<script>
		var formObj = $("form[role='form']");
		$("#cancel_btn").click(function(){
			self.location = "/music/view?bno=${delete}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";	
		});
	</script>	
</div>		
</body>
</html>