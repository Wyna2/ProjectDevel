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

<title>DEVEL :: 비밀번호 재설정</title>

<script type="text/javascript">
/* 뒤로가기(history.back()) 감지 시 메인 페이지 이동 */
window.onpageshow = function(event) {
    if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	$("#password").val("");
    	$("#password_check").val("");
    	alert("비정상적인 접근입니다.");
    	location.href="/login";
    }
}

$(function() {
	/* 새로고침 방지 */	
	if($("#idx").val()=="") {
		alert("비정상적인 접근입니다.\n처음부터 다시 시도하세요.");
		location.href="/findaccount";
	}
});

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

function checkPass(form) {
	$("#pw").attr('type','password');
	$("#pw_check").attr('type','password');
	// 비밀번호 일치 검증
	if (form.password.value !== form.password_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password.value = "";
		form.password_check.value = "";
		return false;
	}
}
</script>
</head>
<body>
<div class="title">
비밀번호 재설정
</div>
<div class="container">
		<div class="box">
			<form action="pwresetprocess" method="post" onsubmit="return checkPass(this)">
			<div style="text-align: center; margin-top: 10px; color: #505050; ">
				입력하신 정보에 해당하는 계정의 비밀번호를 재설정 합니다.<br>
				재설정하실 비밀번호를 입력해주세요. 
				<hr style="margin: 40px 0 30px 0;">
			</div>
			<div style="text-align: center; font-size: 1.5em;" >
				
				<c:if test="${userKey!=null}">
					<input type="hidden" name="member_idx" id="idx" value="${userKey}">
				</c:if>
				<c:if test="${userKey==null}||${userKey==''}">
					<input type="hidden" name="member_idx" id="idx" value="${resetMember_idx }">
				</c:if>
				
				<div class="wrapper">
				<input type="password" class="input" name="password" id="pw" placeholder="비밀번호를 입력하세요" required="required" autocomplete="off" style="width: 360px;">
				<span class="underline"></span>
				<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
			</div>
			<div class="wrapper">
				<input type="password" class="input" name="password_check" id="pw_check" placeholder="비밀번호 확인" required="required"style="width: 360px;">
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