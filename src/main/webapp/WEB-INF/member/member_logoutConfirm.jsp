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

<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root }/css/member/member_findidresult.css">

<title>Insert title here</title>
</head>
<body>
<div class="title">

</div>
<div class="container">
		<div class="box">
			<div style="text-align: center; margin-top: -5px; color: #505050; ">
				다음 계정으로 현재 로그인 상태입니다<br>
				<hr style="margin: 35px 0 30px 0;">
			</div>
			<div style="text-align: center; font-size: 1.2em; color: #505050;" >
				로그인 아이디<br> <span style="font-size: 1.4em;">${userID }</span>
				<br><br>
				로그인 시각<br> <span style="font-size: 1.4em;">${loginTime }</span>
			</div>
			<hr style="margin: 35px 0 0 0;">
			<button class="btn-large2" style="margin: 40px 20px 35px 0; width:170px; float: left;" type="button" onclick="history.back()">뒤로가기</button>
			<button class="btn-large1" style="margin: 40px 0 35px 0; width:170px; " type="button" onclick="location.href='/logout'">로그아웃</button>
		</div>
	</div>
</body>
</html>