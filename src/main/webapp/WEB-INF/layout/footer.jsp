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
<link rel="stylesheet" type="text/css" href="${root }/css/footer.css">

</head>
<body>
<div class="footerhead">
	<span class="option_intro_bold">
		회사소개
	</span>
	<font style="font-size:10px; color:#dbdbdb">│</font>
	<span class="option_intro">
		이용약관
	</span>
	<font style="font-size:10px; color:#dbdbdb">│</font>
	<span class="option_intro_highlight">
		개인정보처리방침
	</span>
	<font style="font-size:10px; color:#dbdbdb">│</font>
	<span class="option_intro" style="color:#808080">
		<font style="color:#000000 !important">SIST_싹쓰리조</font>
		&emsp;&emsp;김주찬&emsp;&emsp;곽경태&emsp;&emsp;강나리&emsp;&emsp;김민지&emsp;&emsp;김종민
	</span>
</div>
<hr noshade="noshade" style="margin: 0;">
<div class="footerarea">
	<span class="footer_text">
		<b>(주)루비소프트웨어</b>
		<br>
		대표이사 : 김주찬
			<font style="font-size:10px; color:#dbdbdb">&nbsp;│&nbsp;</font>
		서울특별시 강남구 역삼동 테헤란로 132 한독약품빌딩 8F 쌍용교육센터 
			<font style="font-size:10px; color:#dbdbdb">&nbsp;│&nbsp;</font>
		사업자등록번호 : 333-22-07050
		<br>
		통신판매업신고 : 2022-서울강남구-333
			<font style="font-size:10px; color:#dbdbdb">&nbsp;│&nbsp;</font>
		E-mail : askdevel@ruby.com
		<br>
		COPYRIGHT 2022. DEVEL Co., Ltd. ALL RIGHTS RESERVED.
	</span>
</div>

</body>
</html>