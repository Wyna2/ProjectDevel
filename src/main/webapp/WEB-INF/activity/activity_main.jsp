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
	
	<c:if test="${cdto.name!=null}">
	<div class="main_detail1">
		<!-- 속해있는 crew 값 가져오기 -->
		<div class="detail_crew">${cdto.name}</div>
	</div>
	</c:if>
	<c:if test="${cdto.name==null}">
	<div class="main_detail1">
		<div class="detail_crew" style="color: black; background-color: white;">소속된 크루가 없습니다.</div>
	</div>
	</c:if>	
	
	<!-- 나의 작성글 목록 -->
	<div class="main_name2">
		<span class="main_span_write">나의 작성글 목록</span>
		<hr style="border: solid 1px #191919;">
	</div>
	<c:if test="${clistsize>0}">
	<div class="main_detail2">
		<!-- 내 작성글 글 제목 값 가져오기 -->
		<c:forEach var="dto" items="${clist}" begin="0" end="2">
			<div class="detail_write">
				<a href="../community/contentdetail?community_idx=${dto.community_idx}">${dto.subject}</a>
			</div>
			<hr style="border: solid 0.5px #767676;">
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${clistsize==0}">
	<div class="main_detail2">
		<div class="detail_crew" style="color: black; background-color: white;">작성된 글이 없습니다.</div>
	</div>
	</c:if>	
	<a href="../activity/mycommunity"><img src="${root }/element/icon_activity_add.png" class="icon_activity_add"></a>
	
	
	
	<!-- 나의 거래 목록 -->
	<div class="main_name3">
		<span class="main_span_market">나의 거래 목록</span>
		<hr style="border: solid 1px #191919;">
	</div>
	<c:if test="${mplistsize>0}">
	<div class="main_detail3">
		<!-- 나의 거래 목록 보이기 -->
		<c:forEach var="dto" items="${mplist}" begin="0" end="2">
			<div class="detail_market">
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
	</div>
	</c:if>
	<c:if test="${mplistsize==0}">
	<div class="main_detail2">
		<div class="detail_crew" style="color: black; background-color: white;">나의 거래 내역이 없습니다.</div>
	</div>
	</c:if>	
	<a href="../activity/mymarketplace"><img src="${root }/element/icon_activity_add.png" class="icon_activity_add"></a>
	


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
	<a href="../activity/mychallenge"><img src="${root }/element/icon_activity_add.png" class="icon_activity_add"></a>
</div>


</body>
</html>