<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
	.profile-withdraw{
		margin: 0 auto;
		width: 500px;
	}	
	.error{
		color: red;
	}
	.button-box {
		text-align: center;
	}
	.withdraw {
		width: 60px;
		height: 30px;
		box-shadow:none; 
		border-radius:5px; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		background: #f76076;
		border: 1px solid #f76076;
		color: #fff;
	}
</style>
<title>게시글 등록</title>
</head>
<body>
	<div class="profile-withdraw">
		<br>
		<h1>피치페이 출금</h1>
		<br>
		<br>
			<form action="<c:url value='/board/profilePay'/>" method="post">
				<label>은행명</label>
				<input type="text" class="form-control" name="PAccount_name" value="${member.me_bk_name}" disabled>
				<br>
				<label>계좌번호</label>
				<input type="text" class="form-control" name="PBank_name" value="${member.me_acc}" disabled>
				<br>
				<label>예금주</label>
				<input type="text" class="form-control" name="PReal_name" value="${member.me_name}" disabled>
				<p>*본인명과 일치하지 않는 계좌는 출금되지 않습니다.</p>
				<br>
				<input type="text" class="form-control" name="me_point" placeholder="출금액" id="PPoint">
				<p class="error">잔여 포인트 이상의 금액은 출금 할 수 없습니다.</p>
				<p>*현재 잔액은 <span>${member.me_point}</span>원입니다.</p>
				<br>
				<div class="button-box">
					<button class="withdraw">출금</button>
				</div>
			</form>
		<br>
	</div>
</body>
<script>
    
    // 숫자가 아닌 정규식
    var currentPoint = ${member.me_point};
    var replaceNotInt = /[^0-9]/gi;
    
    $(document).ready(function(){
        	$(".error").hide();
        $("#PPoint").on("input", function() {
        	$(".error").hide();
            var x = $(this).val();
            if (x > currentPoint) {
                x = currentPoint;
                $(".error").show();
                $(this).val(x);
            }
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
                
            });
        });
 
</script>

</html>

