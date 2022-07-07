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

<title>DEVEL :: 나의 크루</title>
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
											l += "<td> <button class='check1' onclick='acceptMember("
													+ m_dto_n.member_idx
													+ ")'> <img src='../image/check.png'></button>";
											l += "<button class='check2' onclick='rejectMember("
													+ m_dto_n.member_idx
													+ ")'> <img src='../image/x.png'></button>";
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
			<span class="crew_name"
				style="background-color: ${crew_dto.color}; border-radius: 25px; width: 100px;  ">${crew_dto.name}
				&nbsp; </span> <input type="hidden" value="${crew_dto.team_idx }"
				id="team_idx">
			<button type="button" id="modal_opne_btn1"
				style="background-color: white; border: none;">
				<c:if test="${crew_dto.member_idx ==userKey}">
					<img alt="" src="../image/crewadd.png"
						class="img_crewadd modal_opne_btn1">
				</c:if>
			</button>


		</div>

		<div class="crew_pr"
			style="border: 1px solid #191919; border-left-color: #dbdbdb; border-right-color: #dbdbdb; border-bottom-color: #dbdbdb;">
			<table class="table" style="width: 280px; height: 300px;">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td colspan="5">${crew_dto.info}</td>
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

			<button type="button" id="modal_opne_btn0"
				style="background-color: white; border: 1px;">
				<c:if test="${crew_dto.member_idx ==userKey}">
					<img alt="" src="../image/pen.png" class="model_open_btn0"
						style="size: 8px;">
				</c:if>
			</button>
		</span>





		<div class="noticelist"
			style="border: 1px solid #191919; border-left-color: #dbdbdb; border-right-color: #dbdbdb; border-bottom-color: #dbdbdb;">
			<table class="table" style="width: 280px; height: 100px;">
				<thead>
				</thead>
				<tbody>
					<c:forEach var="tc" items="${teamnoticelist}" begin="0" end="2">
						<tr height="35px;">
							<td colspan="2" style="text-align: left;">${tc.notice }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>



		<span class="face"
			style="font-family: 'Noto Sans KR'; font-size: 12.5pt;"><img
			alt="" src="../image/face.png">&nbsp;&nbsp;${cm_dto.size()}</span>

		<div class="crewlistaddadd" style="border: 1px solid #ededed;"
			id="crewlist">
			<c:forEach var="m_dto" items="${m_dto }">
				<div class="crewone" style="float: left;">
					<div class="img_profile">
						<c:if test="${m_dto.photo ==null }">
						<img alt="" src="../image/pro2.png">
						</c:if>
						
						<c:if test="${m_dto.photo != null}">
						<img alt="" src="${root }/photo/${m_dto.photo}" width="90" height="90" style="border-radius: 40px;">
						</c:if>
						 
						<c:if test="${m_dto.link != null }">
							<a href="${m_dto.link }"><img alt="" src="../image/git2.png"
								class="img_git"> </a>
						</c:if>

						<c:if test="${m_dto.link == null }">
							<a href="#"><img alt="" src="../image/git2.png"
								class="img_git"> </a>
						</c:if>
					</div>
					<br> <span class="crewone_name">${m_dto.name}&nbsp;&nbsp;
						<c:if test="${m_dto.member_idx==crew_dto.member_idx }">
							<img alt="" src="../image/lee.png ">
						</c:if>
					</span> <br>
					<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap";>
						<span class="crewone_pr">${m_dto.pr }</span>
			
					</div>
					<br> <br>
					<button type="button" id="modal_opne_btn2"
						style="background-color: white; border: none; position: relative; top:-10px;"
						onclick="transfer(${m_dto.member_idx})">
						<span class="crewone_profile modal_opne_btn2">프로필 보기</span>
					</button>

					<c:if
						test="${crew_dto.member_idx ==userKey and m_dto.member_idx != crew_dto.member_idx }">
						<button class="crewbtndel"
							onclick="crewmemberdelfun(${m_dto.member_idx})">X</button>
					</c:if>
				</div>
			</c:forEach>



		</div>
		<c:if test="${crew_dto.member_idx ==userKey}">
			<button class="crewdel" onclick="crewdelfun()">크루 삭제</button>&nbsp;
		</c:if>


		<!-- 모달1 공지사항 -->
		<div id="modal">

			<div class="modal_content">
				<h4 style="text-align: center; font-family: 'Noto Sans KR';">공지사항
				</h4>

				<table class="table notice_table"
					style="width: 430px; height: 100px;">
					<thead>
					</thead>
					<tbody>
						<c:forEach var="no" items="${teamnoticelist}">
							<tr height="35px;">
								<td colspan="2" style="text-align: left;">${no.notice }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</div>
			<button type="button" id="modal_close_btn"
				style="color: gray; background-color: white; border: none; size: 15px;">X</button>


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



		<div id="modal0">

			<div class="modal_content0">
				<h4 style="text-align: center;">공지사항 작성</h4>
				<form action="/ground/noticeinsert" method="post">
					<input type="hidden" value="${crew_dto.team_idx }" id="team_idx"
						name="team_idx">

					<div class="wrapper">
						<textarea class="info" name="notice" style="resize: none;"></textarea>
						<div id="text_iii"
							style="font-size: 12px; letter-spacing: -0.1em; position: relative; margin-bottom: 65px; color: #505050">
						</div>

					</div>
					<button type="submit" style="text-align: center;" class="btn-small">등록</button>
				</form>
			</div>

			<button type='button' id='modal_close_btn0'
				style='color: gray; background-color: white; border: none; size: 15px;'>X</button>
		</div>



		<div class="modal_layer0"></div>


		<!-- 프로필 보기 모달 -->
		<div id="modal2">


			<div class="modal_content2">
				<h4 style="text-align: center; font-family: 'Noto Sans KR';">프로필
				</h4>

				<form action="/ground/memberprofile" method="post">
					<div>
						<img alt="" src="../image/face2.png" class="crew_proface"> <span
							class="crewproname">이름</span> <input type="hidden"
							name="member_idx" id="m_idx">
						<!-- name, pr,age, job, hobby1, -->

						<!-- <div class="crewcolorbox">팀장</div>-->
						<span class="crewoneprr">한 줄 소개를 입력하세요</span>
						
						<table class="privacy_table" border="0" style="width: 155px;">
							<tbody>
								<tr>
									<th align="center">연령</th>
									<td align="right" class="crewm_age">20대 후반</td>
								</tr>


								<tr>
									<th align="center">직업</th>
									<td align="right" class="crewm_job"></td>
								</tr>
								<tr>
									<th align="center">관심분야</th>

									<td align="right" class="crewm_hobby"></td>


								</tr>
							</tbody>
						</table>

						<button id="privacy_my">정보 수정</button>
					</div>
				</form>


				<button type="button" id="modal_close_btn2"
					style="color: gray; background-color: white; border: none; size: 15px;">X</button>

			</div>

			<div class="modal_layer2"></div>
		</div>


	</div>
	<script type="text/javascript">

	
	
	//반복문으로 입력되는 버튼, 크루원 프로필 보기
    var buttons = document.querySelectorAll('.modal_opne_btn2');
    
    buttons.forEach(function(button) {
		button.addEventListener('click', test1);
	});
    
    function test1() {
		document.getElementById("modal2").style.display = "block";
		}

	document.getElementById("modal_close_btn2").onclick = function() {
		document.getElementById("modal2").style.display = "none";
	}
	
	
		//공지사항
		document.getElementById("modal_opne_btn").onclick = function() {
			document.getElementById("modal").style.display = "block";
		}

		document.getElementById("modal_close_btn").onclick = function() {
			document.getElementById("modal").style.display = "none";
		}
		
		document.getElementById("modal_opne_btn0").onclick = function() {
			document.getElementById("modal0").style.display = "block";
		}

		document.getElementById("modal_close_btn0").onclick = function() {
			document.getElementById("modal0").style.display = "none";
		}

		//크루원 추가
		document.getElementById("modal_opne_btn1").onclick = function() {
			document.getElementById("modal1").style.display = "block";
		}

		document.getElementById("modal_close_btn1").onclick = function() {
			document.getElementById("modal1").style.display = "none";
		}

		function acceptMember(idx) {

			alert(idx);

			var msg = confirm("가입 신청을 수락하시겠습니까?");
			if (msg) {
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
			if (msg) {
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
		
		
		
		function transfer(member_idx) { //transfer를 통해 전달받은 member_idx를 
			$('#m_idx').val(member_idx); //모달 영역의 input 태그에 넣어준다!
			
			
			//모달창 안에 값 넣어줌
			$.ajax({  
				type: 'POST',  
				url: '/ground/memberprofile',  
				data:{ 'member_idx':member_idx},
				success:function(data) {   
					console.log(data)
				  
					$(".crewproname").text(data.name); //크루원 이름
					$(".crewoneprr").text(data.pr); //한줄 소개
					$(".crewm_age").text(data.age); //나이
					$(".crewm_job").text(data.job); //직업
					$(".crewm_hobby").text(data.hobby1+"  "+data.hobby2+"  "+data.hobby3);
					},
				});
			
		}
		
		function crewdelfun() {
			if(${cm_dto.size()>1}) {
				alert("모든 크루원을 내보내야 크루 삭제가 가능합니다.");
			}
			
			else if(confirm("크루를 삭제하시겠습니까?")) {
				location.href='/ground/crewdel?member_idx=${crew_dto.member_idx}'
			}else{
				return false;	
			}
				
		
		}
		
		function crewmemberdelfun(member_idx) {
			
			$.ajax({
				type:'GET',
				url: '/ground/crewmemberdel',
				data: {'member_idx':member_idx},
				dataType: 'text',
				success:function(data) {
			          alert("삭제가 완료되었습니다.");
			          /*새로고침 없이*/
				}
			});
			
			
			/* //alert(member_idx);
		$(".crewbtndel").click(function () {
			if(confirm("크루원을 내보내시겠습니까?")) {
				location.href='/ground/crewmemberdel?member_idx=${member_idx}'
			}else{
				return false;	
			}
			
		});
		}
	 */
	 }
	 

		
	</script>



</body>

</html>