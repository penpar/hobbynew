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
		
		#tables{
			margin: 0 auto;
			width: 70%;
		}
		
		#buttons_location{
			left : 50%;
			transform : translateX(42%);
		}

		#buttons_location input[type="button"]{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
			line-height: 3px;
			border-radius: 7px;
			font-size: 12px;
		}
		
		#buttons_location input[type="button"]:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
			line-height: 3px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		}
		
		#tables{
			margin: 0 auto;
			width: 70%;
		}
	</style>
	</head>
	<body>
	<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>공지사항</h1>
			<p>수정할 내용을 입력해주세요.</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<form id="anChangeForm" name="anChangeForm" action="b_NoticeChange" method="POST" enctype="multipart/form-data">			
			<input type="hidden" id="cd_index" name="cb_index"value="${nolist[0].cb_index}">
			<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}">
			<input type="hidden" id="an_main" name="an_main" value="${nolist[0].an_main}">
			<input type="hidden" value="1" name="fs_index"/><!-- 파일 구분 -->
			<input type="hidden" id="f_newName" name="f_newName" value="${sessionScope.nolist[0].f_newName}">
			
			<table id="tables">
				<tr>
					<td colspan="2">
						<select id="cb_sort" name="cb_sort">
							<option value="0">공지사항</option>
							<option value="6">이벤트</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="text" id="cb_date" name="cb_date" value="${nolist[0].cb_date}" readonly></td>
				</tr>
			
				<tr>
					<td><input type="text" id=cb_subject name="cb_subject" value="${sessionScope.nolist[0].cb_subject}" placeholder="제목"></td>
				</tr>
				<%-- ${nolist[0].cb_index}" --%>
				
				<tr>
					<td colspan="2"><textarea class="autosize" id="cb_content" name="cb_content" style="resize:none;" onkeyup="resize(this)" placeholder="내용">${sessionScope.nolist[0].cb_content}</textarea></td>
					<%-- <td><input type="text" id="cb_content" name="cb_content" value="${sessionScope.nolist[0].cb_content}"></td> --%>
				</tr>
				<%-- ${nolist[0].cb_content} --%>
				
				<tr>
					<td><b>파일 첨부</b>&nbsp;&nbsp;&nbsp;
						<input type="file" name="anFile" onchange="fileCheck(this)" accept=".jpg,.png,.gif,.tif,.tiff"><br/>
						<br/><p>첨부한 파일 : &ensp; ${sessionScope.nolist[0].f_oriName}<br/><br/>
						* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
		                &nbsp;&nbsp;새로운 파일을 첨부하여 수정할 경우, 기존의 파일은 삭제됩니다.</p>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
				</tr>
			</table>
			<br/><br/>
			<div id="buttons_location">
				<input type="button" onclick="changeSend()" value="수정완료">&nbsp;&nbsp;
				<input type="button" onclick="comeBack(${nolist[0].cb_index})" value="취소">
			</div>
		</form>
	</body>
	<script>
	
	//글 박스 사이즈 늘리는 함수
	function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
	
	//파일 첨부 여부 확인
	function fileCheck(elem){
        console.log(elem.value);
        if(elem.value==""){
            console.log("empty");
            $("#fileChk").val(0);//파일 첨부 안함
        }else{
            console.log("unempty");
            $("#fileChk").val(1);//파일 첨부 했음
        }
    }
	
	
	function changeSend(){
		if($("input[name='cb_subject']").val() == ""){
			alert("제목을 입력해주세요.");
		}else if($("textarea[name='cb_content']").val() == ""){
			alert("내용을 입력해주세요.");
		}else{
			console.log("submit");
			$("#anChangeForm").submit();
		}
	}
	
	
	
	//취소 버튼 누를 시
	function comeBack(cb_index){
		if (confirm("취소하시겠습니까?")==true){
			location.href="announceForm?cb_index="+cb_index;
		}else{
			return;
		}
	}
	</script>
</html>