<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>추천 음악 목록</title>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
	<c:if test="${msg==null }">
		<nav id="nav">
			<%@ include file="../include/nav.jsp" %>
		</nav>
		<table class="table table-hover">
	 		<thead>
				<tr>
					<th>번호</th>
				    <th>제목</th>
				    <th>가수</th>
				    <th>작성일</th>
				    <th>작성자</th>
				    <th>조회수</th>
				</tr>
			</thead>
			<tbody>
	  			<c:forEach items="${list }" var="list">
	  				<tr>
	  					<td>${list.bno }</td>
	  					<td>
	  						<a href="/music/view?bno=${list.bno }&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">${list.title }</a>
	  					</td>
	  					<td>${list.singer }</td>
	  					<td>
	  						<fmt:formatDate value="${list.regdate}" pattern="yy-MM-dd" />
	  					</td>
	  					<td>${list.writer }</td>
	  					<td>${list.viewcnt }</td>
	  				</tr>
	  			</c:forEach>
			</tbody>
		</table>
		<div class="search row">
			<div class="col-xs-2 col-sm-2">
				<select name="searchType" class="form-control">
					<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="s"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>가수</option>
					<option value="ts"<c:out value="${scri.searchType eq 'ts' ? 'selected' : ''}"/>>제목+가수</option>
				</select>
	 		</div>
	 		<div class="col-xs-10 col-sm-10">
	 			<div class="input-group">
					<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
	 				<span class="input-group-btn">
	 					<button id="searchBtn" class="btn btn-default">검색</button>
	 				</span>
	 			</div>
			</div>
		</div>
		<script>
		$(function(){
			$('#searchBtn').click(function() {
				self.location = "listSearch"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword="
				+ encodeURIComponent($('#keywordInput').val());
			});
		});   
		</script>
		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if> 
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
					<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if> 
			</ul>		
		</div>
	</c:if>
	<c:if test="${msg==false }">
		<p style="color:#f00;">로그인이 필요합니다!</p>
	</c:if>
</div>
</body>
</html>