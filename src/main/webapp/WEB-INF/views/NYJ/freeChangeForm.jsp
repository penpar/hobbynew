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
			width: 60%;
			margin: 0 auto;
		}
		
		#middle{
			position: relative;
		    /* margin: 0 auto; */
		    left: 50%;
		    transform: translateX(-8%);
		}
		
		.midBtn{
			width: 75px;
		    border-radius: 7px;
		    color: #ff9a2e;
		    border-color: #ff9a2e;
		    line-height: 3px !important;
		}
		
		.midBtn:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 75px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		}
		</style>
	</head>
	<body>
	<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>자유게시판</h1>
			<p>이야기를 나누는 공간</p>
		</div>
		<div id="eb_blank"></div>
		
		<div id="tables">
			<form action=b_freeChange method="POST" enctype="multipart/form-data">
			
			
			<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}"/>
			<input type="hidden" id="cb_index" name="cb_index" value="${freeCom.cb_index}"/>
			<input type="hidden" value="2" name="fs_index"/><!-- 파일 구분 -->
			<input type="hidden" id="cb_sort" name="cb_sort" value="1"/>
			<input type="hidden" id="cb_date" name="cb_date" value="${freeCom.cb_date}"/>
			<%-- <c:forEach items="${freeCom.fAllList}" var="list">
				<input type="hidden" name="f_newName" value="${list.f_newName}">
			</c:forEach> --%>
			
				<table>
					<tr>
						<td>
							<select name="cn_index">
								<c:forEach items="${numlist}" var="result">
									<option value="${result.cn_index}">${result.cn_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td><input type="text" id="fb_title" name="fb_title" value="${freeCom.fb_title}"></td>
					</tr>
					
					<tr>
						<td><input type="text" id="cb_subject" name="cb_subject" value="${freeCom.cb_subject}"></td>
					</tr>
					
					<tr>
						<td><textarea rows="10" cols="30" id="cb_content" name="cb_content" style="resize:none;">${freeCom.cb_content}</textarea></td>
					</tr>
					
					<tr>
						<td><b>파일 첨부</b>&nbsp;&nbsp;&nbsp;
						<input type="file" name="anFile" onchange="fileCheck(this)" multiple="multiple" accept=".jpg,.png,.gif,.tif,.tiff">
							<br/><br/><p>첨부한 파일 :
							<c:forEach items="${freeCom.fAllList}" var="list">
								${list.f_oriName}
							</c:forEach>
							</p>
							<p>* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
							&nbsp;&nbsp;새로운 파일을 첨부하여 수정할 경우, 기존의 파일은 삭제됩니다.</p>
							<p> </p>
							<input type="hidden" value="0" id="fileChk" name="fileChk">
						</td>
					</tr>					
				</table>
				<div id="middle">
					<input type="submit" value="확인" class="midBtn">
					<input type="button" onclick="comeBack()" value="취소" class="midBtn">
				</div><br/><br/>
			</form>
		</div>
	</body>
	<script>
	
	//파일 첨부
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
			location.href="freeList";
		}else{
			return;
		}
		
	}
	
	</script>
</html>