<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
	<div class="scroll-container">
			<div class="product-box">
				<div class="product-image-box">
					<c:choose>
						<c:when test="${board.saleImageVOList.size() != 0 }">
							<img class="product-image" src="<c:url value='/resources/image/${board.saleImageVOList.size() != 0 ? board.saleImageVOList.get(0).si_name :\"\" }'/>">
						</c:when>
						<c:otherwise>
							<img class="product-image" src="<c:url value='/resources/image/NoMainImage.png'/>">
						</c:otherwise>
					</c:choose>
				</div>
				<a href="<c:url value='/saleboard/detail?sb_num=${board.sb_num}' />" class="product-price-and-title">
				<div class="product-price-and-title">
					<div class="product-title">${board.sb_name}</div>
					<div class="product-price">${board.get_sb_price()}</div>
					<span class="tooltip-text">게시글로 이동</span>
				</div>
				</a>
				<button id="openModalBtn" type="button" class="pay" data-num="${board.sb_num }">거래신청</button>
					<div id="myModal" class="modal">
						<div class="modal-content1">
							<span class="close">&times;</span> <img class="modal-image"
								width="30" height="34"
								src="<c:url value='/resources/img/peachmark.png'/>">
							<div class="modal-text1">피치마켓에서 중고거래 시작하기</div>
							<div class="modal-text2">간편하게 상품을 확인하세요</div>
							<div class="button-container">
								<div class="rectangle-button red-button">
									<button id="peachTrade2" type="button" onclick="tradePost()" class="trade" data-sbnum="${board.sb_num}" data-menum="${user.me_num}">직거래</button>
								</div>
								<div class="rectangle-button pink-button">
									<button id="peachTrade" type="button" class="trade"
										data-sb-num="${board.sb_num}" data-me-num="${user.me_num}">피치페이거래</button>
								</div>
							</div>
							<div class="customer-center-container">
								<p>
									도움이 필요하면 <a href="daed124@naver.com">이메일</a> 또는 고객센터 <b>1611-7474</b>
									로 문의 부탁드립니다. <br> 고객센터 운영시간: 09~18시 (점심시간 12~13시, 주말/공휴일
									제외)
								</p>
							</div>
						</div>
					</div>
			</div>
			<div class="message-box">
			<c:forEach items="${messageList }" var="message" varStatus="status">
				<c:choose>
					<c:when test="${user.me_num != message.ms_me_num }">
						<div class="message-yours">
							<div class="message-content-read-yours">
								<div class="message-content">
									${message.ms_info }
								</div>
							</div>
							<div class="date yours">		
								${message.ms_date }
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="message-mine">
							<div class="message-content-read-mine">
								<c:if test="${status.last and message.ms_unread == 0}">
									<span style="margin-right: 5px;"><br>안읽음</span>
								</c:if>
								<c:if test="${status.last and message.ms_unread != 0}">
									<span style="margin-right: 5px;"><br>읽음</span>
								</c:if>
								<div class="message-content">
									${message.ms_info }
								</div>
							</div>
							<div class="date mine">
								${message.ms_date }
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			</div>



			