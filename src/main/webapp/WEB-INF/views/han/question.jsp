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
		
		#eb_question{
			width: 70%;
			margin: 0 auto;
		}
		
		#buttons_location{
			left : 50%;
			transform : translateX(42%);
		}
		
		#eb_question select {
		    width: 100%; /* 원하는 너비설정 */
		    padding: 7px 10px; /* 여백으로 높이 설정 */
		    font-family: inherit;  /* 폰트 상속 */
		    /* 네이티브 화살표를 커스텀 화살표로 대체 */
		    background: url('resources/assets/img/reference/select.png') no-repeat 98% 50%;
		    background-size: 20px auto;
		    /* border: 1px solid #999; */
		    /* border-radius: 4px; */
		    -webkit-appearance: none; /* 네이티브 외형 감추기 */
		    -moz-appearance: none;
		    appearance: none;
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
			<h1>1:1 문의</h1>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<form id="questionWrite" action="questionWrite" method="post" enctype="multipart/form-data">
			<table id="eb_question">
				<tr>
					<td><input type="text" name="cb_subject" placeholder="문의 제목"/></td>
				</tr>
				<tr>
					<td>
						<select name="q_type">
							<option value="">문의 종류를 선택해주세요.</option>
				            <option value="사이트 개선">사이트 개선</option>
				            <option value="제휴">제휴</option>
				            <option value="취미 아티스트 전환">취미 아티스트 전환</option>
				            <option value="클래스 운영">클래스 운영</option>
				            <option value="기타">기타</option>
	            		</select>
	            	</td>
				</tr>
				<tr><!--teatarea는 사이 공간까지 인식하기 때문에 항상 붙여서 명령해야 한다.-->
					<td><textarea name="cb_content" cols="30" rows="10" placeholder="문의 내용" style="resize:none;"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="file" name="q_file" onchange="fileCheck(this)"
						accept=".ais,.arj,.cab,.gz,.hgx,.jas,.lzh,.pak,.psz,.rar,.sea,.tgz,.zip,.zool,.alz"><br/>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
						<br/><p>* zip 확장자만 첨부 가능합니다. 파일은 압축하여 하나로 업로드해 주시기 바랍니다.</p>
					</td>
				</tr>
			</table>
			<input type="hidden" value="4" name="cb_sort"/><!-- 게시판 구분 -->
			<input type="hidden" value="3" name="fs_index"/><!-- 파일 구분 -->
		</form>
		<div id="buttons_location">
			<input type="button" value="확인" onclick="qWrite()"/>&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='customerCenter'"/>
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
	
		function qWrite(){
			if($("input[name='cb_subject']").val() == ""){
				alert("문의 제목을 입력해주세요.");
			}else if($("select[name='q_type']").val() == ""){
				alert("문의 종류를 선택해주세요.");
			}else if($("textarea[name='cb_content']").val() == ""){
				alert("문의 내용을 입력해주세요.");
			}else{
				$("#questionWrite").submit();
			}
		}
		
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>