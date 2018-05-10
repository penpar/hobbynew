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
				height: 70px;
				display: hidden;
			}
			
			.orange_btn{
				width: 83px;
			    height: 34px;
			    background-color: #ff9a2e;
			    border-radius: 7px;
			    color: white;
			    line-height: -1px;
			    font-size: 18px;
			    font-family: 'Lobster', cursive;
			    border: 1px solid #ff9a2e;
			    padding: 4px;
			    margin: 8px 0px 0px 4px;
			    text-align: center;
			    display: inline-block;
			    float: right;
			}
			
			.orange_btn:hover{
				width: 83px;
			    height: 34px;
			    background-color: white;
			    border-radius: 7px;
			    color: #ff9a2e;
			    line-height: -1px;
			    font-size: 18px;
			    margin: 8px 0px 0px 4px;
			    font-family: 'Lobster', cursive;
			    border: 1px solid #ff9a2e;
			    padding: 4px;
			    text-align: center;
			    cursor: pointer;
			    float: right;
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
			<h1>회원 관리</h1>
			<p>회원님들의 내역을 관리합니다.</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<form id="sortForm" action="userSortList" method="post">
			<select id="sortSelect" name="sort" onchange="userSort()">
				<option>-- 구 분 --</option>
				<option value="-1">전체</option>
				<option value="1">일반 회원</option>
				<option value="2">제한적 취미 아티스트</option>
				<option value="3">취미 아티스트</option>
				<option value="5">탈퇴</option>
			</select>
		</form>
		<form id="searchForm" action="userSearch" method="post" style="display:inline">
			<input type="text" id="searchInput" name="searchValue" placeholder="회원 검색">
		</form>
		<input type="button" id="userSearch" class="eb_btn1" value="검색"/>
		<!-- <input type="button" id="userSearch" class="eb_btn" value="전체 쪽지 보내기"/> -->
		<div id="reportMgt" class="orange_btn" onclick="location.href='reportMgt'">Report</div>
		<br><br><br>
		<table>
			<tr>
				<th colspan="7" style="text-align: center;">
					<c:if test="${m_sort == null}">
						전체
					</c:if>
					<c:if test="${m_sort == 1}">
						일반
					</c:if>
					<c:if test="${m_sort == 2}">
						제한적 취미아티스트
					</c:if>
					<c:if test="${m_sort == 3}">
						취미아티스트
					</c:if>
					<c:if test="${m_sort == 4}">
						심사중
					</c:if>
					<c:if test="${m_sort == 5}">
						탈퇴
					</c:if>
				</th>
			</tr>
			<tr>
				<!-- <th><input type="checkbox" id="allUserSelect"></th> -->
				<th>아이디</th>
				<th>구분</th>
				<th>가입날짜</th>
				<th>경고</th>
				<th>탈퇴</th>
				<th>쪽지</th>
			</tr>
			<c:if test="${userList[0] == null}">
				<tr>
					<th colspan="7">정보가 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${userList[0] != null}">
				<c:forEach items="${userList}" var="uList">
					<tr>
						<c:if test="${uList.m_sort != 0}">
							<c:if test="${uList.m_sort != 4}">
									<%-- <td>
										<input type="checkbox" value="${uList.m_id}" class="userSelect">
									</td> --%>
									<td>${uList.m_id}</td>
							</c:if>
						</c:if>
						<c:if test="${uList.m_sort == 1}">
							<td>일반 회원</td>
						</c:if>
						<c:if test="${uList.m_sort == 2}">
							<td>제한적 취미 아티스트</td>
						</c:if>
						<c:if test="${uList.m_sort == 3}">
							<td>취미 아티스트</td>
						</c:if>
						<c:if test="${uList.m_sort == 5}">
							<td>탈퇴</td>
						</c:if>
						<c:if test="${uList.m_sort != 0}">
							<c:if test="${uList.m_sort != 4}">
								<c:if test="${uList.m_sort != 5}">
									<td>${uList.m_date}</td>
									<td><a href="#">경고</a></td>
									<td><a href="./userBen/${uList.m_id}">탈퇴</a></td>
									<td>
										<img class="msgImg" src="resources/sj/messages.png" onclick="noteSend('${uList.m_id}')">
									</td>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${uList.m_sort == 5}">
							<td>${uList.m_date}</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br/>
		<input type="button" id="userSearch" class="eb_btn3" value="관리자 페이지" onclick="location.href='adminMain'"/>
	</body>
	<script>
		//회원 골라보기
		function userSort() {
			$("#sortForm").submit();
		}
		
		//전체 체크
		$("#allUserSelect").click(function(){
	        if($("#allUserSelect").prop("checked")){
	            $(".userSelect").prop("checked",true);
	        }else{
	            $(".userSelect").prop("checked",false);
	        }
	    });
		
		//회원 검색
		$("#userSearch").click(function () {
			console.log($("#searchInput").val());
			$("#searchForm").submit();
		});
		
		//개인별 쪽지보내기
		function noteSend(m_id) {
			console.log(m_id);
			window.open("mailForm?m_id2="+m_id, "MailWrite", "width=530, height=630, left=100, top=50");
		}
	</script>
</html>