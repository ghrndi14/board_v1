<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>	
		<!-- Bootstrap -->
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 합쳐지고 최소화된 최신 JS -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!-- jquery로 제어 head안에 jqueryCDN을 추가 -->
	 	<title>게시판</title>
	</head>
	<body>
		<!-- <div id="root"> -->
		<div class="container">
			<header>
				<h1> 게시판</h1>				
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
				<!-- 목록과 글작성을 상단에 표시해줄 것임 -->
			</div>
			<!-- <hr /> -->
			
			<section id="container">
				<!-- <form role="form" method="post" action="/board/write"> -->
				<form role="form" method="get">
					<!-- <table> -->
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						</thead>
						<c:forEach items="${list}" var = "list">
						
							<tr>
								<td><c:out value="${list.bno}" /></td>
								
								<td>
									<a href="/board/readView?bno=${list.bno}&
															 page=${scri.page}&
															 perPageNum=${scri.perPageNum}&
														     searchType=${scri.searchType}&
															 keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>													
						</c:forEach>
												
					</table>	
					
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
					    
					    <select name="searchType" class="form-control">
				      
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					    </select>
					   </div>
					
					
					<div class="col-xs-10 col-sm-10">
						<!-- <div> -->
						<div class="input-group">															<!-- 추가 -->
					    	<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
							<span class="input-group-btn"><!-- 추가 -->		<!-- 추가 -->
					    		<button id="searchBtn" type="button" class="btn btn-default">검색</button>
					    	</span>
					    </div>
					 </div>
					   
					    <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					 </div>
					
					
					<div class="col-md-offset-3">
						<ul class="pagination">
													
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						 	</c:if> 					
						 
						 	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>					
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
							
						</ul>
					</div>								
				</form>
			</section>	
			<hr />
			</div>
	
	</body>
</html>