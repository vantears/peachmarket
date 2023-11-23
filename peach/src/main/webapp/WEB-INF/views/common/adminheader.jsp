<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header class="header navbar-area">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8 col-md-6 col-12">
				<div class="nav-inner">
					<nav class="navbar navbar-expand-lg">
						<button class="navbar-toggler mobile-menu-btn" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="toggler-icon"></span> <span class="toggler-icon"></span>
							<span class="toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse sub-menu-bar"
							id="navbarSupportedContent">
							<ul id="nav" class="navbar-nav ms-auto">
								
								<li class="nav-item"><a class="dd-menu collapsed"
									href="<c:url value='/admin/manager'/>"
									aria-label="Toggle navigation">회원관리</a></li>
								<li class="nav-item"><a class="dd-menu collapsed"
									href="<c:url value='/admin/salecategory'/>"
									data-bs-toggle="collapse" data-bs-target="#submenu-1-2"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">카테고리관리</a>
									<ul class="sub-menu collapse" id="submenu-1-2">
										<li class="nav-item"><a
											href="<c:url value='/admin/salecategory'/>">물품카테고리 관리 </a></li>
										<li class="nav-item"><a
											href="<c:url value='/admin/communitycategory'/>">커뮤니티카테고리
												관리</a></li>
									</ul></li>
								<li class="nav-item"><a class="dd-menu collapsed"
									href="<c:url value='/admin/report'/>"
									aria-label="Toggle navigation">신고게시판관리</a>
									<ul class="sub-menu collapse" id="submenu-1-2">
										<li class="nav-item"><a
											href="<c:url value='/admin/report'/>">중고거래 신고 관리 </a></li>
										<li class="nav-item"><a
											href="<c:url value='/admin/communityreport'/>">커뮤니티 신고 관리</a></li>
										<li class="nav-item"><a
											href="<c:url value='/admin/tradereport'/>">거래취소 관리</a></li>
									</ul></li>
							</ul>
						</div>


						<!-- navbar collapse -->
					</nav>
					<!-- End Navbar -->
				</div>
			</div>
		</div>
	</div>
</header>