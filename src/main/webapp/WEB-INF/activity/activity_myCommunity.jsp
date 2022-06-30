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

<title>나의활동>작성글목록</title>
<style type="text/css">
span.side_main_span_write {
	font-weight: 600;
	color: #ff4b4e;
}
#d2 {
	border-bottom: 1.5px solid #ff4b4e;
}
</style>

<script type="text/javascript">
$(function() {
	
	/* 전체선택 체크박스 이벤트 */
	var chkList = $("input[name=cnum]");
	$("#allcheck").click(function(){
		if($(this).is(":checked")){
			chkList.prop("checked", true);
		}else
			chkList.prop("checked", false);
	});
	
});
</script>
</head>

<body>
<!-- main -->
<div class="main_title">작성글 목록</div>
<hr id="main_hr">
<div class="main_content">	
	<!-- 작성글 목록 -->
	<div class="main_write">
		<!-- 체크박스 -->
		<div class="write_ck">
			<input type="checkbox" id="allcheck">전체선택
		</div>
		
		<!-- 내 작성글 Data 가져오기 -->
		<form action="writeDel" method="post" enctype="multipart/form-data">
			<c:forEach var="dto" items="${clist}">
				<div class="write_sub">
					<input type="checkbox" id="check" name="cnum"
					value="${dto.community_idx}">
					<a href="../community/contentdetail?community_idx=${dto.community_idx}">${dto.subject}</a>
				</div>
				<hr style="border: solid 0.5px #767676;">
			</c:forEach>
			
			<button type="submit" class="btn_delete">삭제하기</button>
		</form>		
		
		<!-- 페이징 -->
		<div class="pagesort">
		<c:if test="${totalCount>0}">
			<div class="page" align="center" style="margin-top: 20px;">
				<!-- 이전 -->
	            <c:if test="${startPage>1}">
	                <a id="pagelbtn" href="mycommunity?currentPage=${startPage-1}">
	                    <img id="pagebtn" src="${root }/activity/icon_activity_move2.png">
	                </a>
	            </c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
	                <c:if test="${currentPage==pp}">
	                    <a id="pagecnum" href="mycommunity?currentPage=${pp}"><b>${pp}</b></a>
	                </c:if>
	                <c:if test="${currentPage!=pp}">
	                    <a id="pagenum" href="mycommunity?currentPage=${pp}">${pp}</a>
	                </c:if>
	            </c:forEach>
				
				<!-- 다음 -->
	            <c:if test="${endPage<totalPage}">
	                <a id="pagerbtn" href="mycommunity?currentPage=${endPage+1}">
	                    <img id="pagebtn" src="${root }/activity/icon_activity_move1.png">
	                </a>
	            </c:if>
	            
			</div>
		</c:if>
		</div>
	</div>
</div>


</body>
</html>