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
<title>DEVEL :: ${c_dto.subject }</title>


<style type="text/css">
div.main {
background-color: #fff !important;
}
span.adel{
cursor: pointer;
}

button.btndel{
	float:right;
	font-size: 13pt;
}
</style>

<script type="text/javascript">
/* container의 내용의 높이에 따라 div.container 높이 자동 조절 */
$(document).ready(function() {
	var childHeight = $("div.commentdiv2").height()+800;
	   //alert(childHeight);      // (영역 높이+100) 값 출력
	    $('div.main').css({'height':childHeight+'px'});
});
</script>

<script type="text/javascript">
/* 뒤로가기(history.back()) 감지 시 메인 페이지 이동 */
window.onpageshow = function(event) {
    if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	var currentPage=$("#currentPage").val();
       location.href="/community?currentPage="+currentPage;
    }
}

$(function(){
	c_type=$("#content_type").val(); 
	community_idx=$("#c_idx").val();
	c_currentPage="${sessionScope.c_currentPage}";
  	loginOK="${sessionScope.loginOK}";
  	userKey="${sessionScope.userKey}"; 
	if(c_type==0){
		list();
	} else {
		list_q();
	}
  		
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
				$("#content").val("");
				location.href="contentdetail?community_idx="+community_idx+"&c_currentPage=1";
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
			}			
		});
		}
	});
	
	/* scrap 이벤트 */      
	   <%--커뮤니티 상세페이지 scrap 이벤트--%>
	if(${userKey!=null}) {
	   $('.chscrap').on("change", function(){
	      if($(this).is(':checked'))
	      {                        
	         let community_idx = ${c_dto.community_idx };
	         let scrap_count = 1;
	         
	         $.ajax({
	            type: "post",
	            url: "communityScrapDetail.event",
	            data: {
	               "community_idx":community_idx,
	               "scrap_count":scrap_count,
	               },
	            success: function(data) {
	            	document.location.reload(true);
	            	
	            }
	         });
	         //스크랩
	         $(this).siblings('.scrap').attr('src','${root }/element/icon_scrap_red.png');
	         alert("해당 게시글이 스크랩 되었습니다.");
	      } else {
	         let community_idx = ${c_dto.community_idx };
	         let scrap_count = 0;
	         
	         $.ajax({
	            type: "post",
	            url: "communityScrapDetail.event",
	            data: {
	               "community_idx":community_idx,
	               "scrap_count":scrap_count,
	               },
	            success: function(data) {
	               document.location.reload(true);
	               alert("성공");
	            }
	         });
	         //하트 바뀜
	         $(this).siblings(".scrap").attr("src","${root }/element/icon_scrap.png");
	         alert("스크랩이 해제되었습니다.");
	      }
	   });
	   }
});

/* 댓글 삭제 */
$(document).on("click","span.adel",function(){
		var idx=$(this).attr("idx");
		var a=confirm("해당 댓글을 삭제하시겠습니까?");
		
		if(a){
			$.ajax({
				type:"get",
				dataType:"text", //return값 없을땐 text!
				url:"deletecomment",
				data:{"community_comment_idx":idx},
				success:function(data){
					alert("삭제 됐습니다.");
					if(c_type==0){
						list();
					} else {
						list_q();
					}
				}
			});
		}	
	});


/* Q&A 댓글 삭제 */
$(document).on("click","span.q_adel",function(){
		var idx=$(this).attr("idx");
		var a=confirm("해당 댓글을 삭제하시겠습니까?");
		
		if(a){
			$.ajax({
				type:"get",
				dataType:"text", //return값 없을땐 text!
				url:"deletecomment",
				data:{"community_comment_idx":idx},
				success:function(data){
					alert("삭제 됐습니다.");
					if(c_type==0){
						list();
					} else {
						list_q();
					}
				}
			});
		}	
	});
	
