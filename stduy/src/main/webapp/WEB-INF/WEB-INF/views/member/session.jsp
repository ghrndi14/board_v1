<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
<%-- <%@ include file="include/header.jsp" %> --%>
</head>
<body>
<%-- <%@ include file="include/menu.jsp" %> --%>
    <c:if test="${msg == 'success'}">
    <h2>${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</h2>
    </c:if>
</body>
</html>