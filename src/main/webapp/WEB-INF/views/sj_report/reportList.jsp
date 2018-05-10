<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="resources/assets/css/main.css"/>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="resources/assets/js/jquery.min.js"></script>
	</head>
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
		@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		body{
			font-family: 'Nanum Square';
			font-size:18px;
		}
		
		.boardList{
			padding: 100px;
		}
		
		#eb_blank{
			width: 20px;
			height: 70px;
			display: hidden;
		}
		
		#second_subject{
			width: 400px;
			height: auto;
			position: relative;
			left: 40%;
			top: 12%;
		}
		
		th{
		    padding: 10px !important;  
		    text-align: left !important;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<div id="eb_blank"></div>
		<div id = "second_subject" align="center">
			<h1>신고 관리</h1>
			<p>회원님들의 신고 내역을 관리합니다.</p>
		</div>
		<div id="eb_blank"></div>
		
		<table>
			<tr>
				<th>신고자</th>
				<th>신고 대상자</th>
				<th>신고 사유</th>
				<th>신고 날짜</th>
				<th>경고횟수</th>
				<th>탈퇴</th>
			</tr>
			<c:forEach items="${reportList}" var="rList">
				<tr>
					<td>${rList.m_id}</td>
					<td>${rList.m_id2}</td>
					<td>
						<c:if test="${rList.rp_sort == 1}">
							<a href="#">${rList.rp_reason}</a> <!-- 게시글에서 신고 할 경우 -->
						</c:if>
						<c:if test="${rList.rp_sort == 2}">
							<a href="#">${rList.rp_reason}</a> <!-- 클래스에서 신고 할 경우 -->
						</c:if>
						<c:if test="${rList.rp_sort == 3}">
							<a href="#">${rList.rp_reason}</a> <!-- 댓글에서 신고 할 경우 -->
						</c:if>
						<c:if test="${rList.rp_sort == 4}">
							<a href="#">${rList.rp_reason}</a> <!-- 쪽지에서 신고 할 경우 -->
						</c:if>
						<c:if test="${rList.rp_sort == 5}">
							<a href="#">${rList.rp_reason}</a> <!-- ??? 에서 신고 할 경우 -->
						</c:if>
					</td>
					<td>${rList.rp_date}</td>
					<td>--</td>
					<td><a href="./userBen/${rList.m_id2}">탈퇴</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- <a href="userMgt">회원 목록</a> -->
	</body>
</html>