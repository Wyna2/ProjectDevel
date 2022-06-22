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
<link rel="stylesheet" type="text/css" href="${root }/css/member/member_userpwreset.css">

<title>Insert title here</title>

<script type="text/javascript">
//비밀번호 보이기-숨기기 토글
$(document).ready(function(){
    $('.wrapper i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"glyphicon glyphicon-eye-open")
            .prev('span').prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"glyphicon glyphicon-eye-close")
            .prev('span').prev('input').attr('type','password');
        }
    });
});
</script>
</head>
<body>
<div class="title">
비밀번호 재설정
</div>
<div class="container">
		<div class="box">
			<form action="#">
			<div style="text-align: center; margin-top: 10px; color: #505050; ">
				입력하신 정보에 해당하는 계정의 비밀번호를 재설정 합니다.<br>
				재설정하실 비밀번호를 입력해주세요. 
				<hr style="margin: 40px 0 30px 0;">
			</div>
			<div style="text-align: center; font-size: 1.5em;" >
				<div class="wrapper">
				<input type="password" class="input" name="password" placeholder="비밀번호를 입력하세요" required="required" autocomplete="off" style="width: 360px;">
				<span class="underline"></span>
				<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
			</div>
			<div class="wrapper">
				<input type="password" class="input" name="password_check" placeholder="비밀번호 확인" required="required"style="width: 360px;">
				<span class="underline"></span>
				<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
			</div>
			</div>
			<button class="btn-large" style="margin: 40px 0 35px 0;" type="submit">비밀번호 재설정</button>
			</form>
		</div>
	</div>
</body>
</html>