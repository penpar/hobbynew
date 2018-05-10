<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		
		/* 맨 위로 이동 */
		a.top{
			/* display: none; */
			position: fixed;
			left: 95%;
			bottom: 30px;
			width: 50px;
			height: 50px;
			border-radius: 50px;
			z-index: 6;
		}
		
		a.top img{
			position: relative;
			width: 50px;
			height: 50px;
		}
		
		/* 내용 위치 */
		#voteContent{
		    /* background-color: green; */
		    width: 100%;
		    height: auto;
		    margin: 0 auto;
		    align: center;
		}
		
		input[type="button"]{
			position: relative;
			width: 60px;
			border-radius: 7px;
		    line-height: 0px;
		    padding: 0px 0px 45px 0px;
		    margin: 0px 0px 0px 27px;		    
	        /* transform: translateX(-50%);
    		left: 50%; */
		}
		
		input[type="button"]:hover{
			position: relative;
			width: 60px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
			margin: 0px 0px 0px 27px;		
			/* transform: translateX(-50%);
    		left: 50%; */
		    /* line-height: 0px; */
		    /* padding: 0px 0px 45px 0px; */
		}
		
		.voteList{
			position: relative;
			float: left;
			width : 350px;
			height: 550px;
			margin: 27px;
			background-color: white;
			cursor: pointer;
		}
		
		/* .photoList_sub{
			position: relative;
			display: none;
			background-color: #ff9a2e;
			width : 350px;
			height: 350px;
		} */
		
		.middle {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    border: 1px solid #E6E6E6;
		    cursor: pointer;
		 }
		 
		 .eb_separate{
			width: 100%;
			height: 1px;
			position: absolute;
		    top: 63.5%;
			z-index: 2;
			background-color: lightgray;
   		}
   		
   		.eb_inside{
		    position: absolute;
		    width: 100%;
		    display: table-cell;
		    top: 65%;
   		}
   		
   		.eb_inside2{
   			position: relative;
		    top: 42%;
			width: 100%;
   		}
   		
   		.progressBar_top{
   			width: 0%;
			height: 6px;
			position: absolute;
			top: 83%;
			z-index: 3;
			left: 0%;
			background-color: #ff9a2e;
   		}
   		
   		.progressBar_bottom{
   			width: 100%;
			height: 6px;
			position: absolute;
			top: 83%;
			z-index: 2;
			background-color: lightgray;
   		}
   		
   		#voteWrite{
			margin: 0px 27px 0px 0px;
    		float: right;
   		    position: absolute;
    		top: 20%;
    		left: 77%;
   		}
   		
   		.voteImg{
 			position: absolute;
		    top: 0%;
		    left: 0%;
   		}
   		
   		.voteImg img{
   			width: 100%;
    		height: auto;
   		}
   		    
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>투표 게시판</h1>
			<p>나도 취미 아티스트가 되고 싶다면?</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<c:if test="${sessionScope.mb.m_id != null}">
			<input id="voteWrite" type="button" value="글쓰기" onclick="location.href='voteWrite'"/>
		</c:if>
		<br/>
		<div id="voteContent" style="text-align: center;" align="center">
			<c:if test="${vList.size() >= 1}">
				<c:forEach items="#{vList}" var="list">
					<div class="voteList middle" onclick="clicks(${list.cb_index})">
					<c:if test="${list.f_newName != null}">
						<div class="voteImg"><img src="${path}${list.f_newName}" style="object-fit: cover;width:100%;height:63.5%;"/></div>
					</c:if>	
					<c:if test="${list.f_newName == null}">
						<div class="voteImg"><img src="resources/assets/img/vote/noImg.PNG" style="object-fit: cover;width:117.3%;height:63.5%;"/></div>
					</c:if>	
						<div class="eb_separate"></div>
							<div class="eb_inside">
								<h5>${list.cb_subject}</h5>
								<p>${list.m_id}</p>
							</div>
							<fmt:parseNumber var="w" integerOnly="true" value="${100/list.v_person*list.v_people}"/>
							<c:if test="${w < 100}">
								<div class="progressBar_top" style="width: ${w}%"></div>
							</c:if>
							<c:if test="${w >= 100}">
								<div class="progressBar_top" style="width: 100%"></div>
							</c:if>
							<div class="progressBar_bottom"></div>
							<div class="eb_inside2">
								<h6>${list.v_time}일 남음&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;${list.v_people}명 참여</h6>
							</div>
					</div>
				</c:forEach>
			</c:if>
			</div>
		</div>

		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>	
		/* 상세보기 이동 */
		function clicks(cb_index){
			var sessionId = "${sessionScope.mb.m_id}";
			
			if(sessionId == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="loginForm";
			}else{
				location.href="voteDetail?cb_index="+cb_index;
			}
		}
	
		// alert
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
			location.href="vote";
		}
	
		/*맨 위로 이동*/
		$( window ).scroll( function() {
			if ( $( this ).scrollTop() > 200 ) {
				$( '.top' ).fadeIn();
			} else {
				$( '.top' ).fadeOut();
			}
		});
		
		$( '.top' ).click( function() {
			
			  $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
			  return false;
		});
	</script>
</html>