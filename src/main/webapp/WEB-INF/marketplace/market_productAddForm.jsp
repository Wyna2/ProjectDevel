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

<!-- css  -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root }/css/marketplace/market_productaddform.css">

<title>DEVEL :: 상품 등록</title>
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
        $("span.category_placeholder").css("color", "#505050");
    });
    /*End Dropdown Menu*/
    
 
    // 업로드 된 파일명
   $("#photos").on("change",function(){
      fileName=$("#photos")[0].files;
       fileList="";
      // 최대 업로드 이미지 수 제한
      if(fileName.length>5){
         alert("이미지는 최대 5장까지 첨부 가능합니다!!!");
         return false;
      }
      var vaildchk=1;      // 유효성 검증 값
       for(i=0; i<fileName.length; i++){
          if(checkFileName(fileName[i].name)==true) {      // 파일명 검증
             fileList +=fileName[i].name+", ";
          } else {
             vaildchk=0;      // 유효성 검증 실패
             break;
          }
       }
       if(vaildchk==1) {
          fileList=fileList.slice(0, -2);
         $("input.filename_list").val(fileList);
       } else {   // vaildchk==0 
          fileList="";
         $("input.filename_list").val("파일명(확장자)를 확인 후 재업로드 해주세요");
       }
   });
    
    
    /* 색상 선택시 rgb값 받아오기 */
	$("#colorbox div").click(function() {

		$(".color").val($(this).children().val());

		$(this).css("border", "3px solid #ff4b4e");
		$(this).siblings().css({"border": "1px solid black"});
 	});

    /* 연령대 선택 하지 않았을 경우 페이지 이동 방지 스크립트 추가하기 */
});

//파일명 검증
function checkFileName(str){
    var ext=str.split(".").pop().toLowerCase();
    var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if($.inArray(ext, ["bmp","jpg","png","jpeg","gif"]) == -1) {    // 파일 확장자 체크
       //alert(ext);
        alert("이미지 파일만 업로드 가능합니다.\n(업로드 가능 확장자: jpg, png, bmp, gif)");
        return false;
    } else if(pattern.test(str)){    // 파일명에 특수문자 체크
        alert("파일명에 특수문자를 제거해주세요.");
        return false;
    } else {
       return true;
    }
 }
</script>

</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">

<input type="hidden" name="member_idx" value="${userKey}">

<div class="title">
상품등록
</div>
<div class="container">	
 	<div class="box">
 		<table class="text" >
 			<tr>
 				<td class="text1"> <div style="padding-bottom: 20px;">분류</div></td>
	 			<td class="text2">
	 		<div class="wrapper">
          
               <div class="dropdown">
                  <div class="select" style="margin-top: -5px;">
                     <span class="category_placeholder" >
                     <div>카테고리를 선택하세요</div>
                     </span>
                     <i class="fa fa-chevron-left"></i>
                  </div>
                  <input type="hidden" name="category" value="empty">
                  <ul class="dropdown-menu">
                     <li id="notebook"><b>IT전자기기</b> / 노트북</li>
                     <li id="monitor"><b>IT전자기기</b> / 모니터</li>
                     <li id="keyboard"><b>IT전자기기</b> / 키보드</li>
                     <li id="mouse"><b>IT전자기기</b> / 마우스</li>
                     <li id="speaker"><b>IT전자기기</b> / 스피커</li>
                     <li id="goods"><b>IT사무용품</b></li>
                     <li id="book"><b>IT도서</b></li>
                  </ul>
               </div>
            </div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"> <div style="padding-bottom: 20px;">브랜드명</div></td>
	 			<td class="text2">
	 				<div class="wrapper">
           				 <input type="text" class="input" name="brandname" 
           				 placeholder="브랜드명을 입력하세요" required="required" style="width: 440px;">
           				 <span class="underline"></span>
					</div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"><div style="padding-bottom: 20px;">상품명</div></td>
	 			<td class="text2">
	 				<div class="wrapper">
           				 <input type="text" class="input" name="subject" 
           				 placeholder="상품명을 입력하세요" required="required" style="width: 440px;">
           				 <span class="underline"></span>
					</div>
	 			</td>
 			</tr>
 			
 			<tr>
 				<td class="text1"><div style="padding-bottom: 20px;">상품 사진</div></td>
	 			<td class="text2">
	 				<div class="filebox" style="padding-bottom: 15px;">
                    	<input class="filename_list" placeholder="이미지를 첨부하세요(최대 5장까지 가능)"
                    	style="margin-left: 60px; outline: none;" readonly="readonly">
                       	<label for="photos">업로드</label> 
                        <input type="file" value="첨부파일" id="photos" name="photos"
                        style="width: 520px;" multiple="multiple">
             	 	 </div>
	 			</td>
 			</tr>
 			
 			<tr>
 				<td class="text1"><div style="padding-bottom: 20px;">상품원가</div></td>
	 			<td class="text2">
	 				<div class="wrapper">
           				 <input type="text" class="input" name="original_price" 
           				 placeholder="상품원가를 숫자만 입력하세요(ex. 20000)" required="required" style="width: 440px;">
           				 <span class="underline"></span>
					</div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"><div style="padding-bottom: 20px;">상품 판매가</div></td>
	 			<td class="text2">
	 				<div class="wrapper">
           				 <input type="text" class="input" name="price" 
           				 placeholder="상품판매가를 숫자만 입력하세요(ex. 50000)" required="required" style="width: 440px;">
           				 <span class="underline"></span>
					</div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"><div style="padding-bottom: 10px;">상품 색상</div></td>
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
 				<td class="text1" ></td>
 				<td class="text2" >
 					<div id="colorboxname" style="margin-top: -7px;">
 						<span>블랙</span>
 						<span>회색</span>
 						<span>블루</span>
 						<span>노랑</span>
 						<span>보라</span>
 						<span>흰색</span>
 						<span>빨강</span>
 						<span>초록</span>
 						<span>갈색</span>
 					</div>
 				</td>
 			</tr>	
 			
			<tr>
				<td colspan="2">
				<div class="wrapper_textarea" style="margin-top: 15px;">
               <div style="position:relative; margin-bottom: 15px; font-size:16px; font-weight: 500; color: #505050;" >상품 설명</div>
               <textarea class="select" style="resize: none;" name="content"
               placeholder="판매할 상품에 대한 정보를 입력해주세요.&#13;&#10;상세하게 작성할 수록 새로운 주인을 찾기 쉬워요!"></textarea>
               <div style="font-size:12px; letter-spacing :-0.1em; position: relative; margin-bottom: 10px; color: #505050">
               </div>
          		 </div>
          		</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: right;">		
					<button type="submit" class="btn-large">상품등록</button>
				</td>
			</tr>
 		</table>
 	</div>	
</div>
</form>

</body>
</html>