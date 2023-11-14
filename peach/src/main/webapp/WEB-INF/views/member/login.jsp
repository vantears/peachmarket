<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
.imsi-box{
	min-height: 500px;
	padding-top: 50px;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div class="imsi-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12 custom-padding-right">
					<form action="<c:url value='/member/login'/>" method="post">
						<div class="form-group">
							<label>아이디</label> <input type="text" class="form-control"
								name="me_id">
						</div>
						<div class="form-group">
							<label>비번</label> <input type="password" class="form-control"
								name="me_pw">
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" value="true" name="autoLogin">자동로그인
							</label>
						</div>
						<button class="btn btn-outline-warning col-12">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<a href="<c:url value='/member/find_id'/>" class="btn btn-facebook btn-user btn-block">아이디 찾기</a>
	<a href="<c:url value='/member/pw_find'/>" class="btn btn-warning btn-user btn-block">비밀번호찾기 찾기</a>
</body>
</html>
