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
<link rel="stylesheet" type="text/css" href="${root }/css/member/member_infoaddform.css">

<script type="text/javascript">
$(function() {
	/* start Dropdown Menu*/		
	$('.dropdown').click(function () {
        $(this).attr('tabindex', 1).focus();
        $(this).toggleClass('active');
        $(this).find('.dropdown-menu').slideToggle(300);
    });
    $('.dropdown').focusout(function () {
        $(this).removeClass('active');
        $(this).find('.dropdown-menu').slideUp(300);
    });
    $('.dropdown .dropdown-menu li').click(function () {
        $(this).parents('.dropdown').find('span').text($(this).text());
        $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
        $("span.age_placeholder").css("color", "#505050");
    });
    /*End Dropdown Menu*/
    
    /* 연령대 선택 하지 않았을 경우 페이지 이동 방지 스크립트 추가하기 */
});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="title">
추가정보 입력
</div>
<div class="container">
		<div class="box">
			<div style="text-align: center; margin-bottom: 30px; color: #505050; ">
				<b>회원가입을 환영합니다.</b><br> 몇가지 추가정보를 입력하면 활동이 가능합니다.
			</div>
			<form action="memberinfoadd" method="post">
				<div class="wrapper">
				<input type="hidden" name="member_idx" id="idx" required="required" readonly="readonly" value="${member_idx }"> 
					직업&nbsp;&nbsp;
					<input type="text" class="input" name="job" id="addr2" placeholder="직업을 입력하세요" required="required" style="width: 320px;"> 
					<span class="underline"></span> 
				</div>
				<div class="wrapper">
					연령&nbsp;&nbsp;
					<div class="dropdown">
						<div class="select">
							<span class="age_placeholder">연령대를 선택하세요</span> <i class="fa fa-chevron-left"></i>
						</div>
						<input type="hidden" name="age" value="empty">
						<ul class="dropdown-menu">
							<li id="10-">10대-</li>
							<li id="20">20대</li>
							<li id="30">30대</li>
							<li id="40">40대</li>
							<li id="50">50대</li>
							<li id="60+">60대+</li>
						</ul>
					</div>
				</div>
				<div class="wrapper">
					관심분야&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" class="input" name="hobby1" placeholder="관심분야1" required="required" style="width: 90px;"> 
					<span class="underline" style="margin-left: 71px; width: 90px;"></span>
					<input type="text" class="input" name="hobby2" placeholder="관심분야2" style="width: 90px;"> 
					<span class="underline" style="margin-left: 165px; width: 90px;"></span>
					<input type="text" class="input" name="hobby3" placeholder="관심분야3" style="width: 90px;"> 
					<span class="underline" style="margin-left: 259px; width: 90px;"></span>
				</div>
				<div class="wrapper">
					<div style="position:relative; margin-bottom: 10px;">소개글</div>
					<textarea class="select" name="pr" style="resize: none;" placeholder="50자 이내"></textarea>
					<div style="font-size:12px; letter-spacing :-0.1em; position: relative; margin-bottom: 10px; color: #505050">
					* 운영정책에 위배되는 내용 기입 시 서비스 이용이 제한될 수 있습니다.</div>
				</div>
				<button class="btn-large" style="margin-top: 165px;" type="submit">추가정보 저장</button>
			</form>
		</div>
	</div>
</body>
</html>