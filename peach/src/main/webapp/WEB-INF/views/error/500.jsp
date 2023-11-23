<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.wrapper {
		padding-top: 50px;
		max-width: 1320px; /* 최대 너비를 1035px로 고정 */
       	margin: 0 auto; /* 가운데 정렬 */
		margin-bottom: 40px;
		display: block;
	}
	.category-name {
		font-size: 26px;
		color: #000;
		margin-left: 12px;
	}
	.containerboard {
		width: 100%;
		height: 800px;
		display: flex;
		flex-wrap: wrap;
		align-items: stretch;
	}
	.empty-space{
		height: 300px;
	}
    .message-container {
       	width: 100%;
		height: 800px;
          text-align: center;
          padding: 20px;
	}
</style>
<body>
	<div class="wrapper">
		<div class="category-name">${categoryName }</div>
		<div class="containerboard">
			<c:choose>
	            <c:when test="${empty prList}">
	            	<div class="message-container">
	            		<div class="empty-space">
	            		</div>
	            		<img class="no-items-img" width="100px" height="100px" src="<c:url value='/img/RESISTX.gif'/>">
	                	<p class="no-items-message">등록된 상품이 없습니다.</p>
	            	</div>
	            </c:when>
	         </c:choose>
	     </div>
	 </div>
</body>
	 
	            	