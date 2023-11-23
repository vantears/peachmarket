<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

	.container3{
	padding-top: 70px;
		height : 500px;
		width: 500px;
		margin: 0 auto;
	}

	.messages {
	    color: red;
	}
	
	
	label.error {
	    color: red;
	}
	
	.messages.error {
	    color: red;
	}
	</style>
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
</head>

<body class="bg-gradient-primary">
	<div class="container3">
		<form action="<c:url value='/member/pwUpdate'/>" method="post" id="form">
		<input type="hidden" value="${code }" name="code">
			<div class="form-group">
				<label>새 비밀번호 </label>
				<input style="border: 1px solid #f76076; border-radius: 5px;" type="password" name="me_pw" class="form-control" placeholder="새 비밀번호" id="pw">
			</div>
			<div class="form-group" >
				<label>새 비밀번호 확인</label>
				<input style="border: 1px solid #f76076; border-radius: 5px;" type="password" name="me_pw2" class="form-control" placeholder="새 비밀번호 확인">
			</div>
			<button class="btn" style="background-color: #f76076;width: 100%;">확인</button>
		</form>
	</div>  
	<script type="text/javascript">
		const pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+|]).{8,20}$/;
		
		$(function(){
		    $("#form").validate({
		        rules: {
		        	me_pw: {
		                required : true,
		                regex: pwRegex
		            },
		            me_pw2: {
		                required : true,
		                equalTo : pw //id가 pw인 요소와 값이 같은지 확인
		            }
		        },
		        messages : {
		        	me_pw: {
		                required : "필수로입력하세요",
		                regex : "숫자+영문자+특수문자 조합으로 8자 이상 20자 이하로 작성해야 합니다."
		            },
		            me_pw2: {
		                required : "필수로입력하세요",
		                equalTo : "비밀번호와 일치하지 않습니다."
		        	}
		        }
		    });
		})
		$.validator.addMethod(
		    "regex",
		    function(value, element, regexp) {
		        var re = new RegExp(regexp);
		        return this.optional(element) || re.test(value);
		    },
		    "Please check your input."
		);
	</script>
</body>
</html>