<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
/* layout 테스트 환경일 경우 border 1px 지정 */
div.layout div{
  border: 0px solid black;
}

div.layout div.header{
	position: relative;
	width: 1920px;
	height: 90px;
}

div.layout div.menu{
	position: relative;
	width: 1920px;
	height: 56px;
	z-index: 10;
}

/* main 내 side_menu 영역 */
div.layout div.side_menu{
	position: relative;
	background-color: #fff;
	margin-top: -5px;
	padding: 30px 15px 30px 315px; /* 상단, 우측, 하단, 좌측 */
	width: 550px;
	height: 1250px;
	z-index: 1;
	float: left;
	clear: both;
}

div.layout div.main{
	position: relative;
	background-color: #f1f1f5;
	margin-left:550px;
	width: 1370px;
	height: 1250px;
	z-index: 1;	
}

div.layout div.footer{
	position: relative;
	width: auto;
	height: 250px;
}
</style>
</head>
<body>
<!-- 사이드 메뉴가 존재하는 marketplace layout -->
<div class="layout">
	<div class="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="side_menu">
		<tiles:insertAttribute name="m_sidemenu"/>
	</div>
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>