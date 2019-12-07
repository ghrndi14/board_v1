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
	/* 작성버튼을 눌렀을때 벨리데이션을 체크하기 위한 함수 -> 빈 값으로 입력을 하면 팝업창으로 알려줌 */
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
				/* chk라는 클래스의 i번째가 공백이거나 null이면 알러트로 i번째의 타이틀을 출력해주는 함수 */
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	
		// 취소... 인데 널값도 등록이 된다 .. 시벌
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
				<!-- 목록과 글작성, 로그인, 로그아웃을 상단에 표시해줄 것임 -->
			</div>
			<hr />
			
			<section id="container">				
				<form name="writeForm" method="post" action="/board/write">
				<c:if test="${member.userId != null}"><!-- 로그인이 되어있어야 글작성이 가능 -->
				<!-- role="form" -> name="writForm" -->
					<!-- <table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
								</td>																	자바스크립트로 작성된 chk 클래스 사용
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content"  class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer"  class="chk" title="작성자을 입력하세요."/>
								</td>
							<tr>
								<td>						
									<button class="write_btn" type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table> -->
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">제목</label>
						<input type="text" id="title" name="title" class="form-control chk"  title="제목을 입력하세요."/>
					</div>									<!-- 자바스크립트로 작성된 chk 클래스 사용 -->				
					<div>
						<label for="content" class="col-sm-2 control-label">내용</label><textarea id="content" name="content"  class="form-control chk"></textarea>
					</div>			
					<div>	
						<label for="writer" class="col-sm-2 control-label">작성자</label><input type="text" id="writer" name="writer" class="form-control chk"/>
					</div>			
					<div>									
						<button class="write_btn btn btn-warning" type="submit">작성</button>
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