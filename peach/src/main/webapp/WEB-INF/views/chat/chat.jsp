<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
<style>
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
	
	</script>
</body>
</html>
