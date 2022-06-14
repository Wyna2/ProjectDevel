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
<link rel="stylesheet" type="text/css" href="${root }/css/activity.css">

<title>나의활동>모아보기</title>
<style type="text/css">
span.side_main_span_main {
	font-weight: 600;
	color: #ff4b4e;
}
#d1 {
	border-bottom: 1.5px solid #ff4b4e;
}
</style>
</head>

<body>
<!-- main -->
<div class="main_title">모아보기</div>
<hr id="main_hr">
<div class="main_content">
	<!-- 나의 크루 보기 -->
	<div class="main_name1">
		<span class="main_span_crew">나의 크루 보기</span>
		<hr style="border: solid 1px #191919;">
	</div>
	<div class="main_detail1">
		<!-- 속해있는 crew 값 가져오기 -->
		<div class="detail_crew">싹쓰리</div>
	</div>
	
	
	<!-- 나의 작성글 목록 -->
	<div class="main_name2">
		<span class="main_span_write">나의 작성글 목록</span>
		<hr style="border: solid 1px #191919;">
	</div>
	<div class="main_detail2">
		<!-- 내 작성글 글 제목 값 가져오기 -->
		<div class="detail_write">
		작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.
		</div>
		<hr style="border: solid 0.5px #767676;">
		<div class="detail_write">내 작성글2</div>
		<hr style="border: solid 0.5px #767676;">
		<div class="detail_write">내 작성글3</div>
		<hr style="border: solid 0.5px #767676;">
	</div>
	<a href="../activity/seeWrite"><img src="${root }/element/icon_activity_add.png" class="icon_activity_add"></a>
	
	
	<!-- 나의 거래 목록 -->
	<div class="main_name3">
		<span class="main_span_market">나의 거래 목록</span>
		<hr style="border: solid 1px #191919;">
	</div>
	<div class="main_detail3">
		<!-- 나의 거래 목록 보이기 -->		
		<div class="detail_market">
			<img id="mimg" src="${root }/activity/img_activity_key1.jpg">
			<div id="mname">한성컴퓨터 블루투스 무접점 한글 영문 무선키보드</div>
		</div>
		<div class="detail_market">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div id="mname">제품명</div>
		</div>
		<div class="detail_market">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div id="mname">제품명</div>
		</div>
	</div>
	<a href="../activity/seeMarketplace"><img src="${root }/element/icon_activity_add.png" class="icon_activity_add"></a>
	
	
	<!-- 나의 챌린지 목록 -->
	<div class="main_name4">
		<span class="main_span_challenge">나의 챌린지 목록</span>
		<hr style="border: solid 1px #191919;">
	</div>
	<div class="main_detail4">
		<!-- 나의 챌린지 목록 보이기 -->
		<div class="detail_challenge">
			<img id="cimg" src="${root }/activity/img_challenge_key1.jpg">
			<div id="cname">매일아침 조깅 1시간 챌린지</div>
		</div>
		<div class="detail_challenge">
			<img id="cimg" src="${root }/element/icon_noimg.png">
			<div id="cname">챌린지명</div>
		</div>
		<div class="detail_challenge">
			<img id="cimg" src="${root }/element/icon_noimg.png">
			<div id="cname">챌린지명</div>
		</div>
	</div>
	<a href="../activity/seeChallenge"><img src="${root }/element/icon_activity_add.png" class="icon_activity_add"></a>
</div>


</body>
</html>