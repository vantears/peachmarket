<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>프로필</title>
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
            background-color: rgba(0,0,0,0.7);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	.profile-container {
		margin:0 auto; 
		padding-bottom: 50px;
		min-width: 1000px;
		max-width: 1320px;
		display: flex;
		
		color: #000;
	}
	.profile-imgbox {
		flex: 00 310px;
		text-align: center;
	}
	.btn-profile {
		width: 150px;
		margin: 15px auto;
	}
	.example {
		height: 150px;
		width: 150px;
		border-radius: 50%;
		margin-bottom: 20px;
	}
	.profile-name {
		margin: 5px 0;
	}
	.profile-Detail {
		margin-top: 20px;
		flex: 1;
	
	}
	.profile-product {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		display: flex;
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
	.profile-btn {
		width: 100px;
		height: 30px;
		background: #f76076;
		margin: auto;
		border-radius: 5px;
	}
	.profile-btn a {
		margin-top: 4px;
		color: #fff;
	}
	.profile-btn a:hover {
		color: #fff;
	}
	.pp-box {
		position: absolute;
		right: 100px;
		width: 150px;
		padding: 10px 10px;
		display: block;
		border: 1px solid #ccc;
	}
	.point {
		font-size: 18px;
		margin-bottom: 10px;
	}
	.pay-buttons {
		display: flex;
	}
	.peachpay-button {
		width: 60px;
		height: 30px;
		background: #ffc8d0; 
		border:1px solid #ffc8d0; 
		box-shadow:none; 
		border-radius:5px; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		color: #f76076;
	}
	.pay-history {
		margin-top: 5px;
		text-align: center;
		justify-content:center;
	}
	.peachpay-history-button {
		width: 128px;
		height: 30px;
		background: grey; 
		border:1px solid grey; 
		box-shadow:none; 
		border-radius:5px; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		color: #fff;
	}
	.charging {
		margin-right: 9px;
		background: #f76076;
		border: 1px solid #f76076;
		color: #fff;
	}
	.
	.all-profile {
		
	}
	.profile-product-detail{
		display:flex;
		flex-direction:row;
	}
	.profile-product-detail-btn{
		position: relative;
		width: 196px;
		text-align: center;
	}
	.profile-outDTbox {
		padding-left: 15px;
		padding-right: 10px;
		flex: 1;
	}
	.profile-product-detail-text {
		width: 630px;
		
	}
	li{
   		list-style:none;
  	}
	.sellbox{
		margin: auto;
		max-width: 1320px;
		display: flex;
		height: 50px;
	}
	.selected{
		flex: 1 1 0%;
		align-items: center;
		justify-content: center;
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		border-left: 1px solid #ccc;
		border-bottom: 1px solid rgb(255, 255, 255);
		background-color: #fff;
		color: rgb(33, 33, 33);
		font-weight: 600;
	}
	.sellbtn{
		flex: 1 1 0%;
		align-items: center;
		justify-content: center;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 1px solid #ccc;
		background-color: #f9f9f9;
		color: rgb(136, 136, 136);
	}
	.myBtn {
		margin-top: 5px;
		background: inherit ; 
		border:none; 
		box-shadow:none; 
		border-radius:5px; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		color: #fff;
		margin-right: 5px;
	}
	.postup {
		width: 70px;
		height: 30px;
		background: #fd7e14;
	}
	.postedit {
		width: 40px;
		height: 30px;
		background: #0d6efd;
	}
	.postdelete {
		width: 40px;
		height: 30px;
		background: #dc3545;
	}
	.report-post {
		margin-top: 5px;
		background: inherit ; 
		border:none; 
		box-shadow:none; 
		border-radius:5px; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		color: #fff;
		margin-right: 5px;
		width: 80px;
		height: 30px;
		background: #fd7e14;
	}
	.pftext{
		font-size: 30px;
	}
	
	::before, ::after {
		box-sizing: border-box;
	}
	.wrapper {
		padding-top: 50px;
		max-width: 1320px; /* 최대 너비를 1035px로 고정 */
       	margin: 0 auto; /* 가운데 정렬 */
		margin-bottom: 40px;
		display: block;
	}
	#sellbox {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start; /* 왼쪽 정렬 */
		align-items: stretch;
	}
	#sellcbox {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start; /* 왼쪽 정렬 */
		align-items: stretch;
	}
	#sellComBuyBox {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start; /* 왼쪽 정렬 */
		align-items: stretch;
	}
	#sellComSellBox {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start; /* 왼쪽 정렬 */
		align-items: stretch;
	}
	.item-main-holder{
       flex: 0 0 196px; /* 고정 너비 */
       margin-right: 12px;
       margin-left: 12px;
       margin-bottom: 12px;
       margin-top: 12px;
       box-sizing: border
	}
	.item-holder{
		border: 1px solid rgb(238, 238, 238);
		background: rgb(255, 255, 255);
		display: block;
		width: 196px;
	}
	a {
		color: rgb(33, 33, 33);
		text-decoration: none;
		cursor: pointer;
	}
	a:hover {
		text-decoration: none;
		color: #000;
		transition: 0.3s;
	}
	.image-holder {
		position: relative;
		width: 100%;
		height: 194px;
	}
	.image-holder img {
		width: 194px; height: 194px;
	}
	.text-holder {
		padding: 15px 15px;
		height: 80px;
		text-align: left;
	}
	.wish-name {
		display: flex;
		justify-content: space-between;
	}
	.wish {
		color: grey;
		text-align: right;
		min-width: 30px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		font-size: 15px;
	}
	.wish img {
		width: 14px;
		height: 14px;
	}
	.title {
		position: relative;
		font-size: 14px;
		font-weight: 400;
		padding-bottom: 15px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.profile-date {
		display: flex;
		padding: 9px 15px 9px 15px;
		-webkit-box-pack: justify;
		justify-content: space-between;
		-webkit-box-align: center;
		align-items: center;
		height: 40px;
	}
	.price-holder {
		font-size: 17px;
		font-weight: 700;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.price-holder::after {
		content: "원";
		font-size: 13px;
		mergin-left: 3px;
	}
	.date {
		heigt: 40px;
		font-size: 12px;
		white-space: nowrap;
		color: rgb(102, 102, 102);
	}
	.profile {
		font-size: 12px;
		color: rgb(136, 136, 136);
	}
	.form-group {
		max-width: 700px;
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
		border: 1px solid #ccc;
		border-radius: 4px;
		resize: none;
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
	.modal-body{
		margin-left: auto;
		margin-right: auto;
	}
	.price-holder2 {
		position:relative;
		margin-left: 5px;
    	border: 1px solid #ced4da;
    	border-radius: 0.25rem; 
    	width: 150px; 
    	height: 30px;
    }
    .price-holder2::after {
    	line-height: 30px;
    	content: '원';
    	font-size: 16px;
    	font-weight: 400;
    	padding-right: 5px;
    	color: rgb(153, 153, 153);
    	position: absolute;
    	top: 0;
    	right:0;
    }
</style>
<body>
<div class="all-profile">
	<br/>
	<div class="profile-container">
	 <div class="profile-imgbox">
	 <c:if test="${proImg == null}">
	  	<img src="<c:url value='/resources/image/NoMainImage.png'/>" class="example">
	  </c:if>
	  <c:if test="${proImg != null}">
	  	<img src="<c:url value='/img/${proImg.pi_name}'/>" class="example">
	  </c:if>
	  <div class="profile-name"><P>${member.me_nick}</P></div>
	  <c:if test="${user.me_num == member.me_num}">
		<li class="profile-btn"><a href="<c:url value='/board/profilePass?pi_num=${proImg.pi_name}'/>">내 프로필 관리</a></li>
	  </c:if>
	 </div>
	 	<div class="profile-outDTbox">
			 <div class="profile-Detail">
			 	<div style="display:flex;">
			 		<div style="margin-right: 15px;">가입일 : ${member.me_date} </div><div style="margin-right: 15px;">당도 : ${member.me_sugar}</div> 
			 	</div>
			 	<c:if test="${user.me_num == member.me_num }">
					<div class="pp-box">
						<div class="pp-balance">피치페이 잔액</div>
						<div class="point">${user.me_point } <span style="font-size: 14px;">원</span></div>
						<div class="pay-buttons">
							<button id="openModalBtn" class="peachpay-button charging">충전</button>

							<form action="<c:url value='/board/profilePay'/>" method="get">
								<button class="peachpay-button">출금</button>
							</form>					
						</div>
						<div class="pay-history">
						<form action="<c:url value='/member/pointhistory'/>" method="get">
							<button class="peachpay-history-button">피치페이 내역 조회</button>
						</form>	
						</div>
					</div>
				</c:if>
			 	<br/>
			 	<form action="<c:url value='/board/profile'/>" method="post" enctype="multipart/form-data">
			 		<br>
			 		<div class="form-group">
			 			<c:if test="${!empty profile.pf_text && !empty profile.pf_text.replaceAll('<[^>]*>', '').replaceAll('&nbsp;', '').replaceAll(' ', '').trim()}">
			 				<p class="pftext">${profile.pf_text}</p>
			 			</c:if>
			 			<c:if test="${empty profile.pf_text || empty profile.pf_text.replaceAll('<[^>]*>', '').replaceAll('&nbsp;', '').replaceAll(' ', '').trim()}">
			 				<p class="pftext">소개글 내용이 없습니다.</p>
			 			</c:if>
					</div>
			 	</form>
			 </div>
		 </div>
	</div>
	<br>
	<div class="sellbox">
		<button id="sellbtn" class="selected" onclick="sell()">판매중 ${salingProducts.size() == 0 ? 0 : salingProducts.size() }</button>
		<button id="sellcbtn" class="sellbtn" onclick="sellc()">거래중 ${proceeding.size() == 0 ? 0 : proceeding.size() }</button>
		<button id="sellComBuy" class="sellbtn" onclick="sellComBuy()">구매완료 ${meNumBuy.size() == 0 ? 0 : meNumBuy.size() }</button>
		<button id="sellComSell" class="sellbtn" onclick="sellComSell()">판매완료 ${meNumSel.size() == 0 ? 0 : meNumSel.size() }</button>
	</div>
		<div class="wrapper">
		<div id="sellbox">
		<c:if test="${salingProducts.size() != 0 }">
		<c:forEach var="salingProducts" items="${salingProducts}">
					<div class="item-main-holder">
					<%-- a태그를 통해 해당 상품 번호의 상세정보로 경로 전달 --%>
					<a href="<c:url value='/saleboard/detail?sb_num=${salingProducts.sb_num}' />" class="item-holder">
						<div class="image-holder">
							<c:choose>
								<c:when test="${salingProducts.saleImageVOList.size() != 0 }">
									<img class="item" src="<c:url value='/resources/image/${salingProducts.saleImageVOList.size() != 0 ? salingProducts.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
								</c:when>
								<c:otherwise>
									<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text-holder">
							<div class="title">
								${salingProducts.sb_name}
							</div>	
							<div class="wish-name">
								<div class="price-holder">
									${salingProducts.get_sb_price()}
								</div>			
								<div class="wish">
									<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${salingProducts.sb_wish}</span>
								</div>
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${salingProducts.sb_sc_name}
							</div>	
							<div class="date">
								${salingProducts.get_date()}
							</div>
						</div>
					</a>
					<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<button class="myBtn postup" onclick="dateUp(${salingProducts.sb_num})">끌어올리기</button>
						<button class="myBtn postedit" onclick="location.href='<c:url value='/saleboard/update?sb_num=${salingProducts.sb_num}'/>'">수정</button>
						<button class="myBtn postdelete" onclick="deletePD(${salingProducts.sb_num})">삭제</button>
					</div>
					</c:if>
				</div>			
				</c:forEach>
				</c:if>
				</div>
	<div id="sellcbox">
		<c:if test="${proceeding.size() != 0 }">
		<c:forEach var="proceeding" items="${proceeding}">
					<div class="item-main-holder">
						<a href="<c:url value='/sale/tradePage?tq_num=${proceeding.tr_tq_num}' />" class="item-holder">
							<div class="image-holder">
								<c:choose>
									<c:when test="${proceeding.saleImageVOList.size() != 0 }">
										<img class="item" src="<c:url value='/resources/image/${proceeding.saleImageVOList.size() != 0 ? proceeding.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
									</c:when>
									<c:otherwise>
										<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="text-holder">
								<div class="title">
									${proceeding.sb_name}
								</div>	
								<div class="wish-name">
									<div class="price-holder">
										${proceeding.get_sb_price()}
									</div>			
									<div class="wish">
										<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${proceeding.sb_wish}</span>
									</div>
								</div>
							</div>
							<div class="profile-date">
								<div class="profile">
									${proceeding.sb_sc_name}
								</div>	
								<div class="date">
									${proceeding.get_date()}
								</div>
							</div>
							<c:if test="${proceeding.sb_me_num != member.me_num}">
							<div style="text-align: center;">
								<p>구매중</p>
							</div>
						</c:if>	
						<c:if test="${proceeding.sb_me_num == member.me_num}">
							<div style="text-align: center;">
								<p>판매중</p>
							</div>
						</c:if>			
					</a>	
				</div>		
				</c:forEach>
				</c:if>
				<c:if test="${empty proceeding}">
					<div>
						<p class="empty_product">거래중인 상품이 없습니다.</p>
					</div>
				</c:if>	
	</div>	
	<div id="sellComBuyBox">
		<c:if test="${meNumBuy.size() != 0 }">
		<c:forEach var="meNumBuy" items="${meNumBuy}">
					<div class="item-main-holder">
					<div class="item-holder">
						<div class="image-holder">
							<c:choose>
								<c:when test="${meNumBuy.saleImageVOList.size() != 0 }">
									<img class="item" src="<c:url value='/resources/image/${meNumBuy.saleImageVOList.size() != 0 ? meNumBuy.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
								</c:when>
								<c:otherwise>
									<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text-holder">
							<div class="title">
								${meNumBuy.sb_name}
							</div>	
							<div class="wish-name">
								<div class="price-holder">
									${meNumBuy.get_sb_price()}
								</div>			
								<div class="wish">
									<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${meNumBuy.sb_wish}</span>
								</div>
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${meNumBuy.sb_sc_name}
							</div>	
							<div class="date">
								${meNumBuy.get_date()}
							</div>
						</div>
					
				</div>
				<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<c:if test="${user.me_num == member.me_num }">
							<button type="button" class="report-post" id="openReportModalBtn" data-num="${meNumBuy.sb_num}">당도 남기기</button>
						</c:if>
					</div>
				</c:if>	
				</div>	
				</c:forEach>
				</c:if>
				<c:if test="${empty meNumBuy}">
					<div>
						<p class="empty_product">거래완료된 상품이 없습니다.</p>
					</div>
				</c:if>
	</div>
	<div id="sellComSellBox">
		<c:if test="${meNumSel.size() != 0 }">
		<c:forEach var="meNumSel" items="${meNumSel}">
					<div class="item-main-holder">
					<div class="item-holder">
						<div class="image-holder">
							<c:choose>
								<c:when test="${meNumSel.saleImageVOList.size() != 0 }">
									<img class="item" src="<c:url value='/resources/image/${meNumSel.saleImageVOList.size() != 0 ? meNumSel.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
								</c:when>
								<c:otherwise>
									<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text-holder">
							<div class="title">
								${meNumSel.sb_name}
							</div>	
							<div class="wish-name">
								<div class="price-holder">
									${meNumSel.get_sb_price()}
								</div>			
								<div class="wish">
									<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${meNumSel.sb_wish}</span>
								</div>
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${meNumSel.sb_sc_name}
							</div>	
							<div class="date">
								${meNumSel.get_date()}
							</div>
						</div>
						
					
				</div>
				</div>		
				</c:forEach>
				</c:if>
				<c:if test="${empty meNumSel}">
					<div>
						<p class="empty_product">판매완료된 상품이 없습니다.</p>
					</div>
				</c:if>
			</div>
		</div>	
	</div>	
	<div id="reportPostModal" class="custom-modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <div class="modal-header">
	      <h2>당도 남기기</h2>
	    </div>
	    <div class="modal-body">
	      <p>당도는 1점부터 10점까지 매길 수 있습니다.</p>
	      <div class="report-text-area">
		      <input id="reportReason" class="report-reason" placeholder="1~10" pattern="[1-9]|10"></input>      
	      </div>
	      	  <p id="errorMsg" style="color: red;"></p>
	    </div>
	    <div class="modal-footer">
	      <button class="report-button" onclick="reportPost()">확인</button>
	      <button class="cancel-button" onclick="closeReportModal()">취소</button>
	    </div>
	  </div>
	</div>
	<!-- 충전모달 -->
	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <!-- 모달 내용 -->
	        <div style="margin: 0 auto; margin-top:20px; display:flex;">	        
		        <span style="font-size: 16px; line-height:30px;">충전금액 : </span>
		        <div class="price-holder2">
			        <input style="font-size: 16px; width: 130px; height: 100%; padding-right: 5px; text-align: right; border:none;" type="text" id="userInputAmount" maxlength="13" />		        
		        </div>
	        </div>
	        	<span style="margin: 0 auto; font-size: 14px; color: red;">* 최소 충전금액은 2,000원 입니다.</span>
	        <button style="margin: 0 auto; margin-top: 20px; width: 170px; height:50px; background-color: #f76076; color: #fff; border: none; border-radius: 5px;" id="peachTrade" data-me-num="${user}">충전하기</button>
	    </div>
	</div>
<br>
<br>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

if(${meNumSel.size() != 0 } || ${meNumBuy.size() != 0 }){
	
	let sb_num = 0;
	const reportPostModal = document.getElementById("reportPostModal");
	const openReportModalBtns = document.querySelectorAll(".report-post");
	const closeReportModalBtn = document.querySelector(".custom-modal .close");
	if(reportPostModal != null && openReportModalBtns != null && closeReportModalBtn != null){
		
	[].forEach.call(openReportModalBtns, function(button){
		 console.log("버튼 클릭됨");
		button.addEventListener("click", function () {
			console.log(button);
			if('${user.me_id}' == '') {
				if(confirm('로그인하시겠습니까?')){
					location.href = '<c:url value="/member/login"/>'
				}
				return;
			}
		  	reportPostModal.style.display = "block";
		  	sb_num = $(this).data('num');
		});	
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
		var input = document.getElementById("reportReason").value;
	    var errorMsg = document.getElementById("errorMsg");
	
	    // 숫자 범위 확인
	    var number = parseInt(input);
		  if (!isNaN(number) && Number.isInteger(number) && number >= 1 && number <= 10) {
		    errorMsg.textContent = ""; // 에러 메시지 초기화
		    // 여기에 확인 버튼을 눌렀을 때 수행할 동작 추가
		  } else {
		    errorMsg.textContent = "1부터 10까지의 정수만 입력하세요.";
		    return;
		  }
		
		const reportReason = document.getElementById("reportReason").value;
	
	  	if (reportReason.trim() === "") {
	   		alert("당도를 입력하세요.");
	   		return;
		}
	  	
		let data = {
			sl_sb_num : sb_num,
			sl_sugar : reportReason,
		};
		
		ajaxJsonToJson(
				  false,
				  'post',
				  'sugar',
				  data,
				  (data) => {
					  console.log(data);
					    if (data.success) {
					      alert("당도를 매겼습니다.\n당도 점수: " + reportReason);
					      console.log(data.msg);
					      document.getElementById("reportReason").value = '';
					      closeReportModal(); // 신고 모달 닫기
					    } else {
					      alert("이미 평가한 상대입니다.");
					      console.log(data.msg);
					    }
					  },
					  () => {
					    console.log("요청 실패");
					  }
				);
		}
	function closeReportModal() {
		  reportPostModal.style.display = "none";
		}
		
	}
}



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

window.onload = function () {
	$("#sellcbox").hide();
	$("#sellComBuyBox").hide();
	$("#sellComSellBox").hide();
}

const sellbtn = document.querySelector("#sellbtn");
const sellcbtn = document.querySelector("#sellcbtn");
const sellComBuyBtn = document.querySelector("#sellComBuy");
const sellComSellBtn = document.querySelector("#sellComSell");
let currentBox = "#sellbox";
	
function sell() {
	const selectedBtn = document.querySelector(".selected");
	selectedBtn.setAttribute("class", "sellbtn");
	sellbtn.setAttribute("class", "selected");
	$(currentBox).hide();
	$("#sellbox").show();
	currentBox = "#sellbox";
}
function sellc() {
	const selectedBtn = document.querySelector(".selected");
	selectedBtn.setAttribute("class", "sellbtn");
	sellcbtn.setAttribute("class", "selected");
	$(currentBox).hide();
	$("#sellcbox").show();
	currentBox = "#sellcbox";
}
function sellComBuy() {
	const selectedBtn = document.querySelector(".selected");
	selectedBtn.setAttribute("class", "sellbtn");
	sellComBuyBtn.setAttribute("class", "selected");
	$(currentBox).hide();
	$("#sellComBuyBox").show();
	currentBox = "#sellComBuyBox";
}
function sellComSell() {
	const selectedBtn = document.querySelector(".selected");
	selectedBtn.setAttribute("class", "sellbtn");
	sellComSellBtn.setAttribute("class", "selected");
	$(currentBox).hide();
	$("#sellComSellBox").show();
	currentBox = "#sellComSellBox";
}
// 충전 버튼 클릭 시 모달 열기
document.getElementById('openModalBtn').addEventListener('click', function() {
    openModal();
});

// 모달 열기
function openModal() {
    document.getElementById('myModal').style.display = 'block';
}

// 모달 닫기
function closeModal() {
    document.getElementById('myModal').style.display = 'none';
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    if (event.target == document.getElementById('myModal')) {
        closeModal();
    }
};

var replaceNotInt = /[^0-9]/gi;

$(document).ready(function() {
	$("#userInputAmount").on("input", function() {
	    var x = $(this).val();
	    if (x.length > 0) {
	        if (x.match(replaceNotInt)) {
	           x = x.replace(replaceNotInt, "");
	        }
	        x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(this).val(x);
	    }
	});
});

//피치페이 충전
$(document).ready(function() {
    $('#peachTrade').on('click', function() {
    	
    	var comma = /,/g;
        
    	let x = $("#userInputAmount").val(); 
	    x = x.replace(comma, "");
    	
        var IMP = window.IMP; 
        IMP.init("imp41345184"); 
        var inputAmount = x; // 사용자가 입력한 결제할 금액 (임의로 '1111'로 설정)
        var minimumAmount = '2000'; // 최소 결제 금액 (예시로 5000원으로 설정)
        
        if (parseInt(inputAmount) < minimumAmount) {
            // 최소 결제 금액 미만인 경우 최소 금액으로 설정
            inputAmount = minimumAmount.toString();
            alert('최소 결제 금액 이하입니다. 최소 금액(' + minimumAmount + '원)으로 결제합니다.');
        }
        IMP.request_pay({
            pg : 'danal_tpay',
            pay_method : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(), 
            name : '${user.me_id}',
            amount : inputAmount,
            buyer_email : '${user.me_id}',
            buyer_name : '${user.me_name}',
            buyer_tel : '${user.me_phone}',
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
                    	me_num: '${user.me_num}'
                    },
                    success: function (data) {
                        //console.log('서버 응답:', data); // Check the server response in the console
                        alert('포인트가 충전되었습니다.');
                        window.location.href = '/peach/board/profile/' + ${user.me_num};
                    },
                    error: function () {
                        console.error('포인트 충전에 실패했습니다.');
                        // 실패시 처리
                        window.location.href = '/peach/board/profile/' + ${user.me_num};
                    }
                });
        	} else {
        		console.log(rsp);
        	}
        
        });		                        
    })
})
</script>

</body>
</html>