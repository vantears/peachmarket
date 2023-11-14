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
							<th>ID</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>닉네임</th>
							<th>포인트</th>
							<th>권한</th>
							<th>가입날짜</th>
							<th>당도</th>
							<th>계정상태</th>
							<th>지역(대분류)</th>
							<th>은행</th>
							<th>수정</th>

						</tr>
					</thead>
					<c:forEach items="${mbList}" var="mbList">
						<tbody>
							<tr>
								<td>${mbList.me_num}</td>
								<td>${mbList.me_id}</td>
								<td>${mbList.me_name}</td>
								<td>${mbList.me_phone}</td>
								<td>${mbList.me_nick}</td>
								<td>${mbList.me_point}</td>
								<td>${mbList.me_au}</td>
								<td>${mbList.me_date}</td>
								<td>${mbList.me_sugar}</td>
								<td>${mbList.statementVO.st_name}</td>
								<td>${mbList.cityVO.ci_large}</td>
								<td>${mbList.bankVO.bk_name}</td>
								<td><div class="btnWrap">
										<button type="button" class="popupBtn">수정하기</button>
									</div>
									<div class="modalWrap">
										<div class="modalBody">
											<span class="closeBtn"></span>
											<form action="<c:url value='/admin/manager'/>" method="post">
												<input type="hidden" name="me_num" value="${mbList.me_num}">
												<select class="form-control" name="me_st_num">
													<c:forEach items="${StateTypeList}" var="List">
														<option value="${List.st_num }">${List.st_name }</option>
													</c:forEach>
												</select>
												<button>완료</button>
											</form>
										</div>
									</div></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

				<div class="admin-search">
					<form action="" method="get" class="admin-search-bar">
						<div class="form-group">
							<select class="form-control" name="authority">
								<option value="0"
									<c:if test="${pm.cri.authority == '0' }">selected</c:if>
									>전체</option>
								<option value="admin"
									<c:if test="${pm.cri.authority == 'admin' }">selected</c:if>
									>관리자</option>
								<option value="user"
									<c:if test="${pm.cri.authority == 'user' }">selected</c:if>
									>회원</option>
							</select>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<select class="form-control" name="type">
									<option value="0"
										<c:if test="${pm.cri.type == '0' }">selected</c:if>>전체</option>
									<option value="me_num"
										<c:if test="${pm.cri.type == 'me_num' }">selected</c:if>>회원번호</option>
									<option value="me_name"
										<c:if test="${pm.cri.type == 'me_name' }">selected</c:if>>이름</option>
									<option value="me_nick"
										<c:if test="${pm.cri.type == 'me_nick' }">selected</c:if>>닉네임</option>
									<option value="me_au"
										<c:if test="${pm.cri.type == 'me_au' }">selected</c:if>>권한</option>
									<option value="bo_contents"
										<c:if test="${pm.cri.type == 'bo_contents' }">selected</c:if>>내용</option>

								</select>
							</div>
							<input type="text" class="form-control" name="search"
								value="${pm.cri.search}">
							<button class="btn btn-outline-success">검색</button>
						</div>
					</form>
				</div>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/admin/manager${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
						</li>
					</c:if>

					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
						<li
							class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
							<a class="page-link"
							href="<c:url value='/admin/manager${pm.cri.getUrl(i)}'/>">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/admin/manager${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
						</li>
					</c:if>
				</ul>
			</div>

		</div>
	</section>



	<script type="text/javascript">
		$('.popupBtn').click(function() {
			$(this).parent().next().show();
		})
		$('.closeBtn').click(function() {
			$(this).parents('.modalWrap').hide();
		})
		$('.modalWrap').click(function(e) {
			if (e.target == this) {
				$(this).hide()
			}
		})

	
	</script>

</body>
</html>
