<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
  						<a href="/music/view?bno=${list.bno }">${list.title }</a>
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
   <span>[ <a href="listPage?page=${pageMaker.startPage - 1}">이전</a> ]</span>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <span>
   	<c:if test="${select != idx }">
   		<a href="listPage?page=${idx}">${idx}</a> 
   	</c:if>
   	
   	<c:if test="${select==idx }">
   		<b>${idx}</b>
   	</c:if>
   </span>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
   <span>[ <a href="listPage?page=${pageMaker.endPage + 1}">다음</a> ]</span>
  </c:if> 
</div>
</body>
</html>