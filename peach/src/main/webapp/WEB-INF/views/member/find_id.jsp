<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body class="bg-gradient-primary">
<form commandName="member" id="createForm" action="<c:url value='/member/find_result_id'/>" method="post">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">아이디를 잊으셨나요?</h1>
                    <p class="mb-4">이름과 전화번호를 입력하시면 여기에 ID 링크를 보내드릴게요!</p>
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="me_name" name="me_name" placeholder="이름을 입력하세요.">
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="me_phone" name="me_phone" placeholder="전화번호를 입력하세요.">
                  </div>
                  <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-primary btn-user btn-block">ID 찾기</a>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="<c:url value='/member/signup'/>">계정 만들기!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="<c:url value='/member/login'/>">계정이 있으신가요? 로그인!</a>
                  </div>
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
var path = "${pageContext.request.contextPath }";

$(document).ready(function() {
  var msg = "${msg}";
  if (msg != "") {
    alert(msg);
  }
});

function fnSubmit() {
  var name_rule = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
  var phone_rule = /^(\+8210\d{4}\d{4}|010\d{4}\d{4})$/;

  if ($("#me_name").val() == null || $("#me_name").val() == "") {
    alert("이름을 입력해주세요.");
    $("#me_name").focus();
    return false;
  }

  if ($("#me_phone").val() == null || $("#me_phone").val() == "") {
    alert("전화번호를 입력해주세요.");
    $("#me_phone").focus();
    return false;
  }
  
  if (!name_rule.test($("#me_name").val())) {
	    alert("한글 2글자 이상 입력하세요.");
	    return false;
  }
  
  if (!phone_rule.test($("#me_phone").val())) {
    alert("전화번호 형식에 맞게 입력해주세요.");
    return false;
  }

  if (confirm("아이디를 찾으시겠습니까?")) {
    $("#createForm").submit();
    return false;
  }
}
</script>
  
</body>
</html>