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
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp" %>
	</div>
		<form role="form" method="post" autocomplete="off">
			<p>
				<label for="bno">번호></label><input type="text" id="bno" name="bno" value="${delete }" readonly="readonly"/>
			</p>
			<p>정말로 삭제하시겠습니까?</p>
			<p>
		<p>
		<hr>
		<p>
			<button type="submit">삭제</button>
			<button type="button" id="cancel_btn">취소</button>
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
		
		
</body>
</html>