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
<link rel="stylesheet" type="text/css" href="${root }/css/mypage.css">

<title>Insert title here</title>

<!-- 이미지 클릭시 이미지 변경 -->
<script type="text/javascript">
$('#myimg').click(function (e) {
    document.signform.target_url.value=document.getElementById('myimg').src;
    e.preventDefault();
    $('#file').click();
});
</script>


</head>
<body>
<!-- main -->
<div class="main_title">마이페이지</div>
<hr id="main_hr">
<div class="main_content">
	<div class="div1" align="center" style="margin-top: 100px;">
		<div>
			<img id="myimg" src="${root }/element/icon_noimg.png">
		</div>
		
		<form name="signform" method="POST" ENCTYPE="multipart/form-data" action="">
		    <input type="file" id="file" name="file" style="display:none;" onchange="changeValue(this)">
		    <input type="hidden" name="target_url">
		</form>	
	</div>
	
	<div class="div2" style="margin-top: 100px;">
		<div class="txt">
			<div class="title">이름</div>
			<div id="name">김쌍용</div>
		</div>
		<div class="txt">
			<div class="title">아이디</div>
			<div id="id">test1</div>
		</div>
		<div class="txt">
			<div class="title">이메일</div>
			<div id="email">test1@naver.com</div>
		</div>
		<div class="txt">
			<div class="title">비밀번호</div>
			<div id="password"></div>
		</div>
		<div class="txt">
			<div class="title">닉네임</div>
			<div id="nickname">닉네임3</div>
		</div>
		<div class="txt">
			<div class="title">주소</div>
			<div id="address">서울시 강남구</div>
		</div>
		<div class="txt">
			<div class="title">연락처</div>
			<div id="contact_number">010-1234-5678</div>
		</div>
		<div class="txt">
			<div class="title">생년월일</div>
			<div id="birth">2022-07-05</div>
		</div>
		
		
		<div class="txt">
			<div class="title">연령</div>
			<div id="age">20대 후반</div>
		</div>
		<div class="txt">
			<div class="title">직업</div>
			<div id="age">비공개</div>
		</div>
		<div class="txt">
			<div class="title">관심분야</div>
			<div id="hobby">비공개</div>
		</div>
		<div class="txt">
			<div class="title">한줄소개</div>
			<div id="pr">한 줄 소개를 입력하세요</div>
		</div>
	</div>
	
</div>

</body>

</html>