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
<style>
	.form-group{
		border: 1px solid #f76076;
		border-radius: 5px;
	}
	.btn{
		background-color: #f76076;
		width: 100%;
	}
		 #my-spinner { width: 100%; height: 100%; top: 0; left: 0; display: none; opacity: .6; background: silver; position: absolute; z-index: 2; }
        #my-spinner div { width: 100%; height: 100%; display: table; }
        #my-spinner span { display: table-cell; text-align: center; vertical-align: middle; }
        #my-spinner img { background: white; padding: 1em; border-radius: .7em; }
</style>
</head>

<body class="bg-gradient-primary">
<form commandName="member" id="createForm" action="<c:url value='/member/pw_auth.me'/>" method="post">
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
                    <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                    <p class="mb-4">아이디와 이름을 입력하시면 이메일에 인증번호를 보내드릴게요!</p>
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="me_id" name="me_id" placeholder="아이디를 입력하세요.">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="me_name" name="me_name" placeholder="이름을 입력하세요.">
                  </div>
                  <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn">비밀번호 찾기</a>
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
    <!-- 로딩 스피너 코드 추가 -->
    <div id='my-spinner'>
        <div>
            <span>
                <img src="<c:url value='/resources/image/loader_spinner.gif'/>">
            </span>
        </div>
    </div>
<script>
var path = "${pageContext.request.contextPath }";

$(document).ready(function() {
  var msg = "${msg}";
  if (msg != "") {
    alert(msg);
  }
});

function fnSubmit() {
  var id_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\-.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
  var name_rule = /^[가-힣]{2,}$/;


  if ($("#me_id").val() == null || $("#me_id").val() == "") {
    alert("아이디를 입력해주세요.");
    $("#me_id").focus();
    return false;
  }
  if ($("#me_name").val() == null || $("#me_name").val() == "") {
    alert("이름을 입력해주세요.");
    $("#me_name").focus();
    return false;
  }
  
  
  if (!id_rule.test($("#me_id").val())) {
    alert("이메일 형식으로 입력하세요.");
    return false;
  }
  if (!name_rule.test($("#me_name").val())) {
	    alert("한글 2글자 이상 입력하세요.");
	    return false;
  }

  if (confirm("비밀번호를 찾으시겠습니까?")) {
	$("#my-spinner").show();
    $("#createForm").submit();
    return false;
  }
}
	$("#my-spinner").hide();
</script>
  
</body>
</html>
