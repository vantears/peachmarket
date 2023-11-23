<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header class="header navbar-area">
	<!-- 헤더 탑-->
	<div class="topbar navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-left">
						<c:if test="${user != null }">
							<ul class="menu-top-link">
								<img width="20px" height="20px" src="<c:url value='/resources/image/location.png'/>"> ${user.me_city_name}
							</ul>
						</c:if>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-middle">
						<ul class="useful-links">
							<li><a href="<c:url value='/'/>">피치 마켓</a></li>
							<li><a href="<c:url value='/board/community'/>">우리동네 생활</a></li>
						</ul>
					</div>
				</div>				<div class="col-lg-4 col-md-4 col-12">

					<div class="top-end">
						<ul class="user-login">
							<c:if test="${user == NULL}">
								<li class="inner-item"><a
									href="<c:url value='/member/signup' />">회원가입</a></li>
								<li class="inner-item"><a
									href="<c:url value='/member/login'/>">로그인</a></li>
							</c:if>
							<c:if test="${user != NULL }">
								<li class="inner-item"><a href="#" id="notificationLink">알림</a></li>
								<div class="notifi-alarm" id="notificationBox"></div>
								<c:if test="${user.me_social == 'normal' }">
									<li class="inner-item"><a
										href="<c:url value='/member/logout'/>">로그아웃</a></li>
								</c:if>
								<c:if test="${user.me_social != 'normal' }">
									<li class="inner-item"><a
										href="<c:url value='/kakao/logout'/>"> 로그아웃</a></li>
									<li class="inner-item"><a
										href="<c:url value='/kakao/withdraw'/>" onclick="return confirm('회원탈퇴시 계정정보가 전부 없어집니다.');">회원탈퇴</a></li>
								</c:if>
								<c:set var="profileURL" value="/board/profile/${user.me_num}" />
								<li class="inner-item"><a
									href="<c:url value='${profileURL}'/>">마이페이지</a></li>
								</c:if>
							<c:if test="${user != null && user.me_au == 'admin' }">
								<li class="inner-item"><a
									href="<c:url value='/admin/manager'/>">관리자 메뉴</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function reloadNotifications() {
			$.ajax({
						method : 'post',
						url : '<c:url value="/common/header"/>',
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						success : function(map) {
							console.log(map)
							if (map.trList.length === 0 && map.tmList.length === 0) {
								$('#notificationBox').html(
										'<p>최근 알림이 없습니다.</p>');
							} else {
								var notificationList = map.trList;
								var notificationListM = map.tmList;
								var notificationBoxContent = '';
								$.each(notificationList, function(index, item) {
										console.log(item);
										console.log(item.saleBoardVO);
										var imageSrc = item.saleBoardVO.saleImageVOList.length !== 0 ? item.saleBoardVO.saleImageVOList[0].si_name
												: '';
										console.log(imageSrc)
										notificationBoxContent += '<div class="notifi-small">'
												+ '<img class="notifi-img"  src="/peach/resources/image/' + imageSrc + '">'
												+ '<a href="<c:url value="/saleboard/detail?sb_num=' + item.saleBoardVO.sb_num + '"/>">'
												+ '<div class="productName">'
												+ item.saleBoardVO.sb_name
												+ '</div>'
												+ '</a>'
												+ '</br>'
												+ '<a href="<c:url value="/board/profile/' + item.memberVO.me_num + '"/>">'
												+ '<div class="userNick">'
												+ item.memberVO.me_nick
												+ '</div>'
												+ '</a>'
												+ '<div class="notifi-btnbox">'
												+ '<button class="notifi-btn accept" onclick="acception('
												+ item.tq_num
												+ ')">수락</button>'
												+ '<button class="notifi-btn reject" onclick="rejection('
												+ item.tq_num
												+ ')">거절</button>'
												+ '</div>'
												+ '</div>';

								});
								$.each(notificationListM, function(index, item) {
								    notificationBoxContent += '<div class="notifi-small">'
								        + '<a href="<c:url value="/saleboard/detail?sb_num=' + item.tm_sb_num + '"/>">'
								        + '<div class="productName">'
								        + item.tm_sb_num + '번' + item.tm_info
								        + '</div>'
								        + '</a>'
								        + '</br>'
								        + '<div class="notifi-btnbox">'
								        + '<button class="notifi-btn confirmT" onclick="confirmT('
								        + item.tm_num
								        + ')">확인</button>'								        
								        + '</div>'
								        + '</div>';
								});
								$('#notificationBox').html(
										notificationBoxContent);
							}
						},
						error : function(xhr, status, error) {
							console.log(xhr);
							alert("알림을 불러오는 도중 오류가 발생했습니다.");
						}
					});
		}
		$(document).ready(function() {
			$('#notificationLink').click(function(e) {
				e.preventDefault(); // 링크의 기본 동작인 페이지 이동을 막습니다.
				$('#notificationBox').toggle();
				reloadNotifications();
			});
		});

		function confirmT(tm_num) {
			$.ajax({
				method : 'post',
				url : '<c:url value="/common/confirmT"/>', // 수정이 필요한 부분
				data : {
					tm_num : tm_num
				},
				dataType : 'json',
				success : function(map) {
					// 성공 시 수락 처리 후 작업
					alert('메세지를 확인하였습니다.');
					var url = `/peach`;
					window.location.href = url;

				},
				error : function(xhr, status, error) {
					console.log('오류 발생:', error);
					// 오류 처리 로직
				}
			});
		}
		
		
		function acception(tq_num) {
			// 여기에 '수락' 버튼에 대한 로직을 추가
			// 예를 들어, '수락' 버튼이 클릭되었을 때 해야 할 일을 작성
			// 이 함수는 '수락' 버튼이 클릭될 때 실행됩니다.
			// tq_num을 사용하여 적절한 데이터를 전달하고 처리할 수 있습니다.
			// 이 함수에서 수락에 대한 Ajax 호출을 할 수 있습니다.
			$.ajax({
				method : 'post',
				url : '<c:url value="/common/accept"/>', // 수정이 필요한 부분
				data : {
					tq_num : tq_num
				}, // tq_num을 전달하거나 필요한 데이터를 추가하세요
				dataType : 'json',
				success : function(map) {
					// 성공 시 수락 처리 후 작업
					console.log('거래를 수락하였습니다.', map);
					alert('거래를 수락하였습니다.');
					var url = `/peach/sale/tradePage?tq_num=\${tq_num}`;
					window.location.href = url;

				},
				error : function(xhr, status, error) {
					console.log('오류 발생:', error);
					// 오류 처리 로직
				}
			});
		}

		// '거절' 버튼 클릭 시 호출되는 함수
		function rejection(tq_num) {
			// '거절' 버튼에 대한 로직 추가
			// '거절' 버튼이 클릭되었을 때 실행됩니다.
			// tq_num을 사용하여 적절한 데이터를 전달하고 처리할 수 있습니다.
			// '거절' 버튼 클릭 시 AJAX 호출을 수행합니다.
			$.ajax({
				method : 'post',
				url : '<c:url value="/common/reject"/>', // 적절한 URL로 수정
				data : {
					tq_num : tq_num
				}, // 필요한 데이터를 전달하거나 수정하세요
				dataType : 'json',
				success : function(map) {
					console.log('거절 요청이 성공했습니다.', map);
					alert('거절이 완료되었습니다.');

					reloadNotifications();
				},
				error : function(xhr, status, error) {
					console.log('오류 발생:', error);
					// 오류 처리 로직
				}
			});
		}
		
	</script>
