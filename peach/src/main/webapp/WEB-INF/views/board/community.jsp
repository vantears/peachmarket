<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
	.community-category {
	 	margin-left: 37%;
	}

	.pagination{

	}

	ul.pagination {
	  display: flex;
	  flex-direction: row; 
	  list-style: none; 
	}
		
	ul.pagination li {
	   margin-right: 10px; 
	}
	.community-title{
		text-align: center;
	}
	
	.community-list{
		 display: flex;
         width: 800px;
         height: 600px;
         border: 1px solid black;
         margin: 0 auto;
	}
</style>
<title>피치 게시판</title>
</head>
<body>
	<br>
	<br>
	<h1 class="community-title">피치 게시판</h1>
	<div class="community-category">
		<ul class="pagination">
		<li class="page-item"><a class="page-link" href="#">전체</a></li>
		  <li class="page-item"><a class="page-link" href="#">소모임</a></li>
		  <li class="page-item"><a class="page-link" href="#">맛집탐방</a></li>
		  <li class="page-item"><a class="page-link" href="#">무료나눔</a></li>
		</ul>
	</div>
	<br>
	<div class="community-list">
		
	</div>
</body>
</html>
