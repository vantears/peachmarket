<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<style>
		/* 새로운 색상 스키마 */
		body {
			background-color: #f76076;
			color: #fff;
		}

/* 메시지가 표시되는 위치 및 스타일 지정 */
		.container2 {
			margin: 0 auto;
			width: 500px;
			background-color: #fff;
			border-radius: 10px;
			padding: 20px;
			margin-top: 20px;
		}
		
		/* 폼 스타일 */
		.form-group label {
			color: black;
		}
		.form-control {
			border: 1px solid #f76076;
			border-radius: 5px;
		}
		/* 버튼 스타일 */
		.btn-outline,
		.btn-success {
			background-color: #f76076;
			border: 1px solid black;
			color: #fff;
		}

		.btn-outline:hover,
		.btn-success:hover {
			background-color: #f76076;
			color: #fff;
		}
		/* 에러 메시지 */
		.messages,
		label.error,
		.messages.error {
			color: #f76076;
		}
	</style>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
  
</head>
<body>
	<div class="container2" style="border: 3px solid #f76076;">
		<form action="<c:url value='/member/signup'/>" method="post" id="form">
			<div class="form-group">
				<label>아이디</label>
				<input style="border: 1px solid #f76076;" type="text" name="me_id" class="form-control" placeholder="아이디">
			</div>
			<button class="btn btn-outline col-12" style="border: 1px solid #f76076;" type="button" id="btn-check">아이디 중복체크</button>
			<div class="form-group">
				<label>비밀번호</label>
				<input style="border: 1px solid #f76076;" type="password" name="me_pw" class="form-control" placeholder="비밀번호" id="pw">
			</div>
			<div class="form-group">
				<label>비밀번호 확인</label>
				<input style="border: 1px solid #f76076;" type="password" name="me_pw2" class="form-control" placeholder="비밀번호 확인">
			</div>
			<div class="form-group">
				<label>이름</label>
				<input style="border: 1px solid #f76076;" type="text" name="me_name" class="form-control" placeholder="이름">
			</div>
			<div class="form-group">
				<label>핸드폰 번호</label>
				<input style="border: 1px solid #f76076;" type="text" name="me_phone" class="form-control" placeholder="핸드폰 번호">
			</div>
			<div class="form-group">
				<label>닉네임</label>
				<input style="border: 1px solid #f76076;" type="text" name="me_nick" class="form-control" placeholder="닉네임">
			</div>
			<button class="btn btn-outline col-12" style="border: 1px solid #f76076;" type="button" id="btn-check2">닉네임 중복체크</button>
			<div class="form-group">
				<label>지역(시/도)</label>
				<select style="border: 1px solid #f76076;" name="large" class="form-control">
					<option value="0">시/도를 선택하세요.</option>
					<c:forEach items="${large}" var="name">
						<option>${name.ci_large }</option>	
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>지역(시/군/구)</label>
				<select style="border: 1px solid #f76076;" name="medium" class="form-control">
					<option value="0">시/군/구를 선택하세요.</option>
				</select>
			</div>
			<div class="form-group">
				<label>지역(읍/면/동)</label>
				<select style="border: 1px solid #f76076;" name="me_ci_num" class="form-control">
					<option value="">읍/면/동을 선택하세요.</option>
				</select>
			</div>
			<div class="form-group">
				<label>은행</label>
				<select style="border: 1px solid #f76076;" name="me_bk_name" class="form-control">
					<option value="">은행을 선택하세요.</option>
					<c:forEach items="${bankList }" var="bank">
					<option >${bank.bk_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>계좌번호</label>
				<input style="border: 1px solid #f76076;" type="text" name="me_acc" class="form-control" placeholder="계좌번호">
			</div>
			
			<button style="border: 1px solid #f76076; background-color:#f76076; " class="btn btn-success col-12">회원가입</button>
		</form>
	</div>
	<script type="text/javascript">
		let checkId = false;
		const idRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\-.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		const pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+|]).{8,20}$/;
		$('#btn-check').click(function(){
			//서버로 아이디를 전달=>Object로 id만 서버로 전송
			let id = $('[name=me_id]').val();
			if(id.trim() == ''){
				alert('아이디를 입력하세요.');
				return;
			}

			if(!idRegex.test(id)){
				alert('이메일 형식이 아닙니다.')
				return false;
			}
			$.ajax({
				async : true,
				url : '<c:url value="/member/id/check"/>', 
				type : 'post', 
				data : {id : id}, 
				success : function (data){
					//서버에서 아이디 사용 가능여부를 알려주면 알림창으로 알려줌=>Object로 사용 가능/불가능만 알려주면 됨
					if(data){
						alert('사용 가능한 아이디입니다.');
						checkId = true;
					}else{
						alert('이미 사용중인 아이디입니다.')
					}
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})		
		$('[name=me_id]').change(function(){
			checkId = false;
		})
		
		
		//닉네임 중복검사
		let checkNick = false;
		$('#btn-check2').click(function(){
			//서버로 아이디를 전달=>Object로 id만 서버로 전송
			let nick = $('[name=me_nick]').val();
			if(nick.trim() == ''){
				alert('닉네임을 입력하세요.');
				return;
			}
			let nickRegex = /^[a-zA-Z가-힣]{4,10}$/;
			if(!nickRegex.test(nick)){
				alert('영어,한글로 4글자 이상 입력하세요.')
				return false;
			}
			$.ajax({
				async : true,
				url : '<c:url value="/member/nick/check"/>', 
				type : 'post', 
				data : {nick : nick}, 
				success : function (data){
					//서버에서 닉네임 사용 가능여부를 알려주면 알림창으로 알려줌=>Object로 사용 가능/불가능만 알려주면 됨
					if(data){
						alert('사용 가능한 닉네임입니다.');
						checkNick = true;
					}else{
						alert('이미 사용중인 닉네임입니다.')
					}
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})

		$('[name=me_nick]').change(function(){
			checkNick = false;
		})
		
		
		$(function(){
		    $("#form").validate({
		        rules: {
		            me_id: {
		                required : true,
		                email : true
		            },
		            me_pw: {
		                required : true,
		                regex: pwRegex
		            },
		            me_pw2: {
		                required : true,
		                equalTo : pw //id가 pw인 요소와 값이 같은지 확인
		            },
		            me_name: {
		                required : true,
		                regex : /^[가-힣]{2,}$/
		            },
		            me_acc: {
		                required : true,
		                regex : /^[0-9]{10,20}$/
		            },
		            me_phone: {
		                required : true,
		                regex : /^(\+8210\d{4}\d{4}|010\d{4}\d{4})$/
		            },
		            me_nick: {
		                required : true,
		                regex : /^[a-zA-Z가-힣]{4,10}$/
		            },
		            me_ci_num: {
		            	required : true,
		            },
		            me_bk_name: {
		            	required : true,
		            }
		            
		        },
		        //규칙체크 실패시 출력될 메시지
		        messages : {
		            me_id: {
		                required : "필수로입력하세요",
		                email : "이메일 형식으로 입력하세요."
		            },
		            me_pw: {
		                required : "필수로입력하세요",
		                regex : "숫자+영문자+특수문자 조합으로 8자 이상 20자 이하로 작성해야 합니다."
		            },
		            me_pw2: {
		                required : "필수로입력하세요",
		                equalTo : "비밀번호와 일치하지 않습니다."
		            },
		            me_name: {
		                required : "필수로입력하세요",
		                regex : "한글 2글자 이상 입력하세요."
		            },
		            me_acc: {
		                required : "필수로입력하세요.",
		                regex : "10~20자로 -제외한 숫자만 입력하세요."
		            },
		            me_phone: {
		                required : "필수로입력하세요",
		                regex : "-제외한 숫자만 입력하세요."
		            },
		            me_nick: {
		                required : "필수로입력하세요",
		                regex : "영어,한글로 4글자 이상 입력하세요."
		            },
		            me_ci_num: {
		            	required : "필수로 입력하세요."
		            },
		            me_bk_name: {
		            	required : "필수로 입력하세요."
		            }
		            
		            
		        },
		  		submitHandler : function(){
		  			
		  			if(!checkId){
						alert('아이디 중복 검사를 하세요.');
						return false;
					}
					if(!checkNick){
						alert('닉네임 중복 검사를 하세요.');
						return false;
					}
		  			return true;
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
		
		
		//ajax를 이용하여 시/도를 선택하면 해당하는 시/군/구가 셋팅되는 코드
		$('[name=large]').change(function(){
			let largeName = $(this).val();
			//medium태그에 넣을 option태그
			let str = '<option value="">시/군/구를 선택하세요.</option>';
			//시도를 선택하세요를 선택하면
			if(largeName == ""){
				$('[name=medium]').html(str);
				$('[name=me_ci_num]').html('<option value="">읍/면/동을 선택하세요.</option>');
				return;
			}
			$.ajax({
				async : false,
				url : '<c:url value="/member/medium"/>', 
				type : 'post', 
				data : {large : largeName}, 
				success : function (data){
					for(medium of data){
						str += `<option>\${medium.ci_medium}</option>`
					}
					$('[name=medium]').html(str);
					$('[name=me_ci_num]').html('<option value="">읍/면/동을 선택하세요.</option>');
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
		
		$('[name=medium]').change(function(){
			let mediumName = $(this).val();
			//medium태그에 넣을 option태그
			let str = '<option value="">읍/면/동을 선택하세요.</option>';
			//시도를 선택하세요를 선택하면
			if(mediumName == ""){
				$('[name=me_ci_num]').html(str);
				return;
			}
			$.ajax({
				async : false,
				url : '<c:url value="/member/small"/>', 
				type : 'post', 
				data : {medium : mediumName}, 
				success : function (data){
					for(small of data){
						console.log(data)
						str += `<option value="\${small.ci_num}">\${small.ci_small}</option>`
					}
					$('[name=me_ci_num]').html(str);
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
		
		$('[name=me_phone]').focusout(function(){
		    let phone = $(this).val().trim(); // 입력란의 값을 가져옴
		
		    if(phone == ''){
		        alert('핸드폰 번호를 입력하세요.');
		        return;
		    }
		
		    $.ajax({
		        url: '<c:url value="/member/phone"/>',
		        type: 'POST',
		        data: { phone: phone},
		        success: function(data){
		            if(!data){
		                alert('이미 사용 중인 핸드폰 번호입니다.');
		            }
		        },
		        error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
		    });
		});
		
		$('[name=me_acc]').focusout(function(){
		    let acc = $(this).val().trim(); // 입력란의 값을 가져옴
		
		    if(acc == ''){
		        alert('계좌 번호를 입력하세요.');
		        return;
		    }
		
		    $.ajax({
		        url: '<c:url value="/member/acc"/>',
		        type: 'POST',
		        data: { acc: acc},
		        success: function(data){
		            if(!data){
		                alert('이미 사용 중인 계좌 번호입니다.');
		            }
		        },
		        error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
		    });
		});
		
		
	</script>
</body>
</html>