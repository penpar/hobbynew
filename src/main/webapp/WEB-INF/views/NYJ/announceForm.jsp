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
		
		#writes{
			position: relative;
		    top: 20%;
		    float:right;
		}
		
		#writes input[type='button']{
			width: 65px;
			border-radius: 7px;
		    line-height: 3px;
		}
		
		#writes input[type='button']:hover{
			width: 65px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		}
		
		#tables{
			margin: 0 auto;
			width: 70%;
		}
		
		#eb_separate{
        	position: relative;
			width: 100%;
			height: 1px;
			margin: 0 auto;
    		background-color: lightgray;
         }
         
         #goPrev{
         	position: relative;
		    width: 125px;
		    border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
		    /* transform: translateX(0); */
		    /* left: 50%; */
         }
         
         #goPrev:hover{
			color: #ff9a2e;
			border-color: #ff9a2e;
			position: relative;
		    width: 125px;
		    border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
		    /* transform: translateX(0); */
		    /* left: 50%; */
         }
		</style>
	</head>
	<body>
	<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>공지사항</h1>
			<p>전해드릴 소식과 이벤트가 있습니다.</p>
		</div>
		<div id="eb_blank"></div>

		<!-- 신고, 수정, 삭제 버튼 -->
		<form id="announceForm" name="announceForm" action="b_NoticeDel" method="POST" enctype="multipart/form-data">
			<c:if test="${sessionScope.mb.m_sort == 0 ||  nolist[0].m_id == sessionScope.mb.m_id}">
				<div id="writes">
					<input type="button" onclick="Change()" value="수정">
					<input type="button" onclick="Del()" value="삭제">
				</div><br/><br/>
			</c:if>
		
		<!-- 여백 -->
		<br/><div id="eb_separate"></div>
		<br/><br/>
		
		<form id="freeDetail" name="freeDetail" action="b_FreeChange" method="POST" enctype="multipart/form-data">
			<!-- hidden -->
			<input type="hidden" id="cb_index" name="cb_index"value="${nolist[0].cb_index}">
			<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}">
			<input type="hidden" value="1" name="fs_index"/><!-- 파일 구분 -->
			<input type="hidden" id="f_newName" name="f_newName" value="${sessionScope.nolist[0].f_newName}">
		
			<div id="freeContent" style="text-align: center;" align="center">
			<h4>${nolist[0].cb_subject}</h4>
			<p><b >작성일&nbsp;${nolist[0].cb_date}</b></p><br/>
			
			<c:if test="${sessionScope.nolist[0].f_newName==null}" var="result">
				<input type="hidden" id="fileChk" name="fileChk" value="0">
			</c:if>
			
			<c:if test="${sessionScope.nolist[0].f_newName!=null}" var="result">
				<input type="hidden" id="fileChk" name="fileChk" value="1">
			</c:if>
			
			<c:if test="${nolist[0].f_newName != null}">
				<div class="vImg">
					<img src="/HNresources/uploadFolder/resources/announce/${nolist[0].f_newName}" style="width:35%;height:auto;">
				</div><br/><br/>
			</c:if>
			<h6 style="width:70%;margin:0 auto;">${nolist[0].cb_content}</h6><br/> 
		</form>
		<br/><br/>
		<input id="goPrev" type="button" value="목록으로 이동" onclick="location.href='announceList'"/>
	</body>
	<script>
	//수정 버튼 클릭 시
	function Change(){
		location.href="anChangeForm"
	}
	
	//삭제 버튼 클릭 시
	function Del(){
		if (confirm("해당 게시글을 삭제하시겠습니까?")==true){
			$("#announceForm").submit();
		}else{
			return;
		}
	}
	
	</script>
</html>