<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
    <title>Trade Page</title>
</head>
	<style>
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.4);
		}
		
		.modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  height: 506px;
		}
		.modal-image {
		    display: block;
		    margin: 30px auto;
		    border-style: none;
		}
		.modal-text1{
			font-size: 20px;
		    line-height: 1.5;
		    margin-bottom: 15px;
		    text-align: center;
		    font-weight: bold;
		}
		.modal-text2{
			line-height: 1.5;
		    margin-bottom: 35px;
		    text-align: center;
		}
		
		.button-container {
		  display: flex;
		  flex-direction: column;
		  margin-top: 35px;
		  margin-bottom: 20px;
		}
		
		.rectangle-button {
		  width: 100%;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
		.red-button button, .pink-button button {
		  border: none;
		  padding: 10px 0;
		  cursor: pointer;
		  font-size: 16px;
		  color: white;
		  font-weight: bold;
		  width: 280px; /* 버튼 길이 */
		  height: 38px; /* 버튼 높이 */
		  transition: background-color 0.3s;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  border-radius: 8px; /* 버튼의 모서리를 부드럽게 설정 */
		}
		
		.red-button button {
		  background-color: red; /* 빨간색 배경색 */
		  margin-bottom: 10px;
		}
		
		.pink-button button {
		  background-color: pink; /* 분홍색 배경색 */
		}
		
		/* 호버 효과 */
		.red-button button:hover {
		  opacity: 0.8;
		}
		
		.pink-button button:hover {
		  opacity: 0.8;
		}
		.customer-center-container {
			padding: 3.5rem 2rem 1.5rem;
		    font-size: 12px;
		    line-height: 1.5;
		    color: rgb(153, 153, 153);
		}	
		.customer-center-container p{
		    width: 100%;
		    border-top: 1px solid rgb(229, 229, 229);
		    padding-top: 1rem;
		    font-size: 12px;
    	}			
		.close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}		
		
		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		
		.container1 {
			color: black;
			width: 900px;
			margin: auto;
			
		}
		.image-box {
			display: flex;
			height: 600px;
			align-items:center;
			justify-content:center;
		}
		.image-slide-right {
			position: absolute; 
			margin-right: 50px;
			right: 0;
		  	top:50%;
		  	-webkit-transform: translateY(-50%);
		  	transform: translateY(-50%);
			cursor: pointer;
			outline: none;
			width: 11px;
			height: 21px;
		    border: none;
		    background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-right-134c53f44716c3bef227ec30da385b4b09c9c068d339a617a23093718f379d02.svg) no-repeat;
		}
		.image-slide-right:hover {
			background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-right-hover-c71a5a4d1745bf59f056660eadc57e451f619b5bddaff0c9fdf2f8e3b4d955f8.svg) no-repeat;
		}
		.image-slide-left {
			position: absolute; 
			margin-left: 50px;
			left: 0;
		  	top:50%;
		  	-webkit-transform: translateY(-50%);
		  	transform: translateY(-50%);
			cursor: pointer;
			outline: none;
			width: 11px;
			height: 21px;
		    border: none;
		    background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-left-4c0e713bfa2cd12bd959e6dd9ef456cd6fc094953c41e605f6b9a59bc1680686.svg) no-repeat;
		}
		.image-slide-left:hover {
			background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-left-hover-bbda49cc160e798261c2dd4894cc623d0118a701fbb705546fc06de658ce3996.svg) no-repeat;
		}
		.image {
			height: 100%;
			width: 100%;
		}
		.profile-box {
			height: 42px;
			margin-top: 12px;
			margin-bottom: 12px;
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #e9ecef;
		}
		.content-box {
			padding: 20px 0;
			margin: 0 auto;
			border-bottom: 1px solid #e9ecef;
		}
		.title {
			margin-top: 10px;
			font-size: 20px;
			font-weight: 600;
			line-height: 1.5;
			letter-spacing: -0.6px;
		}
		.category-date {
			margin-top: 4px;
			font-size: 13px;
			line-height: 1.46;
			letter-spacing: -0.6px;
			color: #868e96;
		}
		.price {
			font-size: 18px;
			font-weight: bold;
			margin-top: 4px;
			line-height: 1.76;
			letter-spacing: -0.6px;
		}
		.price::after {
			content: "원";
			font-size: 16px;
			margin-left: 4px;
		}
		.content {
			font-size: 17px;
			line-height: 1.6;
			letter-spacing: -0.6px;
			margin: 16px 0;
			word-break: break-all;
		}
		.wish-text {
			font-size: 13px;
			line-height: 1.46;
			letter-spacing: -0.6px;
			color: #868e96;
		}
		.button-box {
			display: flex;
			justify-content: center;
			margin-top: 20px;
			margin-bottom: 20px;
		}
		.wish {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			border: none;
			color: rgb(255, 255, 255);
		}
		.wish.add {
			background: rgb(204, 204, 204);
		}
		.wish.cancel {
			background: rgb(51, 51, 51);
		}
		.wish-type {
			font-weight: 700;
			color: rgb(255, 255, 255);
		}
		.chat {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			background: rgb(219, 112, 147); /* 어두운 분홍색 */
			border: 1px solid rgb(219, 112, 147); /* 동일한 색으로 테두리 설정 */
			color: rgb(255, 255, 255);
		}
		.pay {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			background: rgb(255, 164, 37);
			border: 1px solid rgb(243, 150, 20);
			color: rgb(255, 255, 255);
		}
		.cancel {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			background: rgb(247, 0, 0);
			border: 1px solid rgb(223, 0, 0);
			color: rgb(255, 255, 255);
		}
		.kind {
			position: relative;
			width: 100%;
			height: 650px;
		}
		.kind_slider {
		  border:1px solid #e9ecef;
		  margin-left: 138px; 
		  width:600px;
		  height: 600px;
		  position: relative;
		  overflow: hidden;
		}
		.kind_slider .slides { 
		  position: absolute; 
		  left: 0;
		  top: 0;
		  width: 600px;
		}
		.kind_slider .slides li {
		  float:left;
		}
		.kind_slider img {
		  width: 600px;
		  height: 600px;
		}
		.slide_pagination {
		  /* layout */
		  display: flex;
		  gap: 5px;
		
		  /* position */
		  position: absolute;
		  /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
		  left: 50%;
		  transform: translateX(-50%);
		}
		.slide_pagination > li {
		  /* 현재 슬라이드가 아닌 것은 투명도 부여 */
		  color: #e2e2e2;
		  cursor: pointer;
		  font-size: 25px;
		}
		.slide_pagination > li.active {
		  /* 현재 슬라이드 색상은 투명도 없이 */
		  color: black;
		}
	</style>
