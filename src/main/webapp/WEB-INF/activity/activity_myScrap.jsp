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
		  <c:forEach var="dto" items="${scraplist}" begin="0" end="3">
		
			<div class="detail_market" style="position: relative;">
				<!-- 이미지 있을 경우 상품이미지 중 첫번째 이미지 보이기 -->
				<c:if test="${dto.photo!='no'}">
					<c:forTokens var="p" items="${dto.photo}" delims="," begin="0" end="0">
						<a href="${root }/marketplace/productdetail?market_place_idx=${dto.market_place_idx}&currentPage=1">
							<img id="mimg" src="${root }/photo/${p}">
						</a>
					</c:forTokens>
				</c:if>
				
				<!-- 이미지 없을 경우 기본 이미지 -->
				<c:if test="${dto.photo=='no'}">
					<a href="${root}/marketplace/productdetail?market_place_idx=${dto.market_place_idx}&currentPage=1">
						<img id="mimg" src="${root}/element/icon_noimg.png">
					</a>
			 	</c:if>
			 	<div id="mname">${dto.subject}</div>
			</div>
			
		</c:forEach>
		
		
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