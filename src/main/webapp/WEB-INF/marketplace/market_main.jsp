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

<title>Insert title here</title>
<style type="text/css">
div.main {
background-color: #fff !important;
}
/* #d1{
	color: red;
} */
</style>

<script type="text/javascript">
$(function(){
	$(".sangpumlistdiv").hide();
	$(".pagenumlist").hide();
	
	
	
	<%--목록형 테이블--%>
	$("span.large").click(function(){
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
		$(".sangpumdiv").hide();
		$(".sangpumlistdiv").show();
		
		$(".pagenumlist").show();
		$(".pagenumall").hide();
		
		$("span.list").css("border","1px solid black");
		$("span.large").css("border","1px solid #dbdbdb");
	});

	<%--검색창 클릭시 가이드 문구 없어짐--%>
	$(".searchtext").click(function(){
		//alert(1);
		$(this).val("");
	});
	
	<%--체크박스 체크시 테이블 select문으로 거래가능 출력--%>
	$(".chb").click(function(){
		
	});
	
	
	<%--연관검색어 클릭시 연관검색어 테스트 가져옴--%>
	$(".searchname").click(function(){
		//location.reload();
		var i=$(this).text();
		alert(i);
	});
	
	<%--검색어에 관련된 정보 테이블 출력--%>
	$(".searchicon").click(function(){
		var SearchText=$(".searchtext").val();
		
		//location.reload();
		
		if(SearchText=="")
		{
			alert("검색어를 입력하세요!");
		}
		
		else if(SearchText=="검색어를 입력해 주세요.123")
		{
			alert("검색어를 입력하세요!");
		}
		
		else
		{
			location.href = '/marketplace/market_seachresult?SearchText='+SearchText;
		}
		

		alert(i);
		//location.reload();		
	});

	
	<%--목록 테이블 하트 이벤트--%>
	$(".chheart").change(function(){
		if($(this).is(":checked"))
		{
			$(this).parent('.lab').children(".heart").attr("src","${root }/element/icon_bigheart_inback.png");
			/* $(this).parent('.lablist').children(".heart").attr("src","${root }/element/icon_bigheart_inback.png"); */
		}
		else
		{
			$(this).parent('.lab').children(".heart").attr("src","${root }/element/icon_bigheart_noback.png");
			/* $(this).parent('.lablist').children(".heart").attr("src","${root }/element/icon_bigheart_noback.png"); */
		}
	});
		
		
	<%--리스트 테이블 하트 이벤트--%>
	$(".chheart").change(function(){
		if($(this).is(":checked"))
		{
			$(this).parent('.lablist').children(".heart").attr("src","${root }/element/icon_bigheart_inback.png");
		}
		else
		{
			$(this).parent('.lablist').children(".heart").attr("src","${root }/element/icon_bigheart_noback.png");
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
	
	<form>
	<div class="search" style="border: solid 1px #dbdbdb;">
	
		<input type="text"  class="searchtext" id="searchtext" name="word" value="검색어를 입력해 주세요.">
		<a href="#"><span class="glyphicon glyphicon-search searchicon"></span>
		            <button type="submit">검색</button>	
		</a>
	<!-- 	<input type="text" value="검색어를 입력해 주세요." class="searchtext">
		<a href="#"><span class="glyphicon glyphicon-search searchicon"></span></a> -->
	</div>
	</form>
	
	
	<div class="changelist">
		<span class="glyphicon glyphicon-th-large largeicon large"></span>
		<span class="glyphicon glyphicon-list listicon list"></span>
	</div>
	
	<div class="relatedsearch" style="border: solid 1px #dbdbdb; border-top: solid 2px black;">
		<br>
		<span class="spanrelatedsearch">연관검색어</span>&nbsp;&nbsp;
		<span class="searchname"><a href="#">무선</a></span>&nbsp;&nbsp;
		<span class="searchname"><a href="#">블루투스</a></span>&nbsp;&nbsp;
		<span class="searchname"><a href="#">무접점</a></span>
		<!-- <span class="morelook">더보기&nbsp;<span class="glyphicon glyphicon-menu-down morelookicon"></span></span> -->
	</div>
	
	<div class="selectbox">
		<label class="selectboxlb"><input type="checkbox" class="chb">&nbsp;거래가능 제품만 보기</label>
		<!-- 상품등록 페이지 연결 -->
		<button type="button" class="btn-addsangpum" onclick="location.href='/marketplace/productadd'">상품등록</button>
	</div>
	<br>
	<!-- <div class="tab-content"> -->

	
	<%--전체 테이블 --%>
	<c:forEach var="a" items="${list}">
	  	<div class="sangpumdiv" style="border: 0px solid black;">
			<label  class="lab" id="lab">
				<input type="checkbox" id="chk" value="${i}" class="chheart">
				<img alt="" src="${root }/element/icon_bigheart_noback.png" class="heart">
			</label>

	  	<div class="sangpumphoto" style="border: 0px solid #dbdbdb;">
			<!-- 이미지 있을 경우 상품이미지 중 첫번째 이미지 보이기 -->
			<c:if test="${a.photo!='no'}">
				<c:forTokens var="p" items="${a.photo}" delims="," begin="0" end="0">
					<a href="${root }/marketplace/productdetail?market_place_idx=${a.market_place_idx}&currentPage=${currentPage}">
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
	  	
	  	<div class="sangpumdetail" style="border: 0px solid #dbdbdb;">
	  		<span class="brandname">${a.brandname}</span><br>
	  		<span class="subject">${a.subject}</span><br>
	  		<span class="price">${a.price}원</span>&nbsp;&nbsp;&nbsp;<span class="original_price">${a.original_price}</span><br>
	  		<span class="region">${a.region}</span>
	  		</div>
	  	</div>
	</c:forEach>


	<%--리스트 테이블 --%>
	<c:forEach var="a" items="${list}">
		<div class="sangpumlistdiv" style="border: 1px solid #dbdbdb;">
			
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
			
			<div class="sangpumlistdetail" style="border: 0px solid black">
				<span class="brandname">${a.brandname}</span><br>
				<span class="subject">${a.subject}</span><br><br>
				<span class="price">${a.price}원</span>&nbsp;&nbsp;&nbsp;<span class="original_price">${a.original_price}</span>
				<span class="region">${a.region}</span>
			</div>
			
			<label class="lablist" id="lab">
				<input type="checkbox" id="chk" value="${i}" class="chheart">
				<img alt="" src="${root }/element/icon_bigheart_noback.png" class="heart">
			</label>
		</div>
	</c:forEach>


	<!-- 페이징 -->
    <div class="pagesort">
    <c:if test="${totalCount>0}">
        <div class="page" align="center" style="margin-top: 50px;"> 
            <!-- 이전 -->
            <c:if test="${startPage>1}">
                <a href="market_main?currentPage=${startPage-1}">
                    <img id="pagebtn" src="${root }/activity/icon_activity_move2.png">
                </a>
            </c:if>
            
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${currentPage==pp}">
                    <a id="pagecnum" href="marketplace?currentPage=${pp}"><b>${pp}</b></a>
                </c:if>
                <c:if test="${currentPage!=pp}">
                    <a id="pagenum" href="marketplace?currentPage=${pp}">${pp}</a>
                </c:if>
            </c:forEach>
            
            <!-- 다음 -->
            <c:if test="${endPage<totalPage}">
                <a href="market_main?currentPage=${endPage+1}">
                    <img id="pagebtn" src="${root }/activity/icon_activity_move1.png">
                </a>
            </c:if>
            
        </div>
    </c:if>
    </div>
	
</div>
</body>
</html>