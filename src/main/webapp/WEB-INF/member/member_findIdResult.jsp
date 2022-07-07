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

<title>DEVEL :: 아이디 찾기</title>
</head>
<body>
<div class="title">
아이디 찾기
</div>
<div class="container">
		<div class="box">
			<div style="text-align: center; margin-top: 10px; color: #505050; ">
				입력하신 정보로 조회된 아이디는 다음과 같습니다<br>
				<hr style="margin: 40px 0 30px 0;">
			</div>
			<div style="text-align: center; font-size: 1.5em;" >
				<!-- 아이디 찾기 통해서 나온 db 결과값 출력 -->
				${finderResult }
			</div>
			<hr style="margin: 35px 0 0 0;">
			<button class="btn-large2" style="margin: 40px 0 35px 0;" type="button" onclick="location.href='/findaccount'">비밀번호 찾기</button>
			<button class="btn-large1" style="margin-top: 0px;" type="button" onclick="location.href='/login'">로그인</button>
		</div>
	</div>
</body>
</html>