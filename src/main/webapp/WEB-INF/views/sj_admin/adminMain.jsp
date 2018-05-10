<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/js/jquery-3.2.1.js"></script>
		<title>소수의 취향</title>
		<style>
			#header .links ul li{
        		line-height: 1;
      		}
      		
      		.manage {
			    width: 200px;
			    height: 180px;
			    background-color: white;
			    border: 1px solid #E6E6E6;
			    float: left;
			    margin: 7px;
			    top: 210px;
   				left: 32%;
			    position: relative;
			    text-align: center;
			    font-size: 17px;
			    border-radius: 7px;
			}
      		
      		.manage:hover{
   			    width: 200px;
			    height: 180px;
			    background-color: #ff9a2e;
			    border: 1px solid #E6E6E6;
			    float: left;
			    margin: 7px;
			    position: relative;
			    top: 210px;
   				left: 32%;
			    position: relative;
			    text-align: center;
			    font-size: 17px;
			    color: white;
			    border-radius: 7px;
   			    cursor: pointer;
      		}
      		
      		.manage p{
      			position: relative;
    			top: 42%;
      		}
      		
      		.three{
      			clear: left;
      		}
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<div class="manage one"><p>클래스 관리</p></div>
		<div class="manage two"><p>심사 관리</p></div>
		<div class="manage three"><p>회원 관리</p></div>
		<div class="manage four"><p>문의 관리</p></div>
	</body>
	<script>   		
   		$(".one").click(function(){
   			location.href="classMgt";
   		});
   		
   		$(".two").click(function(){
   			location.href="joinJudgeList";
   		});
   		
   		$(".three").click(function(){
   			location.href="userMgt";
   		});
   		
   		$(".four").click(function(){
   			location.href="questionMgt";
   		});
	</script>
</html>