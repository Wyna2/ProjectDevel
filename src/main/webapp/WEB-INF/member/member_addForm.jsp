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
<link rel="stylesheet" type="text/css" href="${root }/css/member/member_addform.css">

<script type="text/javascript">
/* 뒤로가기(history.back()) 감지 시 메인 페이지 이동 */
window.onpageshow = function(event) {
    if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	alert("이미 회원가입 처리 되었거나 잘못된 접근입니다.\n[확인] 을 클릭 시 메인 페이지로 이동합니다.");
    	$("#id_check").val("");
    	$("#nickname_check").val("");
    	location.href="/login";
    }
}

$(function() {
	// 아이디 입력 폼 focus 시 규칙 노출
	$('#id').on("focus", function () {
	    $("div.idRule").css("display","inline-block");
	});	
	$('#id').on("blur", function () {
		$("div.idRule").css("display","none");
	});
	// 비밀번호 입력 폼 focus 시 규칙 노출
	$('#pw').on("focus", function () {
	    $("div.pwRule").css("display","inline-block");
	});	
	$('#pw').on("blur", function () {
		$("div.pwRule").css("display","none");
	});
	// 닉네임 입력 폼 focus 시 규칙 노출
	$('#nickname').on("focus", function () {
	    $("div.nicknameRule").css("display","inline-block");
	});	
	$('#nickname').on("blur", function () {
		$("div.nicknameRule").css("display","none");
	});
	
	/* 아이디 정규식 체크, 중복 아이디 검증: ajax */
	$("#idCheck").click(
		function() {
			var inputID = $("#id").val();
			var idCheck = /^[A-Za-z]{1}[A-Za-z0-9_]{5,14}$/g.test(inputID);
			if(!idCheck) {
				alert("아이디는 6~15자의 영문, 숫자, 특수기호(_)만 사용 가능합니다.\n(첫글자는 영문만 가능)");
				$("#id").focus();
			} else {
				$.ajax({
					type : "get",
					dataType : "json",
					url : "idcheck",
					data : {"id" : inputID},
					success : function(data) {
						if(inputID=="") {	// 아무것도 입력하지 않았을 경우
							alert("사용할 아이디를 입력해주세요.");
							$("#id").focus();	
						} else {
							if (data.vaildId == 0) {
								alert("사용 가능한 아이디 입니다.");
								$("#id_check").val(inputID);
							} else {
								alert("이미 존재하는 아이디 입니다.\n다른 아이디를 입력해주세요.");
								$("#id").val("");
								$("#id").focus();
							}
						}
					},
					error : function(request, error) {
						alert("fail!");
						alert("code:" + request.status + "\n"+ "error message:" + request.responseText+ "\n" + "error:" + error);
					}
				});
			}	
		}
	);
	/* 닉네임 정규식 체크, 중복 닉네임 검증: ajax */
	$("#nicknameCheck").click(
		function() {
			var inputNickname = $("#nickname").val();
			var nicknameCheck = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,8}$/g.test(inputNickname);
			if(!nicknameCheck) {
				alert("닉네임은 2~8자의 한글, 영문, 숫자만 사용 가능합니다.");
				$("#nickname").focus();
			} else {
				$.ajax({
					type : "get",
					dataType : "json",
					url : "nicknamecheck",
					data : {"nickname" : inputNickname},
					success : function(data) {
						if(inputNickname=="") {	// 아무것도 입력하지 않았을 경우
							alert("사용할 닉네임을 입력해주세요.");
							$("#nickname").focus();
						} else {
							if (data.vaildNickname == 0) {
								alert("사용 가능한 닉네임 입니다.");
								$("#nickname_check").val(inputNickname);
							} else {
								alert("이미 사용 중인 닉네임 입니다.\n다른 닉네임을 입력해주세요.");
								$("#nickname").val("");
								$("#nickname").focus();
							}
						}
					},
					error : function(request, error) {
						alert("fail!");
						alert("code:" + request.status + "\n"+ "error message:" + request.responseText+ "\n" + "error:" + error);
					}
				});
			}
		}
	);
});

/* 회원가입 데이터 검증 */
function checkPass(form) {
	// 비밀번호 정규식 검증
	var inputID = $("#id").val();		// id 입력
	var inputPW = $("#pw").val();	// pw 입력
	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/.test(inputPW);		// 영문, 숫자
	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,15}$/.test(inputPW);		// 영문, 특수문자
	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,15}$/.test(inputPW);		// 특수문자, 숫자
	if(!(check1||check2||check3)){
		alert("비밀번호는 8~12자리의 영문(대/소문자)+숫자+특수문자 중 2가지 이상을 조합해야 합니다.");
		$("#pw").focus();
		return false;
	}
	if(/(\w)\1\1/.test(inputPW)){
		alert('같은 문자를 3번 이상 사용하실 수 없습니다.');
		$("#pw").focus();
		return false;
	}
	if(inputPW.search(inputID)>-1 && inputID!=null){
		alert("비밀번호에 아이디가 포함되어 있습니다.");
		$("#pw").focus();
		return false;
	}
	// 비밀번호 일치 검증
	if(form.password.value !== form.password_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password.value = "";
		form.password_check.value = "";
		return false;
	}
	// 아이디 중복확인 체크
	if(form.id.value!==form.id_check.value || form.id.value=="" || form.id_check.value=="") {
		alert("아이디 중복확인이 필요합니다.");
		return false;
	}
	// 닉네임 중복확인 체크
	if(form.nickname.value!==form.nickname_check.value || form.nickname.value=="" || form.nickname_check.value=="") {
		alert("닉네임 중복확인이 필요합니다.");
		return false;
	}
	// 폼 전송 시 password 가리기
	$("#pwtoggle").attr('class',"glyphicon glyphicon-eye-close")
	$("#pw").attr('type','password');
	$("#pw_check").attr('type','password');
}

