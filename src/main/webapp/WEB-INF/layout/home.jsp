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
<link rel="stylesheet" type="text/css" href="${root }/css/main.css">

<title>개발자의 놀이터, DEVEL</title>

<!-- 해당 style은 임시로 적용되었습니다. -->
<style type="text/css">
div.main {
	background-color: #fff !important;
	height: 1500px !important;
}
</style>

<script type='text/javascript'>
function lucky() {
	alert('오늘도 화이팅!');
}

</script>

</head>
<body>
<div class="container1">
	<img alt="" src="${root }/element/banner_main.png" class="mainbanner">
		<c:if test="${sessionScope.loginOK==null }">
			<button class="main_button">
				<div class="button_content"><p class="button_text" onclick="location.href='/login'">시작하기</p></div>
			</button>
		</c:if>
		<c:if test="${sessionScope.loginOK!=null }">
			<button class="main_button">
				<div class="button_content"><p class="button_text" onclick="lucky()">환영해요:)</p></div>
			</button>
		</c:if>
	</div>
<div class="container2">
	<div class="vertical_box1" style="float: left;">
		<div class="section_title">
			COMMUNITY
						<!-- 커뮤니티 리스트 출력 화면 -->
			<div class="secondbox">
				<c:forEach var="c" items="${homelist }" begin="0" end="7" varStatus="i">	
				<table class="communitylist">
					<tr>
						<td width="580" colspan="2"> 
							<div class="contentnumber1" style="font-size: 0.5em;">#${c.community_idx }</div>
							<c:set var="no" value="${no }"></c:set>  <!-- 글번호 -->
							<div class="tagbox" style="margin-top: 4px;">
									<c:if test="${c.content_type==1}">
										<span class="tag badge" style="background-color: #6BCB77;">OPEN</span>
									</c:if>
									<c:if test="${c.content_type==2}">
										<span class="tag badge" style="background-color: #ff4b4e;">CLOSED</span>
									</c:if>
									<span class="tag badge">#${c.tag1 }</span>
									<c:if test="${c.tag2!=''}">
										<span class="tag badge">#${c.tag2 }</span>
									</c:if>
									<c:if test="${c.tag3!=''}">
										<span class="tag badge">#${c.tag3 }</span>
									</c:if>
							</div>
						</td>  
						<td>
						<div class="day" style="width: 100px; height: 30px;">
								<fmt:formatDate value="${c.write_day }" pattern="yyyy-MM-dd HH:mm"/>
							</div>
						</td>
	
						<td rowspan="2" width="200" style="padding-bottom: 7px;">
						
							<div class="personphoto" style="width: 126px;"> <img src="${root }/element/icon_person1.png"> </div>
							<div class="writer" style="margin: 7px 0 0 0;">${c.writer }</div>
							<c:if test="${c.team_color == '#191919'}">
							<div class="crew" style="background-color: ${c.team_color }; color: #ffffff; font-size: 0.5em;">${c.team_name } </div>   <!-- 크루 네임 및 색상 로고 -->
						</c:if>
							<c:if test="${c.team_color != '#191919'}">
						<div class="crew" style="background-color: ${c.team_color }; font-size: 0.5em;">${c.team_name } </div>
						</c:if>
						</td>
					</tr>
					
					<tr>
						<td colspan="3"> 
							<div class="contentnumber2">
								<c:if test="${c.content_type==0}"> <!-- 값에 따라 일반, 질문글 나뉨 -->
									<div>
										<a href="${root }/community/contentdetail?community_idx=${c.community_idx }">${c.subject}</a>
										<c:if test="${c.photo!='no' }">
											 <span class="glyphicon glyphicon-picture" style="color: #505050;"></span>
										</c:if>
									</div>
								</c:if>
								
								<c:if test="${c.content_type==1 || c.content_type==2}"><!-- qna중 채택, 채택x -->
									<div>
										<a href="${root }/community/contentdetail?community_idx=${c.community_idx }">${c.subject}</a>
										<c:if test="${c.photo!='no' }">
											 <span class="glyphicon glyphicon-picture" style="color: #505050;"></span>
										</c:if>
									</div>
								</c:if>
							</div> 
						</td>
						<td>
						</td>
						<td></td>
					</tr> 		
				</table>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<div class="vertical_box2">
		<div style="height: 390px; margin-bottom: 15px;">
			<div class="section_title">
				NEW ITEM
				<button type="button" class="btn-showAll" id="idcheck" style="position: absolute; float: left; margin: 6px 0 0 167px; font-size: 14px;" onclick="location.href='/marketplace'">전체보기</button>
			</div>
			<c:forEach var="i" begin="1" end="3" items="${marketlist}">
				<div class="gallery_content" style="padding-left: 17px;">
					<div class="relphoto" style="width: 160px; height: 160px;">
						<c:if test="${i.photo != no }">
						<img alt="" src="${root }/photo/${i.photo }">
						</c:if>
						<c:if test="${i.photo == no }">
						<img alt="" src="${root }/element/no_image.png">
						</c:if>
					</div>
					<div class="g_subtitle">
					  ${i.brandname }
					</div>
					<div class="g_title">
					 ${i.subject }
					</div>
					<div class="g_cotent">
				    <fmt:formatNumber
				value="${i.price }" pattern="#,###" /> <span class="relprice2">원</span>
					</div>
			 	</div>
			 </c:forEach>
		</div>
		<div style="height: 390px;">
			<div class="section_title">
				HOT CREW
				<button type="button" class="btn-showAll" id="idcheck" style="position: absolute; float: left; margin: 6px 0 0 165px; font-size: 14px;" onclick="location.href='/ground'">전체보기</button>
			</div>
			<div class="secondbox2" style="width:700px;">
			<c:forEach var="a" items="${crewlist }" varStatus="i" begin="0" end="5">
				<table class="communitylist">
					<tr align="center">
										
						<td width="45" style="padding: 0 10px 0 10px;">
						<c:if test="${i.count ==1 }">
						<img alt="" src="../image/1.png">
						</c:if>
						<c:if test="${i.count != 1}">
						${i.count}
						</c:if>
					 </td>
					 
					 <c:if test="${a.color != '#191919'}">
						<td width="130" >
						<div style="background-color: ${a.color}; border-radius: 25px; width: 100px;  ">
						${a.name }
						</div>
						</td>
						</c:if>
						
						<c:if test="${a.color == '#191919'}">
						<td colspan="2" width="130" >
						<div style="background-color: ${a.color}; border-radius: 25px; width: 100px; color:#ffffff;  ">${a.name }</div>
						</td>
						</c:if>
						
						
						<%-- <td colspan="4" width="110"><img alt=""
							src="../image/face.png" style="width: 20px">
							${a.member_count}/50</td> --%>
						<td colspan="3" width="100" style="padding-right: 5px;"><img alt=""
							src="../image/star.png" style="width: 20px"> <fmt:formatNumber
								value="${a.score }" pattern="#,###" /></td>
					<tr>
				</table>
			</c:forEach>

		</div>
			
		</div>
	</div>
</div>
</body>
</html>