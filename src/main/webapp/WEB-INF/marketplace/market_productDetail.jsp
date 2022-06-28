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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- css  -->
<c:set var="root" value="<%=request.getContextPath()%>" />
<link rel="stylesheet" type="text/css" href="${root }/css/marketplace/market_productdetail.css">
<title>Insert title here</title>
<%
	String checkon = request.getParameter("checkon");
%>

<script type="text/javascript">
$(function () {	
	/* like 이벤트 */	
	$('.chheart').on("change", function(){
		if($(this).is(':checked'))
		{								
			let market_place_idx = ${dto.market_place_idx};
			let member_idx = ${userKey};
			let like_count = 1;
			
			$.ajax({
				type: "post",
				url: "MarketLikeDetail.event",
				data: {
					"market_place_idx":market_place_idx,
					"member_idx":member_idx,
					"like_count":like_count,
					},
				success: function(data) {
					document.location.reload(true);
					console.log("성공");
				}
			});
			
			//하트 바뀜
			$(this).siblings('.heart').attr('src','${root }/element/icon_bigheart_inback.png');
		}
		else
		{
			let market_place_idx = ${dto.market_place_idx};
			let member_idx = ${userKey};
			let like_count = 0;
						
			$.ajax({
				type: "post",
				url: "MarketLikeDetail.event",
				data: {
					"market_place_idx":market_place_idx,
					"member_idx":member_idx,
					"like_count":like_count,
					},
				success: function(data) {
					document.location.reload(true);
					console.log("성공");
				}
			});
			
			//하트 바뀜
			$(this).siblings(".heart").attr("src","${root }/element/icon_bigheart_nobackred.png");
		}
	});
	
	
	/* 이미지 클릭시 변경 */
	$('.subphoto1').on('click',function() {
		$(this).css('border','solid 2px #ff4b4e');		
		$(this).siblings().css('border','solid 1px #dbdbdb');
		
		let subimg = $(this).children().children('.photo').attr('src');
		//alert(subimg);

		$('#photo').attr('src', subimg);
	});
	
	
	
});

</script>

</head>

