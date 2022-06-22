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

<!-- 이미지 파일 업로드 후 이벤트 -->
<script type="text/javascript">
function previewFile() {
  const preview = document.querySelector('#myimg');
  const file = document.querySelector('input[type=file]').files[0];
  const reader = new FileReader();
  
  /* 이미지 파일만 업로드 가능 유효성 검사 */
  if (!file.type.match("image/.*")) {
	alert('이미지 파일만 업로드 가능합니다.');
	return false;
  }
    
  reader.addEventListener("load", function () {
    // convert image file to base64 string
    preview.src = reader.result;
  }, false);

  if (file) {
	  reader.readAsDataURL(file);
  }
  
}
</script>

<style type="text/css">
input:focus {
    outline: none;
    border-bottom: 1px solid #ff4b4e;
}
textarea:focus {
	outline-color: #ff4b4e;
}
div.main {
background-color: #fff !important;
}
</style>

</head>
<body>
<!-- main -->
<form action="update" method="post" enctype="multipart/form-data">
<!-- hidden 넘기기, value 값 주기 -->
<input type="hidden" name="id" value="${dto.id}">

<div class="main_title">마이페이지</div>
<hr id="main_hr">
<div id="updateform" class="main_content">
	<!-- 마이프로필(이미지) -->
	<div class="div1" align="center" style="margin-top: 100px;">
		<a href="javascript:void(0);" class="imgUploadBtn"
		onclick="$('#imgUpload').trigger('click')">
			<img src="${root }/element/icon_noimg.png" id="myimg" name="photo">
		</a>
		<input type="file" id="imgUpload" onchange="previewFile()"
		accept="image/*" style="display:none">
	</div>
	
	<!-- 마이페이지 정보 -->
	<div class="div2" style="margin-top: 100px;">
		<div class="txt">
			<div class="title">이름</div>
			<div id="name">${dto.name}</div>
		</div>
		<div class="txt">
			<div class="title">아이디</div>
			<div id="id">test</div>
		</div>
		<div class="txt">
			<div class="title">이메일</div>
			<div id="email">test@gmail.com</div>
		</div>
		<div class="txt">
			<div class="title">비밀번호</div>
			<button type="button" class="btn_pw">비밀번호 재설정</button>
		</div>
		<div class="txt">
			<div class="title">닉네임</div>
			<div id="nickname">
				<input class="input" type="text" placeholder="Wyna">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">주소</div>
			<div id="address">
				<input class="input" type="text" placeholder="서울시 강남구">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">연락처</div>
			<div id="contact_number">
				<input class="input" type="text" placeholder="010-1234-5678">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">생년월일</div>
			<input class="input" type="date">
		</div>
		
		
		<div class="sub_title">추가정보입력(선택사항)</div>
		<div class="txt">
			<div class="title">연령</div>
			<div id="age">
				<select class="input">
					<option>10-</option>
					<option>20</option>
					<option>30</option>
					<option>40</option>
					<option>50</option>
					<option>60+</option>
				</select>
			</div>
		</div>
		<div class="txt">
			<div class="title">직업</div>
			<div id="job">
				<input class="input" type="text" placeholder="비공개">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">관심분야</div>
			<input class="tag" id="hobby1" type="text" placeholder="취미1">
			<input class="tag" id="hobby2" type="text" placeholder="취미2">
			<input class="tag" id="hobby3" type="text" placeholder="취미3">		
		</div>
		<div class="txt">
			<div class="title">한줄소개</div>
		</div>
		<div>
			<textarea id="pr" placeholder="한 줄 소개를 입력하세요"></textarea>
		</div>
		
		<button type="button" class="btn_update">회원정보수정</button>
	</div>
</div>
</form>
</body>

</html>