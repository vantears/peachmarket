<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
</head>
<body>	
	<div class="wrapper">
		<div class="category-name">${categoryName }</div>
		<div class="containerboard">
			<c:if test="${prList.size() != 0 }">
			
			<%-- forEach를 통해 판매상품 리스트를 컨트롤러에서 가져와서 출력 --%>
			<c:forEach items="${prList}" var="pr">
					<div class="item-main-holder">
					<%-- a태그를 통해 해당 상품 번호의 상세정보로 경로 전달 --%>
					<a href="<c:url value='/saleboard/detail?sb_num=${pr.sb_num}' />" class="item-holder">
						<div class="image-holder">
							<c:choose>
								<c:when test="${pr.saleImageVOList.size() != 0 }">
									<img class="item" src="<c:url value='/resources/image/${pr.saleImageVOList.size() != 0 ? pr.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
								</c:when>
								<c:otherwise>
									<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text-holder">
							<div class="title">
								${pr.sb_name}
							</div>	
							<div class="wish-name">
								<div class="price-holder">
									${pr.get_sb_price()}
								</div>			
								<div class="wish">
									<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${pr.sb_wish}</span>
								</div>
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${pr.sb_me_nickname}
							</div>	
							<div class="date">
								${pr.get_date()}
							</div>
						</div>
					</a>
				</div>			
				</c:forEach>
				</c:if>
				<c:if test="${prList.size() == 0 }">
					<div class="no-posts">
						해당 카테고리에 아직 등록된 게시글이 없습니다.
					</div>
				</c:if>
		</div>
	</div>
    	<!-- 댓글 페이지네이션 -->
	<ul class="pagination">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/saleboard/${pm.cri.sc_num}${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:choose>
	            <c:when test="${i == pm.cri.page}">
	                <li class="page-item current "> <!-- 현재 페이지일 때 current 클래스 추가 -->
	                    <a class="page-link" href="<c:url value='/saleboard/${pm.cri.sc_num}${pm.cri.getUrl(i)}'/>">${i}</a>
	                </li>
	            </c:when>
	            <c:otherwise>
	                <li class="page-item">
	                    <a class="page-link" href="<c:url value='/saleboard/${pm.cri.sc_num}${pm.cri.getUrl(i)}'/>">${i}</a>
	                </li>
	            </c:otherwise>
       		</c:choose>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/saleboard/${pm.cri.sc_num}${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
			</li>
		</c:if>
	</ul>	
</body>
	<style>
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
		.category-name {
			font-size: 26px;
			color: #000;
			margin-left: 12px;
		}
		.containerboard {
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
		.pagination {
	   		display: flex; /* 페이지 번호를 가로로 배열하기 위한 스타일 */
	   		justify-content: center; /* 페이지 번호 중앙 정렬 */
	   		list-style-type: none;
	   		margin-bottom: 20px;
		}
		.page-item {
		    margin: 0 3px; /* 페이지 번호 간격 설정 */
		}
		.page-link{
		    width: 33px;
		    height: 33px;
		    display: flex;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    margin-right: 12px;
		    border: 1px solid rgb(204, 204, 204);
		    background: rgb(255, 255, 255);
		    border-radius: 2px;
		    color: rgb(155, 153, 169);
		    text-decoration: none;
		}
		.pagination li.current a {
		    background-color: #F16461;
		    color: #fff;
		}
		.no-posts {
			text-align: center;
			margin-top: 20px;
			margin-left: 12px;
		}
	</style>
</html>
