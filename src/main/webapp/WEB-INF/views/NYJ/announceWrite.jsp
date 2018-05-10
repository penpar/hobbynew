<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/assets/js/jquery.min.js"></script>
		<title>소수의 취향</title>
	</head>
	<style>
		body{
			font-family: 'Nanum Square';
			font-size:18px;
		}
		
		#header .links ul li{
			line-height: 1;
		}
		
		#eb_blank{
			width: 20px;
			height: 120px;
			display: hidden;
		}
		
		textarea.autosize {
			min-height: 50px;
		}
		
		#tables{
			width: 60%;
     		margin: 0 auto;
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
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>공지사항</h1>
			<p>내용을 입력해주세요.</p>
		</div>
		<div id="eb_blank"></div>
		
		<form id="anWriteForm" name="anWriteForm" action="b_NoticeWrite" method="POST" enctype="multipart/form-data">
		<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}">
		<input type="hidden" value="1" name="fs_index"/><!-- 파일 구분 -->
			<table id="tables">
				<tr>
					<td>
						<select id="cb_sort" name="cb_sort">
							<option value="0">공지사항</option>
							<option value="6">이벤트</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><input type="text" id="cb_subject" name="cb_subject" placeholder="제목"></td>
				</tr>
				
				<tr>
					<td>
						<textarea  class="autosize"  id="cb_content" name="cb_content" placeholder="내용" style="resize:none;" onkeydown="resize(this)" onkeyup="resize(this)" ></textarea>
					</td>
				</tr>
				<tr>
					<td><b>이미지 첨부</b>&nbsp;&nbsp;&nbsp;
					<input type="file" name="anFile" onchange="fileCheck(this)">
					<input type="hidden" value="0" id="fileChk" name="fileChk"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="an_main" value="0" id="mains" style="margin: 5px 0px 0px 5px;"/>&ensp;&ensp;메인에 노출
					<input type="hidden" value="0" id="mainChk" name="mainChk">
					</td>
				</tr>
			</table>
			<br/>
			<div id="buttons_location">
				<input type="button" value="확인" onclick="okClick()"/>&nbsp;&nbsp;
				<input type="button" value="취소" onclick="comeBack()"/>
			</div>
		</form>
	</body>
	<script>
		function okClick(){
			var mainChk = $("#mains").is(":checked");
			console.log(mainChk);
			if(mainChk == true){
				$("#mainChk").val(1);
			}
			console.log($("#mainChk").val());
			$("#anWriteForm").submit();
		}
	
		//글 박스 사이즈 늘리는 함수
		function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}
		
		function fileCheck(elem){
			console.log(elem.value);//elem.value파일명 //파일태그는 내가 선택한 파일명이 밸류가 됨
			if(elem.value==''){
				console.log("empty");
				$("#fileChk").val(0);//첨부 안되면 name:fileChk의 값을 0을 넣는다 //서버는 name만 인식한다
			}else{
				console.log('not empty');
				$("#fileChk").val(1);//첨부 되면 name:fileChk의 값을 1을 넣는다
			}
		}
		
		//취소 버튼 클릭시
		function comeBack(){
			if (confirm("취소 하시겠습니까?")==true){
				location.href="announceList";
			}else{
				return;
			}
		}	
	</script>
</html>