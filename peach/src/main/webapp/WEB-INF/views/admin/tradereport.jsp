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

.flex-box {
	display: flex;
	border: none;
}

.btn-white-delete {
	background-color: #fff;
	border: none;
}
.table_body {
	min-height: 400px;
}
</style>
</head>
<body>
	<section class="hero-area">
		<div class="container admin">
			<div class="row">
				<div class="table_body">
				<table class="table">
					<thead style="height: 50px">
						<tr>
							<th>신고 번호</th>
							<th>신고 날짜</th>
							<th>신고자 닉네임</th>
							<th>거래상태</th>
							<th>거래상태전환</th>
							<th>신고 사유 보기</th>
							<th>신고 삭제</th>
						</tr>
					</thead>
					<c:forEach items="${report}" var="report">
						<c:if test="${report.rp_table == '3'}">
							<tbody>
								<tr>
									<td>${report.rp_num}</td>
									<td>${report.rp_date}</td>
									<td>${report.memberVO.me_nick}</td>
									<td><c:forEach items="${trList }" var="tr">
											<c:if test="${report.rp_key == tr.tq_sb_num }">${tr.tradingVO.tr_ts_state}</c:if>
										</c:forEach></td>
									<td>									
										<div class="btnWrap">
										<button onclick="deleteTradeReport(${report.rp_key})" class="popupBtn">거래상태전환</button>
									</div>
									</td>
									<td>
										<div class="btnWrap">
											<button type="button" class="popupBtn">신고내용보기</button>
										</div>
										<div class="modalWrap">
											<div class="modalBody">
												<span class="closeBtn"></span> ${report.rp_info }
											</div>
										</div>
									</td>
									<td><button onclick="deleteReport(${report.rp_num})"
											class="btn-white-delete">신고 삭제</button></td>
								</tr>
							</tbody>
						</c:if>
					</c:forEach>
				</table>
				</div>
				<div class="admin-search">
					<form action="" method="get" class="admin-search-bar">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<select class="form-control" name="type">
									<option value="0"
										<c:if test="${pm.cri.type == '0' }">selected</c:if>>전체</option>
									<option value="me_nick"
										<c:if test="${pm.cri.type == 'me_nick' }">selected</c:if>>닉네임</option>
									<option value="rp_key"
										<c:if test="${pm.cri.type == 'rp_key' }">selected</c:if>>게시판
										번호</option>
									<option value="rp_info"
										<c:if test="${pm.cri.type == 'rp_info' }">selected</c:if>>내용</option>
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
		function deleteTradeReport(rp_key){
			if(confirm("거래상태를 취소하시겠습니까??")){
		  		let rp = {
		  				rp_key : rp_key
		  		}
		  		ajaxJsonToJson(false, "post", "/admin/report/tradedelete", rp, (data)=>{
		  			if(data.res){
		  				alert('거래가 취소되었습니다')
			  			location.reload();
		  			}else{
		  				alert('거래취소 실패')
		  			}
		  		})
			}else{
				alert("삭제 취소")
			}
		}
		
		function deleteReport(rp_num){
			if(confirm("삭제하시겠습니까??")){
		  		let rp = {
		  				rp_num : rp_num
		  		}
		  		ajaxJsonToJson(false, "post", "/admin/report/delete", rp, (data)=>{
		  			if(data.res){
		  				alert('삭제 성공')
			  			location.reload();
		  			}else{
		  				alert('삭제 실패')
		  			}
		  		})
			}else{
				alert("삭제 취소")
			}
  	}
		

	</script>

</body>
</html>