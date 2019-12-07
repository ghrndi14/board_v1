<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<!-- 작성 버튼을 jquery로 제어할 것이기때문에 head안에 jqueryCDN을 추가 -->
	 	<title>게시판</title>
	</head>
	

	
	<script type="text/javascript">
	
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	
		
		$(".cancle_btn").on("click", function(){
			
			location.href = "/board/list";
		})


	</script>
	
	<body>
	
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
				
			</div>
			<hr />
			
			<section id="container">										
				<form name="writeForm" method="post" action="/board/write">
				<c:if test="${member.userId != null}">
				
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">제목</label>
						<input type="text" id="title" name="title" class="form-control chk"  title="제목을 입력하세요."/>
					</div>								
					<div>
						<label for="content" class="col-sm-2 control-label">내용</label><textarea id="content" name="content"  class="form-control chk"  title="내용을 입력하세요."></textarea>
					</div>			
					<div>	
						<label for="writer" class="col-sm-2 control-label">작성자</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${member.userName}" readonly="readonly" />
					</div>	
					
							
					<div>									
						<button type="submit" class="write_btn btn btn-warning" >작성</button>
						<button type="submit" class="cancle_btn btn btn-danger">취소</button>
					</div>	
					</c:if>	
					<c:if test="${member.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
					</c:if>			
									
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>