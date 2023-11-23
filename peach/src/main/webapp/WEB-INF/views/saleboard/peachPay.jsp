<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
</head>
<script>
	if (confirm('포인트가 부족합니다. 추가 결제를 진행하시겠습니까?')) {
	    var IMP = window.IMP; 
	    IMP.init("imp41345184"); 
	    var inputAmount = '1'; // 사용자가 입력한 결제할 금액 (임의로 '1111'로 설정)
	    var minimumAmount = '1111'; // 최소 결제 금액 (예시로 5000원으로 설정)
	
	    if (parseInt(inputAmount) < minimumAmount) {
	        // 최소 결제 금액 미만인 경우 최소 금액으로 설정
	        inputAmount = minimumAmount.toString();
	        alert('최소 결제 금액 이하입니다. 최소 금액(' + minimumAmount + '원)으로 결제합니다.');
	    }
	    IMP.request_pay({
	        pg : 'danal_tpay',
	        pay_method : 'card',
	        merchant_uid: 'merchant_' + new Date().getTime(), 
	        name : '당근 10kg',
	        amount : inputAmount,
	        buyer_email : 'Iamport@chai.finance',
	        buyer_name : '포트원 기술지원팀',
	        buyer_tel : '010-1234-5678',
	        buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '123-456'
	    }, function (rsp) { // callback
	        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	    	if(rsp.success) {
	    		console.log(rsp);
	    	} else {
	    		console.log(rsp);
	    	}            	
	    });		                        
	} else {
	    // 사용자가 '취소'를 선택한 경우
	    console.log('추가 결제가 취소되었습니다.');
	    // 원하는 작업 수행 (예: 다른 동작 수행 또는 경고창 등)
	}	
</script>
</body>
</html>
