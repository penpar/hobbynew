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
		
		#eb_photo{
			width: 70%;
			margin: 0 auto;
		}
		
		#buttons_location{
			left : 50%;
			transform : translateX(42%);
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
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>포토 갤러리</h1>
			<p>수정할 내용을 입력해주세요!</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<form id="photoUpdate" action="photoUpdate" method="post" enctype="multipart/form-data">
			<table id="eb_photo">
				<tr>
					<td>
						<input type="text" name="cb_subject" value="${updateList[0].cb_subject}"/>
						<input type="hidden" name="cb_index" value="${updateList[0].cb_index}"/>
					</td>
				</tr>
				<tr>
					<td><textarea name="cb_content" cols="30" rows="10" style="resize:none;">${updateList[0].cb_content}</textarea></td>
				</tr>
				<tr>
					<td><b>이미지 첨부</b>&nbsp;&nbsp;&nbsp;
					<input type="file" name="p_file" onchange="fileCheck(this)" multiple="multiple" accept=".jpg,.png,.gif,.tif,.tiff">
						<br/><br/><p>첨부한 파일 :
						<c:forEach items="${fileName}" var="files">
							 ${files}&nbsp;&nbsp;
						</c:forEach>
						</p>
						<p>* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
						&nbsp;&nbsp;새로운 파일을 첨부하여 수정할 경우, 기존의 파일은 삭제됩니다.
						</p>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
				</tr>
			</table>
			<input type="hidden" value="3" name="cb_sort"/><!-- 게시판 구분 -->
			<input type="hidden" value="7" name="fs_index"/><!-- 파일 구분 -->
		</form>	
		<br/>
		<div id="buttons_location">
			<input type="button" value="수정" onclick="pWrite()"/>&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='photoGallery_list'"/>
		</div>
	</body>
	<script>
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
	
		function pWrite(){
			if($("input[name='cb_subject']").val() == ""){
				alert("제목을 입력해주세요.");
			}else if($("textarea[name='cb_content']").val() == ""){
				alert("내용을 입력해주세요.");
			}else{
				console.log("수정 시작");
				$("#photoUpdate").submit();
			}
		}
		
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>