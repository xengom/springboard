<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>추천 음악 정보 수정</title>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp" %>
	</div>
	<form role="form" method="post" autocomplete="off")>
		<p>
		<input type="text" placeholder="제목" name="title" value="${modify.title }" size="45"/><br />
		
		<input type="text" placeholder="가수" name="singer" value="${modify.singer }" size="45"/><br /><br />
		
		<textarea cols="50" rows="5" placeholder="추천 이유" name="content">${modify.content}</textarea><br/>
		</p>
		<hr>
	<button type="submit">완료</button><button type="button" id="cancel_btn">취소</button>
	</form>
	<script>
		var formObj = $("form[role='form']");
		$("#cancel_btn").click(function(){
			self.location = "/music/view?bno=${modify.bno}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
		});
	</script>
	
</body>
</html>