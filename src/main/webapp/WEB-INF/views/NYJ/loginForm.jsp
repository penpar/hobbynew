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
			/* @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css); */
			
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
     	
	     	#tables{
	     		width: 50%;
	     		margin: 0 auto;
	     	}
	     	
	     	#btn{
     		    left: 47%;
			    width: 80px;
			    font-size: 13px;
			    /* margin: 0 auto; */
			    position: relative;
			    /* height: 100%; */
			    border-radius: 7px;
	     	}
	     	
	     	/* td{
	     		align: center;
	     	} */
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		<!-- 여백 -->
		<div id="eb_blanks"></div>
	
		<div id = "second_subject" align="center">
			<h3>Login</h3>
			<p>'소수의 취향'에 오신 것을 환영합니다!</p>
		</div><br/>
	
		<form action="mb_Login" name="loginForm" method="post">
			<table id="tables">
				<tr>
					<td colspan="2" align="center">로그인</td>
				</tr>
				<tr>
					<td><input type="text" name="m_id" placeholder="아이디"></td>
				</tr>
				<tr>
					<td style="background-color: f4f4f4;"><input type="password" name="m_pw" placeholder="비밀번호"></td>
				 </tr>
				 <tr>
				 	<td align="center" colspan="2">
				 		<a href="findIdPw">아이디/비밀번호 찾기</a>
				 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 		<a href=joinChoice>회원가입</a>
				 	</td>
				</tr>
			</table><br/>
			<button id="btn">로그인</button>
		</form>
	</body>
	<script>
	/* function check(check){
		if(check==1){
			alert("회원가입성공");
		}else if(check==2){
			alert("회원가입 실패")
		}else if(check==3){
			alert("회원가입 예외발생")
		}else if(check==4){
			alert("아이디 또는 비밀번호가 일치하지 않습니다")
		}else if(check==5){
			alert("탈퇴 된 회원입니다")
		}
	} */
	
	//글 작성 & 수정 & 삭제 alert
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
		location.href="loginForm"
	}
	
	</script>
</html>