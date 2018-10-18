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

<form action="bbsSearch" id="searchForm">
	<div>
		<table>
			<tr>
				<td>검색</td>
				<td>
					<select name="item">
						<option value="total"  <c:if test="${item eq 'total' }">selected="selected"</c:if>>전체선택</option>
						<option value="title"  <c:if test="${item eq 'title' }">selected="selected"</c:if>>제목</option>
						<option value="writer" <c:if test="${item eq 'writer'}">selected="selected"</c:if>>글쓴이</option>
					</select>
				</td>
				<td><input type="text" id="search" name="search" value="${search}"></td>
				<td><input type="button" id="searchBtn" value="검색"></td>
			</tr>
		</table>
	</div>
</form>

<form>
	<div class="row">
		<div class="col-sm-12">
			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<colgroup>
						<col class="col-sm-1" />
						<col class="col-sm-7" />
						<col class="col-sm-2" />
						<col class="col-sm-2" />
					</colgroup>
					<thead>
						<tr class="active">
							<th>번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>글쓴이</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bbsList }" var="bbs">
							<tr>
								<td>${bbs.seq }</td>
								<td><a href="bbsDetail?seq=${bbs.seq }">${bbs.title }</a></td>
								<td>${bbs.readcount }</td>
								<td>${bbs.id }</td>
								<td>${fn:substring(bbs.wdate,5,10) }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<c:if test="${not empty login}">
		<a href="bbsWrite">글쓰기</a>
	</c:if>
</form>	

	<script type="text/javascript">
	$(document).ready(function () {
		$("#searchBtn").click(function () {
			if($("#search").val() == "" ) {
				alert("검색어 입력해 주세요");
			}else {
				$("#searchForm").submit();
			}
		});
	});
	</script>
</body>
</html>