</header>
<style>
	.notifi-alarm {
		position: absolute;
		width: 400px;
		max-height: 300px;
		overflow-y: auto;
		top: 100%;
		left: calc(50% - 200px);
		border: 1px solid #ccc;
		background: #fff;
		display: none;
		flex-wrap: nowrap; /* 요소가 넘치는 경우 줄 바꿈 방지 */
		align-items: center; /* 수직 가운데 정렬 */
		justify-content: flex-start;	
	}
	.notifi-small{
		width: 100%;
		display: flex;
		border-bottom: 1px solid #ccc;
	}
	.notifi-img{
		width: 50px;
		height: 50px;
		flex: 0 0 auto; /* Flex 아이템의 크기를 유지 */ 		
	}
	header.a{z-index: 99}
	.notifi-small h3 {
	    flex: 1; /* 나머지 공간을 차지하여 이미지 오른쪽에 배치 */
	    text-align: center;
	}
	.notifi-btnbox {
	    display: flex;
	    justify-content: flex-end;
    	align-items: center; 
	}
	.notifi-btn.accept{
		background-color: #4CAF50; /* 자연스러운 초록색 */
		margin-right: 5px;
	    color: white; /* 글자색을 밝게 설정 */
	    border: none; /* 테두리 제거 */
	    padding: 5px 10px; /* 내부 여백 설정 */
	    text-align: center; /* 텍스트 중앙 정렬 */
	    text-decoration: none; /* 링크의 밑줄 제거 */
	    display: inline-block; /* 인라인 요소로 표시 */
	    font-size: 14px; /* 폰트 크기 조정 */
	    border-radius: 5px; /* 둥근 모서리 설정 */
	    transition-duration: 0.4s; /* 변경에 애니메이션 효과 추가 */
	    cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능하게 함 */
	}
	.notifi-btn.reject{
		background-color: #b30000;
		margin-right: 5px;
	    color: white; /* 글자색을 밝게 설정 */
	    border: none; /* 테두리 제거 */
	    padding: 5px 10px; /* 내부 여백 설정 */
	    text-align: center; /* 텍스트 중앙 정렬 */
	    text-decoration: none; /* 링크의 밑줄 제거 */
	    display: inline-block; /* 인라인 요소로 표시 */
	    font-size: 14px; /* 폰트 크기 조정 */
	    border-radius: 5px; /* 둥근 모서리 설정 */
	    transition-duration: 0.4s; /* 변경에 애니메이션 효과 추가 */
	    cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능하게 함 */
	}
	.notifi-small > * {
   
	}
	.menu-top-link {
		color: #fff;
	}
	.productName {
		width: 140px;
		height: 50px;
		line-height: 50px;
		margin: 0 5px;
		text-align: center;
		overflow: hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	.userNick {
		width: 90px;
		height: 50px;
		line-height: 50px;
		padding: 0 5px;
		text-align: center;
		overflow: hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
</style>