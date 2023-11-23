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
	
	.modal-content1 {
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
	
	.modal-text1 {
		font-size: 20px;
		line-height: 1.5;
		margin-bottom: 15px;
		text-align: center;
		font-weight: bold;
	}
	
	.modal-text2 {
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
	
	.customer-center-container p {
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
	
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}

	body, html {
	    height: 100%;
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	.badge{
		margin-left: 15px;
	}
	.message-content-read-mine{
		display: flex;
		justify-content: flex-end;
	}
	.message-content-read-yours {
		display: flex;
		justify-content: flex-start;
	}
	.main-container {
	    display: flex;
	    height: 100%;
	    margin: 0 auto;
	    max-width: 1320px;
	    overflow-x: auto;
	}
	
	.chat-list {
	    flex: 1;
	    background-color: #f4f4f4;
	    border-right: 1px solid #e0e0e0;
	    padding: 10px;
	    overflow-y: scroll;
	    min-width: 345px;
	}
	
	.chat-list-box {
	    margin-bottom: 15px;
	}
	
	.chat-option {
	    font-weight: bold;
	    margin-bottom: 10px;
	}
	
	.chat-room {
	    display: flex;
	    margin-bottom: 10px;
	    align-items: center;
	    border-bottom: 1px solid #e0e0e0
	}
	.chat-room:hover {
		background-color: #dbdbdb;
	}
	.chat-room.active {
		background-color: #dbdbdb;
	}
	.prifle-pic img {
	    max-width: 50px;
	    border-radius: 50%;
	    margin-right: 10px;
	}
	
	.chat-name {
	    display: flex;
	    flex-direction: column;
	    width: 200px;
	}
	
	.chat-title, .chat-content-content, .chat-content-date {
	    margin-bottom: 5px;
	}
	.chat-title {
		
	}
	
	.chat-content-content {
		font-size: 16px;
		font-weight: bold;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.chat-content-date{
		text-align: right;
		font-size: 13px;
	}
	
	.message-area {
	    flex: 3;
	    display: flex;
	    flex-direction: column;
	    padding: 10px;
	    background-color: #fff;
	}
	
	.message-area-list {
		height: 100%;
	    overflow-y: scroll;
	}
	
	.product-box {
		position: sticky;
	    top: 0;
	    z-index: 1; /* Make sure it's on top of the messages */
	    display: flex;
	    padding: 10px;
	    border-bottom: 1px solid #e0e0e0;
	    align-items: center;
	    background-color: #fff;
	}
	
	.product-image {
	    flex: 1;
	    background-color: #e0e0e0;
	    height: 80px;
	    margin-right: 10px;
	}
	.product-price-and-title:hover {
		text-decoration: none;
		color: inherit;
	}
	.product-price-and-title {
	    flex: 3;
	    color: inherit;
	}
	
	.tooltip-text {
	    display: none; /* hide by default */
	    position: absolute;
	    background-color: #333; /* dark background */
	    color: #fff; /* white text */
	    padding: 5px 10px; /* some padding */
	    border-radius: 5px; /* rounded corners */
	    font-size: 12px; /* smaller font size */
	    z-index: 1; /* make sure it's above other elements */
	    left: 14%; /* position it to the right of the parent element */
	    top: 85%; /* align it vertically centered with the parent */
	    white-space: nowrap; /* prevent it from wrapping */
	}
	
	.tooltip-text::before {
	    content: "";
	    position: absolute;
	    top: -1%;
	    left: 2%; /* Adjust this value if you change the width of the arrow */
	    transform: translateY(-50%);
	    
	    /* Arrow pointing to the element (width and height define its size) */
	    border-width: 6px;
	    border-style: solid;
	    border-color: transparent #333 transparent transparent;
	    /* This makes an arrow pointing to the left. Adjust color (#333) to match the background color of your tooltip */
	}
	
	/* Show the tooltip when hovering over the anchor tag */
	.product-price-and-title:hover .tooltip-text {
	    display: inline-block; /* or "block", depending on your preference */
	}
	.product-price {
		font-size: 20px;
		font-weight: bold;
		color: #000;
	}
	.product-title {
		font-size: 16px;
	}
	.product-price::after {
				content: "원";
				font-size: 15px;
				margin-left: 3px;
			}
	.message-box {
	    flex-grow: 1;
	    overflow-y: auto;
	    margin-bottom: 10px;
	    display: flex;         /* Add this line to make it a flex container */
	    flex-direction: column; /* Add this line to make the direction column */
	}
	
	/* New styles */
	.message-mine {
	    align-self: flex-end;
	}
	
	.message-yours {
	    align-self: flex-start;
	}
	.message-content {
	    background-color: #e6f7ff;
	    padding: 10px;
	    border-radius: 5px;
	    text-align: right;
	    font-size: 16px;
	}
	
	.message-yours .message-content {
	    background-color: #f1f1f1;
	}
	
	.date.mine {
	    font-size: 0.8em;
	    color: #888;
	    text-align: right;
	}
	.date.yours {
	    font-size: 0.8em;
	    color: #888;
	    text-align: left;
	}
	
	.message-sender {
	    display: flex;
	    align-items: center;
	    border-top: 1px solid #e0e0e0;
	    padding: 10px 0;
	}
	
	.message-sender-box {
		display: flex;
		justify-content: space-between;
		width: 100%;
	}
	
	.message-sender {
	    flex-grow: 1;
	    margin-right: 10px;
	    font-size: 20px;
	}
	.message-sender{
		flex-grow: 1;
	    padding: 10px 15px;
	    margin-left: 10px;
	    margin-top: 10px;
	    border: none;
	    background-color: #f1f1f1;
	    border-radius: 20px;
	    color: #fff;
	    outline: none;
	}
	.message-typing{
		width: 100%;
		margin-right: 20px;
	}
	.message-typing-box{
		border: none;
		background-color: transparent;
		width: 100%;
	}	
	
	.message-send-button {
		border: none;
	    width: 36px;
	    height: 36px;
	    cursor: pointer;
	    background-image: url("https://ifh.cc/g/LCy9h2.png");
	    background-repeat: no-repeat;
	    background-size: contain;
	    background-position: center;
	    background-color: transparent;
	}
	.col-2 {
		margin-left: auto;
	}
	textarea {
		appearance: none;
	    outline: none;
	    border: none;
	    line-height: 1.2;
	    font-size: 20px;
	    background: transparent;
	    width: 100%;
	    height: 100px;
	    letter-spacing: -0.5px;
	    overflow-y: scroll;
	    padding: 0px 13px 0px 16px;
	    resize: none;
	    box-sizing: border-box;
	
	}
	.scroll-container {
	    display: flex;
	    flex-direction: column;
	}
	.pay {
		margin-left: 5px;
		margin-right: 5px;
		width: 120px; height: 50px;
		font-weight: 700;
		background: rgb(247, 0, 0);
		border: 1px solid rgb(223, 0, 0);
		color: rgb(255, 255, 255);
		border-radius: 10px;
		font-size: 18px;
	}
</style>
</head>

<body>
	<div class="main-container" sbNum="${sb_num }" userNum="${user.me_num }">
		<div class="chat-list">
			<div class="chat-list-box">
			</div>
		</div>
		<div class="message-area" id="message-area">
			<div class="message-area-list">
			</div>
			<div class="message-sender">
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script type="text/javascript">
			
			// 채팅방 번호인 ch_num은 전역변수로 선언하여 기능들이 수행 될 때마다 선택된 채팅방 번호의 값으로 바꿔주어 현재 접속중인 채팅방 번호를 알 수 있게 함.
			let ch_num = 0;

			const userId = $('.main-container').attr('userNum');

			//로그인 유저의 me_num을 전달 받아 userId라는 이름으로 SSE에 전달
			const sseUrl = "<c:url value='/connect?userId="+userId+"'/>";
			
			function sseSet(){
				
				const eventSource = new EventSource(sseUrl);
	
				eventSource.onopen = function(event) {
				    console.log('Connection to server opened.');
				}
	
				eventSource.onmessage = function(event) {
				    console.log('Message:', event.data);
				}
	
				eventSource.addEventListener('connect', function(event) {
				    console.log('Connected event:', event.data);
				});
				
				//메시지가 새로 들어왔을때 메시지리스트를 새로고침하며
				//사용자가 보고 있는 채팅방 번호(ch_num)와 메시지를 보낸 사람이 전달한 채팅방 번호가 같을때만 채팅 내역을 새로고침
				eventSource.addEventListener('newMessage', function(event) {
					if(ch_num == event.data){
						MessageContentList();		
					}
					MessageList();
				});
				
				eventSource.addEventListener('read', function(event) {
					if(ch_num == event.data){
						MessageContentList();
					}
				});
	
				eventSource.onerror = function(event) {
				    if (event.target.readyState === EventSource.CLOSED) {
				        console.log('Connection was closed.');
				    } else if (event.target.readyState === EventSource.CONNECTING) {
				        console.log('Connection is reconnecting.');
				    } else {
				        console.log('An error occurred:', event);
				    }
				}
			}

		
		const sb_num = $('.main-container').attr('sbNum');
		
		function createKeydownHandler() {
		    return function(event) {
		        keydown(event);
		    }
		}

		function keydown(event){
			 if (event.key === 'Enter' && !event.shiftKey) {
			       //시프트+엔터누르면 줄바꿈
			        event.preventDefault();
			        SendMessage();
			    }
		}
		// 가장 처음 메세지 리스트를 가져온다.
		const BoardMessageList = function(sb_num){
			$.ajax({
				async:false,
				url:"/peach/chat/chat-list?sb_num="+sb_num,
				method:"get",
				data:{
				},
				success:function(data){
					console.log("메세지 리스트 리로드 성공");
					
					$('.chat-list-box').html(data);
					$('#sbNum'+sb_num).addClass('active');
					
					ch_num = $('#sbNum'+sb_num).attr('chNum');
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList();
					// 새로온 메시지 알림을 없애기 위해 메시지 리스트 한번더 새로고침
					MessageList();
					
					$.ajax({
						url:"/peach/read?ch_num="+ch_num,
						method:"get",
						success:function(data){
						},
						error : function() {
							alert('에러')
						}
					})
					//메시지 입력, 전송 칸 생성
					let send_msg = "";
					send_msg += "	<div class='message-sender-box'>";
					send_msg += "		<div class='message-typing' id='message'>";
					send_msg += "			<input type='text' placeholder='메시지를 입력하세요.' class='message-typing-box'></input>";
					send_msg += "		</div>";
					send_msg += "		<button type='button' class='message-send-button'></button>";
					send_msg += "			</div>";
					send_msg += "		</div>";

					// 메세지 입력, 전송 칸을 보인다.
					$('.message-sender').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.message-send-button').on('click',function(){
						
						// 메세지 전송 함수 호출
						SendMessage();
						
					});
					//엔터키로 메시지 전송
					const handler = createKeydownHandler();
					$("#message").off('keypress').on('keypress', handler);
					
					// 메세지 리스트중 하나를 클릭했을 때
					$('.chat-room').off('click').on('click', function(){
						ch_num = $(this).attr('chNum');
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat-room').not('.chat-room'+ch_num).removeClass('active');
						// 선택한 메세지만 active 효과 주기
						$('.chat-room'+ch_num).addClass('active');
						
						MessageList();
						
						
					});
						
					sseSet();
				}
			});
		}
		
		//프로필페이지에서 접속했을때는 게시물번호를 0번으로 전달하여 처리
		const ProfileMessageList = function(){
			
			$.ajax({
				url:"/peach/chat/chat-list?sb_num=0",
				method:"get",
				data:{
				},
				success:function(data){
					console.log("메세지 리스트 리로드 성공");
					
					$('.chat-list-box').html(data);
					
					// 메세지 리스트중 하나를 클릭했을 때
					$('.chat-room').off('click').on('click', function(){
			
						ch_num = $(this).attr('chNum');
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat-room').not('.chat-room'+ch_num).removeClass('active');
						// 선택한 메세지만 active 효과 주기
						$('.chat-room'+ch_num).addClass('active');;
						
						MessageContentList();
						//채팅 입력 칸 생성
						let send_msg = "";
						send_msg += "	<div class='message-sender-box'>";
						send_msg += "		<div class='message-typing' id='message'>";
						send_msg += "			<input type='text' placeholder='메시지를 입력하세요.' class='message-typing-box'></input>";
						send_msg += "		</div>";
						send_msg += "		<button type='button' class='message-send-button'></button>";
						send_msg += "			</div>";
						send_msg += "		</div>";
		
						// 채팅 입력 칸을 보이게함.
						$('.message-sender').html(send_msg);
						// 메세지 전송버튼을 눌렀을 때
						$('.message-send-button').on('click',function(){
							
							// 메세지 전송 함수 호출
							SendMessage();
							
						});
						//엔터키로 메시지 전송
						const handler = createKeydownHandler();
						$("#message").off('keypress').on('keypress', handler);
						
						MessageList();
						
						
					});
					
					sseSet();
				}
			});
		}
		
		
		// 메세지 리스트를 다시 가져온다.
		const MessageList = function(){
			$.ajax({
				url:"/peach/chat/chat-list?sb_num="+sb_num,
				method:"get",
				data:{
				},
				success:function(data){
					console.log("메세지 리스트 리로드 성공");
					
					$('.chat-list-box').html(data);
					$('.chat-room').not('.chat-room'+ch_num).removeClass('active');
					$('.chat-room'+ch_num).addClass('active');
					
					
					// 메세지 리스트중 하나를 클릭했을 때
					$('.chat-room').off('click').on('click', function(){
						ch_num = $(this).attr('chNum');
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat-room').not('.chat-room'+ch_num).removeClass('active');
						// 선택한 메세지만 active 효과 주기
						$('.chat-room'+ch_num).addClass('active');
						
						$.ajax({
							url:"/peach/read?ch_num="+ch_num,
							method:"get",
							success:function(data){
							},
							error : function() {
								alert('에러')
							}
						})
						
						MessageList();
						
						
					});
					
				}
			});
		}
		
	    
		
		// 메세지 내용을 가져온다.
		const MessageContentList = function() {
			
			$.ajax({
				url:"/peach/chat/message-list?ch_num="+ch_num,
				method:"GET",
				data:{
				},
				success:function(data){
					console.log("메세지 내용 가져오기 성공");
					
					// 메세지 내용을 html에 넣는다
					$('.message-area-list').html(data);
					
					// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
					$(".message-area-list").scrollTop($(".message-area-list")[0].scrollHeight);
					
					paymodal();
				},
				error : function() {
					alert('잘못된 접근 입니다.');
				}
			});
		
		}
		
		
		// 메세지를 전송하는 함수
		const SendMessage = function(){
			
			let info = $('.message-typing-box').val();
			
			if(info == ""){
				alert("메세지를 입력하세요!");
			}else{
				$.ajax({
					async:false,
					url:"/peach/chat/message-send?ch_num="+ch_num+"&info="+info,
					method:"POST",
					data:{
					},
					success:function(data){
						console.log("메세지 전송 성공");
						
						// 메세지 입력칸 비우기
						$('.message-typing-box').val("");
						
					},
					error : function() {
						alert('서버 에러');
					}
				});
				$.ajax({
					url:"/peach/newmessage?ch_num="+ch_num,
					method:"get",
					success:function(data){
					},
					error : function() {
						alert('에러')
					}
				});
			}
			
		}	
		
		$(document).ready(function(){
			// 게시글을 통해서 들어온 경우 해당 게시글에 대한 채팅 내역이 바로 선택되며 메시지도 바로 불러옴
			// 메인헤더에서 들어올 경우(게시글번호가 0으로 전달됨) 아무것도 선택되지 않은 채 채팅방 리스트만 불러오고 알아서 보고 싶은 채팅방 선택해야함
			if(sb_num != 0){
				BoardMessageList(sb_num);				
			} else {
				ProfileMessageList()
			}
		});
	
		
		function tradePost() {
			var tq_sb_num = document.querySelector('#peachTrade2').dataset.sbnum;
	        var tq_me_num = '${user.me_num}';
		    fetch('/peach/saleboard/detail?sb_num=' + sb_num, {
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
		    	alert(json.message);
		    })
		    .catch(error => {
		        console.error("로그인이 필요합니다:", error);
		        alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
		        window.location.href = '/peach/member/login';
		    });
		}
		
		//거래
		function paymodal(){			

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
				const closeModal = document.querySelector(".close");
				window.addEventListener("click", function(event) {
				  if (event.target === modal) {
				    modal.style.display = "none";
				  }
				});
		
				closeModal.addEventListener("click", function() {
				  modal.style.display = "none";
				});
				

		
			//피치페이 거래
			$(document).ready(function() {
			    $('#peachTrade').on('click', function() {		    	
			        var sb_num = $(this).data('sb-num');
			        var me_num = $(this).data('me-num');
			
			        $.ajax({
			            method: 'GET',
			            url: '<c:url value="/saleboard/peachTrade"/>',
			            data: { sb_num: sb_num },
			            success: function(map) {
			            	console.log(map)
			                var userPoints = map.user.me_point;
			                var productPrice = map.saleBoard.sb_price;
			
			                $('#userPoints').text(userPoints);
			                $('#productPrice').text(productPrice);
			
			                if (userPoints >= productPrice) {
			                    $.ajax({
			                        method: 'POST',
			                        url: '<c:url value="/saleboard/peachTrade"/>',
			                        data: { sb_num: sb_num },
			                        success: function(map) {
			                            if (map.trade) {
			                                console.log('거래가 성공적으로 처리되었습니다.');
			                                alert('거래가 성공적으로 처리되었습니다.');
			                                
			                                var updatedPoints = userPoints - productPrice;
			                                $.ajax({
			                                    method: 'POST',
			                                    url: '<c:url value="/saleboard/reducePoint"/>', // 사용자 포인트 감소를 처리하는 엔드포인트
			                                    data: { me_num: me_num, me_point: updatedPoints,  pp_point: productPrice },
			                                    success: function(response) {
			                                        console.log('포인트가 감소되었습니다.');
			                                    }
			                                });  
			                            } else {
			                                console.log('이미 직거래를 신청한 물품입니다.');
			                                alert('이미 직거래를 신청한 물품입니다.');
			                            }
			                        }
			                    });
			                } else {
			                    if (confirm('포인트가 부족합니다. 추가 결제를 진행하시겠습니까?')) {
			                        var IMP = window.IMP; 
			                        IMP.init("imp41345184"); 
			                        var inputAmount = map.saleBoard.sb_price - map.user.me_point; // 사용자가 입력한 결제할 금액 (임의로 '1111'로 설정)
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
		                                name : map.saleBoard.sb_name,
		                                amount : inputAmount,
		                                buyer_email : map.user.me_id,
		                                buyer_name : map.user.me_name,
		                                buyer_tel : map.user.me_phone,
		                            }, function (rsp) { // callback
		                                //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		                            	if(rsp.success) {
		                                    console.log("결제가 성공했습니다.");
		                                    console.log("결제한 금액:", rsp.paid_amount); // 실제 결제된 금액
		                                    // me_point에 결제된 금액을 추가하는 요청을 서버로 보냄
		                                    $.ajax({
		                                    	async: false,//비동기는 이렇게
		                                        type: 'POST',
		                                        url: '/peach/saleboard/addPoints', // 해당 엔드포인트는 서버에서 처리하고 me_point를 업데이트하는 데 사용
		                                        data: { 
		                                        	paidAmount: rsp.paid_amount,
		                                        	me_num: map.user.me_num
		                                        },
		                                        success: function (data) {
		                                            //console.log('서버 응답:', data); // Check the server response in the console
		                                            alert('포인트가 충전되었습니다.');
		                                        },
		                                        error: function () {
		                                            console.error('포인트 충전에 실패했습니다.');
		                                            // 실패시 처리
		                                        }
		                                    });
		                            	} else {
		                            		console.log(rsp);
		                            	}            	
		                            });		                        
			                    } else {
			                        // 사용자가 '취소'를 선택한 경우
			                        console.log('추가 결제가 취소되었습니다.');
			                        // 원하는 작업 수행 (예: 다른 동작 수행 또는 경고창 등)
			                    }
			                }
			            },
			            error: function(error) {
			                console.log('데이터를 불러오는 중 오류가 발생했습니다.');
			                // 오류 발생 시 추가 작업 수행
			            }
			        });
			    });
			});
			
		}
	</script>
</body>
</html>
