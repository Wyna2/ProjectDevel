<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 비밀번호 확인 모달창 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root }/css/mypage.css">

<title>Insert title here</title>

<script type="text/javascript">
<!-- 이미지 파일 업로드 후 이벤트 -->
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

$(function() {
	
	/* input 클릭시 해당 값 age에 넣기 */
	$(".ageselect").change(function() {
		$("#age").val($(".ageoption").val());
 	});
	
	/* 비밀번호 재설정 클릭시 비밀번호 확인창 */
	$("#btn_pw").click(function() {
		
		/* 비밀번호 재설정 모달창 */
		var modal = {
			open : function(){
				$('#modal-wrapper').show();
			},
			close : function(){
				$('#modal-wrapper').hide();
			}
		};

		$(document).on('click', '#modal-overlay', function(){
			window.history.back();
		}).on('click', '#btn_pw', function(){
			window.history.pushState({}, 'modal', '/modal');
			modal.open();
		}).on('click', '#pwcheckbtn', function() {
			if(${dto.password}==$('.inputpw').val()){
				location.href="${root}/userpwreset";
			} else {
				alert("비밀번호 재확인 후 다시 입력해주세요");
				$('.inputpw').val('');
			}
		});

		window.onpopstate = history.onpushstate = function(e) {
			if(window.location.href.split('/').pop().indexOf('modal')===-1){
				modal.close(); // 현재의 모달을 닫는다.
				$('.inputpw').val(''); // 입력값 초기화
			}
		}		
	});
	
	/* 닉네임 정규식 체크, 중복 닉네임 검증: ajax */
	$("#btn_nick").click(
		function() {
			var inputNickname = $("#nicktxt").val();
			var btn_nick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,8}$/g.test(inputNickname);
			if(!btn_nick) {
				alert("닉네임은 2~8자의 한글, 영문, 숫자만 사용 가능합니다.");
				$("#nicktxt").focus();
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

/* 비밀번호 보이기/숨기기 토글 */
$(document).ready(function(){
    $('.pwchecktxt i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"glyphicon glyphicon-eye-open")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"glyphicon glyphicon-eye-close")
            .prev('input').attr('type','password');
        }
    });
});
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

<input type="hidden" name="userKey" id="userKey" value="${userKey}">

<div class="main_title">마이페이지</div>
<hr id="main_hr">
<div id="updateform" class="main_content">
	<!-- 마이프로필(이미지) -->
	<c:if test="${dto.photo=='no'}">
		<div class="div1" align="center" style="margin-top: 100px;">
			<a href="javascript:void(0);" class="imgUploadBtn"
			onclick="$('#imgUpload').trigger('click')">
				<img src="${root}/element/icon_noimg.png" id="myimg">
			</a>
			<input type="file" id="imgUpload" onchange="previewFile()"
			accept="image/*" value="${dto.photo}" name="imgUpload" style="display:none">
		</div>
	</c:if>
	<c:if test="${dto.photo!='no'}">
		<div class="div1" align="center" style="margin-top: 100px;">
			<a href="javascript:void(0);" class="imgUploadBtn"
			onclick="$('#imgUpload').trigger('click')">
				<img src="${root}/photo/${dto.photo}" id="myimg">
			</a>
			<input type="file" id="imgUpload" onchange="previewFile()"
			accept="image/*" value="${dto.photo}" name="imgUpload" style="display:none">
		</div>
	</c:if>
	
	<!-- 마이페이지 정보 -->
	<div class="div2" style="margin-top: 100px;">
		<div class="txt">
			<div class="title">이름</div>
			<div id="name">${dto.name}</div>
		</div>
		<div class="txt">
			<div class="title">아이디</div>
			<div id="id">${dto.id}</div>
		</div>
		<div class="txt">
			<div class="title">이메일</div>
			<div id="email">${dto.email}</div>
		</div>
		<div class="txt">
			<div class="title">비밀번호</div>
			<button type="button" class="btn_pw" id="btn_pw">비밀번호 재설정</button>
		</div>
		
		<div class="txt">
			<div class="title">닉네임</div>
			<div id="nickname">
				<input class="nicktxt" id="nicktxt" type="text" name="nickname" value="${dto.nickname}"
				style="widows: 100px;">
				<button type="button" class="btn_nick" id="btn_nick">닉네임 중복확인</button>
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">주소</div>
			<div id="address">
				<input class="input" type="text" name="address" value="${dto.address}">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">연락처</div>
			<div id="contact_number">
				<input class="input" type="text" name="contact_number" value="${dto.contact_number}">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">생년월일</div>
			<input class="input" name="birth" value="${dto.birth}" type="date">
		</div>
		
		<div class="sub_title">추가정보입력(선택사항)</div>
		<div class="txt">
			<div class="title">연령</div>
			<div class="ageselect">
				<input type="hidden" id="age" name="age" value="${dto.age}">
				<select class="ageoption">
					<option value="10-" <c:if test="${dto.age=='10-'}">selected="selected"</c:if>>10대-</option>
					<option value="20" 	<c:if test="${dto.age=='20'}">selected="selected"</c:if>>20대</option>
					<option value="30" 	<c:if test="${dto.age=='30'}">selected="selected"</c:if>>30대</option>
					<option value="40" 	<c:if test="${dto.age=='40'}">selected="selected"</c:if>>40대</option>
					<option value="50" 	<c:if test="${dto.age=='50'}">selected="selected"</c:if>>50대</option>
					<option value="60+" <c:if test="${dto.age=='60+'}">selected="selected"</c:if>>60대+</option>
				</select>
			</div>
		</div>
		
		<div class="txt">
			<div class="title">직업</div>
			<div id="job">
				<input class="input" type="text" name="job" value="${dto.job}">
				<span class="underline"></span>
			</div>
		</div>
		<div class="txt">
			<div class="title">관심분야</div>
			<input class="tag" id="hobby1" type="text" name="hobby1" value="${dto.hobby1}">
			<input class="tag" id="hobby2" type="text" name="hobby2" value="${dto.hobby2}">
			<input class="tag" id="hobby3" type="text" name="hobby3" value="${dto.hobby3}">		
		</div>
		<div class="txt">
			<div class="title">한줄소개</div>
		</div>
		<div>
			<textarea name="pr" id="pr" placeholder="한 줄 소개를 입력하세요">${dto.pr}</textarea>
		</div>
		
		<button type="submit" class="btn_update">회원정보수정</button>
	</div>
</div>
</form>

<!--  비밀번호 확인 모달창 -->
<div id="modal-wrapper">
  <div id="modal-overlay"></div>
  <div id="modal-content">
  	<div style="margin-bottom: 10px;">현재 비밀번호를 입력해 주세요.</div>
  	<div class="pwchecktxt" style="margin-bottom: 10px;">
  		<input class="inputpw" type="text" value="">
  		<i class="glyphicon glyphicon-eye-close" id="pwtoggle" style="font-size: 16pt; color: #999999"></i>
  	</div>
  	<div>
  		<button class="btn_pw" id="pwcheckbtn" type="button" style="float: right;">비밀번호 확인</button>
  	</div>
  </div>
</div>
</body>

</html>