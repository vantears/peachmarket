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
				
				<div class="input-group mb-3 mt-3">
					<div class="input-group-prepend">
						<select class="form-control" id="authority">
							<option value="0">카테고리 이름</option>
						</select>
					</div>
					<input type="text" class="form-control" id="cc_name">
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
						<c:forEach items="${ccList}" var="cc">
							<tr>
								<td>${cc.cc_num}<input type="hidden" name="cc_num"
									value="${cc.cc_num}"></td>
								<td><input type="text" value="${cc.cc_name}"
									class="form-control" name="cc_name"></td>
								<td>
									<button class="btn btn-outline-success btn-update">수정</button>
									<button class="btn btn-outline-warning"
										onclick="deleteBoardType(${cc.cc_num})">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<script type="text/javascript">
  	$('.btn-insert').click(()=>{
  		let cc_name = $('#cc_name').val();
  		if(cc_name.trim().length == 0){
  			alert('카테고리명을 입력하세요.');
  			return;
  		}
  		let communityCategory = {
  				cc_name : cc_name,
  		};
  		ajaxJsonToJson(false, "post", "/admin/communitycategory/type/insert", communityCategory, (data)=>{
  			if(data.res){
  				alert('카테고리 종류를 추가했습니다.')
	  			location.reload();
  			}else{
  				alert('카테고리 종류를 추가하지 못했습니다.')
  			}
  		});
  	});
  	
  	$('.btn-update').click(function(){
  		let cc_name = $(this).parents('tr').find('[name=cc_name]').val();
  		console.log(cc_name)
  		if(cc_name.trim().length == 0){
  			alert('카테고리를 입력하세요.');
  			return;
  		}
  		let cc_num = $(this).parents('tr').find('[name=cc_num]').val();
  		
  		let cc = {
  				cc_num : cc_num,
  				cc_name : cc_name
  		}
  		ajaxJsonToJson(false, "post", "/admin/communitycategory/type/update", cc, (data)=>{
  			if(data.res){
  				alert('카테고리 종류를 수정했습니다.')
	  			location.reload();
  			}else{
  				alert('카테고리 종류를 수정하지 못했습니다.')
  			}
  		});
  	});
  	
  	
  	function deleteBoardType(cc_num){
  		let cc = {
  				cc_num : cc_num
  		}
  		ajaxJsonToJson(false, "post", "/admin/communitycategory/type/delete", cc, (data)=>{
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
</body>
</html>