/* 비밀번호 보이기/숨기기 토글 */
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function search_DaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("zipcode").value = extraAddr;
			} else {
				document.getElementById("addr1").value = '';
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("zipcode").value = data.zonecode;
			document.getElementById("addr1").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addr2").focus();
		}
	}).open();
}
</script>

<title>DEVEL :: 회원가입</title>
</head>
<body>
<div class="title">
회원가입
</div>
<div class="container">
	<div class="box">
		<form action="memberadd" method="post" onsubmit="return checkPass(this)">
			<div class="wrapper">
				<input type="text" class="input" name="id" id="id" placeholder="아이디 입력하세요" required="required" style="width: 280px;">
				<span class="underline_id"></span>
				<input type="hidden" class="input" name="id_check" id="id_check">
				<button type="button" class="btn-small" id="idCheck" style="position: absolute; float: left; margin: 10px 0 0 10px;">중복확인</button>
			</div>
			<div class="wrapper">
				<input type="password" class="input" name="password" id="pw" placeholder="비밀번호를 입력하세요" required="required" autocomplete="off" onblur="chekPassword();" style="width: 360px;">
				<span class="underline"></span>
				<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
			</div>
			<div class="wrapper">
				<input type="password" class="input" name="password_check" id="pw_check" placeholder="비밀번호 확인" required="required" style="width: 360px;">
				<span class="underline"></span>
				<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
			</div>
			<div class="wrapper">
				<input type="text" class="input" name="name" placeholder="이름을 입력하세요" required="required" maxlength="15" style="width: 360px;">
				<span class="underline"></span>
			</div>
			<div class="wrapper">
				<input type="text" class="input" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" required="required" style="width: 280px;">
				<span class="underline_id"></span>
				<input type="hidden" class="input" name="nickname_check" id="nickname_check">
				<button type="button" class="btn-small" id="nicknameCheck" style="position: absolute; float: left; margin: 10px 0 0 10px;">중복확인</button>
			</div>
			<div class="wrapper">
				<input type="date" class="input" name="birth" required="required" data-placeholder="생년월일을 입력하세요" style="width: 360px; color: #505050;">
				<span class="underline" style="margin-top: 3px;"></span>
			</div>
			<div class="wrapper">
				<input type="text" class="input" name="addr1" id="addr1" required="required" placeholder="찾기를 클릭해 주소를 입력하세요" readonly="readonly" style="width: 300px;">
				<button type="button" class="btn-small" style="width: 50px; margin: 0 0 0 6px;" onclick="search_DaumPostcode()">찾기</button><br>
			</div>
			<div class="wrapper">
				<input type="text" class="input" name="addr2" id="addr2" placeholder="상세주소를 입력하세요(선택)" style="width: 299px;">
				<span class="underline_addr"></span>
				<input type="text" class="input" name="zipcode" id="zipcode" readonly="readonly" style="width: 50px;">
			</div>
			<div class="wrapper">
				<input type="email" class="input" name="email" placeholder="이메일을 입력하세요 (ex. devel@ruby.com)" required="required" style="width: 360px;">
				<span class="underline"></span>
			</div>
			<div class="wrapper">
				<input type="text" class="input" name="contact_number" placeholder="연락처를 입력하세요 (ex. 010-1234-5678)" required="required" style="width: 360px;">
				<span class="underline"></span>
			</div>
			 <button class="btn-large" style="margin-top: 25px;" type="submit">회원가입</button>
		</form>
	</div>
	<div class="idRule">
		&ensp;•&nbsp; 첫 글자 영문 시작<br>
		&ensp;•&nbsp; 6~15자리 영문, 숫자, _ 조합<br>
	</div>
	<div class="pwRule">
		&ensp;•&nbsp; 8~15자리 영문, 숫자, 특수문자 중 2가지 이상 조합<br>
		&ensp;•&nbsp; 아이디와 중복되는 문자 사용 불가<br>
		&ensp;•&nbsp; 동일한 숫자 또는 문자 3번 이상 연속 사용 불가
	</div>
	<div class="nicknameRule">
		&ensp;•&nbsp; 2~8자리 영어, 숫자, 한글만 사용 가능<br>
		&ensp;•&nbsp; 한글 초성 및 모음 사용 불가
	</div>
</div>
</body>
</html>