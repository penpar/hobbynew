<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Karla" rel="stylesheet">
		<script src="resources/assets/js/jquery.min.js"></script>
		<title>소수의 취향</title>
	</head>
	<style>		
	
		#header .links ul li{
			line-height: 1;
		}
		
		#eb_blank{
			width: 20px;
			height: 120px !important;
			display: hidden;
		}
		
		#eb_blank2{
			width: 20px;
			height: 50px !important;
			display: hidden;
		}
		
		/* 맨 위로 이동 */
		a.top{
			/* display: none; */
			position: fixed;
			left: 95%;
			bottom: 30px;
			width: 50px;
			height: 50px;
			border-radius: 50px;
			z-index: 6;
		}
		
		a.top img{
			position: relative;
			width: 50px;
			height: 50px;
		}
		
		/* 버튼 css */
		#findId, #back{
			position: relative;
			width: 60px;
			float: right;
			border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
        	margin: 0px 0px 0px 15px;	    
	        /* transform: translateX(-50%);
    		left: 50%; */
		}
		
		/* 버튼 css */
		#findId:hover, #back:hover{
			position: relative;
			width: 60px;
			float: right;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;	
		    margin: 0px 0px 0px 15px;
			/* transform: translateX(-50%);
    		left: 50%; */
		    /* line-height: 0px; */
		    /* padding: 0px 0px 45px 0px; */
		}
		
		#tables{
			width: 60%;
			margin: 0 auto;
			position: relative;
		}
		
		#buttons_location{
		    left: 50%;
    		transform: translateX(-45%);
		}
		</style>
	</head>
	<body>
	<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<div id = "second_subject" align="center">
			<h1>아이디 찾기</h1>
			<p>이름 / 이메일을 입력해주세요.</p>
		</div>
		<div id="eb_blank2"></div>
		
		<form id="idFindFoem" name="idFindForm" action="idFind" method="post">
			<div id="tables">
				<input type="text" id="m_name" name="m_name" placeholder="이름"/><br/>
				<input type="text" id="m_email" name="m_email" placeholder="이메일"/>
			</div>
		</form>
		<div id="buttons_location">
			<input type="button" id="back" onclick="comback()" value="취소"/>
			<input type="submit" id="findId" name="findId" value="찾기"/>
		</div>
	</body>
	<script>
	
	
	
	//취소 버튼 클릭 시
	function comback(){
		location.href="loginForm";
	}
	
	//글 작성 & 수정 & 삭제 alert
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
		location.href="idFindForm"
	}
	
	
	</script>
</html>