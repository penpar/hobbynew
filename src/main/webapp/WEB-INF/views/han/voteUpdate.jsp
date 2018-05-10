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
		
		.eb_vote{
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
		
		.startDay, .endDay{
            width: 15%;
            display: inline;
            font-size: 12;
            align: center;
            padding: 0 0 0 6px;
         }
		
		#eb_separate{
        	position: relative;
			width: 75%;
			height: 1px;
			margin: 0 auto;
    		background-color: lightgray;
         }
         
         .plus{
         	width: 46px;
         	height: auto;
        	margin: 0px 0px 0px 10px;
        	cursor: pointer;
         }
         
         .removeImg{
        	width: 15px;
    		height: 15px;
    		position: relative;
    		margin: 0px 5px 0px 20px;
         	cursor: pointer;
         }
         
         input[type="checkbox"], input[type="radio"]{
         	margin: 6px 12px;
    		float: left;
    		margin-right: 1em;
         }
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>투표 게시판</h1>
			<p>수정할 내용을 입력해주세요!</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<form id="voteUpdate" action="vUpdate" method="post" enctype="multipart/form-data">
			<table class="eb_vote">
				<tr>
					<td><input type="text" name="cb_subject" value="${updateList[0].cb_subject}"/></td>
				</tr>
				<tr>
					<td><textarea name="cb_content" cols="30" rows="10" style="resize:none;">${updateList[0].cb_content}</textarea></td>
				</tr>
				<tr>
					<td><b>파일 첨부</b>&nbsp;&nbsp;&nbsp;
					<input type="file" name="v_file" onchange="fileCheck(this)" multiple="multiple" accept=".jpg,.png,.gif,.tif,.tiff">
						<br/><br/><p>첨부한 파일 :
						<c:forEach items="${fileName}" var="files">
							 ${files}&nbsp;&nbsp;
						</c:forEach>
						</p>
						<p>* 가장 먼저 첨부한 이미지 파일이 대표 이미지가 됩니다. 해당 이미지는 투표 게시판 목록에 썸네일로 노출됩니다.<br/>
						&nbsp;&nbsp;새로운 파일을 첨부하여 수정할 경우, 기존의 파일은 삭제됩니다.</p>
						<p>* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다. </p>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
				</tr>
				</table>
			<input type="hidden" value="${param.cb_index}" name="cb_index"/><!-- 글번호 구분 -->
			<input type="hidden" value="2" name="cb_sort"/><!-- 게시판 구분 -->
			<input type="hidden" value="6" name="fs_index"/><!-- 파일 구분 -->
		</form>	
		<br/>
		<div id="buttons_location">
			<input type="button" value="확인" onclick="vWrite()"/>&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='vote'"/>
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
		
		// 유효성 체크
		function vWrite(){
			/* daySetCheck(); */
			if($("input[name='cb_subject']").val() == ""){
				alert("제목을 입력해주세요.");
			}else if($("textarea[name='cb_content']").val() == ""){
				alert("내용을 입력해주세요.");
			}else{
				$("#voteUpdate").submit();
			}
		}
		
		var msg1 = "${msg}";
		if(msg1 != ""){
			alert(msg1);
		}
	</script>
</html>