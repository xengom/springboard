<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>추천 음악 목록</title>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp" %>
	</div>
	<table border="1">
 		<thead>
			<tr>
				<th>번호</th>
			    <th>제목</th>
			    <th>가수</th>
			    <th>작성일</th>
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
  					<td>${list.viewcnt }</td>
  				</tr>
  			</c:forEach>
		</tbody>

</table>

<div>
  <c:if test="${pageMaker.prev}">
   <span>[ <a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a> ]</span>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <span>
   	<c:if test="${select != idx }">
   		<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a>
   	</c:if>
   	
   	<c:if test="${select==idx }">
   		<b>${idx}</b>
   	</c:if>
   </span>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
   <span>[ <a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a> ]</span>
  </c:if> 
</div>

<div class="search">
 <select name="searchType">
  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
  <option value="s"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>가수</option>
  <option value="ts"<c:out value="${scri.searchType eq 'ts' ? 'selected' : ''}"/>>제목+가수</option>
 </select>
 
 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

 <button id="searchBtn">검색</button>
 
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
</div>
</body>
</html>