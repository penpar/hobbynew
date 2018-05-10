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
			height: 120px;
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
		
		#moveButton{
			position: relative;
			width: 169px;
			float: right;
			border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
        	margin: 0px 0px 0px 15px;	    
	        /* transform: translateX(-50%);
    		left: 50%; */
		}
		
		#moveButton:hover{
			position: relative;
			width: 169px;
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
		</style>
	</head>
	<body>
	<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<div id = "second_subject" align="center">
			<h1>아이디 찾기</h1>
			<p>회원님의 아이디 조회 결과입니다</p>
		</div>
		<div id="eb_blank"></div>
		
		
		회원님의 아이디는 ${m_id} 입니다.
		
		<input type="button" id="moveButton" onclick="moveLoginPage()" value="로그인페이지로 이동"/>
		
		
		
	
	</body>
	<script>
		function moveLoginPage(){
			location.href="loginForm";
			
			
		}
	
	</script>
</html>