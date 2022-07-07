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
<link rel="stylesheet" type="text/css" href="${root }/css/community/community_contentaddform.css">

<title>DEVEL :: 작성글 수정</title>
<script type="text/javascript">
$(function () {
	//'글 유형-자유'가 기본값으로 '질문작성' 폼 숨기기
	$("#textarea_qna").hide();	
	
	// 업로드 된 파일명
	$("#file").on("change",function(){
		fileName=$("#file")[0].files;
	    fileList="";
		// 최대 업로드 이미지 수 제한
		if(fileName.length>5){
			alert("이미지는 최대 5장까지 첨부 가능합니다.");
			return false;
		}
		var vaildchk=1;		// 유효성 검증 값
	    for(i=0; i<fileName.length; i++){
	    	if(checkFileName(fileName[i].name)==true) {		// 파일명 검증
	    		fileList +=fileName[i].name+", ";
	    	} else {
	    		vaildchk=0;		// 유효성 검증 실패
	    		break;
	    	}
	    }
	    if(vaildchk==1) {
		    fileList=fileList.slice(0, -2);
			$("input.filename_list").val(fileList);
	    } else {	// vaildchk==0 
	    	fileList="";
			$("input.filename_list").val("파일명(확장자)를 확인 후 재업로드 해주세요");
	    }
	});
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

//라디오 버튼 선택에 따라 본문 textarea 노출 
function setContentType(){
	if($("input:radio[id=contentType_normal]").is(":checked")){
    	$("#textarea_common ").attr("placeholder", "본문 내용을 입력하세요");
		$("#btn_submit").html("등록하기");
    } else if($("input:radio[id=contentType_qna]").is(":checked")){
    	$("#textarea_common").attr("placeholder", "질문 내용을 입력하세요.\n상세하게 작성할수록 명쾌한 답변을 얻을 수 있습니다.");
        $("#btn_submit").html("질문하기");
    }
}
</script>
<style type="text/css">
	div.wrapper div{
	font-family: 'Noto Sans KR';
	font-size: 16px;
	margin-top: 14px;
	color: #767676;
	}
</style>
</head>
<body>
<form action="update" method="post" enctype="multipart/form-data">
<input type="hidden" value="${c_dto.member_idx }" name="member_idx">
<input type="hidden" name="community_idx" value="${c_dto.community_idx }">
<input type="hidden" name="currentPage" value="${currentPage }">
<div class="title">
작성글 수정
</div> 
 
 <div class="container">	
 	<div class="box">
 		<table class="text">
 			<tr>
 				<td class="text1"> <div style="padding-bottom: 20px; width: 95px;">글 유형</div></td>
	 			<td colspan="3" class="text2">
	 				<div class="wrapper">
	 					<div>글 유형은 변경이 불가합니다.</div>
            		</div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"> <div style="padding-bottom: 20px;">태그</div></td>
	 			<td class="text2">
	 				<div class="wrapper" style="width: 270px;">
					#&nbsp;<input type="text" class="input" name="tag1" placeholder="Tag1" required="required" style="width: 75px;" maxlength="4" value="${c_dto.tag1 }"> 
					<span class="underline" style="margin-left: 11px; width: 75px;"></span>
					#&nbsp;<input type="text" class="input" name="tag2" placeholder="Tag2" style="width: 75px;" maxlength="4" value="${c_dto.tag2 }"> 
					<span class="underline" style="margin-left: 100px; width: 75px;"></span>
					#&nbsp;<input type="text" class="input" name="tag3" placeholder="Tag3" style="width: 75px;" maxlength="4" value="${c_dto.tag3 }"> 
					<span class="underline" style="margin-left: 189px; width: 75px;"></span>
				</div>
	 			</td>
	 			
	 			<td class="text1"><div style="padding-bottom: 20px; width: 70px; margin-left: 50px;">작성자</div></td>
	 			<td>
	 				<div class="wrapper">
           				 <input type="text" class="input" name="writer" readonly="readonly" value="${userNickname }" style="width: 120px;">
           				 <span class="underline" style="width: 120px; "></span>
					</div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"><div style="padding-bottom: 20px;">제목</div></td>
	 			<td colspan="3" class="text2">
	 				<div class="wrapper">
           				 <input type="text" class="input" name="subject" placeholder="제목을 입력하세요" required="required" style="width: 520px;" value="${c_dto.subject }">
           				 <span class="underline"></span>
					</div>
	 			</td>
 			</tr>
 			<tr>
 				<td class="text1"><div style="padding-bottom: 20px;">이미지 첨부</div></td>
	 			<td colspan="3" class="text2" style="padding-bottom: 10px;">
	 				<div class="filebox">
	 					 <input class="filename_list" style="margin-left: 10px; outline: none;" value="업로드 버튼으로 이미지를 첨부하세요" readonly="readonly">		
           				 <label for="file">업로드</label> 
           				 <input type="file" value="첨부파일" id="file" name="upload" style="width: 520px;" multiple="multiple">
					</div>
	 			</td>
 			</tr>
			<tr>
				<td colspan="4">
					<div class="wrapper_textarea" id="textarea_normal"  style="margin-top: 15px;">
						<div style="position:relative; margin-bottom: 15px; font-size:16px; font-weight: 500; color: #505050;" >본문</div>
						<textarea class="select" id="textarea_common" name="content" style="resize: none;" placeholder="본문 내용을 입력하세요">${c_dto.content }</textarea>
						<div style="font-size:12px; letter-spacing :-0.1em; position: relative; margin-bottom: 10px; color: #505050">
						</div>
	          		</div>
          		</td>
			</tr>
			
			<tr>
				<td colspan="4" style="text-align: right;">
					<button type="button" class="btn-large2" style="margin-right: 20px;" onclick="location.href='/community'">뒤로가기</button>
					<button type="submit" class="btn-large1" id="btn_submit" style="margin-right: 230px;">수정하기</button>
				</td>
			</tr>

 		</table>
 	</div>	
 </div> 
</form> 
</body>
</html>