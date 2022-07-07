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
<link rel="stylesheet" type="text/css" href="${root }/css/main.css">
<link rel="stylesheet" type="text/css" href="${root }/css/marketplace/marketplacemain.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>DEVEL :: 중고장터</title>

<style type="text/css">
div.main {
background-color: #fff !important;
}
/* #d1{
	color: red;
} */
</style>

<script type="text/javascript">
const $jq = jQuery.noConflict();
$jq(document).ready(function() {
	
	/* like 이벤트 */
	if(${userKey!=null}) {
	<%--목록 테이블 하트 이벤트--%>
	$jq('.chheart').on("change", function(){
		if($(this).is(':checked'))
		{
			let market_place_idx = $(this).attr('market_place_idx');
			//let member_idx = ${userKey};
			let like_count = 1;
			
			$.ajax({
				type: "post",
				url: "marketlike.event",
				data: {
					"market_place_idx":market_place_idx,
					//"member_idx":member_idx,
					"like_count":like_count,
					},
				success: function(data) {
					document.location.reload(true);
					alert("성공");
				}
			});
			
			//하트 바뀜
			$(this).siblings('.heart').attr('src','${root }/element/icon_bigheart_inback.png');
		}
		else
		{
			let market_place_idx = $(this).attr('market_place_idx');
			//let member_idx = ${userKey};
			let like_count = 0;

			$.ajax({
				type: "post",
				url: "marketlike.event",
				data: {
					"market_place_idx":market_place_idx,
					//"member_idx":member_idx,
					"like_count":like_count,
					},
				success: function(data) {
					document.location.reload(true);
					alert("성공");
				}
			});
			
			//하트 바뀜
			$(this).siblings(".heart").attr("src","${root }/element/icon_bigheart_nobackred.png");
		}
	});
	}
});

/* 목록형/리스트형 체크박스 쿠키설정 */
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

