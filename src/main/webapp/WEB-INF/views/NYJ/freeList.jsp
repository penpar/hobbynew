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
		
		.lefts{
		    width: 110px;
		    float: left;
		    margin: 5px 10px 0px 0px;
		}
		
		.rights{
		    width: 80px;
   			line-height: 3px !important;
		    float: right;
		    border-radius: 7px;
		    position: relative;
		    margin: 5px 10px 0px 0px;
		    font-size: 12px;
		    font-size: 13px !important;
		}
		
		.rights:hover{
			width: 80px;
			line-height: 3px;
			float: right;
			position: relative;
		    margin: 5px 10px 0px 0px;
			border-radius: 7px;
			color: #ff9a2e;
			font-size: 12px;
			border-color: #ff9a2e;
			font-size: 13px !important;
		}
		
		.leftss{
		    width: 80px;
		    line-height: 3px !important;
		    border-radius: 7px;
		    position: relative;
		    font-size: 13px !important;
		    margin: 5px 10px 0px 0px;
		}
		
		.leftss:hover{
			width: 80px;
			line-height: 3px;
			/* float: left; */
			position: relative;
			font-size: 13px !important;
		    margin: 5px 10px 0px 0px;
			border-radius: 7px;
			color: #ff9a2e;
			font-size: 12px;
			border-color: #ff9a2e;
		}

		.classify_top{
			    width: 100%;
			    height: 67px;
			    border-bottom: 1px solid #D8D8D8;
			    padding: 14px 5px 14px 30px;
			    font-size: 15.5px;
		}
		
		.classify_top:hover{
			width: 100%;
		    height: 67px;
		    background-color: white;
		    border-bottom: 1px solid #D8D8D8;
	        padding: 14px 5px 14px 30px;
		    font-size: 15.5px;
		    cursor: pointer;
		}
		
		.classify_middle{
		    width: 25%;
		    height: 100%;
		    float: left;
		    /* background-color: green; */
		    padding: 13px;
		}
		
		.classify_middle p{
			float:left;
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
		
		<c:if test="${sessionScope.mb.m_id != null}">
			<input type="button" class="rights" onclick="freeWrite()" value="글쓰기">
		</c:if>
		<br/>
		<!-- <select class="lefts">
			<option value="10">전체</option>
			<option value="0">글 제목</option>
			<option value="1">글 내용</option>
		</select>
	
		<select class="lefts">
			<option value="10">전체</option>
			<option value="0">도서</option>
			<option value="1">영화</option>
			<option value="2">음악</option>
			<option value="3">공예</option>
			<option value="4">사진</option>
			<option value="5">운동</option>
			<option value="6">기타</option>
		</select>
	
		<input type="text" id="find" class="lefts" style="width: 25%;" name="find" placeholder="검색 내용">
		<input type="button" class="leftss" id="clickFind" name="clickFind" value="검색"> -->
		<br/><br/>
		
		<!-- ============================================ -->
		<div id="freeListTableDiv">
			<c:forEach items="${flist}" var="result">
				<div class="classify_top" onclick="move(${result.cb_index})">
					<div class="classify_middle" style="float:left;text-align:left; width: 15%;">
						<!-- 대분류명 출력 -->
						<p><b>분류</b></p>&ensp;&ensp;
						<c:choose>
							<c:when test="${result.cn_name eq '도서'}">도서</c:when>
							<c:when test="${result.cn_name eq '영화'}">영화</c:when>
							<c:when test="${result.cn_name eq '음악'}">음악</c:when>
							<c:when test="${result.cn_name eq '공예'}">공예</c:when>
							<c:when test="${result.cn_name eq '사진'}">사진</c:when>
							<c:when test="${result.cn_name eq '운동'}">운동</c:when>
							<c:when test="${result.cn_name eq '기타'}">기타</c:when>
							<c:otherwise>기타</c:otherwise>
						</c:choose>
					</div>
					<div class="classify_middle" style="width: 35%;">
						<p><b>제목</b>&ensp;&ensp;${result.cb_subject}</p>
					</div>
					<div class="classify_middle">
						<p><b>작성자</b>&ensp;&ensp;${result.m_id}</p>
					</div>
					<div class="classify_middle">
						<p><b>작성일</b>&ensp;&ensp;${result.cb_date}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- ============================================ -->
	</body>
	<script>
		var sessionSort = "${sessionScope.mb.m_sort}";
		var sessionId = "${sessionScope.mb.m_id}";
	
		// 글 클릭 시 상세보기로 이동
		function move(cb_index){
			if(sessionId != ""){
				location.href="freeDetail?cb_index="+cb_index;
			}else{
				alert("로그인이 필요한 서비스입니다.");
				location.href="loginForm";
			}
		}
	
		//자유게시판 글쓰기 버튼 클릭 시
		function freeWrite(){
			if(sessionSort == 1 || sessionSort == 2){
				location.href="freeWrite";
			}else{
				alert("일반 회원 및 제한적 취미 아티스트의 권한을 가진 회원님들만\r사용할 수 있는 게시판입니다.")
			}
			
		}

		//글 작성 & 수정 & 삭제 alert
		var msg = "${param.msg}";
		if(msg!=""){
			alert(msg);
			location.href="freeList"
		}
	
	</script>
</html>