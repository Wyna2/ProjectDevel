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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<c:set var="root" value="<%=request.getContextPath()%>" />
<link rel="stylesheet" type="text/css"
	href="${root }/css/ground/crew.css">

<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//alert("123");
		team_idx = $("#team_idx").val();
		//alert(team_idx);
		list();


		

	});

	function list() {
		$
				.ajax({
					type : "post",
					dataType : "json",
					url : "memberapplylist",
					data : {
						"team_idx" : team_idx
					},
					success : function(data) {
						var l = "";

						l += "<h4 style='text-align: center; font-family: 'Noto Sans KR';'>신청현황</h4>";
						l += "<table class='table crewadd_table' border='1' style='width: 500px; height: 100px;'>";
						l += "<thead> <tr>";
						l += "<th width='80'>이름</th><th>연령대</th><th>소개</th><th width='125'>승인</th></tr></thead>";
						l += "<tbody>";
						$
								.each(
										data,
										function(i, m_dto_n) {
											l += "<tr>";
											l += "<span m_idx="+m_dto_n.member_idx+" id='m_idx'> </span>";
											l += "<td>" + m_dto_n.name
													+ "</td><td>" + m_dto_n.age
													+ "</td><td>" + m_dto_n.pr
													+ "</td>";
											l += "<td> <button class='check1' onclick='acceptMember("+m_dto_n.member_idx+")'> <img src='../image/check.png'></button>";
											l += "<button class='check2' onclick='rejectMember("+m_dto_n.member_idx+")'> <img src='../image/x.png'></button>";
											l += "</td></tr>";
										});
						l += "</tbody></table>";

						$("div.modal_list").html(l);

					},
					error : function(request, error) {
						alert("fail!");
						alert("code:" + request.status + "\n"
								+ "error message:" + request.responseText
								+ "\n" + "error:" + error);
					}

				});
	}
</script>


