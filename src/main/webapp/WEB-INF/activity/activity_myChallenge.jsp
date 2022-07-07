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

<!-- 슬라이드 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<title>DEVEL :: 나의 챌린지</title>
<style type="text/css">
span.side_main_span_challenge {
	font-weight: 600;
	color: #ff4b4e;
}
#d4 {
	border-bottom: 1.5px solid #ff4b4e;
}
</style>

<script type="text/javascript">

const $jq = jQuery.noConflict();

$jq(document).ready(function() {
	
	$jq('.detail_slick').slick({
		slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li
		infinite : false, 	//무한 반복 옵션
		slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 4,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		//dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : 
			"<div style='position: absolute;'><img src='${root }/element/icon_activity_leftmove.png' class='icon_activity_leftmove'></a></div>", // 이전 화살표 모양 설정
		nextArrow : 
			"<img src='${root}/element/icon_activity_rightmove.png' class='icon_activity_rightmove'></a>",		// 다음 화살표 모양 설정
		//dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
		draggable : true, 	//드래그 가능 여부
	});
	
});

</script>

</head>
<body>
<!-- main -->
<div class="main_title">진행중인 챌린지 보기</div>
<hr id="main_hr">
<div class="main_content">
	<!-- 챌린지 목록 -->
	<div class="main_detail3" style="width: 800px;">
	<div class="detail_slick">
		<div class="detail_challenge">
			<img id="cimg" src="${root }/activity/img_challenge_key1.jpg">
			<div id="cname">매일아침 1시간 챌린지</div>
		</div>
		<div class="detail_challenge">
			<img id="cimg" src="${root }/activity/img_challenge_key2.jpg">
			<div id="cname">주 3회 2시간 운동 챌린지</div>
		</div>
		<div class="detail_challenge">
			<img id="cimg" src="${root }/activity/img_challenge_key3.jpg">
			<div id="cname">매일 2시간 개발공부 챌린지</div>
		</div>
		<div class="detail_challenge">
			<img id="cimg" src="${root }/activity/img_challenge_key4.jpg">
			<div id="cname">주 5일 7시 기상 챌린지</div>
		</div>
		<div class="detail_challenge">
			<img id="cimg" src="${root }/activity/img_challenge_key4.jpg">
			<div id="cname">주 5일 7시 기상 챌린지</div>
		</div>
	</div>
	</div>
</div>


<div class="main_title2">진행 완료 챌린지 보기</div>
<hr id="main_hr2">
<div class="main_content2">
	<!-- 진행 완료 챌린지 목록 -->
	<div class="main_detail3" style="width: 800px;">
	<div class="detail_slick">
		<div class="detail_challenge" style="position: relative;">
			<img id="cimgafter_s" src="${root }/activity/img_challenge_key1.jpg">
			<div style="position: absolute; top: 65px; left: 30px;">
				<img id="csuccess" src="${root }/element/img_challenge_success.png">
			</div>
			<div id="cname">매일아침 1시간 챌린지</div>
		</div>

		<div class="detail_challenge" style="position: relative;">
			<img id="cimgafter_s" src="${root }/activity/img_challenge_key2.jpg">
			<div style="position: absolute; top: 65px; left: 30px;">
				<img id="csuccess" src="${root }/element/img_challenge_success.png">
			</div>
			<div id="cname">주 3회 2시간 운동 챌린지</div>
		</div>
		
		<div class="detail_challenge" style="position: relative;">
			<img id="cimgafter_f" src="${root }/activity/img_challenge_key3.jpg">
			<div style="position: absolute; top: 65px; left: 50px;">
				<img id="cfail" src="${root }/element/img_challenge_fail.png">
			</div>
			<div id="cname">매일 2시간 개발공부 챌린지</div>
		</div>
		
		<div class="detail_challenge" style="position: relative;">
			<img id="cimgafter_f" src="${root }/activity/img_challenge_key4.jpg">
			<div style="position: absolute; top: 65px; left: 50px;">
				<img id="cfail" src="${root }/element/img_challenge_fail.png">
			</div>
			<div id="cname">주 5일 7시 기상 챌린지</div>
		</div>
		
		<div class="detail_challenge" style="position: relative;">
			<img id="cimgafter_f" src="${root }/activity/img_challenge_key4.jpg">
			<div style="position: absolute; top: 65px; left: 50px;">
				<img id="cfail" src="${root }/element/img_challenge_fail.png">
			</div>
			<div id="cname">주 5일 7시 기상 챌린지</div>
		</div>
	</div>
	</div>
</div>

</body>
</html>