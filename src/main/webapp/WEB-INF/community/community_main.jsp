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
<c:set var="root" value="<%=request.getContextPath()%>" />
 <link rel="stylesheet" type="text/css" href="${root }/css/community/community_main.css">
<title>Insert title here</title>

<script type="text/javascript">
	$(function () {
		
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
		    
		   /* scrap button change */
		    $(".chscrap").change(function(){
			      
			      if($(this).is(":checked"))
			      {
			         $(this).parent('.lab').children(".scrap").attr("src","${root }/element/icon_scrap_red.png");
			        
			      }
			      else
			      {
			         $(this).parent('.lab').children(".scrap").attr("src","${root }/element/icon_scrap.png");
	   
			      }
			});
		    /* end scrap button change */
	});
</script>

<style type="text/css">
	.scrap{
   /*하트 이미지 배경 처리중  사진 안불러와 짐 다시 돌아가려면 메인에 하트 특수문자 넣고  백그라운드 지우고 위치 다시 조정*/
   width: 26px;
   height: 26px;
   content : '2661';
   box-sizing: border-box;
   cursor: pointer;   
   font-size: 20pt;
   left: 200px;
   
}
#chk{
   display: none;
}
</style>

</head>
<body>
	<div class="container">
		<div class="container1" style="width: 330px; height: 872px; float: left;">
			<div class="box1" style="height: 395px;">
				<span class="title">BEST 게시글</span>
				<div class="listbox1"> 
						<table class="list1" style="margin-top: 7px;">
							<c:forEach var="i" begin="1" end="5">
								<tr>
									<!-- 게시글 제목 출력 -->
									<td class="subject1"> <div style="cursor: pointer;"> 글제목이 나타납니다. </div> </td>   
									<td></td>
									<td class="likecount1"><img src="${root }/element/icon_thumb.png">1,234</td>
								</tr>
							</c:forEach>
						</table>
				</div>
					
			</div>
			
			<div class="box2" style="margin-top:82px;  height: 395px;">
				<span class="title">최신 Q&A</span>
				<div class="listbox2"> 
						<table class="list2">
							<c:forEach var="i" begin="1" end="5">
								<tr>
									<td rowspan="2" class="img2" width="90"> <img src="${root }/element/icon_Q&A2.png" class="Qimg"> </td>
										 <!-- 게시글 제목 출력 -->
									<td class="subject1" style="padding-top:11px; border-bottom: 0px;"> <div style="cursor: pointer;"> 글제목이 나타납니다. </div></td> 
								</tr>
								<tr>
									<td class="date2"> 
									<!-- 게시글 등록 날짜 출력 -->
										<div>2022-06-10 09:00</div> 
									</td>	
								</tr>
							</c:forEach>
						</table>
				</div>
			</div>
		
		</div>
		
		<div class="container2">
			<!-- 상단 게시글보기, 검색어 입력, 버튼 화면 -->				
			<div class="firstbox" style="height: 40px;">
					<!-- select게시글 보기 -->
				 <div class="dropdown" style="float: left; width: 170px; height: 36px;">
                 	 <div class="select" style="margin-top: -9px;">
                     	<span class="category_placeholder" > <div>전체글 보기</div> </span> <i class="fa fa-chevron-left"></i>
                	 </div>
                 		 <input type="hidden" name="" value="empty">
                  			<ul class="dropdown-menu">
                    	   		<li id="notebook">전체글 보기</li>
                     			<li id="monitor">일반글 보기</li>
				         	    <li id="keyboard">질문글 보기</li>
              			    </ul>
             	 </div>	 
					<!-- 검색어를 입력해주세요 -->
				 <div class="search" style="float: left; margin-left: 123px;">
					  	<input type="text" class="search2" placeholder="검색어를 입력해주세요." style="float: left;">
				 		<div class="searchbox">
				 			<img src="${root }/element/icon_search.png" class="searchimg">
				 		</div>
				 </div>						
				 	  
					<!-- 글쓰기 버튼  -->
				 <div class="writebutton" style="margin-left: 186px;" align="right">
					  <button type="button" class="btn-small" onclick="location.href='/community/contentadd'">글쓰기</button>
				 </div>	   	
			</div>
			
				<!-- 커뮤니티 리스트 출력 화면 -->
			<div class="secondbox">
				<c:forEach var="1" begin="1" end="9">	
				<table class="communitylist">
					<tr>
						<td width="32"> 
						<label  class="lab" id="lab">
        					 <input type="checkbox" id="chk" value="${i }" class="chscrap">
         					 <img alt="" src="${root }/element/icon_scrap.png" class="scrap">
						</label>
						</td>
						<td width="550" colspan="2"> 
							<div class="contentnumber1">#글번호</div>  <!-- 글번호 -->
							<div class="tagbox" style="margin-top: 4px;">
								<span class="tag badge">태그1</span>
								<span class="tag badge">태그2</span>
								<span class="tag badge">태그3</span>
							</div>
						</td>  
	
						<td class="count" width="320" style="padding-top: 7px;"> <!-- width="340" -->
							<div> <img alt="" src="${root }/element/icon_comment.png" style="margin-left: 135px;"> </div>
							<div class="word">3</div>
							<div> <img alt="" src="${root }/element/icon_thumb.png" style="margin-left: 23px;"> </div>
							<div class="word">30</div>
							<div> <img alt="" src="${root }/element/icon_visibility.png" style="margin-left: 15px;"> </div>
							<div class="word">2</div>
						</td>
						<td rowspan="2" width="230" style="padding-bottom: 7px;">
							<div class="personphoto" style="width: 126px;"> <img src="${root }/element/icon_person1.png"> </div>
							<div class="writer" style="margin: 7px 0 0 130px;">작성자</div>
							<div class="crew"> </div>   <!-- 크루 네임 및 색상 로고 -->
						</td>
					</tr>
					
					<tr>
						<td colspan="3"> <div class="contentnumber2">글 제목이 나타납니다.</div> </td>
						<td> <div class="day">2020-06-15 </div></td>
						<td></td>
					</tr> 		
				</table>
				</c:forEach>
			</div>
		</div>
	
	</div>
</body>
</html>