/* 일반 댓글 페이징 처리 */
function list() {
	 $.ajax({
			type:"get",
			dataType:"json",
			url:"contentdetailcomment",
			data:{"community_idx":community_idx,"c_currentPage":c_currentPage,"content_type":c_type},
			success:function(data){
				var count=data;
				var data_length=JSON.stringify(data);
				var s="";
				
				$.each(data.commentlist,function(i,cm_dto){	
					s+="<div class='commentarea'>";
					s+="<img alt='' src='${root }/element/icon_profile.png' class='userimg'>";
					s+="<span class='commentuser'>"+cm_dto.comment_writer+"</span>";
					s+="<input type='text' class='commentwritetext' value='"+cm_dto.content+"' readonly='readonly' style='outline : none;'>";
					s+="<br>";
					s+="<span class='commentwriteday'>"+cm_dto.write_day+"</span>";
					s+="</div>";
					
					if(loginOK=="yes" && userKey==data.commentlist[i].member_idx){
						s+="<div class='trashdiv'>";
						s+="<span class='glyphicon glyphicon-trash adel' id='adel' idx='"+data.commentlist[i].community_comment_idx+"'></span>";
						s+="</div>";
					} else {
						s+="<div class='trashdiv'>";
						s+="<span class='adel' id='adel'><br></span>"
						s+="</div>";
					}	
				});
				$("div.commentdiv").html(s);
			
			     var p="";
				 p+="<div class='pagesort'>";
				 		 
				 if(eval(data.totalCount>0)) {
				    p+="<div class='page' align='center' style='margin-top: 50px; border: 0px solid black;'>"; 
				    	 if(eval(data.startPage>1)) {
				    		//console.log("test:::")
				    		p+="<a id='pagelbtn' href='contentdetail?community_idx=92&c_currentPage="+eval(data.startPage-1)+"'>";
				    		p+="<img id='pagebtn' src='${root }/activity/icon_activity_move2.png'></a>";
				    	} 
				    	
					    for(var pp=eval(data.startPage);pp<=eval(data.endPage); pp++) {
					    	if(eval(data.c_currentPage)==pp) {
					    		p+="<a id='pagecnum' href='contentdetail?community_idx="+data.commentlist[0].community_idx+"&c_currentPage="+pp+"'><b>"+pp+"</b></a>";
					    	}
					    	if(eval(data.c_currentPage)!=pp) {
					    		p+="<a id='pagenum' href='contentdetail?community_idx="+data.commentlist[0].community_idx+"&c_currentPage="+pp+"'>"+pp+"</a>";
					    	}
					    }
				    	if(eval(data.endPage<data.totalPage)) {  		
					   		p+="<a id='pagerbtn' href='contentdetail?community_idx="+data.commentlist[0].community_idx+"&c_currentPage="+eval(data.endPage+1)+"'>";
					    	p+="<img id='pagebtn' src='${root }/activity/icon_activity_move1.png'></a>";
				    	}
					    	p+="</div></div>";  
				   }
				    //alert(p);
				$("div.pagesort1").html(p);
			}
		});  
}
/* qna 댓글 페이징 처리 */
function list_q() {
	$.ajax({
		type:"get",
		dataType:"json",
		url:"contentdetailcomment",
		data:{"community_idx":community_idx,"c_currentPage":c_currentPage,"content_type":c_type},
		success:function(data){
			var count=data;
			var data_length=JSON.stringify(data);
			var s="";

			$.each(data.commentlist,function(i,cm_dto){
                  s+="<div class='p_commentarea'>";
                  s+="<img alt='' src='${root }/element/icon_profile.png'>";
                  s+="<span class='q_commentuser'>"+cm_dto.comment_writer+"</span>";
                  s+="<textarea class='cocomment' id='q_cocomment' readonly='readonly' style='resize:none;'>"+cm_dto.content+"</textarea>";
                  s+="<br>";
                  s+="<span class='q_commentwriteday'>"+cm_dto.write_day+"</span>";
                  s+="<c:if test='${c_dto.content_type==1}'>";
                  s+="<img src='${root }/element/button_selection.png' class='selectionbtn' onclick='answerchoose("+data.commentlist[i].community_comment_idx+")'>";
                   s+="</c:if>"; 
                  if(loginOK=="yes" && userKey==data.commentlist[i].member_idx){		          
                	s+="<div class='q_trashdiv'>";
					s+="<span class='glyphicon glyphicon-trash q_adel' id='adel' idx='"+data.commentlist[i].community_comment_idx+"'></span>";
					s+="</div>";
                  } else {
						s+="<div class='q_trashdiv'>";
						s+="<span class='adel' id='q_adel'><br></span>"
						s+="</div>";
				}
			});
			$("div.commentdiv2").html(s);

		     var p="";
			 p+="<div class='pagesort'>";
			 		 
			 if(eval(data.totalCount>0)) {
			    p+="<div class='page' align='center' style='margin-top: 50px; border: 0px solid red;'>"; 

			    	 if(eval(data.startPage>1)) {
			    		p+="<a id='pagelbtn' href='contentdetail?community_idx=92&c_currentPage="+eval(data.startPage-1)+"'>";
			    		p+="<img id='pagebtn' src='${root }/activity/icon_activity_move2.png'></a>";
			    	} 
			    	 
				    for(var pp=eval(data.startPage);pp<=eval(data.endPage); pp++) {
				    	console.log(data)
				    	console.log(pp)
				    	if(eval(data.c_currentPage)==pp) {
				    		p+="<a id='pagecnum' href='contentdetail?community_idx="+data.commentlist[0].community_idx+"&c_currentPage="+pp+"'><b>"+pp+"</b></a>";
				    	}
				    	if(eval(data.c_currentPage)!=pp) {
				    		p+="<a id='pagenum' href='contentdetail?community_idx="+data.commentlist[0].community_idx+"&c_currentPage="+pp+"'>"+pp+"</a>";
				    	}
				    }
			    	if(eval(data.endPage<data.totalPage)) {
				   		p+="<a id='pagerbtn' href='contentdetail?community_idx="+data.commentlist[0].community_idx+"&c_currentPage="+eval(data.endPage+1)+"'>";
				    	p+="<img id='pagebtn' src='${root }/activity/icon_activity_move1.png'></a>";
			    	}
				    	p+="</div><br><br><br></div>";  
			   }
			$("div.pagesort1").html(p);
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

/* qna 답변 채택 */
	function answerchoose(cm_idx) {
		var c_idx = $("#c_idx").val();
		var a = confirm("해당 답변을 채택하시겠습니까?");

		if (a) {
			$.ajax({
				type : "post",
				dataType : "text", //return값 없을땐 text!
				url : "answerchoose",
				data : {
					"community_idx" : c_idx,
					"community_comment_idx" : cm_idx
				},
				success : function(data) {
					alert("채택 되었습니다.");
					location.reload();
				}
			});
		}
	}
	
	/* 이미지 클릭시 원본 size 팝업  */
	function ImgPop(img){
		 contentimg= new Image();
		 contentimg.src=(img);
		 imgControll(img);
	}
		 
	function imgControll(img){
		if((contentimg.width!=0)&&(contentimg.height!=0)){
		    viewImage(img);
		  } else{
		     controller="imgControll('"+img+"')";
		     intervalID=setTimeout(controller,20);
		  }
		}

	function viewImage(img){
		W=contentimg.width;
		H=contentimg.height;
		O="width="+W+",height="+H+",scrollbars=yes";
		imgWin=window.open("","",O);
		imgWin.document.write("<html><head><title>--이미지상세보기--</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		imgWin.document.close();
	}
	
</script>
</head>
<body>
<div class="container">
<input type="hidden" value="${c_dto.community_idx }" id="c_idx">	
<input type="hidden" value="${currentPage }" id="currentPage">
<input type="hidden" value="${c_dto.content_type }" id="content_type">
<div class="detailsubject" style="border: 0px solid black;">

	<div class="firstdiv" style="border: 0px solid black;">
	<%--글번호 받아오기 --%>
	<span class="contentnum">#<span id="delnum"> ${c_dto.community_idx } </span></span>
	<!-- qna글 일 경우 -->
	 <c:if test="${c_dto.content_type==1}">
		<div class="tag" style="border: solid 0px #dbdbdb; font-size: 1.1em;">
			<span class="badge" style="background-color: #6BCB77; float:left; font-size: 1.1em;">OPEN</span>
		</div>
	</c:if>
	<c:if test="${c_dto.content_type==2}">
		<div class="tag" style="border: solid 0px #dbdbdb;">
			<span class="badge" style="background-color: #ff4b4e; float:left; font-size: 1.1em;">CLOSED</span>
		</div>	
	</c:if> 
	
	<%--태그 받아오기 --%>
	<span class="badge" style="font-size: 1.1em; float: left;">#${c_dto.tag1 }</span>
	
	
	<%--태그 받아오기 --%>
	<c:if test="${c_dto.tag2!=''}">
		<span class="badge" style="font-size: 1.1em; float: left;">#${c_dto.tag2 }</span>
	</c:if>
	
	<%--태그 받아오기 --%>
	<c:if test="${c_dto.tag3!=''}">	
		<span class="badge" style="font-size: 1.1em; float: left;">#${c_dto.tag3 }</span>
	</c:if>
	
	<%--글작성일 받아오기 --%>
	<span class="writeday"> <fmt:formatDate value="${c_dto.write_day }" pattern="yyyy-MM-dd"/> 작성 </span>
	</div>
	</div>
	

	<div class="content" style="border-top: solid 2px black; border-bottom: solid 2px black;">
	<div class="contentfirstdiv" >
			<!--게시글 삭제,수정 버튼 -->	
				<div class="iflogindiv" style="margin-top: 5px;">
					<label class="lab" id="lab">
						<c:forEach var="b" items="${scraplist}">
							<c:if test="${(c_dto.community_idx==b.community_idx)&&(userKey==b.member_idx)&&(b.scrap_count==1)}">
							    <input type="checkbox" id="chk" class="chscrap" checked="checked">
							    <img alt="" src="${root }/element/icon_scrap_red.png" class="scrap" style="width: 34px; height: 34px; position: absolute; top: -10px; left: 30px;">
							</c:if>
						 </c:forEach>
						 	<input type="checkbox" id="chk" class="chscrap">
							<img alt="" src="${root }/element/icon_scrap.png" class="scrap" style="width: 34px; height: 34px; position: absolute; top: -10px; left: 30px;">
					</label>
					<!-- scrap버튼 -->
					<c:if test="${sessionScope.loginOK!=null and sessionScope.userKey==c_dto.member_idx}">
						<button type="button" class="btndel glyphicon glyphicon-remove" onclick="delcontent()" title="삭제"></button>
						<button type="button" class="btnmod glyphicon glyphicon-pencil" onclick="location.href='update_content?community_idx=${c_dto.community_idx}&currentPage=${currentPage}'" title="수정" style="float: right;"></button>
					</c:if>	
				</div>
			
		
		<%--작성자 및 프로필 사진 받아오기 --%>
		<div class="contentname">
			<span><img alt="" src="${root }/element/icon_profile.png"></span>
			<span class="spanwriter">${writer }</span>
			
		<%--팀명 받아오기 --%>
			<c:if test="${teamName!=null }">
				<c:if test="${teamColor!='#191919' }">
					<div class="teamname" style="background-color: ${teamColor}">  ${teamName } </div>   <!-- 크루 네임 및 색상 로고 -->
				</c:if>	
								
				<c:if test="${teamColor=='#191919' }">
					<div class="teamname" style="background-color: ${teamColor}; color:#ffffff;">  ${teamName } </div>   <!-- 크루 네임 및 색상 로고 -->
				</c:if>							
			</c:if>
		</div>
		
	</div>	
	
	<%--글 제목 받아오기 --%>
	<div class="contentsubject" style="border: 0px solid black;" >
		${c_dto.subject }
	</div>
	<div class="lineblack" style="border: solid 1px #505050;"></div>
	<%--글 내용, 사진 받아오기 --%>
	<div class="contentarea" style="border:  0px solid black;">
		<c:if test="${c_dto.photo!='no'}">
			<div class="contentphoto">
				<c:forTokens var="p" items="${c_dto.photo}" delims="," >
					<img src="${root }/communityimage/${p}" id="photo" class="photo" style="max-width: 150px; max-height: 150px; cursor: pointer;" onclick="ImgPop('${root }/communityimage/${p}')">			
				</c:forTokens>
				${p.photo }
			</div>
		</c:if> 
		${c_dto.content }
	</div>

	
	<%--각 count값 받아오기 --%>
	<div class="iconcount">
		<span><img alt="" src="${root }/element/icon_textsms.png"><span class="textsms"></span>${c_dto.mcount } </span>
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
			<c:if test="${c_dto.content_type==0 }">
				<input type="text" placeholder="댓글을 입력하세요" class="commenttext" id="content" >
				<button type="button" class="btn-small" id="btncommentadd">댓글등록</button>
			</c:if>	
		
			<c:if test="${c_dto.content_type==1 || c_dto.content_type==2 }">
				<input type="text" placeholder="댓글을 입력하세요" class="commenttext" id="content" >
				<button type="button" class="btn-small" id="btncommentadd">답변등록</button>
			</c:if>	
		</c:if>
	
	<!-- 비회원 일반게시글 댓글 -->
		<c:if test="${sessionScope.loginOK==null && c_dto.content_type==0}">
			<input type="text" value="댓글을 입력하세요" class="commenttext">
			<button type="button" class="btncommentadd2 btn-small" onclick="writecomment()">댓글등록</button>
		</c:if>
	
	<!-- 비회원 qna게시글 댓글 -->	
		<c:if test="${sessionScope.loginOK==null && (c_dto.content_type==1 || c_dto.content_type==2)}">
			<input type="text" value="답변을 입력하세요" class="commenttext">
			<button type="button" class="btncommentadd2 btn-small" onclick="writecomment()">답변등록</button>
		</c:if>
	</div>
	
	<!-- 일반글 출력 div -->
	<c:if test="${c_dto.content_type==0 }">
		<div class="commentdiv" style="border: solid 1px #dbdbdb;">
				
		</div>
		<div class="pagesort1">
	
		</div>
	</c:if>
	
	<!— 질문글 출력 div —>
	<c:if test="${c_dto.content_type==1 || c_dto.content_type==2  }">
		<div class="commentdiv2" style="border: solid 1px #dbdbdb;">
			
		</div>
		<div class="pagesort1">
	
	</div>
 	</c:if>
 </div>
      
</body>
</html>