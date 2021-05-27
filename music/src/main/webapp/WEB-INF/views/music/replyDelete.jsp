<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div id="root">
 <section id="container">
  <form role="form" method="post" autocomplete="off">
   <input type="hidden" id="bno" name="bno" value="${readReply.bno}" readonly="readonly" />
   <input type="hidden" id="rno" name="rno" value="${readReply.rno}" readonly="readonly" />
   <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
   <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
   <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
   <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
   
   <p>정말로 삭제하시겠습니까?</p>
   <p>
    <button type="submit">삭제</button>
    <button type="button" id="cancel_btn">취소</button>

    <script>
    var formObj = $("form[role='form']");
    $("#cancel_btn").click(function(){
      self.location = "/music/view?bno=${readReply.bno}"
      + "&page=${scri.page}"
      + "&perPageNum=${scri.perPageNum}"
      + "&searchType=${scri.searchType}"
      + "&keyword=${scri.keyword}";      
    });
    </script>
   </p>
  </form>
 </section>
</div>
</body>
</html>