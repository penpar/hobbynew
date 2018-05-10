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
		
		#noteSendBtn{
			width: 110px;
		    line-height: 3px;
		    float: right;
		    border-radius: 7px;
		    position: relative;
		    margin: 0px 30px -20px 0px;
		    font-size: 12px;
		    transform: translateY(-130%);
		}
		
		#noteSendBtn:hover{
			width: 110px;
			line-height: 3px;
			float: right;
			position: relative;
		    margin: 0px 30px -20px 0px;
			border-radius: 7px;
			color: #ff9a2e;
			font-size: 12px;
		    transform: translateY(-130%);
			border-color: #ff9a2e;
		}
	</style>
	<body>
		<div id = "second_subject" align="center">
			<h1>클래스 신청인 목록</h1>
			<p>클래스 신청인 목록</p>
		</div>
		<!-- 여백 -->
		<div class="eb_blank"></div>
		<input type="button" id="noteSendBtn" onclick="noteSend()" value="쪽지 보내기">
		<table style="text-align: center;">
			<tr>
				<td><input type="checkbox" id="allUserSelect"></td>
				<td>아&nbsp;이&nbsp;디</td>
				<td>이&nbsp;&nbsp;름</td>
				<td>성&nbsp;&nbsp;별</td>
				<td>신청날짜</td>
			</tr>
			<c:forEach items="${payList}" var="pList">
			<tr>
				<td><input type="checkbox" value="${pList.m_id}" class="userSelect"></td>
				<td>${pList.m_id}</td>
				<td>${pList.m_name}</td>
				<td>${pList.m_gender}</td>
				<td>${pList.pl_date}</td>
			</tr>
			</c:forEach>
		</table>
	</body>
	<script>
		//전체 체크
		$("#allUserSelect").click(function(){
	        if($("#allUserSelect").prop("checked")){
	            $(".userSelect").prop("checked",true);
	        }else{
	            $(".userSelect").prop("checked",false);
	        }
	    });
	
		//선택한 신청인에게 쪽지 보내기
		function noteSend() {
			var checkUser = document.getElementsByClassName("userSelect");
			for (var i=0;i<checkUser.length;i++) {
				if(checkUser[i].checked){
					console.log(checkUser[i].value);
				}
			}
		}
	</script>
</html>