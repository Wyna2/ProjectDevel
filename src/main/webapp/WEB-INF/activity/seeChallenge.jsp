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

<title>나의활동>챌린지</title>
<style type="text/css">
span.side_main_span_challenge {
	font-weight: 600;
	color: #ff4b4e;
}
#d4 {
	border-bottom: 1.5px solid #ff4b4e;
}
</style>
</head>
<body>
<!-- main -->
<div class="main_title">진행중인 챌린지 보기</div>
<hr id="main_hr">
<div class="main_content">
	<!-- 챌린지 목록 -->
	<div class="main_detail3" style="width: 800px;">
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

		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>
</div>


<div class="main_title2">진행 완료 챌린지 보기</div>
<hr id="main_hr2">
<div class="main_content2">
	<!-- 진행 완료 챌린지 목록 -->
	<div class="main_detail3" style="width: 800px;">
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
		
		
		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>
</div>

</body>
</html>