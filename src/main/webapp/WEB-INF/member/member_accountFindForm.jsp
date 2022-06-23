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
<link rel="stylesheet" type="text/css" href="${root }/css/member/member_accountfindform.css">

<script type="text/javascript">
// '아이디 찾기-이메일'이 기본값으로 '아이디 찾기-연락처' 폼 숨기기
$(function () {
	$('#findid_contactform').hide();	
});

// 라디오 버튼 선택에 따라 아이디 찾기 폼 노출
function setFindformType(){
	if($('input:radio[id=findid_email]').is(':checked')){
    	$('#findid_emailform').show();
		$('#findid_contactform').hide();
    } else if($('input:radio[id=findid_contact]').is(':checked')){
        $('#findid_contactform').show();
        $('#findid_emailform').hide();
    }
}
</script>

<title>Insert title here</title>
</head>
<body>
<div class="title">
계정 정보 찾기
</div>
	<div class="container">
		<div class="box">
			<div style="text-align: center; margin-bottom: 18px;">
				계정 정보를 잃어버리셨나요?<br> 몇가지 질문으로 로그인 정보를 찾을 수 있습니다.
			<hr style="margin: 30px 0 0 0;">
			</div>
			<div class="content">
				<div class="tabs">
					<div class="tab">
						<input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch"> 
						<label for="tab-1" class="tab-label" style="margin-left: 60px;">아이디 찾기</label>
						<div class="tab-content">
						<hr style="margin: 0;">
						<ul>
							<li>
							<input type="radio" id="findid_email" name="selector" checked="checked" onchange="setFindformType()">
							<label for="findid_email">이메일로 찾기</label>
							<div class="check"></div>
							</li>
							<li>
							<input type="radio" id="findid_contact" name="selector" onchange="setFindformType()">
							<label for="findid_contact">&emsp;&emsp;휴대폰 번호로 찾기</label>
							<div class="check"><div class="inside"></div></div>
							</li>
						</ul>
						<div class="findid_emailform" id="findid_emailform">
						<!-- 이메일로 아이디 찾기 form -->
						<form action="findid_email" method="post">
						<div class="wrapper" style="margin-bottom: 55px;">
						</div>
						<div class="wrapper">
							이름&nbsp;&nbsp;
							<input type="text" class="input" name="name" id="name" placeholder="이름을 입력하세요" required="required" style="width: 320px;"> 
							<span class="underline"></span> 
						</div>
						<div class="wrapper">
							이메일&nbsp;&nbsp;
							<input type="email" class="input" name="email" id="email" placeholder="이메일을 입력하세요 (ex. devel@ruby.com)" required="required" style="width: 305px;"> 
							<span class="underline" style="width: 305px; margin: 0 0 0 52px;"></span> 
						</div>
						<button class="btn-large" style="margin-top: 40px;" type="submit">아이디 찾기</button>
						</form>	
					</div>
					<div class="findid_contactform" id="findid_contactform">
					<!-- 연락처로 아이디 찾기 form -->
					<form action="findid_number" method="post">
						<div class="wrapper" style="margin-bottom: 55px;">
						</div>
						<div class="wrapper">
							이름&nbsp;&nbsp;
							<input type="text" class="input" name="name" id="name" placeholder="이름을 입력하세요" required="required" style="width: 320px;"> 
							<span class="underline"></span> 
						</div>
						<div class="wrapper">
							연락처&nbsp;&nbsp;
							<input type="text" class="input" name="contact_number" id="contact_number" placeholder="연락처를 입력하세요 (ex. 010-1234-5678)" required="required" style="width: 305px;"> 
							<span class="underline" style="width: 305px; margin: 0 0 0 52px;"></span> 
						</div>
						<button class="btn-large" style="margin-top: 40px;" type="submit">아이디 찾기</button>	
					</form>
					</div>
					</div>
					</div>
					<div class="tab">
						<input type="radio" name="css-tabs" id="tab-2" class="tab-switch">
						<label for="tab-2" class="tab-label">비밀번호 찾기</label>
						<div class="tab-content">
						<hr style="margin: 0;">
						<!-- 비밀번호 찾기 form -->
						<form action="#findpw">
						<div class="wrapper" style="margin-top: 40px;">
							아이디&nbsp;&nbsp;
							<input type="text" class="input" name="id" id="id" placeholder="아이디를 입력하세요" required="required" style="width: 305px;"> 
							<span class="underline" style="width: 305px; margin: 0 0 0 52px;"></span> 
						</div>
						<div class="wrapper">
							이름&nbsp;&nbsp;
							<input type="text" class="input" name="name" id="name" placeholder="이름을 입력하세요" required="required" style="width: 320px;"> 
							<span class="underline"></span> 
						</div>
						<div class="wrapper">
							생년월일&nbsp;&nbsp;
							<input type="date" class="input" name="birth" id="birth" required="required" data-placeholder="생년월일을 입력하세요" style="width: 296px; color: #505050;">
							<span class="underline" style="width: 296px; margin: 2px 0 0 62px;"></span>
						</div>
						<button class="btn-large" style="margin-top: 50px;" type="submit">비밀번호 찾기</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>