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
	.submitBtn {
		width: 60px;
		height: 35px;
		box-shadow:none; 
		border-radius:5px; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		background: #f76076;
		border: 1px solid #f76076;
		color: #fff;
	}
	.form-control {
		width: 250px;
		height: 35px;
		margin-right: 10px;
	}
	.password-box {
		display:flex;
		justify-content: center;
		margin-bottom: 20px;
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
						<h1 class="qwe">개인정보 수정</h1>
						<br>
						<br>
						<br>
						<form action="<c:url value='/board/profilePass?pi_num=${pi_num}'/>" method="post">
							<label for="Ppassword">비밀번호 재확인</label>
							<br>
							<div class="password-box">
	    						<input type="password" class="form-control" id="Ppassword" name="Ppassword">
	    						<input class="submitBtn" type="submit" value="확인">							
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
