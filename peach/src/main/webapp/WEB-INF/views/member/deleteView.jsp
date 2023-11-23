<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form-group{
		border: 1px solid #f76076;
		border-radius: 5px;
	}
	.btn{
		background-color: #f76076;
		width: 100%;
	}
</style>
</head>

<body class="bg-gradient-primary">
<form commandName="member" id="createForm" action="<c:url value='/member/deleteMe'/>" method="post">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-password-image"><img style="width: 100%; margin-top: 150px" src="<c:url value='/img/피치.png'/>"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">회원 탈퇴를 원하시나요?</h1>
                    <p class="mb-4">아이디와 비밀번호 전화번호를 입력하시면 탈퇴 도와드릴게요!</p>
                  </div>
                  <div class="form-group">
					<input type="email" class="form-control form-control-user" id="me_id" name="me_id" placeholder="아이디를 입력하세요.">
				  </div>
                  <div class="form-group">
					<input type="password" class="form-control form-control-user" id="me_pw" name="me_pw" placeholder="비밀번호를 입력하세요.">
				  </div>
				  <div class="form-group">
					<input type="password" class="form-control form-control-user" id="me_pw2" name="me_pw2" placeholder="비밀번호 확인">
				  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="me_phone" name="me_phone" placeholder="전화번호를 입력하세요.">
                  </div>
                  <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn">회원 탈퇴하기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
<script>
//페이지가 로드될 때 서버에서 전달된 메시지 확인
var successMessage = "${successMessage}";
var errorMessage = "${errorMessage}";
// 회원 탈퇴 성공 시
if (successMessage !== "") {
    alert(successMessage);
}
// 회원 탈퇴 실패 시
if (errorMessage !== "") {
    alert(errorMessage);
}
var path = "${pageContext.request.contextPath }";
$(document).ready(function() {
  var msg = "${msg}";
  if (msg != "") {
    alert(msg);
  }
});
function fnSubmit() {
  var id_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\-.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
  var pw_rule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+|]).{8,20}$/;
  var pw2_rule = $("#pw").val();
  var phone_rule = /^(\+8210\d{4}\d{4}|010\d{4}\d{4})$/;
  if ($("#me_id").val() == null || $("#me_id").val() == "") {
    alert("아이디를 입력해주세요.");
    $("#me_id").focus();
    return false;
  }
  
  if ($("#me_pw").val() == null || $("#me_pw").val() == "") {
    alert("비밀번호를 입력해주세요.");
    $("#me_pw").focus();
    return false;
  }
  
  if ($("#me_pw2").val() == null || $("#me_pw2").val() == "") {
    alert("비밀번호 확인을 입력해주세요.");
    $("#me_pw2").focus();
    return false;
  }
  
  if ($("#me_pw").val() !== $("#me_pw2").val()) {
    alert("비밀번호와 확인이 일치하지 않습니다.");
    return false;
  }
  
  if ($("#me_phone").val() == null || $("#me_phone").val() == "") {
    alert("전화번호를 입력해주세요.");
    $("#me_phone").focus();
    return false;
  }
  
  if (!id_rule.test($("#me_id").val())) {
    alert("이메일 형식으로 입력해주세요.");
    return false;
  }
  
  if (!pw_rule.test($("#me_pw").val())) {
    alert("숫자+영문자+특수문자 조합으로 8자 이상 20자 이하로 작성해야 합니다.");
    return false;
  }
  
  if (!phone_rule.test($("#me_phone").val())) {
    alert("전화번호 형식에 맞게 입력해주세요.");
    return false;
  }
  if (confirm("회원 탈퇴하시겠습니까?")) {
    $("#createForm").submit();
    return false;
  }
}
</script>

</body>
</html>