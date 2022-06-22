<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- css  -->
<c:set var="root" value="<%=request.getContextPath()%>" />
<link rel="stylesheet" type="text/css" href="${root }/css/marketplace/market_productdetail.css">
<title>Insert title here</title>

<script type="text/javascript">
	$(function () {
		$(".chheart").change(function(){
		      
		      if($(this).is(":checked"))
		      {
		         $(this).parent('.lab').children(".heart").attr("src","${root }/element/icon_heart_red.png");
		        
		      }
		      else
		      {
		         $(this).parent('.lab').children(".heart").attr("src","${root }/element/icon_heart.png");
   
		      }
		});

	});

</script>

</head>
<body>
	<div class="container">
		<div class="container1" style="position: relative; height: 720px;">
			<div style="width: 712px; float: left;">
				<div class="subphoto">
				
				<!-- 상세 서브 포토 구현 -->
					<c:forEach var="1" begin="1" end="4">
						<div class="subphoto1" style="cursor: pointer;">
							<img alt="" src="${root }/photo_marketplace/1.png">
						</div>
					</c:forEach>	
				</div>

				<!-- 상품 메인이미지 구현 div  -->
				<div class="mainphoto">
					<img alt="" src="${root }/photo_marketplace/keyboard.jpg">	
				</div>
			</div>

			<div class="content" style="margin-top: 32px;">
				<div class="title" style="margin-top: 2px;">
					<span class="brand" style="font-size: 16px; color: #191919;">${dto.brandname}
						<img alt=""	src="${root }/photo_marketplace/arrow.png" class="arrow">
					</span>
				</div>

				<!-- 제품명 업로드  -->
				<div class="subject" style="margin-top: 9px; height: 69px;">
					<div class="productname" style="width: 355px; margin-right: 95px; float: left;">FC750RBT
					PD 그레이 블루 한글 적축 (국내정품)
					</div>
					<div>
						<label  class="lab" id="lab">
        					 <input type="checkbox" id="chk" value="${i }" class="chheart">
         					 <img alt="" src="${root }/element/icon_heart.png" class="heart">
						</label>
						<img alt=""	src="${root }/photo_marketplace/share.png" style="margin-top: 10px;">
					</div>
				</div>

			
				<!-- 가격 등록 -->
				<div class="price" style="margin-top: 24px; width: 203px; height: 34px;">
					<span class="number">173,000</span> <span style="font-size: 15px;">원</span>
					<span class="oprice">200,000</span>
				</div>

				<!-- 판매자 등록 -->
				<div class="sell" style="margin-top: 42px; height: 69px; border: 1px solid #dbdbdb; border-top: 2px solid black;">
					<div class="sell2" style="margin: 25px 94px 24px 24px; width: 450px; height: 20px;">
						<div style="float: left;">
							<span style="font-size: 16px; color: #797979;">판매자</span> 
							<span style="font-size: 16px; color: #191919; margin-left: 24px;">김종민</span>
						</div>
				<!-- 판매 날짜 등록 -->
						<div>
							<span style="font-size: 16px; color: #797979; margin-left: 139px;">판매시작</span>
							<span style="font-size: 16px; color: #191919; margin-left: 24px;">2022-06-10</span>
						</div>
					</div>
				</div>
				<!-- 보상 판매 영역  -->  <!-- 추후 거래시 유의사항 으로 변경 예정 -->
				<div class="bosang">보상 판매 내용</div>

				<div class="bosangcontent">보상 판매 대상 상품은 구매시 사용할 수 있는 포인트로 교환
					혹은 고객요청시 무료로 반품을 진행하여 보다 높은 고객 서비스를 진행하고 있습니다.</div>
				
				<div class="productexplain">상품 설명</div>

				<!-- 상품설명 등록 -->
				<div class="box1" style="margin-top: 8px; height: 182px;">
					<div class="explain">산지 3개월도 안된 제품인데 새로 키보드 선물을 받게 되어 판매해요ㅠ
						사용감 거의 없는 제품입니다~~ 서울지역 직거래 가능하구 택배 원할시 편의점 반반택배 가능합니다. 문의 원할시 편하게
						문의주세요~~! (네고X)
					</div>	
				</div>

				<div class="buttongroup" style="margin-top: 25px; text-align: right;">
					<!-- 등록자 화면에만 보이도록 구현  -->
					<div class="btn2" style="float: left; margin-left: 170px;">
						<button type="button" class="btn-complete">거래 완료 처리 </button>
					</div> 
					
					<div class="btn" style="padding: 0px;">
						<button type="button" class="btn-list">목록보기</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container2" style="margin-top: 20px;">
			<div class="relative" style="margin-left: 53px;">
					연관상품
			</div>
		</div>
			<!-- 연관 상품 리스트 -->
		<div class="container3" style="margin: 39px 0 0 0;" >
			<c:forEach var="i" end="6" begin="1">
				<div class="relproduct" style="width: 160px; height: 262px; float: left; margin-left: 54.9px;">
					<div class="relphoto" style="width: 160px; height: 160px;">
						<img alt="" src="${root }/photo_marketplace/1.png">
					</div>
					<div class="relbrand">
					  레오폴드
					</div>
					<div class="relsubject">
					  FC750RBT PD 그레이 블루 한글 적축 (국내정품)		
					</div>
					<div class="relprice">
				      173,000 <span class="relprice2">원</span>
					</div>
			 	</div>
			 </c:forEach>	
		</div>
		
	</div>
	
		
</body>
</html>