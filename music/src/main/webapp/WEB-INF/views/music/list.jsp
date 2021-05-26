<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 음악 목록</title>
</head>
<body>
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
  					<td>${list.regdate }</td>
  					<td>${list.viewcnt }</td>
  				</tr>
  			</c:forEach>
		</tbody>

</table>
</body>
</html>