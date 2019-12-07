<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #homeForm > div {
        margin: 15px 0;
    }

</style>
<html>
<head>
	<title>로그인</title>
	<!-- Bootstrap -->
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 합쳐지고 최소화된 최신 JS -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
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
				<h1> 게시판</h1>				
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
				
			</div>

<div class="container">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
	<div class="panel panel-success">
            
            <div class="panel-body">
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="userId" class="form-control" placeholder="ID" autofocus >
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="userPass" name="userPass" class="form-control" placeholder="Password">
			</div>
			<div>
				<button type="submit" class="form-control btn btn-primary">로그인</button>
				<button id="registerBtn" type="button" class="form-control btn btn-success">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>