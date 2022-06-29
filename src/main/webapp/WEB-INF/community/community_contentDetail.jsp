<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Hubballi&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root }/css/community/community_detail_normal_login.css">
<title>Insert title here</title>
<style type="text/css">
div.main {
background-color: #fff !important;
}
span.adel{
cursor: pointer;
}

</style>

<script type="text/javascript">
$(function(){
	
	community_idx=$("#c_idx").val();
  	loginOK="${sessionScope.loginOK}";
  	userKey="${sessionScope.userKey}"; 
	list();
	
	 $(".subjecttextbox").click(function(){
		//var i=$(this).val();
		//alert(i);
		
		$(this).val("");
		
	}); 
	
	 $(".commenttext").click(function(){
		//var i=$(this).val();
		//alert(i);
		
		$(this).val("");
		
	}); 
	
	$(".contenttextarea").click(function(){
		//var i=$(this).val();
		//alert(i);
		
		$(this).val("");
		
	}); 
  	
	/* 댓글 ajax */	
	$("#btncommentadd").click(function() {
		var content=$("#content").val();
		if(content.trim().length==0){
			alert("내용을 입력해주세요.");
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "text",
			url: "commentinsert",
			data:{"community_idx":community_idx, "content": content},
			success:function(data){
				list();
				$("#content").val("");
			},
			error : function(request, error) {
				alert("fail!");
				alert("code:" + request.status + "\n"+ "error message:" + request.responseText+ "\n" + "error:" + error);
			}	
		});  
	}); 
	
	/* 추천수 증가 */
	
	$("#btnthumb").click(function() {
		
		var idx=$("#c_idx").val();
		
		var b=confirm("게시글을 추천하시겠습니까?");
		
		if(b){
		$.ajax({
			type:"post",
			dataType:"html", //return값 없을땐 text!
			url:"likecount",
			data:{"community_idx":idx},
			success:function(data){
		
			alert("추천 됐습니다.");
			$("span.likes").html(data);
			},
			error : function(request, error) {
				alert("fail!");
				alert("code:" + request.status + "\n"+ "error message:" + request.responseText+ "\n" + "error:" + error);
			}
		});
		}
	});
	
	
});

/* 댓글 삭제 */
$(document).on("click","span.adel",function(){
		
		var idx=$(this).attr("idx");
		/* alert(idx); */
		
		var a=confirm("해당 댓글을 삭제하시겠습니까?");
		
		if(a){
			$.ajax({
				type:"get",
				dataType:"text", //return값 없을땐 text!
				url:"deletecomment",
				data:{"community_comment_idx":idx},
				success:function(data){
					list();
				alert("삭제 됐습니다.");
				}
			});
		}	
	});
		

/* 댓글 리스트 출력 */
function list() {
	 $.ajax({
			type:"get",
			dataType:"json",
			url:"commentlist",
			data:{"community_idx":community_idx},
			success:function(data){
				$("span.textsms").text(data.length); //댓글 개수
				
				var s="";
				$.each(data,function(i,cm_dto){
					
					s+="<div>";
					s+="<img alt='' src='${root }/element/icon_profile.png'>";
					s+="<span class='commentuser'>"+cm_dto.member_idx+"</span>";
					s+="<input type='text' class='commentwritetext' value='"+cm_dto.content+"' readonly='readonly'>";
					s+="<br>";
					s+="<span class='commentwriteday'>"+cm_dto.write_day+"</span>";
					
					
					if(loginOK=="yes" && userKey==cm_dto.member_idx){
						s+="<span class='glyphicon glyphicon-pencil amod' id='amod' idx='"+cm_dto.community_comment_idx+"'></span>";
						s+="&nbsp;";
						s+="<span class='glyphicon glyphicon-trash adel' id='adel' idx='"+cm_dto.community_comment_idx+"'></span>";
					}
					
					s+="</div>";
				});
				
				$("div.commentdiv").html(s);
			}
		});  
}

/* 게시글 삭제시 컨펌창 */
function delcontent() {
	var c_idx=$("#c_idx").val();
	var currentPage=$("#currentPage").val();
	
	if(confirm("게시글을 삭제하시겠습니까?")){
		location.href='del_content?community_idx='+c_idx+'&currentPage='+currentPage;
	}
}

/* 비회원 댓글 등록 제한 */
function writecomment() {
	alert("댓글 쓰기는 로그인 후 이용 가능합니다.");
}


