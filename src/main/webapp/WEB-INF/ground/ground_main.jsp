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
	href="${root }/css/ground/crewlist.css">

<title>DEVEL :: 그라운드</title>
</head>
<body>

	<div class="container">

		<div class="crewrank">
			<span class="crew_rank">크루 순위</span>
		</div>

		<div class="crewrank_list" style="height: 395px;">
			<div class="listbox1">
				<table class="table" style="margin-top: 7px;">
					<c:forEach var="dto" items="${pointlist }" varStatus="i" begin="0"
						end="4">

						<tr>
							<td class="subject1">${dto.name }<c:if
									test="${i.count == 1}">

									<img src="../image/1.png" style="width: 19px;">
								</c:if>

							</td>
							<!-- 게시글 제목 출력 -->
							<td></td>
							<td class="likecount1"><img src="../image/star.png"> <fmt:formatNumber
									value="${dto.score }" pattern="#,###" /></td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>

		<span class="new_crew">신규 크루</span>

		<div class="newcrewlist"
			style="border: 1px solid #191919; border-left-color: #dbdbdb; border-right-color: #dbdbdb; border-bottom-color: #dbdbdb;">
			<table class="table" style="width: 280px; height: 110px;">
				<c:forEach var="dto" items="${newlist }" varStatus="i" begin="0"
					end="3">
					<tr>
						<td>${dto.name }</td>
					</tr>
				</c:forEach>
			</table>

		</div>

		<span class="crewlist">크루 리스트</span>
		<div class="btns">
			<form action="/ground/mycrew" method="post"
				onsubmit="return chklogin(this)">

				<!-- 마이크루 페이지로 넘겨줌 -->
				<input type="hidden" name="team_idx" value="${team_idx}"
					id="teamidx">


				<button type="submit" class="mycrew">마이 크루</button>

			</form>

			<button class="makecrew">
				<span class="makecrew1">크루 만들기</span>
			</button>

		</div>



		<div class="secondbox">
			<c:forEach var="a" items="${list }" varStatus="status">
				<table class="communitylist">
					<tr align="center">
						<td colspan="4" width="50">${list.size() -status.index}</td>
						
						<c:if test="${a.color != '#191919'}">
						<td colspan="4" width="240" >
						<div style="background-color: ${a.color}; border-radius: 25px; width: 100px;  ">${a.name }</div>
						</td>
						</c:if>
						
						<c:if test="${a.color == '#191919'}">
						<td colspan="4" width="240" >
						<div style="background-color: ${a.color}; border-radius: 25px; width: 100px; color:#ffffff;  ">${a.name }</div>
						</td>
						</c:if>
						
						
						<td colspan="4" width="110"><img alt=""
							src="../image/face.png" style="width: 20px">
							${a.member_count}/50</td>
						<td colspan="4" width="200"><img alt=""
							src="../image/star.png" style="width: 20px"> <fmt:formatNumber
								value="${a.score }" pattern="#,###" /></td>
						<td colspan="4" width="200"><fmt:formatDate
								value="${a.create_day }" pattern="yyyy-MM-dd" /></td>
						<td width="120">
						<c:if test="${team_idx ==null}">
						<button type="button" class="modal_opne_btn2"
									onclick="transferTId(${a.team_idx})">신청하기</button>
									</c:if>
								
							</td>
					<tr>
				</table>
			</c:forEach>

		</div>



		<!-- 페이징 -->
		<div class="pagesort">
			<c:if test="${totalCount>0}">
				<div class="page" align="center" style="margin-top: 50px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a href="ground?currentPage=${startPage-1}"> <img id="pagebtn"
							src="${root }/activity/icon_activity_move2.png">
						</a>
					</c:if>

					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a id="pagecnum" href="ground?currentPage=${pp}"><b>${pp}</b></a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a id="pagenum" href="ground?currentPage=${pp}">${pp}</a>
						</c:if>
					</c:forEach>

					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a href="ground?currentPage=${endPage+1}"> <img id="pagebtn"
							src="${root }/activity/icon_activity_move1.png">
						</a>
					</c:if>

				</div>
			</c:if>
		</div>




		<div id="modal2">

			<div class="modal_content2">
				<h4 style="text-align: center; font-family: 'Noto Sans KR';">
					크루 신청하기</h4>

				<form action="/ground/test123" method="post">

					<div class="crewname_"></div>
				
					<div class="crewprone" style="border: 0px solid black;"></div>
				</form>
				<div class="mypricrew" style="height: 395px;">
					<span class="title">내 개인정보</span>
					<div class="listbox1">
						<table class="list1" style="margin-top: 7px;">

							<tr>
								<td class="subject1">이름</td>
								<!-- 게시글 제목 출력 -->
								<td></td>
								<td class="likecount1">${name }</td>
							</tr>

							<tr>
								<td class="subject1">연령대</td>
								<!-- 게시글 제목 출력 -->
								<td></td>
								<td class="ageage">${age }대</td>
							</tr>
						</table>
					</div>

				</div>

				<div class="wrapper">
					<form action="/ground/mymm" method="post">

						<input type="hidden" name="team_idx" id="t_idx"> <input
							type="text" class="input" name="mypr" placeholder="자기소개 한 줄"
							required="required" style="width: 360px;"> <span
							class="underline"></span>
				</div>

				<button type="submit" class="btn-large">
					<span class="crew_enroll_btn">신청하기</span>

				</button>
				</form>


				<button type="button" id="modal_close_btn2"
					style="color: gray; background-color: white; border: none; size: 15px;">X</button>

			</div>

			<div class="modal_layer2"></div>
		</div>




	</div>



	<div class="search">
	<form action="/team/search">
		<input type="text" class="text_search" name="SearchText" placeholder="검색하실 크루명을 입력하세요"
			style="width: 300px; height: 36px; font-family: 'Noto Sans KR';">
		
		<button type="submit" class="searchbtn" style="border: 0px; background-color: #ffff;"></button>
		<span class="icon glyphicon glyphicon-search"></span>
	</form>
	</div>



	<!-- <div class="check" style="width: 210px;">
		<input type="checkbox" name="check" id="check1" value="crewsearch"
			style="font-family: 'Noto Sans KR';"> 신청 가능한 크루만 보기
	</div> -->








	<script type="text/javascript">

	//마이 크루,,, 로그인 안 되어 있을 때 alert창
		function chklogin(form) {
		//alert(${team_idx});
	     if(${sessionScope.loginOK==null})
	    {
	          alert("로그인 후 사용이 가능합니다.");
	        location.href="/login"; //로그인 폼으로 이동
	        return false;

	      }	else {
	    	if(${team_idx == null}){
	    		alert("가입한 크루가 없습니다.");
	    		return false;
	    	}
	    }

	}
	

	$('.makecrew').click(function () {
	     if(${sessionScope.loginOK==null})
	    {
	          alert("로그인 후 사용이 가능합니다.");
	        location.href="/login"; //로그인 폼으로 이동
	    
	     } else if(${sessionScope.loginOK!=null and crewTeam_idx == null}) {
	    	location.href="/ground/crewenroll";
	    } else if(${sessionScope.loginOK!=null and crewTeam_idx != null}) {
	    	alert("이미 가입된 크루가 존재합니다. \n크루를 만들 수 없습니다.");
	    }
	});
	
	
	//반복문으로 입력되는 버튼
	    var buttons = document.querySelectorAll('.modal_opne_btn2');
	    
	    buttons.forEach(function(button) {
			button.addEventListener('click', test1);
		});
	    
	    function test1() {
	    	if(${sessionScope.loginOK==null})
		    {
		          alert("로그인 후 사용이 가능합니다.");
		        location.href="/login"; //로그인 폼으로 이동
		    
		      }else{
			document.getElementById("modal2").style.display = "block";
			} 
	    }

		document.getElementById("modal_close_btn2").onclick = function() {
			document.getElementById("modal2").style.display = "none";
		}
		
		
		
		function transferTId(team_idx) { //transferId를 통해 전달받은 team_idx를 
			//$('#Tidx').val(team_idx); //모달 영역의 input 태그에 넣어준다!
			
			
			//모달창 안에 값 넣어줌
			$.ajax({  
				type: 'POST',  
				url: '/ground/test123',  
				data:{ 'team_idx':team_idx},
				success:function(data) {   
					console.log(data.name)     
					 $(".crewname_").text(data.name);
					 $(".crewprone").text(data.info);
					$("#t_idx").val(data.team_idx);
					},
				});
			
		}
		
		
			
			
</script>
</body>
</html>