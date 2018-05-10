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
		#header .links ul li{
			line-height: 1;
		}
		
		#eb_blank{
			width: 20px;
			height: 120px;
			display: hidden;
		}
		
		#buttons_location{
			position: relative;
			left: 50%;
			transform: translateX(-7%);
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
			<h1>사이트 소개</h1>
			<p>사이트 소개에 들어갈 내용을 작성해주세요.</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<form id="siteWrite" action="siteWrite" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td><textarea name="siteWrite_content" cols="50" rows="10" placeholder="사이트 소개 내용" style="resize:none;"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="file" name="q_file" onchange="fileCheck(this)">
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
				</tr>
			</table>
			<input type="hidden" value="5" name="cb_sort"/><!-- 게시판 구분 -->
			<input type="hidden" value="4" name="fs_index"/><!-- 파일 구분 -->
		</form>
		<br/>
		<div id="buttons_location">
			<input type="button" value="확인" onclick="sWrite()"/>&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='siteIntroPage'"/>
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
	
		function sWrite(){
			if($("textarea[name='siteWrite_content']").val() == ""){
				alert("사이트 소개 내용을 입력해주세요.");
			}else{
				$("#siteWrite").submit();
			}
		}
	</script>
</html>