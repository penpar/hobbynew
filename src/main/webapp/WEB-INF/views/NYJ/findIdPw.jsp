<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<script src="resources/js/jquery-2.1.1.js"></script>
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<style>
			@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
			
			#header .links ul li{
	         line-height: 1;
	     	}
	     	
	     	/* body{
				font-family: 'Nanum Square';
				font-size:18px;
			} */
			
			#eb_blanks{
				width: 20px;
			    height: 150px;
				display: hidden;
			}
			
			#findId{
				float: left;
			    width: 310px;
			    height: 200px;
			    border-radius: 10px;
			    font-size: 15px;
			    position: relative;
			    margin: 10px;
			}
			
			#findPw{
				float: left;
			    width: 310px;
			    height: 200px;
			    border-radius: 10px;
			    font-size: 15px;
			    position: relative;
			    margin: 10px;
			}
			
			#middle{
			    width: 35.5%;
			    position: absolute;
			    left: 50%;
			    transform: translateX(-50%);
			    top: 44%;
			    height: auto;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		<!-- 여백 -->
		<div id="eb_blanks"></div>
	
		<div id = "second_subject" align="center">
			<h3>아이디 / 비밀번호 찾기</h3>
			<p>찾기 유형을 선택해주세요</p>
		</div><br/><br/><br/>
		<div id="middle">
			<input type="button" id="findId" onclick="sendFindId()" value="아이디 찾기"/>
			<input type="button" id="findPw" onclick="sendFindPw()"  value="비밀번호 찾기"/>
		</div>
	</body>
	<script>
	//아이디 찾기 버튼 클릭 시
	function sendFindId(){
		location.href="idFindForm"
	}
	
	//비밀번호 찾기 버튼 클릭 시
	function sendFindPw(){
		location.href="pwFindForm"
	}
		
	
	</script>
</html>