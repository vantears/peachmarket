<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .co_de {
            font-family: 'Arial', sans-serif;
            margin: 20px auto;
            width: 750px;
        }
        
        a {
        	color: #000;
        	
        }
        a:hover {
        	text-decoration: none;
        	color: #000;
        	cursor: pointer;
        }

		.nick-and-date {
			display: flex;
			margin-bottom: 15px;
		}
        .co_de_title {
            font-size: 24px;
            font-weight: bold;
            color: #000;
        }

        .co_de_info {
            font-size: 14px;
            color: #666;
        }

        .co_de_write {
            margin-bottom: 20px;
            max-height: 500px;
        }

        .co_de_comment {
            display: flex;
			margin-top: 10px;
        }

        .CDbtn {
            width: 80px;
            height: 40px;
            border: none;
            background: #f76076;
            color: #fff;
            /* 필요한 스타일 추가 */
        }
        .reply_writer{
        	width: 100px;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: nowrap;
        	
        }
        .edit-delete-btns{
      	    padding: 5px 10px;
      	    font-size: 14px;
        }
        .reply-delete {
        	color: #f76076;
        	border: none;
        	background: none;
        	margin-left: auto;
        	margin-right: 15px;
        }
        .report-button1{
        	height: 30px;
        	width: 50px;
        }
         .report-button2{
        	height: 30px;
        	width: 50px;
        	margin-left: auto;
        }
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
		
		.reply-input {
			border: none;
			width: 700px;
			padding: 0px 15px;
			background: inherit;
		}
		
		.reply-input-area {
			display: flex;
			border: 1px solid #ccc;
			border-radius: 15px;
			overflow: hidden;
		}
		
		
		.modify-delete {
			display: flex;
		}
		.btn-primary {
			margin-right: 10px;
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
		
			.custom-modal2 {
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
		
		.custom-modal2 .modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  padding: 20px;
		  text-align: center;
		  border-radius: 8px;
		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		}
		
		.custom-modal2 .modal-header h2 {
		  font-size: 24px;
		  font-weight: bold;
		}
		
		.custom-modal2 .modal-body {
		  margin-top: 20px;
		}
		
		.custom-modal2 .report-reason {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  resize: none;
		  height: 200px;
		}
		
		.custom-modal2 .report-button,
		.custom-modal2 .cancel-button {
		  padding: 10px 20px;
		  font-size: 16px;
		  cursor: pointer;
		  border: none;
		  border-radius: 5px;
		  margin-right: 10px;
		}
		
		.custom-modal2 .report-button {
		  background-color: #ff5733;
		  color: white;
		}
		
		.custom-modal2 .report-button:hover {
		  background-color: #ff4500;
		}
		
		.custom-modal2 .cancel-button {
		  background-color: #ccc;
		  color: #333;
		}
		
		.custom-modal2 .cancel-button:hover {
		  background-color: #999;
		}
		
		.custom-modal2 .close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}
		
		.custom-modal2 .close:hover,
		.custom-modal2 .close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		.cImg{
			width: 300px;
			height: 300px;
		}
		.title-area {
			position:relative;
			display: flex;
		}
		.title-menu {
			border: none;
			width: 36px;
			height: 36px;
			background-size: 36px;
			background-color: inherit;
			margin-left: auto;
			background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAABOCAYAAACOqiAdAAAACXBIWXMAAAsTAAALEwEAmpwYAAABs0lEQVR4nO3bz04TURiG8ad6BwKyEdwLLpQQwgplQ2LUSyBgvAwJknAbCAkpYYl3IuyMuFO8AyHhnzlwGsbmzHSmm5nS55d8SZOeLz150+mcmZ4BSZIkSZIk6V6YB3aAo1jbwFzdk2q6TeA6UVfARt2Ta6qPOaFla7XuSTbNQ+BPieB+x7GKZkqE1qkXnSbBUoXgwlhF0xWCe9ZpErSAHyVC+x7HKuNdXHbkhXYJvMk26M4H4DQR2l9gJTNOCRPAGnAQ6xPwJDVQkiRJjTMKvIoVXquHx8A+cJG5agiv94CxXs3Dahz4WXCtemx4afsl7o60c3qH1mjX4ZlX58BI3ZNtksUKNzLDCUPR6wrBLXSaRKVD9ZGB/W+vRHC7XT3idp12XBBa+E/CxXBBeO2uw/Y8ftMMrYSReBII5W+aJEnSYHgKfAa+xloHJuue1CDsAz5LXG6dxg05SnjfY5tXeO9tqnGYtdxY2J/nFW5kTvX5GffSkpun+/OyQnBu188ID32clAjtF/Ag2yhulhu9gls2qLSNnCXJVVwIq0B4xPILcAh8A7aA2aIGSZIkSZIkicHwD8lpBngbmb5qAAAAAElFTkSuQmCC");
		}
		.menu-box {
			flex-direction: column;
			text-align: center;
			justify-content: space-around;
			width: 40px;
			height: 70px;
			position: absolute;
			display:none;
			border: 1px solid #ccc;
			right: 0px;
			top: 35px;
		}
		.menu-btn {
			border: none;
			background: none;
		}
		.item-category{
		background: #f76076;
		padding: 1px 5px;
		border-radius: 5px;
		width: max-content;
		color: #fff;
		font-size: 13px;
	}
    </style>
    <title>커뮤니티 세부 정보</title>
