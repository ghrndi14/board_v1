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
		<!-- 수정, 삭제, 취소 버튼은 jquery로 제어할 것이기때문에 head안에 jqueryCDN을 추가 -->
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니가?");
				if(deleteYN == true){									
				
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
		
		
		// 목록
			$(".list_btn").on("click", function(){
			
			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		
		// 댓글 작성
			$(".replyWriteBtn").on("click", function(){
			/* 작성 버튼을 눌렀을때 값들이 replyWrite로 전달되게끔 함수를 만듬 */
			  
			/* formObj가 이미 쓰고있기때문에 함수 안에 다시 만들어주고 form의 name을 replyForm으로 바꿈 */
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/replyWrite");
			formObj.submit();
			});	
			
		// 댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){	// 클릭 이벤트
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
	// 수정 버튼을 클릭했을 때 url주소가 게시판 bno, page, perPageNum, searchType, keyword 
	// 그리고 댓글번호인 rno가 들어가 있는것이 보입니다								
								+ "&rno="+$(this).attr("data-rno");
										// 클릭 이벤트가 발생한 수정 버튼의 data-rno값을 가져옴
			});
					
		// 댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
			
	})
	</script>
	
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
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<!-- scri값을 보관하기위해 form태그안에 타입 hidden으로 input태그를 추가 -->
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				    <input type="hidden" id="page" name="page" value="${scri.page}"> 
				    <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				    <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				    <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				</form>				
				
				<%-- <table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table> --%>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜 : 
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></label><br>
				</div>
				
				<div>
					<%-- <button type="submit" class="update_btn> --%>									
					<button type="submit" class="update_btn btn btn-warning">수정</button>
					<button type="submit" class="delete_btn btn btn-danger">삭제</button>
					<button type="submit" class="list_btn btn btn-primary">목록</button>	
				</div>
				
				<!-- 댓글 -->
					<!-- <div id="reply"> -->
					<div class="container">
					  <ol class="replyList">
					    <c:forEach items="${replyList}" var="replyList">
					      <li>
					        <div class="form-group">
					        <label for="title" class="col-sm-2 control-label">작성자 : ${replyList.writer}</label><br>				       
					        </div>
					        <div class="form-group">
					        <label for="title" class="col-sm-2 control-label">작성 날짜 : <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></label><br>											     
					        </div>
					        <p>${replyList.content}</p>					        					        					        
					        <div>
					        	<%-- <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}"> --%>
								<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
								<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
							</div>
					      </li>
					    </c:forEach>   
					  </ol>
					</div>
					
					<!-- 댓글 작성을 위한 폼태그를 생성 -->
					<!-- <form name="replyForm" method="post"> -->
					<form name="replyForm" method="post" class="form-horizontal">
						<input type="hidden" id="bno" name="bno" value="${read.bno}" />
						 <!-- input태그 type=hidden으로 작성하신후 
						 댓글 작성자와 댓글 내용을 입력할 수 있는 input태그를 만듬 -->
					  	<input type="hidden" id="page" name="page" value="${scri.page}"> 
					  	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					  	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					  	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					  <!-- <div> -->
					  <div class="form-group">
					  	<!-- <label for="writer"> -->
					    <label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
					    <div class="col-sm-10"><!-- 추가 -->				<!-- 추가 -->	
					    	<input type="text" id="writer" name="writer" class="form-contol"/>
					    </div>
					   </div> 	
					    
					  <div class="form-group">		<!-- 추가 -->
					    <label for="content" class="col-sm-2 control-label">댓글 내용</label>
					    <div class="col-sm-10"><!-- 추가 -->	
					    	<input type="text" id="content" name="content" />
					 	 </div>
					 </div>
					 
					  <!-- <div> -->
					  <div class="form-group">
					  	<div class="col-sm-offset-2 col-sm-10">		<!-- 추가 -->
					 	 <button type="button" class="replyWriteBtn btn btn-success">작성</button>
					<!-- 작성 버튼을 눌렀을때 type을 hidden으로 만들어준 input태그의 값들이 replyWrite로 값이 감 -->
					  	</div>
					  </div>
					</form>
			
			</section>
			<hr />
		</div>
	</body>
</html>