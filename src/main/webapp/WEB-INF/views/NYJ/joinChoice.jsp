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
			
			#ny_user{
				float: left;
			    width: 310px;
			    height: 200px;
			    border-radius: 10px;
			    font-size: 15px;
			    position: relative;
			    margin: 10px;
			}
			
			#ny_hobbyArtist{
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
			<h1>회원가입</h1>
			<p>회원가입 유형을 선택해주세요.</p>
		</div><br/><br/><br/>
		<div id="middle">
			<input type="button" id="ny_user" onclick="goUserJoinForm()" value="일반 회원"/>
			<input type="button" id="ny_hobbyArtist" onclick="artistJoinForm()"  value="취미 아티스트"/>
		</div>
	</body>
		
	<script>
	//일반 회원가입 버튼 클릭 시
	function goUserJoinForm(){
		location.href="joinUserForm"
		
	}
	
	//취미 아티스트 버튼 클릭 시
	function artistJoinForm(){
		location.href="joinArtForm"
		
	}

	/* //일반 회원가입 버튼 클릭 시
	$("#ny_user").click(function(){
		location.href="userJoinForm.jsp";
		
	}
	
	
	//취미 아티스트 버튼 클릭 시
	$("#ny_user").click(function(){
		location.href="artistJoinForm.jsp";
	} */
	
	
	</script>
</html>