<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
<!-- 글 생성시 -->
<form id="_form" action="bbsWriteAf" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td><label for="id">아이디</label></td>
			<td><input id="id" name="id" type="text" value="${login.id }"/><td>
		</tr>
		<tr>
			<td><label for="title">제목</label></td>
			<td><input id="title" name="title" type="text" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="file" id="fileload" name="fileload"></td>
		</tr>
		<tr>
			<td><label for="content">내용</label></td>
			<td><textarea cols="40" id="content" name="content" rows="10"></textarea></td>
		</tr>	
	</table>
	<button type="button" id="write"> 글쓰기</button>
</form>

	<script type="text/javascript">
	 $(document).ready(function() {
		$("#write").click(function() {
			$("#_form").submit();
		});
	});
	</script>
</body>
</html>