<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
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
			margin-top: 50px;
			
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
			margin-top: 12px;
			margin-bottom: 12px;
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #e9ecef;
		}
		.prifle-pic img {
		    max-width: 50px;
		    border-radius: 50%;
		    margin-right: 10px;
		}
		.profile-left {
			display: flex;
			margin-bottom: 10px;
			justify-content: center;
			
		}
		.profile-right {
			display: flex;
			justify-content: center;
			flex-direction: column;
		}
		.profile-name-sweetness{
			display: block;
		}
		.profile-name {
			font-size: 16px;
			font-weight: 700;
		}
		.profile-sweetness-text {
			font-size: 13px;
		}
		.profile-sweetness {
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
			background: rgb(255, 164, 37);
			border: 1px solid rgb(243, 150, 20);
			color: rgb(255, 255, 255);
		}
		.pay {
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
		  margin-left: 150px; 
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
		
		.custom-modal .modal-body {
		  margin-top: 20px;
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
		/* Image Modal */
		.image-modal {
		  display: none;
		  position: fixed;
		  z-index: 2;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  background-color: rgba(0, 0, 0, 0.9);
		}
		
		.image-modal-content {
		  position: relative;
		  text-align: center;
		  margin: auto;
		  top: 50%;
		  transform: translateY(-50%);
		  max-width: 80%;
		  max-height: 80%;
		  overflow: auto;
		}
		
		#modalImage {
		  width: auto;
		  height: auto;
		  max-width: 100%;
		  max-height: 100%;
		}
		
		/* Close button */
		.close {
		  position: absolute;
		  top: 15px;
		  right: 15px;
		  font-size: 30px;
		  color: white;
		  cursor: pointer;
		}
		
		.close:hover {
		  color: #ccc;
		}
		
		.image-modal .close {
			opacity: 1;
			font-size: 50px;
		}
		.image-modal .image-slide-left {
			background-image: none;
			width: 25px; /* 사이즈 */
		    height: 25px; /* 사이즈 */
		    border-top: 5px solid #fff; /* 선 두께 */
		    border-right: 5px solid #fff; /* 선 두께 */
		    transform: rotate(225deg) translateY(50%); /* 각도 */
		}
		.image-modal .image-slide-left:hover {
			opacity: 0.75;
			border-top: 5px solid #ccc; /* 선 두께 */
		    border-right: 5px solid #ccc; /* 선 두께 */
		}
		.image-modal .image-slide-right {
			background-image: none;
			width: 25px; /* 사이즈 */
		    height: 25px; /* 사이즈 */
		    border-top: 5px solid #fff; /* 선 두께 */
		    border-right: 5px solid #fff; /* 선 두께 */
		    transform: rotate(45deg) translateY(-50%); /* 각도 */
		}
		.image-modal .image-slide-right:hover {
			opacity: 0.75;
			border-top: 5px solid #ccc; /* 선 두께 */
		    border-right: 5px solid #ccc; /* 선 두께 */
		}
		span {
			transition: none;
			-webkit-transition: none;
		}
	</style>
</head>
<body>
	<div class="container1">
		<div class="kind">
			<div class="kind_slider">
			    <ul class="slides">
			    <c:choose>
					<c:when test="${board.saleImageVOList.size() != 0 }">			    
			        	<c:forEach items="${board.saleImageVOList}" var="saleImage">
		       				 <li><img src="<c:url value='/resources/image/${saleImage.si_thb_name }'/>" data-src="<c:url value='/resources/image/${saleImage.si_name }'/>"></li>
		      			</c:forEach>
		      		</c:when>
		      		<c:otherwise>
		      			<li><img src="<c:url value='/resources/image/NoMainImage.png'/>"/></li>
		      		</c:otherwise>
		      	</c:choose>
			    </ul>
			</div>
		    <ul class="slide_pagination"></ul>
		  	<div class="arrow">
		      <button class="image-slide-left"></button>
		      <button class="image-slide-right"></button>
		 	</div>
		 	 <div id="imageModal" class="image-modal">
		        <span class="close" id="closeImageModal">&times;</span>
		        <div class="image-modal-content">
		            <img id="modalImage" src="" alt="Original Image">
		            <!-- Add navigation buttons for scrolling through images -->
		        </div>
		            <button class="image-slide-left" id="prevImage"></button>
		            <button class="image-slide-right" id="nextImage"></button>
		    </div>
		</div>
		<div class="profile-box">
			<div class="profile-left">
				<div class="prifle-pic">
					<img src="<c:url value='/resources/image/NoMainImage.png'/>">
				</div>
				<div class="profile-name-sweetness">
					<div class="profile-name">${board.sb_me_nickname}</div>
					<span class="profile-sweetness-text">당도</span>
					<span class="profile-sweetness">${board.sb_me_sugar}</span>				
				</div>
			</div>
			<c:if test="${user.me_num != board.sb_me_num }">
			<div class="profile-right">
				<div class="profile-right-box">
					<button type="button" class="report-post" id="openReportModalBtn">게시물 신고하기</button>
				</div>
			</div>
			</c:if>
		</div>
		<div class="content-box">
			<p class="title">${board.sb_name}</p>
			<p class="category-date">${board.sb_sc_name} | ${board.sb_date}</p>
			<p class="price">${board.get_sb_price()}</p>
			<div class="content">${board.sb_info}</div>
			<p class="wish-text">찜 ${board.sb_wish}</p>
		</div>
		<div class="button-box">
			<c:choose>
				<c:when test="${user != null && user.me_num == board.sb_me_num }">
					<button type="button" onClick="location.href='<c:url value='/saleboard/update?sb_num=${board.sb_num }'/>'" class="chat">수정하기</button>
					<button type="button" onClick="location.href='<c:url value='/saleboard/delete?sb_num=${board.sb_num }'/>'" class="pay">삭제하기</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${wishCheck == 1 }">
							<button type="button" class="wish cancel"><img src="<c:url value='/resources/image/wish-filled.png'/>" width="16px" height="16px"> <span class="wish-type">찜취소</span></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="wish add"><img src="<c:url value='/resources/image/wish.png'/>" width="16px" height="16px"> <span class="wish-type">찜하기</span></button>
						</c:otherwise>
					</c:choose>
					
					<button type="button" onClick="location.href='<c:url value='/chat/chat?sb_num=${board.sb_num}'/>'" class="chat">대화하기</button>
					<button id="openModalBtn" type="button" class="pay">거래신청</button>
					<div id="myModal" class="modal">
					  <div class="modal-content">
					    <span class="close">&times;</span>
					   	<img class="modal-image" width="30" height="34" src="<c:url value='/resources/img/peachmark.png'/>">
					    <div class="modal-text1">피치마켓에서 중고거래 시작하기</div>
					    <div class="modal-text2">간편하게 상품을 확인하세요</div>
					    <div class="button-container">
					      <div class="rectangle-button red-button">
					      	<button type="button" onclick="tradePost()" class="trade">직거래</button>
					      </div>
					      <div class="rectangle-button pink-button">
					        <button>피치페이거래</button>
					      </div>
					    </div>
					    <div class="customer-center-container">
					    	<p>
					    		도움이 필요하면 
					    		<a href="daed124@naver.com">이메일</a>
					    		또는 고객센터
					    		<b>1611-7474</b>
					    		로 문의 부탁드립니다.
					    		<br>
					    		고객센터 운영시간: 09~18시 (점심시간 12~13시, 주말/공휴일 제외)
					    	</p>
					    </div>
					  </div>
					</div>
					<div id="reportPostModal" class="custom-modal">
						  <div class="modal-content">
						    <span class="close">&times;</span>
						    <div class="modal-header">
						      <h2>신고하기</h2>
						    </div>
						    <div class="modal-body">
						      <p>신고 내용을 작성해주세요.</p>
						      <p>최대한 자세하게 기재해주셔야 원활한 신고 처리가 가능합니다.</p>
						      <div class="report-text-area">
							      <p class="maxtext">* 최대 500자 제한</p>
							      <textarea id="reportReason" class="report-reason" placeholder="신고 이유를 입력하세요" maxlength="500"></textarea>						      
						      </div>
						    </div>
						    <div class="modal-footer">
						      <button class="report-button" onclick="reportPost()">신고</button>
						      <button class="cancel-button" onclick="closeReportModal()">취소</button>
						    </div>
						  </div>
						</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript">
			window.onload = function() {
			const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
			const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
			let currentIdx = 0; //현재 슬라이드 index
			const slideCount = slideImg.length; // 슬라이드 개수
			const prev = document.querySelector('.image-slide-left'); //이전 버튼
			const next = document.querySelector('.image-slide-right'); //다음 버튼
			const slideWidth = 600; //한개의 슬라이드 넓이

			//전체 슬라이드 컨테이너 넓이 설정
			slides.style.width = slideWidth * slideCount + 'px';

			function moveSlide(num) {
			  slides.style.left = -num * 600 + 'px';
			  currentIdx = num;
			}
			
			const pagination = document.querySelector(".slide_pagination");

			for (let i = 0; i < slideCount; i++) {
			  if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
			  else pagination.innerHTML += `<li>•</li>`;
			}

			const paginationItems = document.querySelectorAll(".slide_pagination > li");
			
			for (let i = 0; i < slideCount; i++) {
	  			paginationItems[i].addEventListener("click", () => {
	  			let dv = event.currentTarget;
	    		paginationItems[currentIdx].setAttribute("class", "");
	    		currentIdx = i;
	   			moveSlide(currentIdx);
	    		dv.setAttribute("class", "active");
	  			});
			}

			prev.addEventListener('click', function () {
			  /*첫 번째 슬라이드로 표시 됐을때는 
			  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
			  currentIdx !==0일때만 moveSlide 함수 불러옴 */

			  if (currentIdx !== 0) {
				  paginationItems.forEach((i) => i.classList.remove("active"));
				  paginationItems[currentIdx - 1].classList.add("active");
				  moveSlide(currentIdx - 1);
			  }
			});

			next.addEventListener('click', function () {
			  /* 마지막 슬라이드로 표시 됐을때는 
			  다음 버튼 눌러도 아무런 반응 없게 하기 위해
			  currentIdx !==slideCount - 1 일때만 
			  moveSlide 함수 불러옴 */
			  if (currentIdx !== slideCount - 1) {
			    paginationItems.forEach((i) => i.classList.remove("active"));
			    paginationItems[currentIdx + 1].classList.add("active");
			    moveSlide(currentIdx + 1);
			  }
			});
		}
	
		//찜버튼 눌렀을 때 기능
		$('.wish').click(function(){
			if('${user.me_id}' == '') {
				if(confirm('로그인하시겠습니까?')){
					location.href = '<c:url value="/member/login"/>'
				}
				return;
			}
			let data = {
				wi_me_num : '${user.me_num}',
				wi_sb_num : '${board.sb_num}',
			};
			ajaxJsonToJson(false, 'post', '/saleboard/wish', data, (data)=>{
				if(data.isWish == 0){
					alert('찜을 취소하였습니다.');		
				}else {
					alert('찜을 하였습니다.');
				}
				diplayWishBtn(data.isWish);
				$('.wish-text').text("찜 " + data.board.sb_wish);
			})
		})
		
		
		//ajax로 받아온 찜 상태에 따라 찜버튼 수정
		function diplayWishBtn(isWish){
			if(isWish == 0){
				$('.wish-type').text("찜하기");
				$('.wish').removeClass("cancel");
				$('.wish').addClass("add");
				$('.wish img').attr("src", "<c:url value='/resources/image/wish.png'/>");
			}else {
				$('.wish-type').text("찜취소");
				$('.wish').removeClass("add");
				$('.wish').addClass("cancel");
				$('.wish img').attr("src", "<c:url value='/resources/image/wish-filled.png'/>");
			}
		}
		if('${user.me_num}' != '${board.sb_me_num}'){	
			// 모달 열기 버튼
			const openModalBtn = document.getElementById("openModalBtn");
	
			// 모달 요소
			const modal = document.getElementById("myModal");
	
			// 모달 열기 버튼 클릭 시 이벤트
			openModalBtn.addEventListener("click", function() {
				if('${user.me_id}' == '') {
					//alert('로그인한 회원만 이용이 가능합니다.');
					if(confirm('로그인하시겠습니까?')){
						location.href = '<c:url value="/member/login"/>'
					}
					return;
				}
			 	modal.style.display = "block";
			});
	
			// 모달 닫기 버튼 또는 바깥 영역 클릭 시 모달 닫기
			const closeModal = document.querySelector(".modal .close");
			window.addEventListener("click", function(event) {
			  if (event.target === modal) {
			    modal.style.display = "none";
			  }
			});
	
			closeModal.addEventListener("click", function() {
			  modal.style.display = "none";
			});
			
			function tradePost() {
			    var tq_sb_num = '${board.sb_num}'; // SaleBoardVO의 sb_num 값 가져오기
			    var tq_me_num = '${user.me_num}';
			    console.log({
		        	tq_sb_num: tq_sb_num,
		        	tq_me_num: tq_me_num,
		        })
			    fetch('/peach/saleboard/detail?sb_num=' + ${board.sb_num}, {
			        method: 'POST',
			        headers: {
			            'Content-Type': 'application/json'
			        },
			        body: JSON.stringify({
			        	tq_sb_num: tq_sb_num,
			        	tq_me_num: tq_me_num
			        })
			    })
			    .then(response => {
			    	return response.json();	
			    }).then(json => {
			    	alert(json.message)
			    })
			    .catch(error => {
			        console.error("로그인이 필요합니다:", error);
			        alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			        window.location.href = '/peach/member/login';
			    });
			}
			
			// 신고 모달
			const reportPostModal = document.getElementById("reportPostModal");
			const openReportModalBtn = document.getElementById("openReportModalBtn");
			const closeReportModalBtn = document.querySelector(".custom-modal .close");
			
			openReportModalBtn.addEventListener("click", function () {
				if('${user.me_id}' == '') {
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
				
				if('${user.me_num}' == '${board.sb_me_num}'){
					alert("본인의 게시물은 신고가 불가합니다.");
					return;
				}
				
				const reportReason = document.getElementById("reportReason").value;
	
			  	if (reportReason.trim() === "") {
			   		alert("신고 이유를 입력하세요.");
			   		return;
				}
			  	
				let data = {
					key : '${board.sb_num}',
					info : reportReason,
					table : 'sale_board'
				};
				ajaxJsonToJson(
						  false,
						  'post',
						  'report',
						  data,
						  (data) => {
						    alert("게시물을 신고했습니다.\n신고 사유: " + reportReason);
						    console.log(data.msg);
						    document.getElementById("reportReason").value = '';
						    closeReportModal(); // 신고 완료 후 모달 닫기
						  },
						    () => {
						    	
						    	console.log("실패");
						    }
						);
				}
				
			// 신고 모달 닫는 기능
			function closeReportModal() {
			  reportPostModal.style.display = "none";
			}
		}
		
		//이미지 클릭시 원본 이미지 표시 모달
		document.addEventListener("DOMContentLoaded", function () {
			  console.log("loaded");
			  const imageModal = document.getElementById("imageModal");
			  const modalImage = document.getElementById("modalImage");
			  const closeImageModalBtn = document.getElementById("closeImageModal");
			  const nextImageBtn = document.getElementById("nextImage");
			  const prevImageBtn = document.getElementById("prevImage");
			  const thumbnailImages = document.querySelectorAll(".slides li");

			  let currentImageIndex = 0;

			  // 모달 오픈 기능
			  function openImageModal(imageIndex) {
			    imageModal.style.display = "block";
			    currentImageIndex = imageIndex;
			    displayImage(currentImageIndex);
			  }

			  // 모달 닫기
			  closeImageModalBtn.addEventListener("click", function () {
			    imageModal.style.display = "none";
			  });

			  // 다음 버튼 클릭 시 다음 이미지 보여줌
			  nextImageBtn.addEventListener("click", function () {
			    currentImageIndex = (currentImageIndex + 1) % thumbnailImages.length;
			    displayImage(currentImageIndex);
			  });

			  // 이전 버튼 클릭 시 이전 이미지 보여줌
			  prevImageBtn.addEventListener("click", function () {
			    currentImageIndex =
			      (currentImageIndex - 1 + thumbnailImages.length) % thumbnailImages.length;
			    displayImage(currentImageIndex);
			  });

			  // 해당 인덱의의 img 태그에서 data-src의 값(원본 이미지 주소)를 가져와서 이미지 표시
			  function displayImage(index) {
			    modalImage.src = thumbnailImages[index].querySelector("img").getAttribute("data-src");
			  }

			  // 각 이미지마다 이벤트리스너 생성
			  thumbnailImages.forEach(function (thumbnail, index) {
			    thumbnail.addEventListener("click", function () {
			      openImageModal(index);
			    });
			  });
			  // 이미지 범위 밖에 클릭 시 모달 빠져나오기
			  window.addEventListener("click", function(event) {
				  if (event.target === imageModal) {
				    imageModal.style.display = "none";
				  }
				});
			});
	</script>
</body>
</html>
