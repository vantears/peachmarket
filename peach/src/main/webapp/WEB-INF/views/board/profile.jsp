<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>프로필</title>
</head>
<style>
	.profile-container {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		display: flex;
		border-style: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px;
	}
	.profile-imgbox {
		flex: 00 310px;
		background-color: aqua;
		text-align: center;
		border-right: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px 0 0 20px;
	}
	.btn-profile {
		width: 150px;
		margin: 15px auto;
	}
	.example {
		height: 120px;
		width: 120px;
		margin: 15px auto;
		margin-top: 50px;
	}
	.profile-name {
		margin: 15px 0;
	}
	.profile-Detail {
		
		flex: 1;
	
	}
	.profile-product {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		background-color: green;
		display: flex;
		border-style: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px;
	}
	.profile-product2 {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		background-color: lime;
		display: flex;
		border-style: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px;
	}
	.profile-product-list{
		display:flex;
		flex-direction:row;
		align-items: center;
		padding: 20px;
		
	}
	.example2 {
		height: 100px;
		width: 100px;
		margin-right: 40px;
	}
	.btn-pc {
		margin-top: 10px;
	}
	.pp-box {
	  position: absolute;
	  top: 140px;
	  right: 50px;
	  background-color: lightgray;
	  padding: 5px;
	  border-radius: 10px;
	}
	.pp-balance {
		display: inline;
	}
	.all-profile {
		
	}
	.profile-product-detail{
		display:flex;
		flex-direction:row;
	}
	.profile-product-detail-btn{
		position: relative;
		width: 200px;
	}
	.profile-outDTbox {
		padding-left: 15px;
		padding-right: 10px;
		flex: 1;
		background-color: yellow;
		border-radius: 0 20px 20px 0;
	}
	.profile-product-detail-text {
		width: 630px;
		
	}
	li{
   		list-style:none;
  	}
	.sellbox{
		margin-left: 30%;
	}
	.pftext{
		font-size: 30px;
	}
	
</style>
<body>
<div class="all-profile">
	<c:if test="${user.me_num == member.me_num }">
	<div class="pp-box">
		<div class="pp-balance">피치페이 잔액 : </div>
		<button>피치페이 충전</button>
		<button>피치페이 출금</button>
	</div>
	  </c:if>
	<br/>
	<div class="profile-container">
	 <div class="profile-imgbox">
	 <c:if test="${proImg == null}">
	  	<img src="<c:url value='/resources/img/3.png'/>" class="example">
	  </c:if>
	  <c:if test="${proImg != null}">
	  	<img src="<c:url value='/img/${proImg.pi_name}'/>" class="example">
	  </c:if>
	  <div class="profile-name"><P>${member.me_id}</P></div>
	  <c:if test="${user.me_num == member.me_num}">
		<li class="inner-item"><a href="<c:url value='/board/profilePass?pi_num=${proImg.pi_name}'/>">내 프로필 관리</a></li>
	  </c:if>
	 </div>
	 	<div class="profile-outDTbox">
			 <div class="profile-Detail">
			 	<div class="profile-namebox">
			 		<div class="profile-name"><P>${member.me_id}</P></div>
			 	</div>
			 	<br/>
			 	<div style="display:inline;">
			 		가입일 : ${user.me_date} 판매 중 : <text>${salingAndTradingProducts.size()}</text> 판매 완료 : ${finishedProducts.size()}<text>${ss}</text> 당도 : <text>${user.me_sugar}</text> 
			 	</div>
			 	<br/>
			 	<form action="<c:url value='/board/profile'/>" method="post" enctype="multipart/form-data">
			 		<br>
			 		<div class="form-group">
			 			<p class="pftext">${profile.pf_text}</p>
					</div>
			 	</form>
			 </div>
		 </div>
	</div>
	<br>
	<div class="sellbox">
		<button onclick="sell()">판매중</button>
		<button onclick="sellc()">판매완료</button>
	</div>
	<br>
	<div id="sellbox">
		<c:forEach var="salingAndTradingProducts" items="${salingAndTradingProducts}">
		<div class="profile-product">
			<div class="profile-product-list">
				<img src="<c:url value='/resources/img/3.png'/>" class="example2">
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : ${salingAndTradingProducts.sb_name}] [카테고리 : ${salingAndTradingProducts.sb_sc_num}]  [게시일 : ${salingAndTradingProducts.sb_date}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<button onclick="dateUp(${salingAndTradingProducts.sb_num})">끌어올리기</button>
						<button>수정</button>
						<button onclick="deletePD(${salingAndTradingProducts.sb_num})">삭제</button>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>	
	<div id="sellcbox">
		<c:forEach var="finishedProducts" items="${finishedProducts}">
		<div class="profile-product2">
			<div class="profile-product-list">
				<img src="<c:url value='/resources/img/3.png'/>" class="example2">
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : ${finishedProducts.sb_name}] [카테고리 : ${finishedProducts.sb_sc_num}]  [게시일 : ${finishedProducts.sb_date}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<button onclick="dateUp(${finishedProducts.sb_num})">끌어올리기</button>
						<button>수정</button>
						<button onclick="deletePD(${finishedProducts.sb_num})">삭제</button>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>	
</div>	
<br>
<br>
<script>
function dateUp(sb_num){
	$.ajax({
	    type: 'POST',
	    url: '<c:url value="/board/dateUp"/>',
	    data: { sb_num: sb_num },
	    success: function(data) {
	    	location.reload();
	    },
	    error: function(a) {
	        alert('끌어올리기 실패');
	        console.log(a);
	    }
	});
	
}
function deletePD(sb_num){
	var ans = confirm('삭제하시겠습니까?');
	if (ans) {
		$.ajax({
			type: 'POST',
			url: '<c:url value="/board/delete"/>', // 맞게 URL 수정
			data: { sb_num: sb_num },
			success: function (data) {
				location.reload();
			},
			error: function (a) {
				alert('삭제 실패');
				console.log(a);
			}
		});
	}
}

$("#sellcbox").hide();
	
function sell() {
	$("#sellcbox").hide();
	$("#sellbox").show();
}
function sellc() {
	$("#sellbox").hide();
	$("#sellcbox").show();
}


</script>

</body>
</html>