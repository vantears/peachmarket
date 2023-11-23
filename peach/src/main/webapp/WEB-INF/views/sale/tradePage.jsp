<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
    <title>Trade Page</title>
</head>
	<style>
		/*오류처리*/
		.empty-space{
			height: 300px;
		}
        .message-container {
        	width: 100%;
			height: 800px;
           text-align: center;
           padding: 20px;
        }
        .no-items-img{
        	flex: 0 0 196px;
        }
        .no-items-message {
        	
            font-size: 20px;
            color: #555;
            margin: 10px 0;
        }
		/*신고모달*/
		.custom-modal {
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
		
		.custom-modal .modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  padding: 20px;
		  text-align: center;
		  border-radius: 8px;
		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		}
		
		.custom-modal .modal-header h2 {
		  font-size: 24px;
		  font-weight: bold;
		}
		
		.custom-modal .report-reason {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  resize: none;
		  height: 200px;
		}
		
		.custom-modal .report-button,
		.custom-modal .cancel-button {
		  padding: 10px 20px;
		  font-size: 16px;
		  cursor: pointer;
		  border: none;
		  border-radius: 5px;
		  margin-right: 10px;
		}
		
		.custom-modal .report-button {
		  background-color: #ff5733;
		  color: white;
		}
		
		.custom-modal .report-button:hover {
		  background-color: #ff4500;
		}
		
		.custom-modal .cancel-button {
		  background-color: #ccc;
		  color: #333;
		}
		
		.custom-modal .cancel-button:hover {
		  background-color: #999;
		}
		
		.custom-modal .close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}
		
		.custom-modal .close:hover,
		.custom-modal .close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		.report-text-area {
			text-align: left;
			margin-top: 20px;
		}
		.maxtext {
			color: grey;
			font-size: 13px;
		}
		.report-post {
			background-color: #ff5733; /* Choose your desired background color */
			color: white;
			border: none;
			padding: 10px 20px; /* Adjust padding as needed */
			font-size: 14px;
			cursor: pointer;
			border-radius: 5px; /* Rounded corners for the button */
		}
		.report-post:hover {
			background-color: #ff4500; /* Change the background color on hover */
		}

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
			margin-top: 30px;
			
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
		}
		.content-box {
			padding: 20px 0;
			margin: 0 auto;
			border-top: 1px solid #e9ecef;
			border-bottom: 1px solid #e9ecef;
		}
		.title {
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
	    <div class="message-container">
     		<div class="empty-space">
     		</div>
     		<img class="no-items-img" width="100px" height="100px" src="<c:url value='/img/RESISTX.gif'/>">
         	<p class="no-items-message">잘못된 접근입니다.</p>
     	</div>
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
						<c:if test="${tr.tradingVO.tr_se == 1 }">
						<div class="profile-name" style="font-size: 14px; text-align: center; color: grey;">인계대기중</div>
						</c:if>
						<c:if test="${tr.tradingVO.tr_se == 2 }">
						<div class="profile-name" style="font-size: 14px; text-align: center;">인계완료</div>
						</c:if>
						<div class="profile-name" style="font-size: 18px;">판매자 : ${tr.saleBoardVO.memberVO.me_nick}</div>
					</div>
					<div class="profile-right">
						<div class="profile-right-box">
							<c:if test="${tr.tradingVO.tr_cu == 1 }">
							<div class="profile-name" style="font-size: 14px; text-align: center; color: grey;">인수대기중</div>
							</c:if>
							<c:if test="${tr.tradingVO.tr_cu == 2 }">
							<div class="profile-name" style="font-size: 14px; text-align: center;">인수완료</div>
							</c:if>
							<span class="profile-sweetness" style="font-size: 18px;">구매자 : ${tr.memberVO.me_nick}</span>
						</div>
					</div>
				</div>
				<div class="content-box">
					<p class="title">${tr.saleBoardVO.sb_name}</p>
					<p class="category-date">${tr.saleCategoryVO.sc_name} | ${tr.saleBoardVO.sb_date}</p>
					<p class="price">${tr.saleBoardVO.sb_price}</p>
					<p class="content">${tr.saleBoardVO.sb_info}</p>
				</div>
				<div class="button-box">
					<c:choose>
						<c:when test="${user.me_num == tr.tq_me_num && tr.tradingVO.tr_cu == 1}">
							<button type="button" onClick="location.href='<c:url value='/chat/chat?sb_num=${tr.saleBoardVO.sb_num}'/>'" class="chat">피치톡</button>
							<button id="underTake" type="button" class="pay" data-tq-num="${tr.tq_num}">인수완료</button>
							<button type="button" class="report-post" id="openReportModalBtn">거래취소 요청</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${user.me_num == tr.saleBoardVO.sb_me_num && tr.tradingVO.tr_se == 1}">
									<button type="button" onClick="location.href='<c:url value='/chat/chat?sb_num=0'/>'" class="chat">피치톡</button>
									<button id="giveItem" type="button" class="pay" data-tq-num="${tr.tq_num}">인계완료</button>
									<button type="button" class="cancel" id="openReportModalBtn">거래취소 요청</button>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${tr.tradingVO.tr_cu == 2 && tr.tradingVO.tr_se == 2}">
											<p>거래가 완료되었습니다.</p>
										</c:when>
										<c:otherwise>																						
											<c:choose>
												<c:when test="${user.me_num == tr.tq_me_num && tr.tradingVO.tr_cu == 2}">
													<p>인수가 완료되었습니다. 상대방이 인계를 완료하면 거래가 종료됩니다.</p>
												</c:when>
												<c:otherwise>
													<p>인계가 완료되었습니다. 상대방이 인수를 완료하면 거래가 종료됩니다.</p>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>	
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
					<div id="reportPostModal" class="custom-modal">
						  <div class="modal-content">
						    <span class="close">&times;</span>
						    <div class="modal-header">
						      <h2>거래취소 요청</h2>
						    </div>
						    <div class="modal-body">
						      <p>거래취소 요청 사유를 작성해주세요.</p>
						      <p>최대한 자세하게 기재해주셔야 원활한 취소 처리가 가능합니다.</p>
						      <div class="report-text-area">
							      <p class="maxtext">* 최대 500자 제한</p>
							      <textarea id="reportReason" class="report-reason" placeholder="거래취소 요청 사유를 입력하세요" maxlength="500"></textarea>						      
						      </div>
						    </div>
						    <div class="modal-footer">
						      <button class="report-button" onclick="reportPost()">거래취소 요청</button>
						      <button class="cancel-button" onclick="closeReportModal()">취소</button>
						    </div>
						  </div>
						</div>
</body>
<script>
	//인수 확인
	$(document).ready(function(){
	    $("#underTake").click(function(){
	        var tq_num = $(this).data('tq-num');
	
	        // 확인창 보이기
	        var confirmUndertake = confirm("제품 인수를 완료하시겠습니까?");
	        
	        if (confirmUndertake) {
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
	                error: function(xhr, status, error1) {
	                    // 오류 발생 시 실행될 코드
	                    console.log(xhr);
	                    // 여기서 오류 시 할 작업을 수행
	                }
	            });
	        } else {
	            // 사용자가 "아니요"를 선택한 경우
	            // 아무 동작 없이 그냥 종료
	        }
	    });
	});
	//인수 취소
	$(document).ready(function(){
	    $("#underTakeCancel").click(function(){
	        var tq_num = $(this).data('tq-num');
	
	        // 확인창 보이기
	        var confirmUndertake = confirm("제품 인수를 취소하시겠습니까?");
	        
	        if (confirmUndertake) {
	            $.ajax({
	                method: "POST", // 요청 방식 (GET, POST 등)
	                url: '<c:url value="/sale/undertakeCancel"/>', // 서버 엔드포인트 URL
	                data: {tq_num: tq_num},
	                dataType: 'json',
	                success: function(map) {
	                    // 성공 시 실행될 코드
	                    console.log("요청 성공", map);
	                    // 여기서 성공 시 할 작업을 수행
	                    alert("제품 인수를 취소하였습니다");
	                    location.reload();
	                },
	                error: function(xhr, status, error) {
	                    // 오류 발생 시 실행될 코드
	                    console.log("요청 오류", error);
	                    // 여기서 오류 시 할 작업을 수행
	                }
	            });
	        } else {
	            // 사용자가 "아니요"를 선택한 경우
	            // 아무 동작 없이 그냥 종료
	        }
	    });
	});
	//인계 완료
	$(document).ready(function(){
	    $("#giveItem").click(function(){
	        var tq_num = $(this).data('tq-num');
	
	        // 확인창 보이기
	        var confirmGiveItem = confirm("제품 인계를 완료하시겠습니까?");
	
	        if (confirmGiveItem) {
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
	        } else {
	            // 사용자가 "아니요"를 선택한 경우
	            // 아무 동작 없이 그냥 종료
	        }
	    });
	});
	//인계 취소
	$(document).ready(function(){
	    $("#giveItemCancel").click(function(){
	        var tq_num = $(this).data('tq-num');
	
	        // 확인창 보이기
	        var confirmGiveItem = confirm("제품 인계를 취소하시겠습니까?");
	
	        if (confirmGiveItem) {
	            $.ajax({
	                method: "POST", // 요청 방식 (GET, POST 등)
	                url: '<c:url value="/sale/giveitemCancel"/>', // 서버 엔드포인트 URL
	                data: {tq_num: tq_num},
	                dataType: 'json',
	                success: function(map) {
	                    // 성공 시 실행될 코드
	                    console.log("요청 성공", map);
	                    // 여기서 성공 시 할 작업을 수행
	                    alert("제품 인계를 취소하였습니다");
	                    location.reload();
	                },
	                error: function(xhr, status, error) {
	                    // 오류 발생 시 실행될 코드
	                    console.log("요청 오류", error);
	                    // 여기서 오류 시 할 작업을 수행
	                }
	            });
	        } else {
	            // 사용자가 "아니요"를 선택한 경우
	            // 아무 동작 없이 그냥 종료
	        }
	    });
	});
	
	// 신고 모달
	const reportPostModal = document.getElementById("reportPostModal");
	const openReportModalBtn = document.getElementById("openReportModalBtn");
	const closeReportModalBtn = document.querySelector(".custom-modal .close");
	
	openReportModalBtn.addEventListener("click", function () {
		if('${user.me_id}' == '') {
			//alert('로그인한 회원만 이용이 가능합니다.');
			if(confirm('로그인하시겠습니까?')){
				location.href = '<c:url value="/member/login"/>'
			}
			return;
		}
	  	reportPostModal.style.display = "block";
	});
	
	closeReportModalBtn.addEventListener("click", function () {
	  reportPostModal.style.display = "none";
	});		
	
	window.addEventListener("click", function (event) {
	  if (event.target === reportPostModal) {
	    reportPostModal.style.display = "none";
	  }
	});

	function reportPost() {
		
		const reportReason = document.getElementById("reportReason").value;
	
	  	if (reportReason.trim() === "") {
	   		alert("취소 사유를 입력하세요.");
	   		return;
		}
	  	
		let data = {
			rp_key : '${trList.get(0).tq_sb_num}',
			rp_info : reportReason,
			rp_table : '3'
		};
		ajaxJsonToJson(
				  false,
				  'post',
				  'report',
				  data,
				  (data) => {
				    alert("거래취소 요청을 완료했습니다.\n취소 사유: " + reportReason);
				    console.log(data.msg);
				    document.getElementById("reportReason").value = '';
				    closeReportModal(); // Close the modal after reporting
				  },
				    () => {
				    	
				    	console.log("실패");
				    }
				);
		}
		
	// Function to close the modal
	function closeReportModal() {
	  reportPostModal.style.display = "none";
	}
</script>
</html>