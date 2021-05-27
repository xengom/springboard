<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>댓글 수정</title>
</head>
<body>
<div class="container mt-5">
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
	<nav id="nav">
		<%@ include file="../include/nav.jsp" %>
	</nav>
	
	<form role="form" method="post" autocomplete="off">
	   	<input type="hidden" id="bno" name="bno" value="${readReply.bno}" readonly="readonly" />
	   	<input type="hidden" id="rno" name="rno" value="${readReply.rno}" readonly="readonly" /> 
	   	<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
	   	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
	   	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
	   	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
		<div class="form-group">
			<label for="content" class="control-label">댓글 내용</label>
		    <textarea id="content" name="content" class="form-control col-sm-5">${readReply.content}</textarea>
	    </div>
	    
	    <div class="form-group mt-3">
			<button type="submit" class="btn btn-success">수정</button>
			<button type="button" id="cancel_btn" class="btn btn-default">취소</button>
		</div>
    </form>
    <script>
	    var formObj = $("form[role='form']");
	    $("#cancel_btn").click(function(){   
	     self.location = "/music/view?bno=${readReply.bno}"
	    		+"&page=${scri.page}"+"&perPageNum=${scri.perPageNum}"
	    		+"&searchType=${scri.searchType}"+"&keyword=${scri.keyword}";
	    });
    </script> 
</div>
</body>
</html>