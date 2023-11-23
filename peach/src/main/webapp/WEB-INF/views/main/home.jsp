<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>스프링</title>
<style>
	.price {
		font-size: 18px;
		font-weight: bold;
		margin-top: 4px;
		line-height: 1.76;
		letter-spacing: -0.6px;
	}
	
	.price::after {
		content: "원";
		font-size: 16px;
		margin-left: 4px;
	}
	.slide {
	  /* layout */
	  display: flex;
	  flex-wrap: nowrap;
	  /* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
	  overflow: hidden;
	
	  /* position */
	  /* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
	  position: relative;
	
	  /* size */
	  width: 100%;
	
	  /* slide drag를 위해 DOM요소가 드래그로 선택되는것을 방지 */
	  user-select: none;
	}
	.slide_item {
	  /* layout */
	  display: flex;
	  align-items: center;
	  justify-content: center;
	
	  /* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
	  position: relative;
	  left: 0px;
	
	  /* size */
	  width: 100%;
	  height: 300px;
	  /* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
	  flex-shrink: 0;
	
	  /* transition */
	  transition: left 1s;
	}
	.slide_button {
	  /* layout */
	  display: flex;
	  justify-content: center;
	  align-items: center;
	
	  /* position */
	  position: absolute;
	  /* 버튼이 중앙에 위치하게 하기위해 계산 */
	  top: calc(50% - 16px);
	
	  /* size */
	  width: 32px;
	  height: 32px;
	
	  /* style */
	  font-size: 50px;
	  font-weight: 500;
	  color: #fff;
	  cursor: pointer;
	}
	
	.slide_prev_button {
	  left: 10px;
	}
	.slide_next_button {
	  right: 10px;
	}
	
	/* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */
	.slide_item.item1 {
	  background-color: darkgoldenrod;
	}
	.slide_item.item2 {
	  background-color: aqua;
	}
	.slide_item.item3 {
	  background-color: blueviolet;
	}
	.slide_item.item4 {
	  background-color: burlywood;
	}
	.slide_item.item5 {
	  background-color: cornflowerblue;
	}
	
	/* 페이지네이션 스타일 */
	ul,
	li {
	  list-style-type: none;
	  padding: 0;
	  margin: 0;
	}
	.slide_pagination {
	  /* layout */
	  display: flex;
	  gap: 5px;
	
	  /* position */
	  position: absolute;
	  bottom: 0;
	  /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
	  left: 50%;
	  transform: translateX(-50%);
	}
	.slide_pagination > li {
	  /* 현재 슬라이드가 아닌 것은 투명도 부여 */
	  color: #fff;
	  cursor: pointer;
	  font-size: 25px;
	}
	.slide_pagination > li.active {
	  /* 현재 슬라이드 색상은 투명도 없이 */
	  color: #f76076;
	}
	
	.slide_item_duplicate {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  position: relative;
	  left: 0px;
	  width: 100%;
	  height: 300px;
	  flex-shrink: 0;
	  transition: left 0s;
	}
	
	.item-main-holder{
       flex: 0 0 230px; /* 고정 너비 */
       margin-right: 5px;
       margin-left: 5px;
       margin-bottom: 12px;
       margin-top: 12px;
	}
	.item-holder{
		border: 1px solid rgb(238, 238, 238);
		background: rgb(255, 255, 255);
		display: block;
		width: 230px;
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
		height: 228px;
	}
	.image-holder img {
		width: 228px; height: 228px;
	}
	.text-holder {
		padding: 15px 15px;
		height: 90px;
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
		font-size: 16px;
	}
	.wish img {
		width: 15px;
		height: 15px;
	}
	.title {
		position: relative;
		font-size: 16px;
		font-weight: 400;
		padding-bottom: 20px;
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
		font-size: 19px;
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
	.city-text {
			text-align: center;
			font-size: 14px;
			font-weight: 400;
			color: #888888;
			padding-bottom: 10px;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
		}
</style>
</head>
<body>
	<section class="hero-area">
		<div class="container">
			<div class="row">
				<div class="col-12 custom-padding-right">
					<div class="slide slide_wrap">
				      <div class="slide_item item1"><img style="width: 100%; height: 100%" src="<c:url value='/resources/image/banner1.png'/>"></div>
				      <div class="slide_item item2"><img style="width: 100%; height: 100%" src="<c:url value='/resources/image/banner2.png'/>"></div>
				      <div class="slide_item item3"><img style="width: 100%; height: 100%" src="<c:url value='/resources/image/banner3.png'/>"></div>
				      <div class="slide_prev_button slide_button">&lt;</div>
				      <div class="slide_next_button slide_button">&gt;</div>
				      <ul class="slide_pagination"></ul>
				    </div>
				</div>
			</div>
		</div>
	</section>


	<!-- Start Trending Product Area -->
	<section class="trending-product section" style="margin-top: 12px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>우리동네 인기 상품</h2>
						<p>내 동네의 최근 20개의 인기상품을 확인해보세요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Start Single Product -->
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
						<div class="city-text">
									${pr.memberVO.cityVO.ci_small}
						</div>
					</a>
				</div>			
				</c:forEach>

				<!-- End Single Product -->
			</div>
		</div>
	</section>
	<!-- End Trending Product Area -->


	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/glightbox.min.js"></script>
	<script src="resources/js/main.js?version2"></script>
	<script type="text/javascript">
	//페이지가 로드될 때 서버에서 전달된 메시지 확인
	var successMessage = "${successMessage}";
	var errorMessage = "${errorMessage}";
	// 회원 탈퇴 성공 시
	if (successMessage !== "") {
	    alert(successMessage);
	}
	// 회원 탈퇴 실패 시
	if (errorMessage !== "") {
	    alert(errorMessage);
	}
	
		$('.wish').click(function(){
			let data = {
				wi_me_num : '${user.me_num}',
				wi_sb_num : '${board.sb_num}',
			};
			ajaxJsonToJson(false, 'post', '/saleboard/wish', data, (data)=>{
				if(data.isWish == 0){
					alert('찜을 취소하였습니다.');		
				}
				diplayWishBtn(data.isWish);
				$('.wish-text').text("찜 " + data.board.sb_wish);
			})
		})
		function diplayWishBtn(isWish){
			
				$('.wish-type').text("찜취소");
				$('.wish').removeClass("add");
				$('.wish').addClass("cancel");
				$('.wish img').attr("src", "<c:url value='/resources/image/wish-filled.png'/>");
			
		}
		
		// 슬라이크 전체 크기(width 구하기)
		const slide = document.querySelector(".slide");
		let slideWidth = slide.clientWidth;

		// 버튼 엘리먼트 선택하기
		const prevBtn = document.querySelector(".slide_prev_button");
		const nextBtn = document.querySelector(".slide_next_button");

		// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
		let slideItems = document.querySelectorAll(".slide_item");
		// 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
		const maxSlide = slideItems.length;
		console.log(maxSlide);

		// 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
		let currSlide = 1;

		// 페이지네이션 생성
		const pagination = document.querySelector(".slide_pagination");

		for (let i = 0; i < maxSlide; i++) {
		  if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
		  else pagination.innerHTML += `<li>•</li>`;
		}

		const paginationItems = document.querySelectorAll(".slide_pagination > li");

		// 무한 슬라이드를 위해 start, end 슬라이드 복사하기
		const startSlide = slideItems[0];
		const endSlide = slideItems[slideItems.length - 1];
		const startElem = document.createElement("div");
		const endElem = document.createElement("div");

		endSlide.classList.forEach((c) => endElem.classList.add(c));
		endElem.innerHTML = endSlide.innerHTML;

		startSlide.classList.forEach((c) => startElem.classList.add(c));
		startElem.innerHTML = startSlide.innerHTML;

		// 각 복제한 엘리먼트 추가하기
		slideItems[0].before(endElem);
		slideItems[slideItems.length - 1].after(startElem);

		// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
		slideItems = document.querySelectorAll(".slide_item");
		//
		let offset = slideWidth + currSlide;
		slideItems.forEach((i) => {
			i.style.left = -offset + 'px';
		});

		function nextMove() {
			currSlide++;
			if (currSlide <= maxSlide + 1) {
			// Slide to the next item
			moveSlide(currSlide);
			} else {
				moveSlide(currSlide);
			    // Loop back to the second slide to give the appearance of moving to the next page
			    currSlide = 2;
			    setTimeout(() => {
			    	 moveSlide(currSlide);
			    }, 100);
			}
		}
	
		// Function to move to the previous slide
		function prevMove() {
			currSlide--;
			if (currSlide >= 0) {
		    	// Slide to the previous item
		    	moveSlide(currSlide);
		  	} else {
				moveSlide(currSlide);
		    	// Loop to the second-to-last slide to give the appearance of moving to the previous page
		    	currSlide = maxSlide - 1;
		    	setTimeout(() => {
		    	moveSlide(currSlide);
		      	}, 100);
			}
		}

		// 버튼 엘리먼트에 클릭 이벤트 추가하기
		nextBtn.addEventListener("click", () => {
		  // 이후 버튼 누를 경우 현재 슬라이드를 변경
		  nextMove();
		});
		// 버튼 엘리먼트에 클릭 이벤트 추가하기
		prevBtn.addEventListener("click", () => {
		  // 이전 버튼 누를 경우 현재 슬라이드를 변경
		  prevMove();
		});

		// 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
		window.addEventListener("resize", () => {
		  slideWidth = slide.clientWidth;
		});

		// 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
		for (let i = 0; i < maxSlide; i++) {
  			paginationItems[i].addEventListener("click", () => {
    		// Get the clicked pagination index (1-based)
    		const clickedIndex = i + 1;
    		currSlide = clickedIndex;
    		// Move to the clicked slide
   			 moveSlide(clickedIndex);
  			});
		}
		
		function moveSlide(slideIndex) {
			 if(slideIndex > maxSlide+1){
				  let offset = slideWidth * 1;
				  slideItems.forEach((item) => {
					  item.style.transition = 0+ "s";
				    item.style.left = -offset + "px";
				  });
			  } else if(slideIndex < 0) {
				  let offset = slideWidth * 5;
				  slideItems.forEach((item) => {
					  item.style.transition = 0+ "s";
				    item.style.left = -offset + "px";
				  });
			  } else {
				  let offset = slideWidth * slideIndex;
				  slideItems.forEach((item) => {
					  item.style.transition = 1 + "s";
				    item.style.left = -offset + "px";
				  });	
			  }
			  if(slideIndex == 6){
				updatePagination(1);
			  } else if(slideIndex == 0){
				updatePagination(5);
			  } else{				  
			  	updatePagination(slideIndex);
			  }
			  
		}
		
		function updatePagination(activeIndex) {
			paginationItems.forEach((item, index) => {
				if (index === activeIndex - 1) {
			      item.classList.add("active");
			    } else {
			      item.classList.remove("active");
			    }
			});
		}

		// 드래그(스와이프) 이벤트를 위한 변수 초기화
		let startPoint = 0;
		let endPoint = 0;

		// PC 클릭 이벤트 (드래그)
		slide.addEventListener("mousedown", (e) => {
		  startPoint = e.pageX; // 마우스 드래그 시작 위치 저장
		});

		slide.addEventListener("mouseup", (e) => {
		  endPoint = e.pageX; // 마우스 드래그 끝 위치 저장
		  if (startPoint < endPoint) {
		    // 마우스가 오른쪽으로 드래그 된 경우
		    prevMove();
		  } else if (startPoint > endPoint) {
		    // 마우스가 왼쪽으로 드래그 된 경우
		    nextMove();
		  }
		});

		// 모바일 터치 이벤트 (스와이프)
		slide.addEventListener("touchstart", (e) => {
		  startPoint = e.touches[0].pageX; // 터치가 시작되는 위치 저장
		});
		slide.addEventListener("touchend", (e) => {
		  endPoint = e.changedTouches[0].pageX; // 터치가 끝나는 위치 저장
		  if (startPoint < endPoint) {
		    // 오른쪽으로 스와이프 된 경우
		    prevMove();
		  } else if (startPoint > endPoint) {
		    // 왼쪽으로 스와이프 된 경우
		    nextMove();
		  }
		});

		// 기본적으로 슬라이드 루프 시작하기
		let loopInterval = setInterval(() => {
		  nextMove();
		}, 5000);

		// 슬라이드에 마우스가 올라간 경우 루프 멈추기
		slide.addEventListener("mouseover", () => {
		  clearInterval(loopInterval);
		});

		// 슬라이드에서 마우스가 나온 경우 루프 재시작하기
		slide.addEventListener("mouseout", () => {
		  loopInterval = setInterval(() => {
		    nextMove();
		  }, 5000);
		});
		
	</script>


</body>
</html>
