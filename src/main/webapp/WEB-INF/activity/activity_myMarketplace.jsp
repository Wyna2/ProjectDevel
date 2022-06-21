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

<title>나의활동>거래목록</title>
<style type="text/css">
span.side_main_span_market {
	font-weight: 600;
	color: #ff4b4e;
}
#d3 {
	border-bottom: 1.5px solid #ff4b4e;
}
</style>
</head>
<body>
<!-- main -->
<div class="main_title">거래 미완료 목록 보기</div>
<hr id="main_hr">

<div class="main_content">
	<!-- 거래 미완료 목록 -->
	<div class="main_detail3" style="width: 800px;">
		<div class="detail_market">
			<img id="mimg" src="${root }/activity/img_activity_key1.jpg">
			<div id="mname">
				한성컴퓨터 블루투스 무접점 한글 영문 무선키보드
			</div>
		</div>
		<div class="detail_market">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div id="mname">제품명</div>
		</div>
		<div class="detail_market">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div id="mname">제품명</div>
		</div>
		<div class="detail_market">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div id="mname">제품명</div>
		</div>
		
		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>
</div>


<div class="main_title2">거래 완료 목록 보기</div>
<hr id="main_hr2">
<div class="main_content2">
	<!-- 거래 완료 목록 -->
	<div class="main_detail3" style="width: 800px;">
		<div class="detail_market" style="position: relative;">
			<img id="mimgafter" src="${root }/activity/img_activity_key1.jpg">
			<div style="position: absolute; top: 65px; left: 40px;">
				<img id="msuccess" src="${root }/element/img_activity_success.png">
			</div>
			<div id="mname">한성컴퓨터 블루투스 무접점 한글 영문 무선키보드</div>
		</div>
		<div class="detail_market" style="position: relative;">
			<img id="mimgafter" src="${root }/element/icon_noimg.png">
			<div style="position: absolute; top: 65px; left: 40px;">
				<img id="msuccess" src="${root }/element/img_activity_success.png">
			</div>
			<div id="mname">제품명</div>
		</div>
		<div class="detail_market" style="position: relative;">
			<img id="mimgafter" src="${root }/element/icon_noimg.png">
			<div style="position: absolute; top: 65px; left: 40px;">
				<img id="msuccess" src="${root }/element/img_activity_success.png">
			</div>
			<div id="mname">제품명</div>
		</div>
		<div class="detail_market" style="position: relative;">
			<img id="mimgafter" src="${root }/element/icon_noimg.png">
			<div style="position: absolute; top: 65px; left: 40px;">
				<img id="msuccess" src="${root }/element/img_activity_success.png">
			</div>
			<div id="mname">제품명</div>
		</div>
		
		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>
</div>

</body>
</html>