$(function(){
	
	var key = getCookie("key");
    console.log(key);
	
	$(".sangpumlistdiv").hide();
	$(".pagenumlist").hide();
	
	<%--목록형 테이블--%> 
	$("span.large").click(function(){
		setCookie("key", "1", "1");
		
		$(".sangpumlistdiv").hide();
		$(".pagenumlist").hide();
		
		$(".sangpumdiv").show();
		
		$(".pagenumlist").hide();
		$(".pagenumall").show();
		
		$("span.large").css("border","1px solid black");
		$("span.list").css("border","1px solid #dbdbdb");
	});
	
	<%--리스트 테이블--%> 
	$("span.list").click(function(){
		setCookie("key", "2", "1");
		
		$(".sangpumdiv").hide();
		$(".sangpumlistdiv").show();
		
		$(".pagenumlist").show();
		$(".pagenumall").hide();
		
		$("span.list").css("border","1px solid black");
		$("span.large").css("border","1px solid #dbdbdb");
	});
	
	if(getCookie("key")=="1"){
		$(".sangpumlistdiv").hide();
		$(".pagenumlist").hide();
		
		$(".sangpumdiv").show();
		
		$(".pagenumlist").hide();
		$(".pagenumall").show();
		
		$("span.large").css("border","1px solid black");
		$("span.list").css("border","1px solid #dbdbdb");
	}
	
	else if(getCookie("key")=="2"){
		$(".sangpumdiv").hide();
		$(".sangpumlistdiv").show();
		
		$(".pagenumlist").show();
		$(".pagenumall").hide();
		
		$("span.list").css("border","1px solid black");
		$("span.large").css("border","1px solid #dbdbdb");
	}

	<%--검색창 클릭시 가이드 문구 없어짐--%>
	$(".searchtext").click(function(){
		//alert(1);
		$(this).val("");
	});
	
	<%--체크박스 체크시 테이블 select문으로 거래가능 출력--%>
	$("#changebox").change(function(){
		if($("#changebox").is(":checked"))
		{
			var checkon = 1;	
			location.href = '/marketplace/market_tradeabletest?checkon='+checkon;	
		}
		else
		{
		}
	});

});
</script>
</head>
<body>
<div class="container">
	<div class="marketfirst">
	</div>
	
	<div class="marketfirst2">
		<span class="sangpumcount">
		<!--marketplace 상품 총 갯수-->
		${totalCount}
		</span>	
		<span class="sangpumcountcomment">개의 상품이 있습니다.</span>		
	</div>
	
	
	<div class="search" style="border: solid 1px #dbdbdb;">
	<form action="/marketplace/search">
		<input type="text"  class="searchtext" id="searchtext" name="SearchText" placeholder="검색어를 입력하세요.">
		<button type="submit" class="searchbtn">
		<span class="glyphicon glyphicon-search searchicon"></span>
		</button>
	</form>
	</div>
	

	<div class="changelist">
		<input type="hidden" id="checkValue">
		<span class="glyphicon glyphicon-th-large largeicon large">
			<input type="checkbox" hidden="" id="viewlarge" value="1">
		</span>
		<span class="glyphicon glyphicon-list listicon list">
			<input type="checkbox" hidden="" id="viewlist" value="2">
		</span>
	</div>
	
	<div class="relatedsearch" 
	style="border: solid 1px #dbdbdb; border-top: solid 2px black;
	margin: 0 0 0 29px;">
		<br>
		<span class="spanrelatedsearch">연관검색어</span>&nbsp;&nbsp;
		<span class="searchname"><a href="${root }/marketplace/search?SearchText=노트북">노트북</a></span>&nbsp;&nbsp;
		<span class="searchname"><a href="${root }/marketplace/search?SearchText=키보드">키보드</a></span>&nbsp;&nbsp;
		<span class="searchname"><a href="${root }/marketplace/search?SearchText=마우스">마우스</a></span>
		<!-- <span class="morelook">더보기&nbsp;<span class="glyphicon glyphicon-menu-down morelookicon"></span></span> -->
	</div>
	
	<div class="selectbox">
		
		<label class="selectboxlb"><input type="checkbox" class="chb" id="changebox">&nbsp;거래가능 제품만 보기</label>
			
		<!-- 상품등록 페이지 연결 -->
		<button type="button" class="btn-addsangpum" onclick="location.href='/marketplace/productadd'">상품등록</button>
	</div>
	<br>
	<!-- <div class="tab-content"> -->

	
	<%--전체 테이블 --%>	
	<c:forEach var="a" items="${list}" varStatus="status">
	  	<div class="sangpumdiv" style="border: 0px solid black;">
			
			
			<!-- like 이벤트 -->
			<label class="lab" id="lab">
				<c:forEach var="b" items="${likelist}">
					<c:if test="${(a.market_place_idx==b.market_place_idx)&&(userKey==b.member_idx)&&(b.like_count==1)}">
						<input type="checkbox" id="chk"
						market_place_idx="${a.market_place_idx}" class="chheart" checked="checked">
						<img alt="" src="${root }/element/icon_bigheart_inback.png" class="heart"
						style="position: absolute;">
					</c:if>
				</c:forEach>
	
				<input type="checkbox" id="chk"
				market_place_idx="${a.market_place_idx}" class="chheart">
				<img alt="" src="${root }/element/icon_bigheart_nobackred.png" class="heart">
			</label>
			

		<!-- 거래미완료 상품 -->
		<c:if test="${a.sold_day==null}">
		  	<div class="sangpumphoto" style="border: 0px solid #dbdbdb;">
				<!-- 이미지 있을 경우 상품이미지 중 첫번째 이미지 보이기 -->
				<c:if test="${a.photo!='no'}">
					<c:forTokens var="p" items="${a.photo}" delims="," begin="0" end="0">
						<a id="imghref" href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
							<img src="${root }/photo/${p}" style="width: 220px; height: 220px;" class="photo">
						</a>
					</c:forTokens>
				</c:if>
				
				<!-- 이미지 없을 경우 기본 이미지 -->
				<c:if test="${a.photo=='no'}">
					<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
						<img src="${root }/element/icon_noimg.png" style="width: 220px; height: 220px;" class="photo">
					</a>
		  		</c:if>
		  	</div>
	  	</c:if>

	  	<!-- 거래완료 상품 -->
		<c:if test="${a.sold_day!=null}">
		  	<div class="sangpumphoto" style="border: 0px solid #dbdbdb;">
				<!-- 이미지 있을 경우 상품이미지 중 첫번째 이미지 보이기 -->
				<c:if test="${a.photo!='no'}">
					<c:forTokens var="p" items="${a.photo}" delims="," begin="0" end="0">
						<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
							<img src="${root }/photo/${p}" style="width: 220px; height: 220px; opacity: 30%" class="photo">
						</a>
						<div style="position: absolute; top: 130px; left: 60px;">
							<img id="msuccess" src="${root }/element/img_activity_success.png"
							style="width: 100px; height: 35px;">
						</div>
					</c:forTokens>
				</c:if>
				
				<!-- 이미지 없을 경우 기본 이미지 -->
				<c:if test="${a.photo=='no'}">
					<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
						<img src="${root }/element/icon_noimg.png" style="width: 220px; height: 220px;" class="photo">
					</a>
					<div style="position: absolute; top: 130px; left: 60px;">
						<img id="msuccess" src="${root }/element/img_activity_success.png"
						style="width: 100px; height: 35px;">
					</div>
		  		</c:if>
		  	</div>
	  	</c:if>
	  	
	  	
	  	<div class="sangpumdetail" style="border: 0px solid #dbdbdb;">
	  		<span class="brandname">${a.brandname}</span><br>
	  		<span class="subject">${a.subject}</span><br>
	  		<span class="price">
				<fmt:formatNumber pattern="#,##0">${a.price}</fmt:formatNumber>원
			</span>&nbsp;&nbsp;&nbsp;
			<span class="original_price">
				<fmt:formatNumber pattern="#,##0">${a.original_price}</fmt:formatNumber>원
			</span>
	  		<span class="region">${a.region}</span>
	  		</div>
	  	</div>
	</c:forEach>


	<%--리스트 테이블 --%>
	<c:forEach var="a" items="${list}">
		<div class="sangpumlistdiv" style="border: 1px solid #dbdbdb;" id="listdiv">
		
		<!-- 거래미완료 상품 -->
		<c:if test="${a.sold_day==null}">
			<div class="sangpumlistphoto" style="border: 1px solid #dbdbdb;">
				<c:if test="${a.photo!='no'}">
					<c:forTokens var="p" items="${a.photo}" delims="," begin="0" end="0">
						<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
							<img src="${root }/photo/${p}" style="width: 146px; height: 146px;" class="photo">
						</a>
					</c:forTokens>
				</c:if>
									
				<!-- 이미지 없을 경우 기본 이미지 -->
				<c:if test="${a.photo=='no'}">
					<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
						<img src="${root }/element/icon_noimg.png" style="width: 146px; height: 146px;" class="photo">
					</a>
			  	</c:if>
			</div>
		</c:if>
		
		<!-- 거래완료 상품 -->
		<c:if test="${a.sold_day!=null}">
		  	<div class="sangpumlistphoto" style="border: 1px solid #dbdbdb;">
				<!-- 이미지 있을 경우 상품이미지 중 첫번째 이미지 보이기 -->
				<c:if test="${a.photo!='no'}">
					<c:forTokens var="p" items="${a.photo}" delims="," begin="0" end="0">
						<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
							<img src="${root }/photo/${p}" style="width: 146px; height: 146px; opacity: 30%" class="photo">
						</a>
						<div style="position: absolute; top: 60px; left: 25px;">
							<img id="msuccess" src="${root }/element/img_activity_success.png"
							style="width: 100px; height: 35px;">
						</div>
					</c:forTokens>
				</c:if>
				
				<!-- 이미지 없을 경우 기본 이미지 -->
				<c:if test="${a.photo=='no'}">
					<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
						<img src="${root }/element/icon_noimg.png" style="width: 146px; height: 146px;" class="photo">
					</a>
					<div style="position: absolute; top: 60px; left: 25px;">
						<img id="msuccess" src="${root }/element/img_activity_success.png"
						style="width: 100px; height: 35px;">
					</div>
		  		</c:if>
		  	</div>
	  	</c:if>

			
			<div class="sangpumlistdetail" style="border: 0px solid black">
				<span class="brandname">${a.brandname}</span><br>
				<span class="subject">${a.subject}</span><br><br>
				<span class="price">
					<fmt:formatNumber pattern="#,##0">${a.price}</fmt:formatNumber>원
				</span>&nbsp;&nbsp;&nbsp;
				<span class="original_price">
					<fmt:formatNumber pattern="#,##0">${a.original_price}</fmt:formatNumber>원
				</span>
				<span class="region">${a.region}</span>
			</div>
			
			<!-- like 이벤트 -->
			<label class="lablist" id="lab">
				<c:forEach var="b" items="${likelist}">
					<c:if test="${(a.market_place_idx==b.market_place_idx)&&(userKey==b.member_idx)&&(b.like_count==1)}">
						<input type="checkbox" id="chk"
						market_place_idx="${a.market_place_idx}" class="chheart" checked="checked">
						<img alt="" src="${root }/element/icon_bigheart_inback.png" class="heart"
						style="position: absolute; margin-left: 20px;">
					</c:if>
				</c:forEach>
	
				<input type="checkbox" id="chk"
				market_place_idx="${a.market_place_idx}" class="chheart">
				<img alt="" src="${root }/element/icon_bigheart_nobackred.png" class="heart"
				style="margin-left: 20px;"">
			</label>
		</div>
	</c:forEach>




	<!-- 페이징 -->
    <div class="pagesort">
    <c:if test="${totalCount>0}">
        <div class="page" align="center" style="margin-top: 50px;"> 
            <!-- 이전 -->
            <c:if test="${startPage>1}">
                <a id="pagelbtn" href="market_main?currentPage=${startPage-1}">
                    <img id="pagebtn" src="${root }/activity/icon_activity_move2.png">
                </a>
                
            </c:if>
            
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${currentPage==pp}">
                    <a id="pagecnum" href="market_main?currentPage=${pp}"><b>${pp}</b></a>
                </c:if>
                <c:if test="${currentPage!=pp}">
                    <a id="pagenum" href="market_main?currentPage=${pp}">${pp}</a>
                </c:if>
            </c:forEach>
            
            <!-- 다음 -->
            <c:if test="${endPage<totalPage}">
                <a id="pagerbtn" href="market_main?currentPage=${endPage+1}">
                    <img id="pagebtn" src="${root }/activity/icon_activity_move1.png">
                </a>
            </c:if>
            
        </div>
    </c:if>
    </div>
	
</div>
</body>
</html>