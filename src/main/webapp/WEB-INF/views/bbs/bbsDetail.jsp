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
	<form action="bbsUpdate" id="_form" method="post">
		<input type="hidden" value="${bbs.seq }" id="seq" name="seq">
		<div>
			<input type="text" name="title" class="bbs" id="title" value="${bbs.title}" readonly>
		</div>
		<div>${fn:substring(bbs.wdate,0,10) }</div>
		<div>
			<textarea name="content" class="bbs" readonly>${bbs.content }</textarea>
		</div>
		<c:if test="${login.id == bbs.id}">
			<button type="button" class="update" id="update">수정</button>
			<button type="button" class="updateAf" id="cancel" hidden="hidden">취소</button>
			<button type="submit" class="updateAf" hidden="hidden">수정하기</button>
			<button type="button" class="update" id="delete">삭제</button>
		</c:if>
	</form>
	
	<script type="text/javascript">
	$(document).ready(function () {
		$("#update").click(function () {
			$(".bbs").attr("readonly", false);
			$(".update").hide();
			$(".updateAf").show();
		});
		
		$("#cancel").click(function () {
			var res = confirm("작성중인 글을 취소하시면 저장되지 않습니다.");
			if(res){
				location.href="bbsDetail?seq=${bbs.seq }";
			}
		});
		
		$("#delete").click(function () {
			var res = confirm("삭제 하겠습니까?");
			if(res){
				location.href="bbsDelete?seq=${bbs.seq}";
			}
		});
		
	});
	</script>
	
</body>
</html>