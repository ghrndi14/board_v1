<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
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
 		<title>로그인 페이지</title>
</head>



<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
			// 아이디가 memberUpdateBtn이라는 버튼을 클릭했을 때 member/memberUpdateView 로 가라는 뜻 
			// 그러면 컨트롤러에  member/memberUpdateView로 가라는 말
		})
		
	})
</script>


<body>
	<div class="container">
			<header>
				<h1>로그인 페이지</h1>
			</header>
			<hr />
			
			<ul>
	<li><a href="/board/list">목록</a></li>
	<li><a href="/board/writeView">글 작성</a></li>
	<li>
		<c:if test="${member != null}"><a href="/member/logout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="/">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${member != null}">
			<p>${member.userName}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>
			
			
	<section id="container">
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="userId" class="col-sm-2 control-label">아이디</label>
				<input type="text" id="userId" name="userId" class="form-control">
			</div>
			<div>
				<label for="userPass" class="m-2 control-label">비밀번호</label>
				<input type="password" id="userPass" name="userPass" class="form-control">
			</div>
			<div>
				<!-- <button type="submit">로그인</button> -->
				 <button type="submit" class="btn btn-success">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userName}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
	</section>
</div>
</body>
</html>