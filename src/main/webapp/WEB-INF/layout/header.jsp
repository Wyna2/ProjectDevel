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
<link rel="stylesheet" type="text/css" href="${root }/css/header.css">

</head>
<body>
<div class="headerarea">
	<a href="/" style="text-decoration: none;">
		<img alt="" src="${root }/element/logo@2x.png" class="logo">
	</a>
	<a href="../activity/mypage"><img alt="" src="${root }/element/icon_mypage.png" class="icon_mypage"></a>
	<a href="../activity"><img alt="" src="${root }/element/icon_activity.png" class="icon_activity"></a>
	<a href="../activity/scrap"><img alt="" src="${root }/element/icon_scrap.png" class="icon_scrap"></a>
	<hr style="margin: 0;">
</div>
</body>
</html>