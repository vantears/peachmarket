<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
<style>
.admin {
	min-height: 800px;
	/* min-width: 1024px; */
	overflow: auto;
}

.box-main {
	border: 3px solid black;
}

.popupBtn {
	width: 100%;
	height: 100%;
	background-color: white;
	border: none;
}

.modalWrap {
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
}

.modalBody {
	width: 500px;
	height: 300px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
	margin: 100px;
}

.closeBtn {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
}

.admin-search {
	margin: auto;
	width: 500px;
	margin-top: 10px;
}

.justify-content-center {
	display: flex;
	margin-top: -5px;
}
</style>
</head>
<body>
	<section class="hero-area">
		<div class="container admin">
			<div class="row">
				<h2>회원관리</h2>
				<table class="table">
					<thead style="height: 50px">
						<tr>
							<th>회원 번호</th>
							<th>포인트</th>
							<th>날짜</th>
							<th>변동 사유</th>
						</tr>
					</thead>
					<c:forEach items="${phList}" var="pointHistory">
						<tbody>
							<tr>
								<td>${pointHistory.ph_me_num}</td>
								<td>${pointHistory.ph_point}</td>
								<td>${pointHistory.formattedPhDate}</td>
								<td>${pointHistory.ph_info}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/member/pointhistory${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
						</li>
					</c:if>

					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
						<li
							class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
							<a class="page-link"
							href="<c:url value='/member/pointhistory${pm.cri.getUrl(i)}'/>">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/member/pointhistory${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
						</li>
					</c:if>
				</ul>
			</div>

		</div>
	</section>
</body>
</html>
