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
<script type="text/javascript">
$("img.icon_myscrap").attr("src","${root }/element/icon_myscrap_active.png");
</script>
<title>DEVEL :: 나의활동>스크랩</title>
<style type="text/css">
span.side_main_span_scrap {
	font-weight: 600;
	color: #ff4b4e;
}
#d5 {
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
<div class="main_title">찜한 상품</div>
<hr id="main_hr">

<!-- 상품 스크랩 -->
<div class="main_content">
	<div class="main_detail3" style="width: 800px;">
		<!-- 나의 거래 목록 보이기 -->
		<div class="detail_slick">
		<c:forEach var="dto" items="${scraplist}">
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
		</div>
	</div>

</div>


<div class="main_title2">스크랩북</div>
<hr id="main_hr2">
<div class="main_content2">
	<!-- 글 스크랩 -->
	<!-- 작성글 목록 -->
	<div class="main_write">
		<!-- 내 작성글 Data 가져오기 -->
		<form action="writeDel" method="post" enctype="multipart/form-data">
			<c:forEach var="dto" items="${clist}">
				<div class="write_sub">
					<a href="../community/contentdetail?community_idx=${dto.community_idx}">${dto.subject}</a>
				</div>
				<hr style="border: solid 0.5px #767676;">
			</c:forEach>
		</form>	
		
		<!-- 페이징 -->
		<div class="pagesort">
		<c:if test="${totalCount>0}">
			<div class="page" align="center" style="margin-top: 20px;">
				<!-- 이전 -->
	            <c:if test="${startPage>1}">
	                <a id="pagelbtn" href="myscrap?currentPage=${startPage-1}">
	                    <img id="pagebtn" src="${root}/activity/icon_activity_move2.png">
	                </a>
	            </c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
	                <c:if test="${currentPage==pp}">
	                    <a id="pagecnum" href="myscrap?currentPage=${pp}"><b>${pp}</b></a>
	                </c:if>
	                <c:if test="${currentPage!=pp}">
	                    <a id="pagenum" href="myscrap?currentPage=${pp}">${pp}</a>
	                </c:if>
	            </c:forEach>
				
				<!-- 다음 -->
	            <c:if test="${endPage<totalPage}">
	                <a id="pagerbtn" href="myscrap?currentPage=${endPage+1}">
	                    <img id="pagebtn" src="${root}/activity/icon_activity_move1.png">
	                </a>
	            </c:if>
	            
			</div>
		</c:if>
		</div>

	</div>
</div>


</body>
</html>