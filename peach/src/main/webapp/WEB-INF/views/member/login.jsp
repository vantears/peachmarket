<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
.imsi-box {
	min-height: 500px;
	padding-top: 50px;
}
.login-box {
	margin:0 auto;
}
.login-signup {
	display: block;
	text-align: center;
}
.id-pw-box {
	width: 450px;
	margin: 0 auto;
}
.login-find-box {
	margin: 0 auto;
	width: 450px;
	text-align: center;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div class="imsi-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12 login-box">
					<form action="<c:url value='/member/login'/>" method="post">
						<div class="id-pw-box">
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
							<div class="login-signup">
								<div class="mt-3" style="text-align:center;">
									<button style="margin-right: 10px; height: 45px; line-height: 30px; background-color: #f76076; border: none; color: #fff;" class="btn btn-outline-warning col-3">로그인</button>						
									<a style="margin-right: 10px; height: 45px; line-height: 34px; background-color: #609af7; border: none; color: #fff;" class="btn btn-outline-primary col-3" href="<c:url value='/member/signup'/>">회원가입</a>								
									<a class="btn-kakao mt-3 mb-2"
										href="https://kauth.kakao.com/oauth/authorize?client_id=48d34ab3779ba344d7b7d355a84f5660&redirect_uri=http://localhost:8080/peach/kakao/login&response_type=code">
										<img alt="카카오로그인" src="<c:url value='/resources/img/kakao_login.png'/>">
									</a>
								</div>
							</div>
						</div>
						<div class="login-find-box">
							<div class="find-box">
								<a href="<c:url value='/member/find_id'/>" class="btn">아이디 찾기</a>
								<a href="<c:url value='/member/pw_find'/>" class="btn">비밀번호 찾기</a>							
							</div>
						
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
    // 페이지가 로드될 때 서버에서 전달된 메시지 확인
    var successMessage = "${successMessage}";
    var errorMessage = "${errorMessage}";

    // 비밀번호 변경 성공 시
    if (successMessage !== "") {
        alert(successMessage);
    }
    
    // 비밀번호 변경 실패 시
    if (errorMessage !== "") {
        alert(errorMessage);
    }
</script>
</html>
