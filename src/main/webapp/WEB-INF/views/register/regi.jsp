<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
<form id="_form" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" id="id" required="required"><span id="idCheck"></span></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password" required="required"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" required="required"> </td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" required="required"></td>
	</tr>
</table>
	<button id="regi">회원가입</button>
</form>

<script type="text/javascript">
$("#id").blur(function () {
	var id = $(this).val();
	//1. 조건 확인 (4자이상 10자 이하) 	//2. 존재하는 아이디 확인  //3.
	$.ajax({
		type : "POST",
		data : { 
			"id" : id
		},
		url : "./regiIdCheck",
		success : function (data) {
			if(data){
				$("#idCheck").empty().append("사용 가능한 아이디입니다.");
				$("#idCheck").css("color", "green");
			}else{
				$("#idCheck").empty().append("이미 사용중인 아이디입니다.");
				$("#idCheck").css("color", "red");
			}
		},
	  	error : function(xhr, status, error) {
	    }
	});
});

$("#regi").click(function () {
	$.ajax({
		type : "POST",
		data : $("#_form").serialize(),
		url : "./regiAf",
		success : function (data) {
			if(data){
				alert("환영합니다");
				location.href="./";
			}else{
				alert("회원가입 실패");
			}		
		},
		error : function (xhr, status, error) {
		}
	});
});
</script>
</body>
</html>