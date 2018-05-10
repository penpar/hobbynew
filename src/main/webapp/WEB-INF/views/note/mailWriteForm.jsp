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
	      
	      #tables{
				width: 80%;
				margin: 0 auto;
			}
			
			#btn_location{
				width: 100%;
				text-align: center;
			}
			
			 #one, #two{
				width: 65px;
			    border-radius: 7px;
			    font-size: 13px;
			    line-height: 3px;
			}
			
			#one:hover, #two:hover{
				width: 65px;
				border-radius: 7px;
				font-size: 13px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px;
			}
		</style>
		
	</head>
	<body>
		<h3 style="text-align:center;">쪽지</h3><br/>
		<form action="mailWrite" method="get" id = "MyPop" name="MyPop" onsubmit="return check()">
			<table id="tables">
				<tr>
				<th>보낸 사람</th>
					<td><input type="text" name="m_id" value="${sessionScope.mb.m_id}" readonly></td>						
				</tr>
				<tr>
					<th>받는 사람</th>
					<td>
						<c:if test="${m_id != null}">
							<input type="text" id="recevie_id" name="m_id2" value="${m_id}">
						</c:if>
						<c:if test="${param.m_id2 != null}">
							<input type="text" id="recevie_id" name="m_id2" value="${param.m_id2}">
						</c:if>
						<c:if test="${m_id == null && param.m_id2 == null}">
							<input type="text" id="recevie_id" name="m_id2">
						</c:if>
					</td>		
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="n_subject"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="n_content" rows="5" cols="20" style="resize:none;"></textarea>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
					
				</tr>
			</table><br/>
			<div id="btn_location">
				<button name = "cls1" type="submit" value="전송" id="one">전송</button>
				<button name = "cls" type="button" onclick= "closeP()" id="two">취소</button>
			</div>
		</form>
	<div style="display:none;">
	<jsp:include page="../loginBox.jsp"/>
	</div>


		
	</body>




<script>

	${text}

	/*
	$("input[name=cls]").mouseup(function(){
		window.opener.top.location.href="noteList";
		//window.opener.top.location.reload();//새로고침
		window.close();
	});
	*/
	function check() {
		  if(MyPop.m_id.value == "") {
		    alert("보내는 사람을 입력해 주세요.");
		    MyPop.m_id.focus();
		    return false;
		  }
		  else if(MyPop.m_id2.value == "") {
		    alert("받는 사람을 입력해 주세요.");
		    MyPop.m_id2.focus();
		    return false;
		  }
		  else if(MyPop.n_subject.value == "") {
			    alert("제목을 입력해 주세요.");
			    MyPop.n_subject.focus();
			    return false;
			  }
		  else if(MyPop.n_content.value == "") {
			    alert("내용을 입력해 주세요.");
			    MyPop.n_content.focus();
			    return false;
			  }
		  else return true;
		  
		}

	function closeP(){
		window.close();
	}

	/*
	  jQuery('#MyPop').submit(
			    function(){
			    	
					window.opener.top.location.href="noteList";
					window.opener.top.location.reload();//새로고침
			    }
			)
	
	*/

</script>


</html>