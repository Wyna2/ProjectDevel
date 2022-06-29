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
	
</script>


<title>Insert title here</title>
</head>
<body>
	<form action="crewinsert" method="post">
		<div class="container">

			<span class="crew">크루 등록</span>
			<div class="box">


				<span class="crew_name">크루 이름</span>
				<input type="text" value="${userKey }" name="userKey">

				<div class="wrapper">
					<input type="text" class="input" name="name"
						placeholder="크루 이름을 입력하세요" required="required"
						style="width: 360px;"> <span class="underline"></span>
				</div>

				<br> <span class="crew_color">크루 색상</span>

				<table>
					<tr>
						<td class="text1"><div style="padding-bottom: 10px;">상품
								색상</div></td>
						<td class="text2">
							<div id="colorbox">
								<input type="text" hidden="" class="color" name="color" value="">

								<div style="background-color: #191919;">
									<input type="text" hidden="" value="블랙">
								</div>
								<div style="background-color: #dbdbdb;">
									<input type="text" hidden="" value="회색">
								</div>
								<div style="background-color: #5172de;">
									<input type="text" hidden="" value="블루">
								</div>
								<div style="background-color: #ffd93d;">
									<input type="text" hidden="" value="노랑">
								</div>
								<div style="background-color: #72138e;">
									<input type="text" hidden="" value="보라">
								</div>
								<div style="background-color: #ffffff;">
									<input type="text" hidden="" value="흰색">
								</div>
								<div style="background-color: #f62020;">
									<input type="text" hidden="" value="빨강">
								</div>
								<div style="background-color: #095a19;">
									<input type="text" hidden="" value="초록">
								</div>
								<div style="background-color: #541f1f;">
									<input type="text" hidden="" value="갈색">
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="text1"></td>
						<td class="text2">
							<div id="colorboxname" style="margin-top: -7px;">
								<span>블랙</span> <span>회색</span> <span>블루</span> <span>노랑</span>
								<span>보라</span> <span>흰색</span> <span>빨강</span> <span>초록</span>
								<span>갈색</span>
							</div>
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