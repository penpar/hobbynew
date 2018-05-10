<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="resources/assets/css/main.css"/>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="resources/assets/js/jquery.min.js"></script>
	</head>
	<style>
		.eb_blank{
			width: 20px;
			height: 60px;
			display: hidden;
		}
	</style>
	<body>
		<div id = "second_subject" align="center">
			<h1>나의 투표 목록</h1>
			<p>나의 투표 목록</p>
		</div>
		<!-- 여백 -->
		<div class="eb_blank"></div>
		<table style="text-align: center;">
			<tr>
				<td>제목</td>
				<td>작성일</td>
			</tr>
			<c:forEach items="${voteList}" var="vList">
			<tr>
				<td><a href="javascript:getVoteUrl('${vList.cb_index}')">${vList.cb_subject}</a></td>
				<td>${vList.cb_date}</td>
			</tr>
			</c:forEach>
		</table>
	</body>
	<script>
		function getVoteUrl(cb_index) {
			console.log(cb_index);
			opener.document.getElementById("voteResultUrl").value = "http://localhost/hobbynew/voteDetail?cb_index="+cb_index;
			window.close();
		}
	</script>
</html>