<body>
<c:choose>
    <c:when test="${empty trList}">
        <h3>잘못된 접근입니다.</h3>
    </c:when>
    <c:otherwise>
		<c:forEach items="${trList}" var="tr">
			<div class="container1">
				<div class="kind">
					<div class="kind_slider">
					    <ul class="slides">
					        <c:forEach items="${tr.saleBoardVO.saleImageVOList}" var="saleImage">
				       			 <li><img class="item" src="<c:url value='/resources/image/${tr.saleBoardVO.saleImageVOList.size() != 0 ? tr.saleBoardVO.saleImageVOList.get(0).si_name :\"\" }'/>"></li>
				      		</c:forEach>
					    </ul>
					</div>
				    <ul class="slide_pagination"></ul>
				  	<div class="arrow">
				      <button class="image-slide-left"></button>
				      <button class="image-slide-right"></button>
				 	</div>
				</div>
				<div class="profile-box">
					<div class="profile-left">
						<img src="" class="profile-thumnail">
						<div class="profile-name">${tr.saleBoardVO.sb_me_nickname}</div>
					</div>
					<div class="profile-right">
						<div class="profile-right-box">
							<span class="profile-sweetness-text">당도</span>
							<span class="profile-sweetness">${tr.saleBoardVO.sb_me_sugar}</span>
						</div>
					</div>
				</div>
				<div class="content-box">
					<p class="title">판매자: ${tr.saleBoardVO.memberVO.me_name}</p>
					<p class="title">구매자: ${tr.memberVO.me_name}</p>
					<p class="title">${tr.saleBoardVO.sb_name}</p>
					<p class="category-date">${tr.saleCategoryVO.sc_name} | ${tr.saleBoardVO.sb_date}</p>
					<p class="price">${tr.saleBoardVO.sb_price}</p>
					<p class="content">${tr.saleBoardVO.sb_info}</p>
				</div>
				<div class="button-box">
					<c:choose>
						<c:when test="${user.me_num == tr.tq_me_num && tr.tradingVO.tr_cu == 1}">
							<button type="button" onClick="location.href='<c:url value='/saleboard/update?sb_num=${board.sb_num }'/>'" class="chat">피치톡</button>
							<button id="underTake" type="button" class="pay" data-tq-num="${tr.tq_num}">인수완료</button>
							<button type="button" onClick="location.href='<c:url value='/saleboard/delete?sb_num=${board.sb_num }'/>'" class="cancel">거래취소요청</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${user.me_num == tr.saleBoardVO.sb_me_num && tr.tradingVO.tr_se == 1}">
									<button type="button" onClick="location.href='<c:url value='/saleboard/update?sb_num=${board.sb_num }'/>'" class="chat">피치톡</button>
									<button id="giveItem" type="button" class="pay" data-tq-num="${tr.tq_num}">인계완료</button>
									<button type="button" onClick="location.href='<c:url value='/saleboard/delete?sb_num=${board.sb_num }'/>'" class="cancel">거래취소요청</button>
								</c:when>
								<c:otherwise>
									<p>상대방이 인수/인계를 완료를 기다리는 중입니다.</p>
								</c:otherwise>
							</c:choose>
						</c:otherwise>	
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
<script>
$(document).ready(function(){
    $("#underTake").click(function(){
    	var tq_num = $(this).data('tq-num');
        $.ajax({
            method: "POST", // 요청 방식 (GET, POST 등)
            url: '<c:url value="/sale/undertake"/>', // 서버 엔드포인트 URL
            data: {tq_num: tq_num},
            dataType: 'json',
            success: function(map) {
                // 성공 시 실행될 코드
                console.log("요청 성공", map);
                // 여기서 성공 시 할 작업을 수행
                alert("제품 인수를 완료하였습니다");
                location.reload();
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 실행될 코드
                console.log("요청 오류", error);
                // 여기서 오류 시 할 작업을 수행
            }
        });
    });
});

$(document).ready(function(){
    $("#giveItem").click(function(){
    	var tq_num = $(this).data('tq-num');
        $.ajax({
            method: "POST", // 요청 방식 (GET, POST 등)
            url: '<c:url value="/sale/giveitem"/>', // 서버 엔드포인트 URL
            data: {tq_num: tq_num},
            dataType: 'json',
            success: function(map) {
                // 성공 시 실행될 코드
                console.log("요청 성공", map);
                // 여기서 성공 시 할 작업을 수행
                alert("제품 인계를 완료하였습니다");
                location.reload();
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 실행될 코드
                console.log("요청 오류", error);
                // 여기서 오류 시 할 작업을 수행
            }
        });
    });
});

</script>
</html>