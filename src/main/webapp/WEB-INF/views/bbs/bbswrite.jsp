<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 글 생성시 -->
<form id="_form" action="bbswriteAf" method="post" enctype="multipart/form-data">
    <div class="col-md-9">
	<div class="form-group"> <!-- userId field -->
		<label class="control-label " for="id">아이디</label>
		<input class="form-control" id="id" name="id" type="text" value="${login.id }"/>
	</div>
	
	<div class="form-group"> <!-- "title" field -->
		<label class="control-label " for="title">제목</label>
		<input class="form-control" id="title" name="title" type="text" />
	</div>
	
	<div class="form-group"> <!-- content field -->
		<label class="control-label " for="content">내용</label>
		<textarea class="form-control" cols="40" id="content" name="content" rows="10"></textarea> 
	</div>
	
	<div class="form-group pull-right">
		<!-- <button type="submit"  class="btn btn-primary" id="write" > 글쓰기</button>
		 -->
		 <button type="button"  class="btn btn-primary" id="write" > 글쓰기</button>
	</div>
	
	</div>
</form>

<script type="text/javascript">
 $(document).ready(function() {
	$("#write").click(function() {
		var formData = $("#_form").serialize();
	
		$.ajax({
			type : "post",
			url : "bbsWriteAf",
			data : formData,
			success:function (data){
				if(data==1){
					location.href="bbs";
				}else{
					//...작성x  (insert error )
				}
			}, 
			error:function(request,status,error){
	             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
		
	});
});
</script>
</body>
</html>