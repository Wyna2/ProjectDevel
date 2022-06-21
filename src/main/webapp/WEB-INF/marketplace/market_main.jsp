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
	
	$(".searchicon").click(function(){
		
		var i=$(".searchtext").val();
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
		<!--marketplace 상품 총 갯수   -->
		300
		</span>	
		<span class="sangpumcountcomment">개의 상품이 있습니다.</span>		
	</div>
	
	
		
	<div class="search" style="border: solid 1px #dbdbdb;">
		<input type="text" value="검색어를 입력해 주세요." class="searchtext">
		<a href="#"><span class="glyphicon glyphicon-search searchicon"></span>	</a>
	</div>
	
	
	<div class="changelist">
		<span class="glyphicon glyphicon-th-large largeicon large"></span>
		<span class="glyphicon glyphicon-list listicon list"></span>
	</div>
	
	<div class="relatedsearch" style="border: solid 1px #dbdbdb; border-top: solid 2px black;">
		<br>
		<span class="spanrelatedsearch">연관검색어</span>&nbsp;&nbsp;
		<span class="searchname"><a href="#">무선키보드</a></span>&nbsp;&nbsp;
		<span class="searchname"><a href="#">블루투스키보드</a></span>&nbsp;&nbsp;
		<span class="searchname"><a href="#">무접점키보드</a></span>
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
  <c:forEach var="a" begin="1" end="4" varStatus="i"> 
  <c:forEach var="a" begin="1" end="2">
  <div class="sangpumdiv" style="border: 0px solid black;">
	  <label  class="lab" id="lab">
	      <input type="checkbox" id="chk" value="${i }" class="chheart">
	      <img alt="" src="${root }/element/icon_bigheart_noback.png" class="heart">
	  </label>
  <div class="sangpumphoto" style="border: 1px solid #dbdbdb;">
  <img alt="" src="${root }/element/sangpumaddbtn.png" style="max-width: 220px; max-height: 170px;" class="photo">
  </div>
  
  <div class="sangpumdetail" style="border: 1px solid #dbdbdb;">
  <span class="subject">레오폴드</span><br>
  <span class="content">FC750RBT PD 그레이 블루 한글 적축 [국내정품]</span><br>
  <span class="price">173,000원</span>&nbsp;&nbsp;&nbsp;<span class="original_price">200,000</span><br>
  <span class="region">서울</span>
  </div>
  </div>
  </c:forEach>
  </c:forEach>
  
  
  
  
  
 
  <%--리스트 테이블 --%>  
  <c:forEach var="i" begin="1" end="4" varStatus="i"> 
  <c:forEach var="i" begin="1" end="2">
  <div class="sangpumlistdiv" style="border: 1px solid #dbdbdb;">
  <div class="sangpumlistphoto" style="border: 1px solid #dbdbdb;">
  <img alt="" src="${root }/element/sangpumaddbtn.png" style="max-width: 150px; max-height: 150px;" class="photo">
  </div>
  <div class="sangpumlistdetail" style="border: 0px solid black">
  
  <span class="subject">레오폴드</span><br>
  <span class="content">FC750RBT PD 그레이 블루 한글 적축 [국내정품]</span><br>
  <span class="price">173,000원</span>&nbsp;&nbsp;&nbsp;<span class="original_price">200,000</span><br>
  <span class="region">서울</span>
  
  <label  class="lablist" id="lab">
	      <input type="checkbox" id="chk" value="${i }" class="chheart">
	      <img alt="" src="${root }/element/icon_bigheart_noback.png" class="heart">
    </label> 
  </div>
  </div>
  </c:forEach>
  </c:forEach>
	
  
	



<%-- 전체 페이지 페이징 처리 --%>
	<div class="pagenumall">
	<div class="pagingnumber">
		<span class="spanpagingnumber">1</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">2</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">3</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">4</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">5</span>	
	</div>
	
	</div>
	
<%-- 리스트 페이지 페이징 처리 --%>
	<div class="pagenumlist">
	<div class="pagingnumber">
		<span class="spanpagingnumber">1</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">2</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">3</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">4</span>	
	</div>
	
	<div class="pagingnumber">
		<span class="spanpagingnumber">5</span>	
	</div>
	
	</div>
	
<!-- 페이징 -->
	<c:if test="${totalCount>0}">
		<div style="width: 800px;text-align: center;">
			<ul class="pagination">	
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<li><a href="list?currentPage=${startPage-1}">이전</a></li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<li class="active"><a href="list?currentPage=${pp}">${pp}</a></li>
				</c:if>
				<c:if test="${currentPage!=pp}">
					<li><a href="list?currentPage=${pp}">${pp}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<li><a href="list?currentPage=${endPage+1}">다음</a></li>
			</c:if>
			</ul>
		</div>
	</c:if>	
</div>
</body>
</html>