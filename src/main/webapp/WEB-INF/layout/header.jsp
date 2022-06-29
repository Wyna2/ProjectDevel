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
	
	<c:if test="${sessionScope.loginOK!=null }">
		<img alt="" src="${root }/element/icon_myinfo.png" class="icon_myinfo" onclick="location.href='/activity/mypage'">
		<img alt="" src="${root }/element/icon_inbox.png" class="icon_inbox" onclick="location.href='/activity'">
		<img alt="" src="${root }/element/icon_favorite.png" class="icon_favorite" onclick="location.href='/activity/myscrap'">
	</c:if>
	<hr style="margin: 0;">
</div>
</body>
</html>