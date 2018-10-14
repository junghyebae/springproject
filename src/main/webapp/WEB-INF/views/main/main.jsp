<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty login}">
		${login.name }님 <a href="logout">Logout</a>
	</c:if>
	<c:if test="${empty login}">
		<a href="login">Login</a>
		<a href="regi">회원가입</a>
	</c:if> 
	<a href="bbs">게시판</a>
</body>
</html>