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
			<form id="freeWriteForm" action=b_freeWrite method="POST" enctype="multipart/form-data">
			
			<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}">
			<input type="hidden" value="2" name="fs_index"/><!-- 파일 구분 -->
			<input type="hidden" id="cb_sort" name="cb_sort" value="1">
				<table>
					<tr>
						<td>
							<select name="cn_index">
							<option value="0">분류</option>
								<c:forEach items="${numlist}" var="result">
									<option value="${result.cn_index}">${result.cn_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td><input type="text" id="fb_title" name="fb_title" placeholder="말머리"></td>
					</tr>
					
					<tr>
						<td><input type="text" id="cb_subject" name="cb_subject" placeholder="제목"></td>
					</tr>
					
					<tr>
						<td><textarea rows="10" cols="30" id="cb_content" name="cb_content" placeholder="내용" style="resize:none;"></textarea></td>
					</tr>
					
					<tr>
						<td>파일첨부 : <input type="file" name="anFile" onchange="fileCheck(this)" multiple="multiple" multiple="multiple" accept="image/*" onchange="chk_file_type(this)">
						<input type="hidden" value="0" id="fileChk" name="fileChk"></td>
					</tr>
					
				</table>
				<div id="middle">
					<input type="button" onclick="freeWrite()" value="확인" class="midBtn">
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
	
	//첨부 파일 확인
	function chk_file_type(obj) {
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind+1,obj.length);
		var file_type = file_name.toLowerCase();
		console.log(file_kind);
		console.log(file_name);
		console.log(file_type);

		var check_file_type = new Array();

		check_file_type=['jpg','gif','png','jpeg','bmp', 'tif', 'tiff'];
		if(check_file_type.indexOf(file_type)==-1){
			alert('이미지 파일만 선택할 수 있습니다.');
			$("input[type='file']").val("");
			var parent_Obj=obj.parentNode
			var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
			return false;
		}
	}
	
	function freeWrite() {
		if($("#fb_title").val() == ""){
			alert()
		}
	}
	</script>
</html>