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

<title>나의활동>스크랩</title>
<style type="text/css">
span.side_main_span_scrap {
	font-weight: 600;
	color: #ff4b4e;
}
#d5 {
	border-bottom: 1.5px solid #ff4b4e;
}
</style>
</head>
<body>
<!-- main -->
<div class="main_title">찜한 상품</div>
<hr id="main_hr">
<div class="main_content">
	<!-- 상품 스크랩 -->
	<div class="main_detail3" style="width: 850px;">
		<!-- 나의 거래 목록 보이기 -->
		<div class="detail_market" style="position: relative;">
			<img id="mimg" src="${root }/activity/img_activity_key1.jpg">
			<div style="position: absolute; top: 10px; right: 10px;">
				<img id="mimgdel" src="${root }/element/icon_activity_delete.png">
			</div>
			<div id="mcompany">레오폴드</div>
			<div id="mname">FC750RBT PD 그레이 블루 한글 적축(국내정품)</div>
			<span id="mprice">173,000</span>원
			<span id="moprice">200,000</span>
		</div>
		<div class="detail_market" style="position: relative;">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div style="position: absolute; top: 10px; right: 10px;">
				<img id="mimgdel" src="${root }/element/icon_activity_delete.png">
			</div>
			<div id="mcompany">제조사</div>
			<div id="mname">제품명</div>
			<span id="mprice">1,111,111</span>원
			<span id="moprice">2,222,222</span>
		</div>
		<div class="detail_market" style="position: relative;">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div style="position: absolute; top: 10px; right: 10px;">
				<img id="mimgdel" src="${root }/element/icon_activity_delete.png">
			</div>
			<div id="mcompany">제조사</div>
			<div id="mname">제품명</div>
			<span id="mprice">1,111,111</span>원
			<span id="moprice">2,222,222</span>
		</div>
		<div class="detail_market" style="position: relative;">
			<img id="mimg" src="${root }/element/icon_noimg.png">
			<div style="position: absolute; top: 10px; right: 10px;">
				<img id="mimgdel" src="${root }/element/icon_activity_delete.png">
			</div>
			<div id="mcompany">제조사</div>
			<div id="mname">제품명</div>
			<span id="mprice">1,111,111</span>원
			<span id="moprice">2,222,222</span>
		</div>	
		
		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>

</div>


<div class="main_title2">스크랩북</div>
<hr id="main_hr2">
<div class="main_content2">
	<!-- 글 스크랩 -->
	<!-- 작성글 목록 -->
	<div class="main_write">
		<!-- 내 작성글 글 제목 값 가져오기 -->
		<div class="write_sub">
		작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.
		</div>
		<hr style="border: solid 0.5px #767676;">
		<div class="write_sub">내 작성글 제목</div>
		<hr style="border: solid 0.5px #767676;">
		<div class="write_sub">내 작성글 제목</div>
		<hr style="border: solid 0.5px #767676;">
		
		<!-- 페이징 -->
		<div class="page" align="center" style="margin-top: 50px;">
			<img src="${root }/activity/icon_activity_move2.png">
			<span id="num1">1</span>
			<span id="num2">2</span>
			<span id="num3">3</span>
			<span id="num4">4</span>
			<span id="num5">5</span>
			<img src="${root }/activity/icon_activity_move1.png">
		</div>
	</div>
</div>


</body>
</html>