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

<title>Insert title here</title>
</head>

<body>
<!-- sidebar -->
<div class="sidebar_title">나의활동</div>
<hr id="sidebar_hr">
<div class="sidebar_content">
	<div class="sidebar_detail" id="d1" onclick="location.href='../activity'">
		<span class="side_main_span_main">모아보기</span>
	</div>
	<div class="sidebar_detail" id="d2" onclick="location.href='../activity/seeWrite'">
		<span class="side_main_span_write">작성글 목록</span>
	</div>
	<div class="sidebar_detail" id="d3" onclick="location.href='../activity/seeMarketplace'">
		<span class="side_main_span_market">거래 목록</span>
		</div>
	<div class="sidebar_detail" id="d4" onclick="location.href='../activity/seeChallenge'">
		<span class="side_main_span_challenge">챌린지 목록</span>
	</div>
	<div class="sidebar_detail" id="d5" onclick="location.href='../activity/scrap'">
		<span class="side_main_span_scrap">스크랩</span>
	</div>
</div>

</body>
</html>