<body>
<input type="hidden" value="${dto.market_place_idx}">
	<div class="container">
		<div class="container1" style="position: relative; height: 720px;">
			<div style="width: 712px; float: left;">
				
				<!-- 상품 sub 이미지 -->
				<div class="subphoto">
					<c:if test="${dto.photo!='no'}">			
						<c:forTokens var="p" items="${dto.photo}" delims=",">
						<div class="subphoto1" style="cursor: pointer;">
							<a>
								<img src="../photo/${p}" class="photo">
							</a>
							
							<%--
							<a href="../photo/${p}">
								<img src="../photo/${p}" class="photo">
							</a> 
							--%>
						</div>
						</c:forTokens>
					</c:if>
				</div>

				<!-- 상품 메인이미지 구현 div -->
				<!-- 이미지 없을 경우 -->
				<c:if test="${dto.photo=='no'}">
					<!-- 거래미완료 상품 -->
					<div class="mainphoto">
						<img src="${root }/element/icon_noimg.png" id="photo" class="photo">
					</div>
					
					<!-- 거래완료 상품 거래완료 표시 -->
					<c:if test="${dto.sold_day!=null}">
						<img src="${root }/photo/${p}" id="photo" class="photo" style="opacity: 30%">
						<div style="position: absolute; top: 300px; left: 300px;">
							<img id="msuccess" src="${root }/element/img_activity_success.png"
							style="width: 200px; height: 70px;">
						</div>
					</c:if>
				</c:if>
				
				<!-- 이미지 있을 경우 -->				
				<c:if test="${dto.photo!='no'}">
					<div class="mainphoto">
						<!-- 여러 사진 있을 경우 첫번째 사진 -->
						<c:forTokens var="p" items="${dto.photo}" delims="," begin="0" end="0">
							
							<!-- 거래미완료 상품 -->
							<c:if test="${dto.sold_day==null}">
								<img src="${root }/photo/${p}" id="photo" class="photo">
							</c:if>
							
							<!-- 거래완료 상품 거래완료 표시 -->
							<c:if test="${dto.sold_day!=null}">
								<img src="${root }/photo/${p}" id="photo" class="photo" style="opacity: 30%">
								<div style="position: absolute; top: 300px; left: 300px;">
									<img id="msuccess" src="${root }/element/img_activity_success.png"
									style="width: 200px; height: 70px;">
								</div>
							</c:if>
						</c:forTokens>
					</div>
				</c:if>
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
					${dto.subject}
					</div>
					<div>
					
						<!-- like 이벤트 -->
						<label class="lab" id="lab">
							<c:forEach var="b" items="${likelist}">
								<c:if test="${(dto.market_place_idx==b.market_place_idx)&&(userKey==b.member_idx)&&(b.like_count==1)}">
									<input type="checkbox" id="chk" class="chheart" checked="checked">
									<img alt="" src="${root }/element/icon_bigheart_inback.png" class="heart"
									style="position: absolute; margin-left: 1065px;">
								</c:if>
							</c:forEach>
				
							<input type="checkbox" id="chk" class="chheart">
							<img alt="" src="${root }/element/icon_bigheart_nobackred.png" class="heart">
						</label>
						
						<img alt=""	src="${root }/photo_marketplace/share.png" 
						style="position:absolute; margin-top: 40px; margin-left: -25px;">
					
					</div>
				</div>

			
				<!-- 가격 등록 -->
				<div class="price" style="margin-top: 24px; width: 300px; height: 34px;">
					<span class="number"><fmt:formatNumber pattern="#,##0">${dto.price}</fmt:formatNumber></span><span style="font-size: 15px;">원</span>
					<span class="oprice"><fmt:formatNumber pattern="#,##0">${dto.original_price}</fmt:formatNumber></span>
				</div>

				<!-- 판매자 등록 -->
				<div class="sell" style="margin-top: 42px; height: 69px; border: 1px solid #dbdbdb; border-top: 2px solid black;">
					<div class="sell2" style="margin: 25px 94px 24px 24px; width: 450px; height: 20px;">
						<div style="float: left;">
							<span style="font-size: 16px; color: #797979;">판매자</span>
							<span style="font-size: 16px; color: #191919; margin-left: 24px;">${dto.seller}</span>
						</div>
					<!-- 판매 날짜 등록 -->
					<div>
						<span style="font-size: 16px; color: #797979; margin-left: 139px;">판매시작</span>
							<span style="font-size: 16px; color: #191919; margin-left: 24px;">
							<fmt:formatDate value="${dto.upload_day}" pattern="yyyy-MM-dd"/>
						</span>
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
					<div class="explain">${dto.content}</div>
				</div>

				<div class="buttongroup" style="margin-top: 25px; text-align: right;">
					
					<!-- 등록자 화면에만 보이도록 구현 -->
					<c:if test="${userKey==dto.member_idx}">
						<!-- 거래완료된 상품은 버튼 안보이기(거래완료안된 상품만 버튼 보이기) -->
						<c:if test="${dto.sold_day==null}">
							<div class="btn2" style="float: left; margin-left: 170px;">
								<c:if test="${SearchText==null}">
									<c:if test="${colorradio!=null}">
										<c:if test="${checkside == null}">
											<button type="button" class="btn-complete"
											onclick="location.href='${root }/marketplace/soldout?subtitle=${subtitle}&colorradio=${colorradio}&marketprice=${marketprice}&market_place_idx=${dto.market_place_idx}&currentPage=${currentPage}'">거래 완료 처리</button>
		     							</c:if>
		                        
										<c:if test="${checkside != null}">
											<button type="button" class="btn-complete"
											onclick="location.href='${root }/marketplace/soldout?subtitle=${subtitle}&colorradio=${colorradio}&marketprice=${marketprice}&market_place_idx=${dto.market_place_idx}&currentPage=${currentPage}&checkside=1'">거래 완료 처리</button>
		    							</c:if>
		    
									</c:if>
					
					
									<c:if test="${colorradio==null}">
	
										<c:if test="${checkall == null}">
											<button type="button" class="btn-complete"
											onclick="location.href='${root }/marketplace/soldout?market_place_idx=${dto.market_place_idx}&currentPage=${currentPage}'">거래 완료 처리</button>   
									</c:if>
								
									<c:if test="${checkall != null}">
										<button type="button" class="btn-complete"
										onclick="location.href='${root }/marketplace/soldout?market_place_idx=${dto.market_place_idx}&currentPage=${currentPage}&checkall=1'">거래 완료 처리</button>        
									</c:if>
		
									</c:if>
								</c:if>
						
								<c:if test="${SearchText != null}">
									<c:if test="${checksearch == null}">
										<button type="button" class="btn-complete"
										onclick="location.href='${root }/marketplace/soldout?market_place_idx=${dto.market_place_idx}&currentPage=${currentPage}&SearchText=${SearchText}'">거래 완료 처리</button>
	    							</c:if>
	                        
	    							<c:if test="${checksearch != null}">
										<button type="button" class="btn-complete"
										onclick="location.href='${root }/marketplace/soldout?market_place_idx=${dto.market_place_idx}&currentPage=${currentPage}&SearchText=${SearchText}&checksearch=1'">거래 완료 처리</button>
	    							</c:if>    
	    
								</c:if>  
							</div>
						</c:if>
					</c:if>
					
					<div class="btn" style="padding: 0px;">		
						<c:if test="${SearchText==null}">
							<c:if test="${colorradio!=null}">
								<c:if test="${checkside == null}">
									<button type="button" class="btn-list"
			                        onclick="location.href='sidesearch?subtitle=${subtitle}&colorradio=${colorradio}&marketprice=${marketprice}&currentPage=${currentPage}&market_place_idx=${a.market_place_idx}'">목록보기</button>
		                        </c:if>
		                        
		                        <c:if test="${checkside != null}">
									<button type="button" class="btn-list"
			                        onclick="location.href='market_tradeablesidetest?subtitle=${subtitle}&colorradio=${colorradio}&marketprice=${marketprice}&currentPage=${currentPage}&market_place_idx=${a.market_place_idx}&check'">목록보기</button>
		                        </c:if>
		                        
							</c:if>
							
							<c:if test="${colorradio==null}">
								<c:if test="${checkall == null}">
									<button type="button" class="btn-list"
		                        	onclick="location.href='market_main?currentPage=${currentPage}&market_place_idx=${a.market_place_idx}'">목록보기</button>       
								</c:if>
								
								<c:if test="${checkall != null}">
									<button type="button" class="btn-list"
		                        	onclick="location.href='market_tradeabletest?currentPage=${currentPage}&market_place_idx=${a.market_place_idx}'">목록보기</button>       
								</c:if>
							</c:if>
						</c:if>
						
						<c:if test="${SearchText != null}">
							<c:if test="${checksearch == null}">
								<button type="button" class="btn-list"
		                        onclick="location.href='search?SearchText=${SearchText}&currentPage=${currentPage}&market_place_idx=${a.market_place_idx}'">목록보기</button>
	                        </c:if>
	                        
	                        <c:if test="${checksearch != null}">
								<button type="button" class="btn-list"
		                        onclick="location.href='market_tradeablesearchtest?SearchText=${SearchText}&currentPage=${currentPage}&market_place_idx=${a.market_place_idx}'">목록보기</button>
	                        </c:if>    
						</c:if>     
						
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
			<c:forEach var="a" begin="0" end="5" items="${list}">
				<div class="relproduct" style="width: 160px; height: 262px; float: left; margin-left: 54.9px;">
					<div class="relphoto" style="width: 160px; height: 160px;">
						<c:if test="${a.photo!='no'}">
							<c:forTokens var="p" items="${a.photo}" delims="," begin="0" end="0">
								<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
									<img src="${root }/photo/${p}" class="photo">
								</a>
							</c:forTokens>
						</c:if>
						<c:if test="${a.photo=='no'}">
							<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
								<img src="${root }/element/icon_noimg.png" class="photo">
							</a>
						</c:if>
					</div>
					<div class="relbrand">${a.brandname}</div>
					<div class="relsubject">${a.subject}</div>
					<div class="relprice">${a.price}<span class="relprice2">원</span>
					</div>
			 	</div>
			 </c:forEach>	
		</div>
		
	</div>
	
		
</body>
</html>