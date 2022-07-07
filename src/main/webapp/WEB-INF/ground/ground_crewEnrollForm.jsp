<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="root" value="<%=request.getContextPath()%>" />
<link rel="stylesheet" type="text/css"
	href="${root }/css/ground/enroll.css">


<script type="text/javascript">
/*  크루명정규식 체크, 중복 닉네임 검증: ajax */
$(function () {
 $("#nameCheck").click(function() {
 	//alert("111");
 	var inputCrewname= $("#name").val();
			var crewnameCheck = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,6}$/g.test(inputCrewname);
			if(!crewnameCheck) {
				alert("크루명은 2~6자의 한글, 영문, 숫자만 사용 가능합니다.");
				$("#name").focus();
			} else {
				$.ajax({
					type : "get",
					dataType : "json",
					url : "crewnamecheck",
					data : {"name" : inputCrewname},
					success : function(data) {
						if(inputCrewname=="") {	// 아무것도 입력하지 않았을 경우
							alert("사용할 크루명을 입력해주세요.");
							$("#name").focus();
						} else {
							if (data.vaildCrewname == 0) {
								alert("사용 가능한 크루명 입니다.");
								$("#name_check").val(inputCrewname);
							} else {
								alert("이미 사용 중인 크루명 입니다.\n다른 크루명을 입력해주세요.");
								$("#name_check").val("");
								$("#name").focus();
							}
						}
					},
					error : function(request, error) {
						alert("fail!");
						alert("code:" + request.status + "\n"+ "error message:" + request.responseText+ "\n" + "error:" + error);
					}
				});
			}
 });
		
			
		
});

function checkPass(form) {
	if($("#name").val()!==$("#name_check").val() || $("#name").val()=="" || $("#name_check").val()=="") {
		alert("크루명 중복확인이 필요합니다.");
		return false;
	}
	if(form.color.value=="") {
		alert("크루 색상 선택이 필요합니다.");
		return false;
	}
	
	$("#name").val("");
}
</script>


<title>DEVEL :: 크루 생성</title>
</head>
<body>
	<form action="crewinsert" method="post" onsubmit="return checkPass(this)">
		<div class="container">

			<span class="crew">크루 등록</span>
			<div class="box">


				<span class="crew_name">크루 이름</span>
				<input type="hidden" value="${userKey }" name="userKey">

				<div class="wrapper" style="margin-left: -50px;">
					<input type="text" class="input" name="name_check" id="name"
						placeholder="크루 이름을 입력하세요" required="required"
						style="width: 360px;"> <span class="underline" style="margin-left: -50px;"></span>
				<input type="hidden" class="input" name="name" id="name_check">
				</div>
				
				<button type="button" class="btn-small" id="nameCheck" style="position: absolute; top:52px; left:580px; margin: 10px 0 0 10px;">중복확인</button>

				<br> <span class="crew_color">크루 색상</span>

				<table>
					<tr>
						<td class="text1"><div style="padding-bottom: 10px;">상품
								색상</div></td>
						<td class="text2">
							<div id="colorbox">
								<input type="text" hidden="" class="color" name="color" value="">

								<div style="background-color: #191919;">
									<input type="text" hidden="" value="#191919">
								</div>
								<div style="background-color: #dbdbdb;">
									<input type="text" hidden="" value="#dbdbdb">
								</div>
								<div style="background-color: #99CCFF;">
									<input type="text" hidden="" value="#99CCFF">
								</div>
								<div style="background-color: #FFFACD;">
									<input type="text" hidden="" value="#FFFACD">
								</div>
								<div style="background-color: #DDA0DD;">
									<input type="text" hidden="" value="#DDA0DD">
								</div>
								<div style="background-color: #ffffff;">
									<input type="text" hidden="" value="#ffffff">
								</div>
								<div style="background-color: #FFAFB0;">
									<input type="text" hidden="" value="#FFAFB0">
								</div>
								<div style="background-color: #7fffd4;">
									<input type="text" hidden="" value="#7fffd4">
								</div>
								<div style="background-color: #f4a460;">
									<input type="text" hidden="" value="#f4a460">
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="text1"></td>
						<td class="text2">
							
						</td>
					</tr>
				</table>

				<br> <span class="crew_pr">크루 소개  </span> 
				
				
				
			<div class="wrapper">
					<textarea class="info" name="info" style="resize: none;" placeholder="50자 이내"></textarea>
					<div id="text_iii" style="font-size:12px; letter-spacing :-0.1em; position: relative; margin-bottom: 65px; color: #505050">
					* 운영정책에 위배되는 내용 기입 시 서비스 이용이 제한될 수 있습니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="realByte">0 / 190 byte</span></div>
					
				</div>

				<button type="submit" class="btn-large">
					<span class="crew_enroll_btn">크루 등록</span>
				</button>


			</div>
		</div>
	</form>
	<script type="text/javascript">
	/* 색상 선택시 rgb값 받아오기 */
	$("#colorbox div").click(function() {

		$(".color").val($(this).children().val());

		$(this).css("border", "3px solid #ff4b4e");
		$(this).siblings().css({"border": "1px solid black"});
 	});
	
	$(document).ready(function() {
	$(".info").keyup(function(event){
		console.log('sssss');
		   var maxByte = 190; //최대 입력 바이트 수
		   var str = $(".info").val();
		   var str_len = str.length; //입력한 길이

		   var rbyte = 0;
		   var rlen = 0;
		   var one_char = "";
		   var str2 = "";
		   console.log(rbyte);
		   for (var i = 0; i < str_len; i++) {
		       one_char = str.charAt(i);

		       if (escape(one_char).length > 4) {
		           rbyte += 2; //한글2Byte
		       } else {
		           rbyte++; //영문 등 나머지 1Byte
		           
		       }
		       console.log(rbyte);

		       if (rbyte <= maxByte) {
		           rlen = i + 1; //return할 문자열 갯수
		       }
		   }
		   console.log(rbyte);

		   $("#realByte").text(rbyte + ' / 190byte');	         
		   if (rbyte > maxByte) {
		       alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		       str2 = str.substr(0, rlen); //문자열 자르기
		       $("#realByte").text('190 / 190byte');
		       //$("#DS_CONT").val(str2);
		       //fnChkByte( maxByte);
		   } 
		});

	});

	
	</script>
</body>
</html>