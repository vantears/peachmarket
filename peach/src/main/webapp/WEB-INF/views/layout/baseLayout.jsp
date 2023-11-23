<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta charset="UTF-8"> <!-- 추가할부분 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 추가할부분 -->
	<meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 추가할부분 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  	<style>
	body{
	min-width:400px;
	min-height: 800px;
	}
	
	@media screen and (max-width: 575px) {
  	#welcome {
    
    position: absolute;
    left: 80px;
 	 }
	} 
	</style>
	<script type="text/javascript">
	function ajaxJsonToJson(async, type, url, sendObject, successFunc){
		$.ajax({
			async : async, 
			type : type, 
			url : '<c:url value="/"/>'+url, 
			data : JSON.stringify(sendObject), 
			contentType : "application/json; charset=UTF-8", 
			dataType : "json",
			success : successFunc
		});
	}
	</script>
<title>스프링</title>
 <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/LineIcons.3.0.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/glightbox.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css?versionFinal'/>" />
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="mainheader"/>
    <tiles:insertAttribute name="body" />
    <tiles:insertAttribute name="footer" />
</body>
</html>