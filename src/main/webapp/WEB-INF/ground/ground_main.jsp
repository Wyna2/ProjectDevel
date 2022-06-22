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

<title>Insert title here</title>
</head>
<body>

	<div class="container">

		<div class="crewrank">
			<span class="crew_rank">크루 순위</span>
		</div>

		<div class="crewrank_list" style="height: 395px;">
			<div class="listbox1">
				<table class="table" style="margin-top: 7px;">

					<tr>
						<td class="subject1">싹쓰리 <img src="../image/1.png"
							style="width: 19px;"></td>
						<!-- 게시글 제목 출력 -->
						<td></td>
						<td class="likecount1"><img src="../image/star.png">1,234</td>
					</tr>

					<tr>
						<td class="subject1">싹쓰리</td>
						<!-- 게시글 제목 출력 -->
						<td></td>
						<td class="likecount1"><img src="../image/star.png">1,234</td>
					</tr>

					<tr>
						<td class="subject1">싹쓰리1212</td>
						<!-- 게시글 제목 출력 -->
						<td></td>
						<td class="likecount1"><img src="../image/star.png">1,234</td>
					</tr>

					<tr>
						<td class="subject1">싹쓰리</td>
						<!-- 게시글 제목 출력 -->
						<td></td>
						<td class="likecount1"><img src="../image/star.png">1,234</td>
					</tr>
					<tr>
						<td class="subject1">싹쓰리</td>
						<!-- 게시글 제목 출력 -->
						<td></td>
						<td class="likecount1"><img src="../image/star.png">1,234</td>
					</tr>

				</table>
			</div>

		</div>


		<span class="new_crew">신규 크루</span>

		<div class="newcrewlist"
			style="border: 1px solid #191919; border-left-color: #dbdbdb; border-right-color: #dbdbdb; border-bottom-color: #dbdbdb;">
			<table class="table" style="width: 280px; height: 110px;">
				<thead>
				</thead>
				<tbody>
					<tr height="35px;">
						<td colspan="2" style="text-align: left;">싹쓰리1</td>
					</tr>
					<tr height="35px;">

						<td colspan="2" style="text-align: left:;">싹쓰리2</td>
					</tr>
					<tr height="35px;">

						<td colspan="2" style="text-align: left;">싹쓰리3</td>
					</tr>
				</tbody>
			</table>

		</div>

		<span class="crewlist">크루 리스트</span>
		<div class="btns">
			<button class="mycrew" onclick="location.href='/ground/mycrew'">마이 크루</button>
			<button class="makecrew" onclick="location.href='/ground/crewenroll'">
				<span class="makecrew1">크루 만들기</span>
			</button>
		</div>

		
		<div class="secondbox">
 <c:forEach var="1" begin="1" end="7">
            <table class="communitylist">
               <tr align="center">
               <td colspan="4" width="130">#크루번호</td>
               <td colspan="4" width="220"><button type="button" id="modal_opne_btn2">크루 이름</button></td>
               <td colspan="4" width="120"><img alt="" src="../image/face.png" style="width: 20px">3/50</td>
               <td colspan="4" width="220"><img alt="" src="../image/star.png" style="width: 20px">2582</td>
               <td colspan="4" width="220">2022-06-10</td>
               <tr>

        </table>
          </c:forEach>
        
         </div>


		<div id="modal2">

			<div class="modal_content2">
				<h4 style="text-align: center; font-family: 'Noto Sans KR';">크루
					신청하기</h4>


				<div class="crewname_">crew</div>
				<span class="inwon"><img alt="" src="../image/face.png" style="width: 19px;">15/50</span>
				<div class="crewprone" style="border: 0px solid black;">크루 한 줄
					소개 란입니다. 크루 한 줄 소개 란입니다. 크루 한 줄 소개 란입니다.크루 한 줄 소개 란입니다.</div>

					<div class="mypricrew" style="height: 395px;">
            <span class="title">내 개인정보</span>
            <div class="listbox1"> 
                  <table class="list1" style="margin-top: 7px;">
                     
                        <tr>
                           <td class="subject1">이름</td>   <!-- 게시글 제목 출력 -->
                           <td></td>
                           <td class="likecount1">김쌍용</td>
                        </tr>
                     
                        <tr>
                           <td class="subject1">연령대</td>   <!-- 게시글 제목 출력 -->
                           <td></td>
                           <td class="likecount1">20대 초반</td>
                        </tr>
                  </table>
            </div>
               
         </div>

<div class="wrapper">
 <input type="text" class="input" name="crew_name_text" placeholder="자기소개 한 줄" required="required" style="width: 360px;">
 <span class="underline"></span>
         </div>

				<button type="submit" class="btn-large">
					<span class="crew_enroll_btn">신청하기</span>
				</button>


				<button type="button" id="modal_close_btn2"
					style="color: gray; background-color: white; border: none; size: 15px;">X</button>

			</div>

			<div class="modal_layer2"></div>
		</div>

	</div>
	<!-- 테이블 밑에 페이징 처리 넣어야 함 -->

	<div class="search">
		<input type="text" class="text_search" placeholder="검색하실 크루명을 입력하세요"
			style="width: 300px; height: 36px; font-family: 'Noto Sans KR';">
		<span class="icon glyphicon glyphicon-search"></span>
	</div>

	<div class="check" style="width: 210px;">
		<input type="checkbox" name="check" id="check1" value="crewsearch"
			style="font-family: 'Noto Sans KR';"> 신청 가능한 크루만 보기
	</div>




	<script type="text/javascript">
		document.getElementById("modal_opne_btn2").onclick = function() {
			document.getElementById("modal2").style.display = "block";
		}

		document.getElementById("modal_close_btn2").onclick = function() {
			document.getElementById("modal2").style.display = "none";
		}
	</script>

</body>
</html>