</head>
<body>

	<div class="container">

		<div class="crewname">
			<span class="crew_name">${dto.name} &nbsp; <input
				type="hidden" value="${dto.team_idx }" id="team_idx">
				<button type="button" id="modal_opne_btn1"
					style="background-color: white; border: none;">
					<img alt="" src="../image/crewadd.png"
						class="img_crewadd modal_opne_btn1">
				</button>
			</span>
		</div>

		<div class="crew_pr"
			style="border: 1px solid #191919; border-left-color: #dbdbdb; border-right-color: #dbdbdb; border-bottom-color: #dbdbdb;">
			<table class="table" style="width: 280px; height: 300px;">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td colspan="5">${dto.info}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<span class="crew_Notice">공지사항
			<button type="button" id="modal_opne_btn"
				style="background-color: white; border: none;">
				<img alt="" src="../image/plus.png" id="modal_opne_btn"
					style="cursor: pointer;">
			</button>
		</span>





		<div class="noticelist"
			style="border: 1px solid #191919; border-left-color: #dbdbdb; border-right-color: #dbdbdb; border-bottom-color: #dbdbdb;">
			<table class="table" style="width: 280px; height: 100px;">
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



		<span class="face"
			style="font-family: 'Noto Sans KR'; font-size: 12.5pt;"><img
			alt="" src="../image/face.png">&nbsp;&nbsp;1</span>

		<div class="crewlistaddadd" style="border: 1px solid #ededed;">
			<c:forEach var="m_dto" items="${m_dto }">
				<div class="crewone" style="float: left;">
					<div class="img_profile">
						<img alt="" src="../image/pro2.png"> <a
							href="${m_dto.link }"><img alt="" src="../image/git2.png"
							class="img_git"></a>
					</div>
					<br> <span class="crewone_name">${m_dto.name}&nbsp;&nbsp;
						<c:if test="${m_dto.member_idx==dto.member_idx }">
							<img alt="" src="../image/lee.png ">
						</c:if>
					</span> <br> <span class="crewone_pr">${m_dto.pr }</span><br> <br>
					<button type="button" id="modal_opne_btn2"
						style="background-color: white; border: none;">
						<span class="crewone_profile modal_opne_btn2">프로필 보기</span>
					</button>
				</div>
			</c:forEach>
		</div>


		<!-- 모달1 공지사항 -->
		<div id="modal">

			<div class="modal_content">
				<h4 style="text-align: center; font-family: 'Noto Sans KR';">공지사항
				</h4>

				<img alt="" src="../image/pen.png" class="mypen" style="size: 8px;">
				<table class="table notice_table"
					style="width: 430px; height: 100px;">
					<thead>
					</thead>
					<tbody>
						<tr height="35px;">
							<td colspan="2" style="text-align: left;">텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍
								스트텍스트텍스트텍스트텍스트텍스트텍스트</td>
						</tr>
						<tr height="35px;">

							<td colspan="2" style="text-align: left:;">싹쓰리2</td>
						</tr>
						<tr height="35px;">

							<td colspan="2" style="text-align: left;">싹쓰리3</td>
						</tr>
					</tbody>
				</table>



				<button type="button" id="modal_close_btn"
					style="color: gray; background-color: white; border: none; size: 15px;">X</button>

			</div>

			<div class="modal_layer"></div>
		</div>

		<!-- 모달2 신청현황(크루원 신청) -->
		<div id="modal1">

			<div class="modal_content1">
				<div class="modal_list"></div>

				<button type='button' id='modal_close_btn1'
					style='color: gray; background-color: white; border: none; size: 15px;'>X</button>
			</div>



			<div class="modal_layer1"></div>
		</div>

		<!-- 프로필 보기 모달 -->
		<div id="modal2">

			<div class="modal_content2">
				<h4 style="text-align: center; font-family: 'Noto Sans KR';">프로필
				</h4>

				<div>
					<img alt="" src="../image/face2.png" class="crew_proface"> <span
						class="crewproname">김주찬</span>
					<!-- name, pr,age, job, hobby1, -->
					<div class="crewcolorbox">크루명</div>

					<span class="crewoneprr">한 줄 소개를 입력하세요</span>

					<table class="privacy_table" border="0" style="width: 155px;">
						<tbody>
							<tr>
								<th align="center">연령</th>
								<td align="right">20대 후반</td>
							</tr>


							<tr>
								<th align="center">직업</th>
								<td align="right">비공개</td>
							</tr>
							<tr>
								<th align="center">관심분야</th>
								<td align="right">게임 낚시</td>
							</tr>
						</tbody>
					</table>

					<button id="privacy_my">정보 수정</button>
				</div>



				<button type="button" id="modal_close_btn2"
					style="color: gray; background-color: white; border: none; size: 15px;">X</button>

			</div>

			<div class="modal_layer2"></div>
		</div>


	</div>


	<script type="text/javascript">
		    document.getElementById("modal_opne_btn").onclick = function() {
			document.getElementById("modal").style.display = "block";
		}

		document.getElementById("modal_close_btn").onclick = function() {
			document.getElementById("modal").style.display = "none";
		}

		//크루원 추가
		document.getElementById("modal_opne_btn1").onclick = function() {
			document.getElementById("modal1").style.display = "block";
		}

		document.getElementById("modal_close_btn1").onclick = function() {
			document.getElementById("modal1").style.display = "none";
		}

		//프로필 보기
		document.getElementById("modal_opne_btn2").onclick = function() {
			document.getElementById("modal2").style.display = "block";
		}

		document.getElementById("modal_close_btn2").onclick = function() {
			document.getElementById("modal2").style.display = "none";
		}

		function acceptMember(idx) {
			
			alert(idx);
			
			var msg = confirm("가입 신청을 수락하시겠습니까?");
			if (msg){
			$.ajax({
				type : "post",
				dataType : "text",
				url : "memberaccept",
				data : {
					"member_idx" : idx
				},
				success : function(data) {
					list();
				alert("수락되었습니다.");
				}
			});
			}
		}
		
		function rejectMember(idx) {
			
			var msg = confirm("가입 신청을 거절하시겠습니까?");
			if (msg){
			$.ajax({
				type : "post",
				dataType : "text",
				url : "memberreject",
				data : {
					"member_idx" : idx
				},
				success : function(data) {
					list();
					alert("거절되었습니다.");
			
				}
			});
			}
		}
	</script>



</body>

</html>