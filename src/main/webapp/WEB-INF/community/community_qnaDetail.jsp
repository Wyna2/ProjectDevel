<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Hubballi&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root }/css/community/community_detail_qanda.css">
<title>Insert title here</title>
<style type="text/css">
div.main {
background-color: #fff !important;
}
</style>

<script type="text/javascript">
$(function(){
	
	$(".subjecttextbox").click(function(){
		//var i=$(this).val();
		//alert(i);
		
		$(this).val("");
		
	});
	
	$(".commenttext").click(function(){
		//var i=$(this).val();
		//alert(i);
		
		$(this).val("");
		
	});
	
	$(".contenttextarea").click(function(){
		//var i=$(this).val();
		//alert(i);
		
		$(this).val("");
		
	});
	
	
	<%--추천수 이벤트--%>
	$(".likes").click(function(){
		
		alert("추천수가 올라야해요!");
		
	});
	
	<%--댓글 추가--%>
	$(".commentaddimg").click(function(){
		
		alert("답변 등록 완료!");
	});
	
	<%--채택하기 버튼--%>
	$(".selectionbtn").click(function(){
		
		alert("채택 되었어요!");
	});
});

</script>
</head>
<body>
<div class="container">
	<input type="hidden" value="${c_dto.community_idx }" id="c_idx">	
	<input type="hidden" value="${currentPage }" id="currentPage">

<div class="detailsubject" style="border: 0px solid black;">
	<%--글번호 받아오기 --%>
	<span class="contentnum">#${c_dto.community_idx }</span>
	
	
	<%--Q&A글 알림표 --%>
	<div class="tag" style="border: solid 1px black; color: #fff;background: black;">
	<span class="qatag">&nbsp;&nbsp;Q&A</span>
	</div>
	
	
	<%--태그1 받아오기 --%>
	<div class="tag" style="border: solid 0px #dbdbdb;">
	<span class="badge" style="font-size: 1.1em; float: left;">태그1</span>
	</div>
	
	<%--태그2 받아오기 --%>
	<div class="tag" style="border: solid 0px #dbdbdb;">
	<span class="badge" style="font-size: 1.1em; float: left;">태그2</span>
	</div>
	
	<%--태그3 받아오기 --%>
	<div class="tag" style="border: solid 0px #dbdbdb;">
	<span class="badge" style="font-size: 1.1em; float: left;">태그3</span>
	</div>
	
	</div>
	<%--글작성일 받아오기 --%>
	<span class="writeday">2022-06-14-03:01 작성</span>
	

	<div class="content" style="border: solid 1px #dbdbdb; border-top: solid 2px black; border-bottom: solid 2px black;">
	
		<span class="writeicon"><img alt="" src="${root }/element/icon_writecontent_small.png"> </span>
		
	
	<%--작성자 및 프로필 사진 받아오기 --%>
	<div class="contentname">
	<span><img alt="" src="${root }/element/icon_profile.png"></span>
	<span class="spanwriter">작성자</span>
	
	<%--팀명 받아오기 --%>
	<div class="teamname">
		<span class="spanteamname">싹스리</span>
	</div>
	</div>
	
	<%--글 제목 받아오기 --%>
	<div class="contentsubject">
	<input type="text" value="글제목이 나타납니다" class="subjecttextbox">
	</div>
	
	<%--글 내용 받아오기 --%>
	<div class="contentarea">
	<textarea rows="" cols="" class="contenttextarea">글내용이 나타납니다</textarea>
	</div>
	
	<%--각 count값 받아오기 --%>
	<div class="iconcount">
	<span class="textsms"><img alt="" src="${root }/element/icon_textsms.png">&nbsp;&nbsp;0</span>
	<span class="likes"><img alt="" src="${root }/element/icon_thumb.png">&nbsp;&nbsp;30</span>
	<span><img alt="" src="${root }/element/icon_visibil.png">&nbsp;&nbsp;2378</span>
	</div>
	
	</div>
	
	<div class="addcomment" style="border: solid 1px #dbdbdb;">
	
	<input type="text" value="답변을 입력하세요" class="commenttext">
	<button type="button" class="btn-small">답변등록</button>
	</div>
	
	
	<div class="commentdiv" style="border: solid 1px #dbdbdb;">
	<c:forEach var="i" begin="1" end="1">
	<div>
		<img alt="" src="${root }/element/icon_profile.png">
		<span class="commentuser">유저1</span>
		
		<br>
		<span class="commentwriteday">2022-06-14 05:03</span>
		<textarea rows="" cols="" class="cocomment" readonly="readonly" style="">??</textarea>
		<img alt="" src="${root }/element/button_selection.png" class="selectionbtn">
	</div>
	</c:forEach>
	
	</div>
</div>
</body>
</html>