</head>
<body>
	<br>
	<div class="co_de CDdiv">
		<div class="user-box">	
			<div class="profile-pic">
			</div>
			
		</div>
		<div class="item-category">
					${detail.cc_name}
		</div>
		<div class="title-area">
		    <div class="co_de_title CDdiv">${detail.co_title}</div>
		    <c:if test="${user != null && user.me_num == writer.me_num}">
			    <button class="title-menu" onclick="menu_popup()" type="button"></button>
			    <div id="menu_box" class="menu-box">
			    	<form action="<c:url value='/board/communityEdit/${detail.co_num}'/>" method="get">
		        		<button class="menu-btn" type="submit">수정</button>
		   			 </form>
		   			 <button class="menu-btn" onclick="deleteCom(${detail.co_num})">삭제</button>
			    </div>
		    </c:if>
		    <c:if test="${user != null && user.me_num != writer.me_num}">
			    <button class="title-menu" onclick="menu_popup()" type="button"></button>
			    <div id="menu_box" class="menu-box">
			    	<button type="button" class="menu-btn" id="openReportModalBtn">신고</button>
		  			<button class="menu-btn" onclick="likeCommunity()">추천</button>
		  			 <c:if test="${user.me_au == 'admin'  }">
					 	<button onclick="deleteComAdmin(${detail.co_num})" class="menu-btn">삭제</button>
					 </c:if> 
			    </div>
		    </c:if>
		</div>
		<div class="nick-and-date">
			    <div class="co_de_info CDdiv"><a href="<c:url value='/board//profile/+${writer.me_num}'/>">${writer.me_nick}</a> · ${detail.get_date() }</div>
			</div>
	    <div class="co_de_write">
	 	  	<!-- 글 내용 -->
	 	   <c:if test="${coImage != null}">
	  		  <img class="cImg" src="<c:url value='/img/${coImage.ci_name}'/>" class="co_img">
	 	   </c:if>
	 	   <c:if test="${empty detail.co_info}">
      		  <p>내용이 없습니다.</p>
   		   </c:if>
	   	 	<div class="co_de_content CDdiv">${detail.co_info}</div>
		</div>
		<div class="recommend-reply">
			추천 ${detail.co_like } · 댓글 ${detail.co_reply }
		</div>
		<br>
		<c:if test="${not empty reList}">
		    <div class="co_de_comments">
		        <c:forEach var="reList" items="${reList}">
		            <div class="co_de_comment">
		            	<div class="reply_writer">
		            		<a href="<c:url value='/board//profile/+${reList.re_me_num}'/>">${reList.replyWriter}</a>
		            	</div>
		                	${reList.re_info}
							
							<c:if test="${reList.replyWriter == user.me_nick}">
							    <button type="button" class="reply-delete" onclick="delete_reply(${reList.re_num})">X</button>
							</c:if>
		            </div>
		        </c:forEach>
		    </div>
		</c:if>
		<br>
		<form action="<c:url value='/board/communityDetail'/>" method="post" enctype="multipart/form-data">
		    <div class="form-group reply-input-area">
				<input id="summernote" class="reply-input" name="re_info" class="form-control" rows="4"></input>
				<input type="hidden" name="co_num" value="${detail.co_num}">
				<button class="CDbtn">댓글 등록</button>
			</div>
		</form>
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
	<div id="reportPostModal2" class="custom-modal2">
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
		      <textarea id="reportReason2" class="report-reason" placeholder="신고 이유를 입력하세요" maxlength="500"></textarea>						      
	      </div>
	    </div>
	    <div class="modal-footer">
	      <button class="report-button" onclick="reportPost2()">신고</button>
	      <button class="cancel-button" onclick="closeReportModal2()">취소</button>
	    </div>
	  </div>
	</div>

    <script>
        
        
        function likeCommunity() {
            // 게시물 번호
            var coNum = "${co_num}"; 
            // Ajax 요청
            $.ajax({
                type: "POST",
                url: "/peach/board/communityDetail/"+coNum,
                data: {},
                success: function(response) {
                    if (response === true) {
                        alert("추천 성공");
                        window.location.href = '<c:url value="/board/communityDetail/'+coNum+'"/>';
                    } else {
                        alert("추천은 한 번만 가능합니다.");
                    }
                },
                error: function(error) {
                    alert("추천 실패");
                }
            });
        }
        
        const reportPostModal = document.getElementById("reportPostModal");
		const openReportModalBtn = document.getElementById("openReportModalBtn");
		const closeReportModalBtn = document.querySelector(".custom-modal .close");
		
		if(reportPostModal != null && openReportModalBtn != null && closeReportModalBtn != null){
			
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
	
				if('${user.me_num}' == '${writer_me_num}'){
					alert("본인의 게시물은 신고가 불가합니다.");
					return;
				}
				
				const reportReason = document.getElementById("reportReason").value;
	
			  	if (reportReason.trim() === "") {
			   		alert("신고 이유를 입력하세요.");
			   		return;
				}
			  	
				let data = {
					rp_key : '${co_num}',
					rp_info : reportReason,
					rp_table : '2'
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
						    closeReportModal(); // Close the modal after reporting
						  },
						    () => {
						    	
						    	console.log("실패");
						    }
						);
				}
			function closeReportModal() {
				  reportPostModal.style.display = "none";
				}
			
		}
		
		/* 댓글 신고 기능
		let re_num = 0;
		const reportPostModal2 = document.getElementById("reportPostModal2");
		const openReportModalBtn2 = document.querySelectorAll("#openReportModalBtn2");
		const closeReportModalBtn2 = document.querySelector(".custom-modal2 .close");
		
		[].forEach.call(openReportModalBtn2, function(button){
			 console.log("버튼 클릭됨");
			button.addEventListener("click", function () {
				console.log(button);
				if('${user.me_id}' == '') {
					if(confirm('로그인하시겠습니까?')){
						location.href = '<c:url value="/member/login"/>'
					}
					return;
				}
			  	reportPostModal2.style.display = "block";
			  	re_num = $(this).data('num');
			});	
		});
		
		closeReportModalBtn2.addEventListener("click", function () {
		  reportPostModal2.style.display = "none";
		});		

		window.addEventListener("click", function (event) {
		  if (event.target === reportPostModal) {
		    reportPostModal2.style.display = "none";
		  }
		});
		
		function reportPost2() {
			 console.log("버튼 클릭됨");
			const reportReason2 = document.getElementById("reportReason2").value;

		  	if (reportReason2.trim() === "") {
		   		alert("신고 이유를 입력하세요.");
		   		return;
			}
		  	
			let data = {
				key : re_num,
				info : reportReason2,
				table : 'reply'
			};
			ajaxJsonToJson(
					  false,
					  'post',
					  'report',
					  data,
					  (data) => {
					    alert("게시물을 신고했습니다.\n신고 사유: " + reportReason2);
					    console.log(data.msg);
					    document.getElementById("reportReason2").value = '';
					    closeReportModal(); 
					  },
					    () => {
					    	
					    	console.log("실패");
					    }
					);
			}
		function closeReportModal2() {
			  reportPostModal2.style.display = "none";
			}
		*/
		function deleteCom(co_num){
			var ans = confirm('삭제하시겠습니까?');
			if (ans) {
				$.ajax({
					type: 'POST',
					url: '<c:url value="/board/comDelete"/>', // 맞게 URL 수정
					data: { co_num: co_num },
					success: function (data) {
						alert('삭제 성공');
						window.location.href = '<c:url value="/board/community"/>';
					},
					error: function (a) {
						alert('삭제 실패');
						console.log(a);
					}
				});
			}
		}
	
		function delete_reply(re_num) {
		    var ans = confirm('삭제하시겠습니까?');
		    if (ans) {
		        $.ajax({
		            type: 'POST',
		            url: '<c:url value="/board/replyDelete"/>',
		            data: { re_num: re_num },
		            success: function (data) {
		                alert('삭제 성공');
		                location.reload();
		            },
		            error: function (a) {
		                alert('삭제 실패');
		                location.reload();
		            }
		        });
		    }
		}    
		
		const menu_box = document.querySelector('#menu_box');
		function menu_popup(){
			setTimeout(function() {
				menu_box.style.display = 'flex';
			}, 100);
		}
		
		
		
		window.addEventListener("click", function(event) {
			if (event.target != menu_box && menu_box.style.display == "flex") {
				    menu_box.style.display = "none";
			}
		});
		
		function deleteComAdmin(co_num){
			var ans = confirm('삭제하시겠습니까?');
			if (ans) {
				$.ajax({
					type: 'POST',
					url: '<c:url value="/board/comDelete"/>', // 맞게 URL 수정
					data: { co_num: co_num },
					success: function (data) {
						alert('삭제 성공');
						window.location.href = '<c:url value="/admin/communityreport"/>';
					},
					error: function (a) {
						alert('삭제 실패');
						console.log(a);
					}
				});
			}
		}
    </script>
</body>
</html>
