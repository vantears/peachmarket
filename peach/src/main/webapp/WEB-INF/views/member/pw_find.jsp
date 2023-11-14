<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class = "content" action="<c:url value='/member/pw_auth.me'/>" method="post">
	<div class="textbox">
  		<input id="me_name" name="me_name" pattern="/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/" type="text" />
  		<label for="text">이름</label>
   		<div class="error">한글 2글자 이상 입력하세요.</div>
 	</div>
	<div class="textbox">
  		<input id="me_id" name="me_id" type="email" pattern="/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\-.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/" required/>
  		<label for="email">아이디</label>
  	<div class="error">유효하지 않은 아이디 입니다.</div>
	</div><br><br>
   	<input type="submit" id="check" value="비밀번호찾기">
</form>
</body>
</html>
