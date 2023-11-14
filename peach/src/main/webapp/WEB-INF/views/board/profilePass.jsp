<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>

	.row1{
		text-align: center;
		margin-left: 25%;
	}
	.qwe{
		font-weight: bold;
	}
</style>
	<title>프로필 관리 접속시, 비밀번호 요구</title>
</head>
<body>
	<div class="imsi-box">
			<div class="container1">
				<div class="row1">
					<div class="col-lg-8 col-12 custom-padding-right">
						<br>
						<br>
						<br>
						<h1 class="qwe">비밀번호 확인</h1>
						<br>
						<br>
						<br>
						<form action="<c:url value='/board/profilePass?pi_num=${pi_num}'/>" method="post">
							<div class="form-group">
								<h3>아이디 : ${user.me_id}</h3>
							</div>
							<br>
							<label for="Ppassword">비밀번호:</label>
    						<input type="password" id="Ppassword" name="Ppassword">
    						<input type="submit" value="로그인">
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
