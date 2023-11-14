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
				<button id="openModalBtn" type="button" class="pay">피치페이</button>
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
			