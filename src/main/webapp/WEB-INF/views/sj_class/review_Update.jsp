<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/js/jquery-3.2.1.js"></script>
		<title>소수의 취향</title>
		<style>
			#class_Sample{
	            border: 1px solid #D8D8D8;
	            width: 60%;
	            height: 14%;
	            margin: 0 auto;
	            padding: 15px;
	         }
	         
	         #class_Sample p {
			    font-size: 15px;
			    line-height: 200% !important;
			    margin: 0;
			 }
	         
	          #mainDiv{
                width: 15%;
	            float: left;
	            margin: 0px 30px 0px 0px;
	         }
	         
	         #mainImg{
	             width: 100%;
	             height: 100%;
	             object-fit: cover;
	         }
		
			#updateTB{
				margin: 0 auto;
				width: 60%;
				text-align: center;
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
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		<div id="eb_separate"></div>
		<div id = "second_subject" align="center" style="left: 30%;">
			<h1>후기 수정</h1>
			<p>후기를 수정해주세요.</p>
		</div>
		<div id="eb_separate"></div>
		<br/>
		
		<!-- 후기쓰려는 클래스의 대표이미지, 상품명, 간단한 설명, 기간, 가격-->
			<div id="class_Sample">
	         <div id="mainDiv">
	         	<!-- 나중에 사진으로 교체하기 --> 
	            <img id="mainImg" src="${classDetail.path}${classDetail.classBean.c_mainImg}">
	         </div>
	         <p><b>상품명</b>&nbsp;&nbsp;${classDetail.classBean.c_subject}&nbsp;/&nbsp;
	         	<b>간단한 설명</b>&nbsp;&nbsp;${classDetail.classBean.c_simpleContent}<br/>
				<b>기간</b>&nbsp;&nbsp;${classDetail.classBean.c_startDay}&nbsp;∼&nbsp;${classDetail.classBean.c_endDay}<br/>
				<b>가격</b>&nbsp;&nbsp;${classDetail.classBean.c_price}원</p>
			</div>
			<br/><br/>

		<form id="review_Update" action="reviewUpdate" method="post" enctype="multipart/form-data">
		<table id="updateTB">
			<tr>
				<td colspan="2">
					<input type="text" placeholder="제목" name="re_subject" value="${reviewUpdate.re_subject}">
					<input type="hidden" name="c_index" value="${reviewUpdate.c_index}">
					<input type="hidden" name="re_index" value="${param.re_index}">
					<input type="hidden" name="rf_oriName" value="${reviewUpdate.rf_oriName}">
				</td>
			</tr>
			<tr>
				<td>
					별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점
				</td>
				<td>
					<!-- <img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/> -->
					<select id="pointSelect" name="a_rate">
						<option value="5" <c:if test="${reviewUpdate.a_rate == 5}">selected</c:if>>5점</option>
						<option value="4" <c:if test="${reviewUpdate.a_rate == 4}">selected</c:if>>4점</option>
						<option value="3" <c:if test="${reviewUpdate.a_rate == 3}">selected</c:if>>3점</option>
						<option value="2" <c:if test="${reviewUpdate.a_rate == 2}">selected</c:if>>2점</option>
						<option value="1" <c:if test="${reviewUpdate.a_rate == 1}">selected</c:if>>1점</option>
						<option value="0" <c:if test="${reviewUpdate.a_rate == 0}">selected</c:if>>0점</option>
					</select>
				</td> 
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="20" placeholder="내용" name="re_content" style="resize: none;">${reviewUpdate.re_content}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					사진 첨부
				</td>
				<td style="text-align: left;">
					<input type="file" name="re_file">
				</td>
			</tr>
			<tr style="text-align: left;">
				<td colspan="2">
					첨부된 파일 : ${reviewUpdate.rf_oriName}
					<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
					&nbsp;&nbsp;새로운 파일을 첨부하여 수정 할 경우, 기존의 파일은 삭제됩니다.</p>
				</td>
			</tr>
		</table>
		</form>
		<div id="buttons_location">
		<input type="button" onclick="updateChk()" value="수정">
		<input type="button" onclick="location.href='classDetail_contents?c_index=${reviewUpdate.c_index}'" value="취소">
		</div>
	</body>
	<script>
		function updateChk() {
			if($("input[name='re_subject']").val() == ""){
				alert("제목을 입력해 주세요.");
			}else if($("textarea[name='re_content']").val() == ""){
				alert("내용을 입력해 주세요.");
			}
			$("#review_Update").submit();
		}
		
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>