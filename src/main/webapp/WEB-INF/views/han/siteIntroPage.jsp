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
		/* body{
			font-family: 'Nanum Square';
			font-size:18px;
		} */
		
		#header .links ul li{
			line-height: 1;
		}
		
		#eb_blank{
			width: 20px;
			height: 120px;
			display: hidden;
		}
		
		#introContent{
		    /* background-color: green; */
		    width: 80%;
		    height: 100%;
		    margin: 0 auto;
		    align: center;
		}
		
		#introContent img{
			margin: 0 auto;
			position: relative;
		}
		
		input[type="button"]{
			position: relative;
			width: 60px;
			border-radius: 7px;
		    line-height: 0px;
		    padding: 0px 0px 45px 0px;
	        transform: translateX(-50%);
    		left: 50%;
		}
		
		input[type="button"]:hover{
			position: relative;
			width: 60px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
			transform: translateX(-50%);
    		left: 50%;
		    /* line-height: 0px; */
		    /* padding: 0px 0px 45px 0px; */
		}
		
		a.top{
			/* display: none; */
			position: fixed;
			left: 95%;
			bottom: 30px;
			width: 50px;
			height: 50px;
			border-radius: 50px;
		}
		
		a.top img{
			position: relative;
			width: 50px;
			height: 50px;
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
         
         .block{
         	height: 9%;
         }
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>사이트 소개</h1>
			<p>'소수의 취향', 어떤 뜻인가요?</p>
		</div>
		
		<c:if test="${sessionScope.mb.m_sort == 0}">
			<!-- 여백 -->
			<div id="eb_blank"></div>
			<input id="SiteIntroWrite" type="button" value="수정" onclick="location.href='siteIntroWrite'"/>
		</c:if>
		
		<div id="introContent" align="center">
			<h6>${siteIntro.cb_content}</h6><br/><br/>
			<img src="${path}${siteIntro.f_newName}">
			<div class="block"></div>
		</div>
		
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>
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
		
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
			location.href="siteIntroPage";
		}
	</script>
</html>