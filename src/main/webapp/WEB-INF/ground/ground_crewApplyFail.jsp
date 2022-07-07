<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVEL ::</title>
</head>
<body>
	<form action="/ground/mymm_r" method="post" id="form">
		<input type="hidden" name="member_idx" value="${member_idx }">
	</form>
	
		<script type="text/javascript">
	
		
	
		var msg = confirm("이미 가입 신청한 크루가 있습니다. \n[확인]을 누르면 기존 가입신청이 취소되고, \n[취소]를 누르면 뒤로 돌아갑니다.");
		if (msg) {
			$("#form").submit();
		} else {
			history.back();
		}
		
	</script>
</body>
</html>