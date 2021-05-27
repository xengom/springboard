<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 음악 조회</title>
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp" %>
	</div>
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" id="page" name="page" value="${scri.page }" readonly="readonly"/>
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }" readonly="readonly"/>
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }" readonly="readonly"/>
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }" readonly="readonly"/>
			<p>
				<label for="bno">번호></label><input type="text" id="bno" name="bno" value="${view.bno }" readonly="readonly"/>
			</p>
		</form>
		<p>
		<label>제목</label>
		${view.title }<br />
		
		<label>가수</label>
		${view.singer }<br />
		
		<label>추천 이유</label><br/>
		${view.content }<br/>
		
		<p>
		<hr>
		<p>
			<button id="list_btn">목록으로</button>
			<button id="modify_btn">수정</button>
			<button id="delete_btn">삭제</button>
			
		<script>
			var formObj = $("form[role='form']");
			$("#list_btn").click(function(){
				self.location="/music/listSearch?"
						+"page=${scri.page}&perPageNum=${scri.perPageNum}"
						+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			$("#modify_btn").click(function(){
				formObj.attr("action","/music/modify");
				formObj.attr("method","get");
				formObj.submit();
			});
			$("#delete_btn").click(function(){
				formObj.attr("action","/music/delete");
				formObj.attr("method","get");
				formObj.submit();
			});
		</script>
			
		<!-- 게시물 끝 -->
		<div id="reply">
		 <ol class="replyList">
		 <c:forEach items="${repList}" var="repList">
		 <li>
		  <p>
		   작성자 : ${repList.writer}<br />
		   작성 날짜 :  <fmt:formatDate value="${repList.regdate}" pattern="yy-MM-dd" />
		  </p>
		  <p>${repList.content}</p>
		 </li>
		 </c:forEach>   
		 </ol>
		</div>
		
		
		
		
</body>
</html>