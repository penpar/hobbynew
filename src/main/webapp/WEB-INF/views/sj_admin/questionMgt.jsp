<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/assets/js/jquery.min.js"></script>
		<title>소수의 취향</title>
		<style>
			@import url('https://fonts.googleapis.com/css?family=Lobster');
			
			/* body{
				font-family: 'Nanum Square';
				font-size:18px;
			} */
			
			form{
				display: inline;
				float: left;
			}
			
			.msgImg{
				width: 25px;
				opacity: 0.7;
			}
			
			.msgImg:hover {
				cursor: pointer;
			}
			
			#allUserSend{
				float: right;
			}
			
			#eb_blank{
				width: 20px;
				height: 120px;
				display: hidden;
			}
			
			th{
			    padding: 10px !important;
			}
			
			#sortForm, #searchForm{
				margin: 5px;
			}
			
			.eb_btn{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 150px;
				border-radius: 7px;
			    line-height:3px !important;
			    display:inline;
			    margin: 5px;
			}
			
			.eb_btn:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 150px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px !important;
			    display:inline;
			    margin: 5px;
			}
			
			.eb_btn1{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 80px;
				border-radius: 7px;
			    line-height: 3px !important;
			    display:inline;
		        margin: 10px -1px 5px 10px;
			}
			
			.eb_btn1:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 80px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px !important;
			    display:inline;
		        margin: 10px -1px 5px 10px;
			}
			
			.eb_btn3{
			    width: 120px;
			    border-radius: 7px;
			    line-height: 3px !important;
			    position: relative;
			    left: 45%;
			}
			
			.eb_btn3:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 120px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px !important;
			    position: relative;
		        left: 45%;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<div id = "second_subject" align="center">
			<h1>문의 관리</h1>
			<p>회원님들의 문의 내역을 관리합니다.</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<br/>
		<form id="sortForm" action="questionSort" method="post">
			<select id="sortSelect" name="sort" onchange="qSort()">
				<option value="문의 종류">문의 종류</option>
	            <option value="사이트 개선">사이트 개선</option>
	            <option value="제휴">제휴</option>
	            <option value="취미 아티스트 전환">취미 아티스트 전환</option>
	            <option value="클래스 운영">클래스 운영</option>
	            <option value="기타">기타</option>
         	</select>
		</form>
		<form id="searchForm" action="qUserSearch" method="post" style="display:inline">
			<input type="text" id="searchInput" name="searchValue" placeholder="회원 검색">
		</form>
		<input type="button" id="userSearch" class="eb_btn1" value="검색"/>
		<br><br><br>
		<table style="table-layout: fixed;">
			<tr>
				<th colspan="5" style="text-align: center;">
					<c:if test="${qstSort != ''}">
						검색 결과
					</c:if>
				
					<c:if test="${qstSort == '문의 종류'}">
						전체
					</c:if>
					<c:if test="${qstSort == '사이트 개선'}">
						사이트 개선
					</c:if>
					<c:if test="${qstSort == '제휴'}">
						제휴
					</c:if>
					<c:if test="${qstSort == '취미 아티스트 전환'}">
						취미 아티스트 전환
					</c:if>
					<c:if test="${qstSort == '클래스 운영'}">
						클래스 운영
					</c:if>
					<c:if test="${qstSort == '기타'}">
						기타
					</c:if>
				</th>
			</tr>
			<tr>
				<th>아이디</th>
				<th>문의 제목</th>
				<th>문의 내용</th>
				<th>문의 날짜</th>
				<th>파일 다운로드</th>
			</tr>
			<c:forEach items="${qstList}" var="qstList">
				<tr>
					<td>${qstList.m_id}</td>
					<td><a href="javascript:question('${qstList.m_id}')">${qstList.cb_subject}</a></td>
					<td>${qstList.cb_content}</td>
					<td>${qstList.cb_date}</td>
					
					<c:if test="${qstList.f_oriName != null}"> <!-- 첨부한 파일이 있으면 -->
						<td>
							<a href="qFileDown?f_newName=${qstList.f_newName}&f_oriName=${qstList.f_oriName}&fs_index=${qstList.fs_index}">
								파일 다운로드
							</a>
						</td>
					</c:if>
					<c:if test="${qstList.f_oriName == null}"> <!-- 첨부한 파일이 없으면 -->
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
						</td>
					</c:if>
					
				</tr>
			</c:forEach>
		</table>
		<br/>
		<input type="button" id="userSearch" class="eb_btn3" value="관리자 페이지" onclick="location.href='adminMain'"/>
	</body>
	<script>
		// 문의 답변 전송
		function question(m_id){
			window.open("mailForm?m_id2="+m_id, "MailWrite", "width=530, height=630, left=100, top=50");
		}
	
		// 종류 골라보기
		function qSort() {
			$("#sortForm").submit();
		}
		
		//회원 검색
		$("#userSearch").click(function () {
			console.log($("#searchInput").val());
			$("#searchForm").submit();
		});
		
	</script>
</html>