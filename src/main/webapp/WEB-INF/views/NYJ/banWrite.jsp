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
			width: 70%;
			margin: 0 auto;
		}
		
		#buttons_location{
			left : 50%;
			transform : translateX(44%);
		}
		
		#buttons_location input[type="button"], #buttons_location input[type="submit"]{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
			line-height: 3px;
			border-radius: 7px;
			font-size: 12px;
		}
		
		#buttons_location input[type="button"]:hover, #buttons_location input[type="submit"]:hover{
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
			<h1>신고 접수</h1>
			<p>신고는 신중하게 작성 부탁드립니다.</p>
		</div>
		<div id="eb_blank"></div>
		
		<form id="banWirte" name="banWirte" action="banInsert" onsubmit='return check()'>
			<table id="tables">
				<tr>
					<td><p style="display: inline;">신고 아이디</p>&ensp;&ensp;&ensp;
					<input type="text"  style="display: inline;width: 84%;" name = "m_id2" readonly value="${m_id2}"></td>
				</tr>	
				
				<tr>
					<td>
					<select name = "b_selected">
						<option value="">신고 사유</option>
						<option value="도배">도배</option>
						<option value="욕설">욕설</option>
						<option value="비방">비방</option>
						<option value="음란물">음란물</option>
						<option value="광고성게시물">광고성 게시물</option>
						<option value="사기">사기</option>
						<option value="허위정보">허위정보</option>
						<option value="기타">기타</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td><textarea name = "b_text" style="resize:none;" cols="20" rows="10" placeholder="신고내용"></textarea></td>
				</tr>
			</table>
			<br/><br/>
			<div id="buttons_location">
				<input type="submit" value="확인" />&nbsp;&nbsp;
				<input type="button" value="취소" onclick="comeBack()"/>
				
			</div>
			<input type = "hidden" name = "sort" value = "${sort}">
			<input type = "hidden" name = "index" value = "${index}">
			<input type = "hidden" name = "c_index" value = "${param.c_index}">
		</form>
	
	
	</body>
	<script>
		
		//취소 버튼 클릭시
		function comeBack(){
			if (confirm("취소 하시겠습니까?")==true){
				var sort = ${sort};
			
				if(sort==4){ // note로 이동
					location.href="noteList";
				}else if(sort==0){ // 투표 페이지
					location.href="voteDetail?cb_index="+${index};
				}else if(sort==1){ // 자유 페이지
					location.href="freeDetail?cb_index="+${index};
				}else if(sort==3){ // 포토 페이지
					location.href="photoGallery_list?cb_index="+${index};
				}else if(sort==2){ // 취미 클래스
					location.href="classDetail_contents?c_index="+${param.c_index};
				}else if(sort==5){ // 후기 게시판
					location.href="classDetail_contents?c_index="+${param.c_index};
				}else if(sort==6){ // 클래스 댓글
					location.href="classDetail_contents?c_index="+${param.c_index};
				}
				
			}else{
				false;
							}
			return;			
		}
		

		function check(){
			  if (confirm("신고를 진행하시겠습니까?")==true){
				  alert("신고접수가 완료 되었습니다.")
		    	true;
		      }else{
		    	 false;
		        
		      } 
			  return;
		}
			
		
	</script>
	
</html>