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
<link rel="stylesheet" type="text/css" href="${root }/css/member/member_loginform.css">

<script type="text/javascript">
function checkPass(form) {
	$("#pw_see").attr("type","password");
	var inputPassword = $("#pw_see").val();
	$("#pw").val(inputPassword);
	$("#pw_see").val("");
	
}
// 비밀번호 보이기/숨기기 토글
$(document).ready(function(){
    $(".wrapper i").on("click",function(){
        $("input").toggleClass("active");
        if($("input").hasClass("active")){
            $(this).attr("class","glyphicon glyphicon-eye-open")
            .prev("span").prev("input").attr("type","text");
        }else{
            $(this).attr("class","glyphicon glyphicon-eye-close")
            .prev("span").prev("input").attr("type","password");
        }
    });
});
</script>

<title>DEVEL :: 회원 로그인</title>
</head>
<body>
<div class="title">
로그인
</div>
<div class="container">
		<div class="box">
			<form action="loginprocess" method="post" name="frm" onsubmit="checkPass(this)">
			<div class="wrapper">
				<input type="text" class="input" name="id" placeholder="아이디를 입력하세요" required="required" value="${sessionScope.saveid==null?"":sessionScope.userID }" style="width: 360px;" >
				<span class="underline"></span>
			</div>
			<div class="wrapper">
				<input type="password" class="input" name="password_see" id="pw_see" placeholder="비밀번호를 입력하세요" required="required" autocomplete="off" style="width: 360px;">
				<span class="underline"></span>
				<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
			</div>
				<input type="hidden" name="password" id="pw" autocomplete="off" style="width: 360px;">
			<ul>
				<li>
				<input type="checkbox" id="saveid" name="saveid" onchange="setDisplay()" ${sessionScope.saveid==null?"":"checked" }>
				<label for="saveid">아이디 저장</label>
				<div class="check"></div>
				</li>
			</ul>
			<span class="findaccount_click" onclick="location.href='/findaccount'">
			아이디/비밀번호 찾기
			</span>
			<button class="btn-large1" style="margin: 30px 0 10px 0;" type="submit">로그인</button>
			<div style="font-size: 11pt; letter-spacing :-0.04em; color: #767676; text-align: center; padding-top: 25px;" >
				간편하게 시작하기
				<br>
				<br>
				<img alt="" src="${root }/element/icon_kakaologin.png" class="">&emsp;
				<img alt="" src="${root }/element/icon_googlelogin.png" class="">&emsp;
				<img alt="" src="${root }/element/icon_naverlogin.png" class="">
			</div>
			<button class="btn-large2" style="margin-top: 37px;" type="button" onclick="location.href='/signup'">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>