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
<!-- 거래미완료 목록 -->
<div class="main_content">
	<div class="main_detail3" style="width: 800px;">
		<!-- 거래 미완료 목록 -->
		<c:forEach var="dto" items="${mplist}" begin="0" end="7" >
		<c:if test="${dto.sold_day==null}">
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
		</c:if>
		</c:forEach>
		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>
</div>


<div class="main_title2">거래 완료 목록 보기</div>
<hr id="main_hr2">
<!-- 거래완료 목록 -->
<div class="main_content2">
	<div class="main_detail3" style="width: 800px;">
		<!-- 거래 완료 목록 -->
		<c:forEach var="dto" items="${mplist}" begin="0" end="7">
		<c:if test="${dto.sold_day!=null}">
			<!-- 이미지 있을 경우 상품이미지 중 첫번째 이미지 보이기 -->
			<c:if test="${dto.photo!='no'}">
				<div class="detail_market" style="position: relative;">
					<c:forTokens var="p" items="${dto.photo}" delims="," begin="0" end="0">
						<img id="mimgafter" src="${root }/photo/${p}">
					</c:forTokens>	
					<div style="position: absolute; top: 65px; left: 40px;">
						<a href="${root }/marketplace/productdetail?market_place_idx=${dto.market_place_idx}&currentPage=1">
							<img id="msuccess" src="${root }/element/img_activity_success.png">
						</a>
					</div>
					<div id="mname">${dto.subject}</div>
				</div>
			</c:if>
			<!-- 이미지 없을 경우 기본 이미지 -->
			<c:if test="${dto.photo=='no'}">
				<div class="detail_market" style="position: relative;">
					<img id="mimgafter" src="${root }/element/icon_noimg.png">	
					<div style="position: absolute; top: 65px; left: 40px;">
						<a href="${root }/marketplace/productdetail?market_place_idx=${dto.market_place_idx}&currentPage=1">
							<img id="msuccess" src="${root }/element/img_activity_success.png">
						</a>
					</div>
					<div id="mname">${dto.subject}</div>
				</div>
			</c:if>			
		</c:if>
		</c:forEach>
		<a href=""><img src="${root }/element/icon_activity_move.png" class="icon_activity_move"></a>
	</div>
</div>

</body>
</html>