<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="_form" method="post"> 
	<table>
	<tr style="height: 97px;">
		<td style="width: 90px;">아이디</td>
		<td><input type="text" name="id" id="user_id" data-msg="아이디"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td> <input type="password" name="password" id="user_pw" data-msg="비밀번호"></td>
	</tr>
	</table>
</form>

<div>
	<a href="findId.do">아이디</a> <a href="findPw.do"> / 비밀번호 찾기</a>
	<button type="button" id="_btnLogin">로그인</button>
</div>

<script type="text/javascript">
$("#_btnLogin").click(function() {
	if($("#user_id").val() == ""){
		alert($("#user_id").attr("data-msg") + " 입력해 주십시오" );
		$("#user_id").focus();
	} else if($("#user_pw").val() == ""){
		alert($("#user_pw").attr("data-msg") + " 입력해 주십시오" );
		$("#user_pw").focus();
	} else{  
		
		var formData = $("#_form").serialize();
		$.ajax({
		    type : "post",
			data : formData,
		    url : "./loginAf",
		    success : function(data) {
		    	alert(data);
		       if(data == "로그인 성공"){
		    	   location.href="./";
		       }else {
		    	   location.href="./login";
		       }
		    },
		    error : function(xhr, status, error) {
		       alert("아이디 또는 비밀번호를 다시 확인하세요");
		    }
		});
	}
});


$("#user_id").keypress(function(event) {
	if(event.which == "13"){
		$("#_btnLogin").click();
	}
});

$("#user_pw").keypress(function() {
	if(event.which == "13"){
		$("#_btnLogin").click();
	}
});


</script>

</body>
</html>