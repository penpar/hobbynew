<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<script src="resources/js/jquery-2.1.1.js"></script>
		<style>
			#header .links ul li{
	         	line-height: 1;
	     	}
	     	
	     	#eb_blank{
				width: 20px;
				height: 120px;
				display: hidden;
			}
			
			#tables{
				width: 60%;
	     		margin: 0 auto;
			}
		
			#middle{
				position: relative;
			    /* margin: 0 auto; */
			    left: 50%;
			    transform: translateX(-5%);
			}
			
			#middle input[type="button"]{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 70px;
				border-radius: 7px;
			    line-height: 3px;
			}
			
			#middle input[type="button"]:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 70px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px;
			}
			
			#changePwForm{
				position:relative;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h2>My Page</h2>
			<p>변경할 비밀번호를 입력해주세요.</p>
		</div>
		<div id="eb_blank"></div>
		
		<form id="changePwForm" action="mp_ChangePw">
			<table id="tables">
				<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}">
				<tr>
					<td>새로운 비밀번호</td>
					<td><input type="password" id="m_pw" name="m_pw" placeorder="새로운 비밀번호"></td>
				</tr>
				
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="m_pwConfirm" name="m_pwConfirm" placeorder="비밀번호 확인"></td>
				</tr>
			</table>
			<br/>
			<div id="middle">
				<input type="button" onclick="sendPw()" value="확인">
				<input type="button" onclick="comeback()" value="취소">
			</div>
		</form>
	</body>
	<script>
	//확인 버튼 누를 시
	function sendPw(){
		var pwEmpty = false;//비밀번호 공백 체크
		var pwChk = false;//비밀번호 유효성 체크
		var pwConChk = false;//비밀번호 일치 체크
		
		var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,16}$/;
		
		/* '6~16자 영문,숫자,특수문자 각각 1개이상을 입력해주세요' */
		if($('#m_pw').val()==""){
			pwEmpty=false;
		}else if($('#m_pw').val()!=""){
			if(!pwc.test($('#m_pw').val())){
				pwChk=false;
			}else if(pwc.test($('#m_pw').val())){
				if($('#m_pwConfirm').val()!=$('#m_pw').val()){
					pwConChk=false;
				}else{
					pwConChk=true;
				}
				pwChk=true;
			}
			pwEmpty=true;
		}
		
		if(pwEmpty==false){
			alert("새로운 비밀번호를 입력해주세요");
		}else if(pwChk==false){
			alert("비밀번호 형식이 맞지 않습니다. 6~16자 영문,숫자,특수문자 각각 1개이상을 입력해주세요");
		}else if(pwConChk==false){
			alert("비밀번호가 일치하지 않습니다")
		}else if(pwEmpty=true && pwChk==true && pwConChk==true){
			console.log("submit")
			$("#changePwForm").submit();
		}
		
		
		
	}//확인버튼 누를 시 sendPw() End
	
	//취소 버튼 누를 시
	function comeback(){
			if (confirm("작업을 중단하고 이전 페이지로 이동하시겠습니까?")==true){
				location.href="backMyPage";v
			}else{
				return;
			}
		};
	
	</script>
</html>