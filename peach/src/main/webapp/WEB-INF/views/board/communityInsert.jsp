<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
	.Cinsert{
		height: 800px;
		width: 750px;
		margin: 0 auto;
		margin-top: 30px
	}
	.maintext {
		font-size: 26px;
		color: #000;
	}
</style>
<title>게시글 등록</title>
</head>
<body>
	<div class="Cinsert">
	<div class="maintext">게시글 등록</div>
		<br>
		<form action="<c:url value='/board/communityInsert'/>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input class="form-control" placeholder="제목" name="co_title">
			<p>*제목은 반드시 입력해야 합니다.</p>
			</div>
			<select name="CICategory" class="form-control">
			<option value="0">카테고리 선택</option>
			<c:forEach var="CCNames" items="${CCNames}" varStatus="status">
   				 <option value="${CCNames}">${CCNames}</option>
			</c:forEach>
			</select>
			<p>*카테고리는 반드시 선택해야 합니다.</p>
			<br>
			<div class="form-group">
				<textarea class="form-control" placeholder="내용" name="co_info" style="min-height: 400px"></textarea>
			</div>
			<input type="file" class="form-control" name="fileList">
			<br>
			<div style="text-align: center;">
				<button class="btn btn-danger">게시글 등록</button>
			</div>
		</form>
	</div>
</body>
</html>