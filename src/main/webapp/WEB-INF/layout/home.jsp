<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root }/css/main.css">

<title>개발자의 놀이터, DEVEL</title>

<!-- 해당 style은 임시로 적용되었습니다. -->
<style type="text/css">
div.main {
	background-color: #fff !important;
	height: 1500px !important;
}
</style>

</head>
<body>
<div class="container1">
	<img alt="" src="${root }/element/banner_main.png" class="mainbanner">
		<button class="main_button">
			<div class="button_content"><p class="button_text" onclick="location.href='/login'">시작하기</p></div>
		</button>
	</div>
<div class="container2">
	<div class="vertical_box1" style="float: left;">
		<div class="section_title">
			COMMUNITY
		</div>
	</div>
	<div class="vertical_box2">
		<div style="height: 390px;">
			<div class="section_title">
				NEW ITEM
				<button type="button" class="btn-showAll" id="idcheck" style="position: absolute; float: left; margin: 6px 0 0 167px; font-size: 14px;" onclick="location.href='/marketplace'">전체보기</button>
			</div>
			<c:forEach var="i" begin="1" end="3">
				<div class="gallery_content">
					<div class="relphoto" style="width: 160px; height: 160px;">
						<img alt="" src="${root }/element/no_image.png">
					</div>
					<div class="g_subtitle">
					  [브랜드명]
					</div>
					<div class="g_title">
					  [중고장터 상품명][중고장터 상품명]
					</div>
					<div class="g_cotent">
				     [판매가격] <span class="relprice2">원</span>
					</div>
			 	</div>
			 </c:forEach>
		</div>
		<div style="height: 390px;">
			<div class="section_title">
				HOT CHALLENGE
				<button type="button" class="btn-showAll" id="idcheck" style="position: absolute; float: left; margin: 6px 0 0 120px; font-size: 14px;" onclick="location.href='/challenge'">전체보기</button>
			</div>
			<c:forEach var="i" begin="1" end="3">
				<div class="gallery_content">
					<div class="relphoto" style="width: 160px; height: 160px;">
						<img alt="" src="${root }/element/no_image.png">
					</div>
					<div class="g_content">
						[챌린지 이름]	
					</div>
					<div class="g_title">
						<b>[챌린지 남은자리]</b>남음
					</div>
					
					<div class="g_subtitle">
				      <span class="">[챌린지 시작기간]<br>~[챌린지 종료기간]</span>
					</div>
			 	</div>
			 </c:forEach>
		</div>
	</div>
</div>
</body>
</html>