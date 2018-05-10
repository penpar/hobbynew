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
		      
		      .eb_btn{
				width: 65px;
			    border-radius: 7px;
			    font-size: 13px;
			    line-height: 3px;
			}
			
			.eb_btn:hover{
				width: 65px;
				border-radius: 7px;
				font-size: 13px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px;
			}
			
			#buttons_location{
			    width: 100%;
   				text-align: center;
			}
			
			#tables{
				width: 80%;
				margin: 0 auto;
			}
		</style>
		
	</head>
	<body>
		<h3 style="text-align: center;">쪽지</h3>
		<br/>
		
			<table id="tables">
				<tr>
				<th>보낸 사람</th>
					<td>${nDetail.m_id}</td>
				</tr>
				<tr>
					<th>받는 사람</th>
					<td>${nDetail.m_id2}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${nDetail.n_subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						${nDetail.n_content}
					</td>
				</tr>
			</table>

			<br/>
			<div id="buttons_location">
				<button name = "cls" type="button" onclick="closeP()" value="2" class="eb_btn">확인</button>
			</div>
			
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
	
	
	function goSubmit(a){
		window.open("mailReForm?m_id="+a+"", "MailWrite", "width=500, height=500, left=100, top=50");
	}

	function closeP(){
		window.close();
	}


</script>
</html>