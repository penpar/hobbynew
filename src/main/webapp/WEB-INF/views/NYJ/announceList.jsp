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
			height: 30px;
			display: hidden;
		}
		
		#cb_sort{
			width: 10%;
		    float: left;
		}
		
		.eb_btn{
			/* position: relative;
			top:28%;
			left:47%; */
		    width: 70px;
		    border-radius: 7px;
		    line-height: 3px !important;
		    float: right;
		}
		
		.eb_btn:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 70px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px !important;
		    float: right;
		}
		
		th, td{
		    padding: 7px 10px 10px 30px !important;
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
		<c:if test="${sessionScope.mb.m_sort == 0}">
			<input type="button" onclick="moveAform()" value="글쓰기" class="eb_btn"/>
		</c:if>
		
		<select id="cb_sort" name="cb_sort" onchange="anSortChange()">
			<option value="7">전체</option>
			<option value="0">공지사항</option>
			<option value="6">이벤트</option>
		</select>
		<!-- ========================================================= -->
		
		<br/><br/><br/>
		<div id="anListTableDiv">
			<table id="anListTable">
				<tr>
					<th>분류</th>
					<th>글 제목</th>
					<th>작성일</th>
				</tr>
				
				<c:forEach items="${anlist}" var="anlist">
					<tr>
						<td>
							<c:choose>
							    <c:when test="${anlist.cb_sort eq '0'}">
									공지사항
							    </c:when>
							    <c:otherwise>
							        이벤트
							    </c:otherwise>
							</c:choose>
						</td>
						
						<td><div onclick="clicks(${anlist.cb_index})"><a href="javascript:">${anlist.cb_subject}</a></div></td>
						<td>${anlist.cb_date}</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- ========================================================= -->
	</body>
	<script>
		/* 상세보기 이동 */
		function clicks(cb_index){
			var sessionId = "${sessionScope.mb.m_id}";
			
			if(sessionId == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="loginForm";
			}else{
				location.href="announceForm?cb_index="+cb_index;
			}
		}
	
		//글쓰기 버튼 클릭 시
		function moveAform(){
			location.href="announceWrite";
		}
				
		//성공 여부 확인 메세지
		var check = "${check}";
			if(check != ""){
				alert(check);
				location.href="announceList";
			}
			
		//분류 select 바뀔 때 마다 ajax실행 (전체:0, 공지:1, 이벤트:2) 
		function anSortChange(){
			
			$.ajax({
				type:'get',
				url:'b_NoticeSort',
				data:{
					cb_sort:$("select[name='cb_sort']").val()
				},
				
				dataType:"json",
				success:function(data){
					listPrint(data.anlist); 
				},//function(data) End
				error:function(error){
					console.log(error);
				}
			})//ajax End
		}//anSortChange End
		
		//분류 ajax 실행 시 리스트 출력
		function listPrint(anlist){
			console.log(anlist);
			
			var list="";
			var i=0;
			
			list+="<table id='anListTable'>"
			list+=	"<tr>"
			list+=		"<th>분류</th>"
			list+=		"<th>글 제목</th>"
			list+=		"<th>작성일</th>"
			list+=	"</tr>"
			for(i=0;i<anlist.length;i++){

				list+="<tr>"
				if(anlist[i].cb_sort==0){
					list+="<td>공지사항</td>"
				}else{
					list+="<td>이벤트</td>"
				};
				
				list+="<td><a href='./announceForm?cb_index="+anlist[i].cb_index+"'>"+anlist[i].cb_subject+"</a></td>"
				list+="<td>"+anlist[i].fm_date+"</td>"
				list+="</tr>"
			};//for End
			list+="</table>"

			/* if(data.anlist.length == 0){
				$(#anListTableDiv).html();
			}else{
				for(var i=0;i<data.anlist.length;i++){
					
				}
			} */
			
			$("#anListTableDiv").html(list);
		}//listPrint End
		
		
	</script>
</html>