</script>
</head>
<body>
<div class="container">
<input type="hidden" value="${c_dto.community_idx }" id="c_idx">	
<input type="hidden" value="${currentPage }" id="currentPage">
<input type="text" value="${c_dto.content_type }" id="content_type">
<div class="detailsubject" style="border: 0px solid black;">
	<%--글번호 받아오기 --%>
	<span class="contentnum">#<span id="delnum"> ${c_dto.community_idx } </span></span>
	<!-- qna글 일 경우 -->
	<c:if test="${c_dto.content_type==1 }">
		<div class="tag" style="border: solid 0px #dbdbdb;">
			<span class="badge" style="font-size: 1.1em; float: left; background-color: black;">#Q&A</span>
		</div>
	</c:if>
	
	<%--태그1 받아오기 --%>
	<div class="tag" style="border: solid 0px #dbdbdb;">
	<span class="badge" style="font-size: 1.1em; float: left;">#${c_dto.tag1 }</span>
	</div>
	
	<%--태그2 받아오기 --%>
	<div class="tag" style="border: solid 0px #dbdbdb;">
	<span class="badge" style="font-size: 1.1em; float: left;">#${c_dto.tag2 }</span>
	</div>
	
	<%--태그3 받아오기 --%>
	<div class="tag" style="border: solid 0px #dbdbdb;">
	<span class="badge" style="font-size: 1.1em; float: left;">#${c_dto.tag3 }</span>
	</div>
	
	</div>
	<%--글작성일 받아오기 --%>
	<span class="writeday"> <fmt:formatDate value="${c_dto.write_day }" pattern="yyyy-MM-dd"/> 작성 </span>
	

	<div class="content" style="border: solid 1px #dbdbdb; border-top: solid 2px black; border-bottom: solid 2px black;">
		
		<!--게시글 삭제,수정 버튼 -->
		<c:if test="${sessionScope.loginOK!=null and sessionScope.userKey==c_dto.member_idx}">
			<button type="button" class="btndel glyphicon glyphicon-remove" style="border: none; background-color: #fff" onclick="delcontent()"></button>
			<span class="writeicon"><img alt="" src="${root }/element/icon_writecontent_small.png"> </span>
		</c:if>	
	
	<%--작성자 및 프로필 사진 받아오기 --%>
	<div class="contentname">
	<span><img alt="" src="${root }/element/icon_profile.png"></span>
	<span class="spanwriter">${writer }</span>
	
	<%--팀명 받아오기 --%>
	<div class="teamname">
		<span class="spanteamname">싹스리</span>
	</div>
	</div>
	
	<%--글 제목 받아오기 --%>
	<div class="contentsubject">
		${c_dto.subject }
	</div>
	
	<%--글 내용 받아오기 --%>
	<div class="contentarea">
		${c_dto.content }
	</div>
	
	<%--각 count값 받아오기 --%>
	<div class="iconcount">
		<span><img alt="" src="${root }/element/icon_textsms.png"><span class="textsms"></span> </span>
			<button type="button" id="btnthumb" style="border: none; background-color: #fff;">
				<img alt="" src="${root }/element/icon_thumb.png">
			</button> 
			<span class="likes"> 
				${c_dto.like_count}
			</span>
		
		<span><img alt="" src="${root }/element/icon_visibil.png">&nbsp;&nbsp;${c_dto.read_count }</span>
	</div>
	
	</div>
	
	<div class="addcomment" style="border: solid 1px #dbdbdb;">
	
	
	<!-- 댓글쓰기 버튼 -->
		<c:if test="${sessionScope.loginOK!=null }">
			<input type="text" placeholder="댓글을 입력하세요" class="commenttext" id="content" >
			<button type="button" class="btn-small" id="btncommentadd">댓글등록</button>
		</c:if>
	
		<c:if test="${sessionScope.loginOK==null }">
			<input type="text" value="댓글을 입력하세요" class="commenttext">
			<button type="button" class="btncommentadd2 btn-small" onclick="writecomment()">댓글등록</button>
		</c:if>
	</div>
	<c:if test="${c_dto.content_type==0 }">
		<div class="commentdiv" style="border: solid 1px #dbdbdb;">
	
		</div>
	</c:if>
	
	<c:if test="${c_dto.content_type==1 }">
		<div class="commentdiv2" style="border: solid 1px #dbdbdb;">
			<c:forEach var="i" begin="1" end="1">
				<div>
					<img alt="" src="${root }/element/icon_profile.png">
					<span class="commentuser">유저1</span>
		
					<br>
					<span class="commentwriteday">2022-06-14 05:03</span>
					<textarea rows="" cols="" class="cocomment" readonly="readonly" style="resize: none;">??</textarea>
					<img alt="" src="${root }/element/button_selection.png" class="selectionbtn">
				</div>
			</c:forEach>
		</div>
 	</c:if>
 
 </div>
      
</body>
</html>