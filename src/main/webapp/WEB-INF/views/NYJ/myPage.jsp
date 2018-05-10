<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		#m_pw{
			width: 145px;
		    line-height: 3px;
		    border-radius: 7px;
		    float: right;
		    font-size: 12px;
		}
		
		#m_pw:hover{
			width: 145px;
			line-height: 3px;
			border-radius: 7px;
			color: #ff9a2e;
			float: right;
			border-color: #ff9a2e;
		}
		
		#trHere td{
	        padding: 12px 0px 0px 10px;
		}
		
		#trHere input[type='button']{
            margin: -3px 20px 9px 10px;
		}
		
		#buttons_location{
			left : 50%;
		    transform: translateX(43%);
		}
		
		#buttons_location input[type="submit"], #buttons_location input[type="button"]{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
			line-height: 3px;
			border-radius: 7px;
			font-size: 12px;
		}
		
		#buttons_location input[type="submit"], #buttons_location input[type="button"]:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
			line-height: 3px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		}
		
		#mySp{
	        width: 28px;
		    /* margin: 0 auto; */
		    /* left: 20%; */
		    margin: 0px 0px 3px 0px;
		    position: relative;
		    height: auto;
		}
		
		#mySps{
		    margin: 0 auto;
		    font-size: 13px;
		    width: 80px;
		    text-align: center;
		    border-radius: 100px;
		    padding: 14px;
		    /* align-items: center; */
		    height: 80px;
		    background-color: #E6E6E6;
		    left: 50%;
		    cursor: pointer;
		}
		
		#mySps:hover{
			background-color: #ff9a2e;
		}
	</style>	
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h2>My Page</h2>
		</div>
		<div id="eb_blank"></div>
		
		<div id="mySps" onclick="mySpace()">
			<%-- ${sessionScope.mb.m_id}&nbsp;&nbsp;&nbsp; --%>
			<img src="resources/assets/img/my/mySpace.png" id="mySp"/>
			<p>내 공간</p>
		</div>
		<br/><br/>
		
		<form id="myPageForm" action="ny_out">
		<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}"/>
		<input type="hidden" id="m_name" name="m_name" value="${sessionScope.mb.m_name }"/>
		<input type="hidden" id="m_email" name="m_email" value="${sessionScope.mb.m_email}"/>
		<input type="hidden" id="m_phone" name="m_phone" value="${sessionScope.mb.m_phone}"/>
		<input type="hidden" id="m_addr" name="m_addr" value="${sessionScope.mb.m_addr}"/>
		<input type="hidden" id="m_detailAddress" name="m_detailAddress" value="${sessionScope.mb.m_detailAddress}"/>
			<table id="tables">
				<tr id="trHere">
					<td>아이디</td>
					<td>
						${sessionScope.mb.m_id}
						<input type="button" id="m_pw" name="m_pw" onclick="changePw()" value="비밀번호 변경하기">
					</td>
				</tr>
								
				<tr>
					<td>이름</td>
					<td>${sessionScope.mb.m_name }</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>${sessionScope.mb.m_email}</td>
				</tr>
				
				<tr>
					<td>연락처</td>
					<td>${sessionScope.mb.m_phone}</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>${sessionScope.mb.m_addr}<br/>
					${sessionScope.mb.m_detailAddress}</td>
				</tr>

				<tr>
					<td>포인트</td>
					<td colspan="2">${myPoint}</td>
				</tr>
			</table>
			<br/>
			<div id="buttons_location">
				<input type="button"  onclick="nyEdit()" value="수정하기">&nbsp;&nbsp;
				<input type="button"  onclick="ny_out()" value="탈퇴">
			</div>
			
			
		</form>
	</body>
	<script>
	//내 공간 버튼 클릭 시
	function mySpace(){
		location.href="mySpaceList?sort=1"
	}
	
	//수정하기 버튼 클릭 시
	function nyEdit(){
		location.href="myPageEdit"
	}

	//탈퇴 버튼 클릭 시
	function ny_out(){
		if(confirm("탈퇴 시 이 계정은 영구적으로 사용할 수 없습니다. 그래도 탈퇴하시겠습니까?") == true){
			$("#myPageForm").submit();
		}else{
			return;
		}
	};
	
	function changePw(){
		location.href="changePw"
	} 
	
	//글 작성 & 수정 & 삭제 alert
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
		location.href="myPage"
	}
	
	</script>
</html>