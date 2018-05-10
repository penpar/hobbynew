<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
<!DOCTYPE html>
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/js/jquery-3.2.1.js"></script>
		<title>쪽지</title>
		<style>
			#header .links ul li{
		         line-height: 1;
		      }
		</style>
		
	</head>
	<body>
		<h1>쪽지</h1>
		<form action="mailWrite" method="get" id="MyPop" onsubmit = 'check()'>
			<table>
				<tr>
				<th>보낸 사람</th>
					<td><input type="text" name="m_id" value="${sessionScope.mb.m_id}" readonly></td>						
				</tr>
				<tr>
					<th>받는 사람</th>
					<td><input type="text" name="m_id2"></td>		
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="n_subject"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="n_content" rows="10" cols="20"></textarea>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
					
				</tr>
			</table>
			<button name = "cls1" type="submit" value="전송">전송</button>
			<button name = "cls" type="button" onclick="closeP()">취소</button>
		</form>
	<div style="display:none;">
	<jsp:include page="../loginBox.jsp"/>
	</div>


		
	</body>

<script>

	$("input[name=cls]").mouseup(function(){
		window.opener.top.location.href="noteList";
		//window.opener.top.location.reload();//새로고침
		window.close();
	});
	

	
	function check(){
		alert("메시지가 전송되었습니다.")
	}

	function closeP(){
		window.close();
	}
	

	jQuery('#MyPop').submit(
		    function(){
		            alert('서브밋!');
		            mySubmit();

		    }
		)
		
	function mySubmit(){
		alert("메시지가 전송되었습니다.");
		window.opener.top.location.href="noteList";
		window.opener.top.location.reload();//새로고침
		function showPopup1() { 
			window.open("noteControl.jsp", "MailWrite1", "width=530, height=630, left=50, top=50"); 
		}
		
		
		
		
		
		/*
		window.opener.name = "parentPage"; // 부모창의 이름 설정
		document.MyPop.target = "parentPage"
	    document.MyPop.action ="noteList";
	    */ 
	}
	
	

</script>


</html>