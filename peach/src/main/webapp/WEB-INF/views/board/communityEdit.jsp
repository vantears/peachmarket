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
		text-align: center;
		margin-left: 280px;
		margin-top: 30px
	}
</style>
<title>게시글 수정</title>
</head>
<body>
	<div class="Cinsert">
	<h1>게시글 수정</h1>
		<br>
		<form action="<c:url value='/board/communityEdit/${co_num}'/>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input class="form-control" placeholder="제목" name="co_title" value="${detail.co_title}">
			</div>
			<p>*제목은 반드시 입력해야 합니다.</p>
			<select name="CICategory" class="form-control">
			<option>${detail.cc_name}</option>
			<c:forEach var="CCNames" items="${CCNames}" varStatus="status">
   				 <option value="${CCNames}">${CCNames}</option>
			</c:forEach>
			</select>
			<p>*카테고리는 반드시 선택해야 합니다.</p>
			<br>
			<div class="form-group">
				<textarea class="form-control" placeholder="내용" name="co_info" style="min-height: 400px">${detail.co_info}</textarea>
			</div>
			<input type="file" class="form-control" name="fileList">
			<button type="button" onclick="deleteUploadedFile()">기존 이미지 삭제</button>
			<br>
			<input type="hidden" name="editImg" value="${editImg}">
			<br>
			<button class="btn btn-danger">게시글 등록</button>
		</form>
		<br>
		
	</div>
	
</body>
<script>
  function deleteUploadedFile() {
    // 삭제할 이미지 파일명 가져오기
    const co_num = '${co_num}'; // 이미지 파일명을 서버에서 전달받아 설정
    var ans = confirm('삭제하시겠습니까?');
    if (ans) {
	    // 이미지 삭제 요청
	    $.ajax({
	      url: '<c:url value="/board/deleteUploadedFile"/>', // 이미지 삭제를 처리하는 서버 API의 URL
	      type: 'POST',
	      data: {co_num: co_num},
	      success: function (data) {
	    	alert('이미지를 삭제했습니다.')
	
	      },
	      error: function (xhr, status, error) {
	        console.error(error);
	        alert('이미지 삭제에 실패했습니다.');
	      }
	    });
    }
  }
</script>
</html>