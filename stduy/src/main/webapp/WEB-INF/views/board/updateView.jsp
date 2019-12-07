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
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
		})
	
	</script>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");			
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
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
				
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">제목</label>
								<input type="text" id="title" name="title" value="${update.title}" class="form-control chk" title="제목을 입력하세요."/>
						</div>
						<div>	
							<label for="content"  class="col-sm-2 control-label">내용</label>
								<textarea id="content" name="content" class="form-control chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
						</div>
						<div>								
							<label for="writer" class="col-sm-2 control-label">작성자</label>
								<input type="text" id="writer" name="writer" value="${update.writer}" class="form-control" readonly="readonly"/>
						</div>	
						<div>	
							<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
								<%-- <fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" /> --%>	
								<input type="text" id="regdate" neme="regdate" value="${update.regdate}" pattern="yyyy-MM-dd" class="form-control" readonly="readonly"/>				
						</div>		
					<div>
						<button type="submit" class="write_btn btn btn-success">저장</button>
						<button type="submit" class="cancle_btn btn btn-danger">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>