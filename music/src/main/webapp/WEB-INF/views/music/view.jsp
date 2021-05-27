<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>추천 음악 조회</title>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
	<nav id="nav">
		<%@ include file="../include/nav.jsp" %>
	</nav>
	
	<form role="form" method="post" autocomplete="off">
		<input type="hidden" id="page" name="page" value="${scri.page }" readonly="readonly"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }" readonly="readonly"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }" readonly="readonly"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }" readonly="readonly"/>
		<div class="form-group">
			<label for="bno" class="control-label">번호</label>
			<input type="text" id="bno" name="bno" class="form-control" value="${view.bno }" readonly="readonly"/>
		</div>
	</form>
	
	<div class="form-group">
		<label for="title" class="control-label">제목</label>
		<input type="text" id="title" name="title" class="form-control" value="${view.title }" readonly="readonly"/>
	</div>	
	<div class="form-group">
		<label for="singer" class="control-label">가수</label>
		<input type="text" id="singer" name="singer" class="form-control" value="${view.singer }" readonly="readonly"/>
	</div>	
	<div class="form-group">
		<label for="content" class="control-label">추천 이유</label>
		<textarea id="content" name="content" class="form-control" readonly="readonly">"${view.content }"</textarea>
	</div>	
	
	<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
	<div class=video-container>
		<div id="player"></div>
	</div>	
	<script>
			// 2. This code loads the IFrame Player API code asynchronously.
	      	var myObj = ${json};
		  	var vid = myObj.items[0].id.videoId;
	      	var tag = document.createElement('script');
			tag.src = "https://www.youtube.com/iframe_api";
      		var firstScriptTag = document.getElementsByTagName('script')[0];
      		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
			// 3. This function creates an <iframe> (and YouTube player)
      		//    after the API code downloads.
      		var player;
      		function onYouTubeIframeAPIReady() {
        		player = new YT.Player('player', {
          		height: '500',
         	 	width: '100%',
          		videoId: vid,
		          	events: {
		            	'onReady': onPlayerReady
		          	}
        		});
      		}

	      // 4. The API will call this function when the video player is ready.
	      function onPlayerReady(event) {
	        event.target.playVideo();
	      }  
    </script>
	
	<div class="form-group">
		<button type="button" class="btn btn-primary" id="list_btn">목록으로</button>
		<button type="button" class="btn btn-warning" id="modify_btn">수정</button>
		<button type="button" class="btn btn-danger" id="delete_btn">삭제</button>
	</div>	
	<hr>	
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
			
	<div id="reply">
		<h4>댓글</h4>
		<ol class="replyList">
			<c:forEach items="${repList}" var="repList">
				<li>
					<p>
					<span class="glyphicon glyphicon-user"></span>
				   		${repList.writer}
				   		(<fmt:formatDate value="${repList.regdate}" pattern="yy-MM-dd" />)
				  	</p>
				  	<p class="bg-info">${repList.content}</p>
				  	<div class="form-group">            
						<button type="button" class="replyUpdate btn btn-warning btn-xs" data-rno="${repList.rno}">댓글수정</button>
						<button type="button" class="replyDelete btn btn-danger btn-xs" data-rno="${repList.rno}">댓글삭제</button>
					</div> 
					
					<script>
						$(".replyUpdate").click(function(){
							self.location = "/music/replyUpdate?bno=${view.bno}"
					    	+ "&page=${scri.page}"
					    	+ "&perPageNum=${scri.perPageNum}"
					    	+ "&searchType=${scri.searchType}"
					    	+ "&keyword=${scri.keyword}"
					    	+ "&rno=" + $(this).attr("data-rno");        
					  	});
					  
					  	$(".replyDelete").click(function(){
						   	self.location = "/music/replyDelete?bno=${view.bno}"
						    + "&page=${scri.page}"
						    + "&perPageNum=${scri.perPageNum}"
						    + "&searchType=${scri.searchType}"
						    + "&keyword=${scri.keyword}"
						    + "&rno=" + $(this).attr("data-rno"); 
						});    
					</script>
				 </li>
			 </c:forEach>   
		 </ol>
		 
		 <section class="replyForm">
			<form role="form2" method="post" autocomplete="off" class="form-horizontal">
				<input type="hidden" id="bno" name="bno" value="${view.bno}" readonly="readonly" />
				<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
			
				<h4>새댓글 작성</h4>
				<div class="form-group">
			 		<label for="writer" class="col-sm-2 control-label">이름 </label>
			 		<div class="col-sm-10">
			 			<input type="text" id="writer" name="writer" class="form-control"/>
			 		</div>
			 	</div>
			 	<div class="form-group">
			 		<label for="content" class="col-sm-2 control-label">내용 </label>
			 		<div class="col-sm-10">
			 			<input type="text" id="content" name="content" class="form-control"/>
			 		</div>
			 	</div>
			 	
			 	<div class="form-group">
			 		<div class="col-sm-offset-2 col-sm-10">
			 			<button type="button" class="repSubmit btn btn-success">작성</button>
			 		</div>
			  	</div>
				<script>
			  		var formObj = $(".replyForm form[role='form2']");
			  			$(".repSubmit").click(function(){
			   			formObj.attr("action", "replyWrite");
			   			formObj.submit();
			  		});
			  	</script>
			</form>
		</section>
	</div>
</div>	
</body>
</html>