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
}

.box-main {
	border: 3px solid black;
}
</style>
</head>
<body>
	<section class="hero-area">
		<div class="container admin">
			<div class="row">
				<h1>물품 카테고리 관리</h1>
				<div class="input-group mb-3 mt-3">
					<div class="input-group-prepend">
						<select class="form-control" id="authority">
							<option value="0">카테고리 이름</option>
						</select>
					</div>
					<input type="text" class="form-control" id="sc_name">
					<button class="btn btn-outline-success btn-insert">등록</button>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>카테고리 번호</th>
							<th>카테고리 이름</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categoryList}" var="sc">
							<tr>
								<td>${sc.sc_num}<input type="hidden" name="sc_num"
									value="${sc.sc_num}"></td>
								<td><input type="text" value="${sc.sc_name}"
									class="form-control" name="sc_name"></td>
								<td>
									<button class="btn btn-outline-success btn-update">수정</button>
									<button class="btn btn-outline-warning"
										onclick="deleteBoardType(${sc.sc_num})">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<script type="text/javascript">
  	$('.btn-insert').click(()=>{
  		let sc_name = $('#sc_name').val();
  		if(sc_name.trim().length == 0){
  			alert('카테고리명을 입력하세요.');
  			return;
  		}
  		let saleCategory = {
  				sc_name : sc_name,
  		};
  		ajaxJsonToJson(false, "post", "/admin/salecategory/type/insert", saleCategory, (data)=>{
  			if(data.res){
  				alert('카테고리 종류를 추가했습니다.')
	  			location.reload();
  			}else{
  				alert('카테고리 종류를 추가하지 못했습니다.')
  			}
  		});
  	});
  	
  	$('.btn-update').click(function(){
  		let sc_name = $(this).parents('tr').find('[name=sc_name]').val();
  		console.log(sc_name)
  		if(sc_name.trim().length == 0){
  			alert('카테고리를 입력하세요.');
  			return;
  		}
  		let sc_num = $(this).parents('tr').find('[name=sc_num]').val();
  		
  		let sc = {
  				sc_num : sc_num,
  				sc_name : sc_name
  		}
  		ajaxJsonToJson(false, "post", "/admin/salecategory/type/update", sc, (data)=>{
  			if(data.res){
  				alert('카테고리 종류를 수정했습니다.')
	  			location.reload();
  			}else{
  				alert('카테고리 종류를 수정하지 못했습니다.')
  			}
  		});
  	});
  	
  	
  	function deleteBoardType(sc_num){
  		let sc = {
  				sc_num : sc_num
  		}
  		ajaxJsonToJson(false, "post", "/admin/salecategory/type/delete", sc, (data)=>{
  			if(data.res){
  				alert('게시판 종류를 삭제했습니다.')
	  			location.reload();
  			}else{
  				alert('게시판 종류를 삭제하지 못했습니다.')
  			}
  		});
  	}
  </script>

			</div>
		</div>
	</section>





	<!-- <div class="container admin box-main">
		<nav class="admin-nav">
			<ul>
				<li><h2>1. 회원관리</h2></li>
				<li>2. 카테고리 추가 제거</li>
				<li>3. 신고기능관리</li>
			</ul>
		</nav>
		<div class="admin-content">
		내용확인
		</div>
	</div> -->

</body>
</html>