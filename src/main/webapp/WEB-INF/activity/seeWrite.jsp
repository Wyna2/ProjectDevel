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
			<input type="checkbox" id="allcheck" checked="checked">
			전체선택
		</div>
		
		<!-- 내 작성글 글 제목 값 가져오기 -->
		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.작성글이입력됩니다.
		</div>
		<hr style="border: solid 0.5px #767676;">

		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			내 작성글 제목
		</div>
		<hr style="border: solid 0.5px #767676;">
		
		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			내 작성글 제목
		</div>
		<hr style="border: solid 0.5px #767676;">
		
		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			내 작성글 제목
		</div>
		<hr style="border: solid 0.5px #767676;">
		
		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			내 작성글 제목
		</div>
		<hr style="border: solid 0.5px #767676;">
		
		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			내 작성글 제목
		</div>
		<hr style="border: solid 0.5px #767676;">
		
		<div class="write_sub">
			<input type="checkbox" id="check" name="cnum" checked="checked">
			내 작성글 제목
		</div>
		<hr style="border: solid 0.5px #767676;">
		
		<button type="button" class="btn_delete">삭제하기</button>
		
		
		<!-- 페이징 -->
		<div class="page" align="center" style="margin-top: 20px;">
			<img src="${root }/activity/icon_activity_move2.png">
			<span id="num1">1</span>
			<span id="num2">2</span>
			<span id="num3">3</span>
			<span id="num4">4</span>
			<span id="num5">5</span>
			<img src="${root }/activity/icon_activity_move1.png">
		</div>
	</div>
</div>


</body>
</html>