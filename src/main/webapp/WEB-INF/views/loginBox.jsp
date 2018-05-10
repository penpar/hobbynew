<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="resources/assets/css/main.css"/>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
		@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		
		/* html, body, main {
			 width: 100%;
			height: 100%; 
			margin: 0;
			padding: 0;
		} */
		
		/* #header .links ul li{
			line-height: 1;
		} */
	
		.mySlides {
			display:none;
		}
		
		.w3-left, .w3-right, .w3-badge {
			cursor:pointer;
		}
		
		.w3-badge {
			height:13px;width:13px;padding:0;
		}
	
		ul.icons{
			display: inline;
		}
		
		::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff;}
		::-webkit-scrollbar-button:start:decrement,
		::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: #efefef}
		::-webkit-scrollbar-track {
			background: #efefef; -webkit-border-radius: 10px; border-radius:10px;
			-webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)
		}
		::-webkit-scrollbar-thumb {
			height: 50px; width: 50px; background: rgba(0,0,0,.2);
			-webkit-border-radius: 8px; border-radius: 8px;
			-webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)
		}
		
		#eb_log{
			margin: 0px 0px 0px 20px;
		}
		
		#eb_logo{
			width: 155px;
			height: auto;
			position: relative;
			left: 42%;
		}
		
		#eb_blank, #eb_blank2{
			width: 20px;
			height: 30px;
			display: hidden;
		}
		
		@media screen and (max-width: 480px) {

			#eb_logo{
			width: 100px;
			height: auto;
			left: 30%;
			}
		}
		
		#eb_scroll{
			width:50px;
			height: auto;
			opacity: 0.5;
			position: fixed;
			left: 3%;
			top: 90%;
		}		
		
		/* html, body {
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		} */
		
		/* 2스크롤 */
		#second_subject{
			width: 400px;
			height: auto;
			position: relative;
			left: 34%;
			top: 12%;
		}
		
		/* 3스크롤 */
		#third_subject{
			width: 400px;
			height: auto;
			position: relative;
			left: 40%;
			top: 12%;
		}
		
		#carousel {
			position: relative;
			height: 500px;
			top: 50%;
			transform: translateY(-50%);
			overflow: hidden;
		}
		
		#carousel div {
			position: absolute;
			transition: transform 1s, left 1s, opacity 1s, z-index 0s;
			opacity: 1;
		}
		
		#carousel div img {
			width: 400px;
			transition: width 1s;
			border-radius: 200px;
		}
		
		#carousel div.hideLeft {
			left: 0%;
			opacity: 0;
			transform: translateY(50%) translateX(-50%);
		}
		
		#carousel div.hideLeft img {
			width: 200px;
		}
		
		#carousel div.hideRight {
			left: 100%;
			opacity: 0;
			transform: translateY(50%) translateX(-50%);
		}
		
		#carousel div.hideRight img {
			width: 200px;
		}
		
		#carousel div.prev {
			z-index: 5;
			left: 30%;
			transform: translateY(50px) translateX(-50%);
		}
		
		#carousel div.prev img {
			width: 300px;
		}
		
		#carousel div.prevLeftSecond {
			z-index: 4;
			left: 15%;
			transform: translateY(50%) translateX(-50%);
			opacity: 0.7;
		}
		
		#carousel div.prevLeftSecond img {
			width: 200px;
		}
		
		#carousel div.selected {
			z-index: 10;
			left: 50%;
			transform: translateY(0px) translateX(-50%);
		}
		
		#carousel div.next {
			z-index: 5;
			left: 70%;
			transform: translateY(50px) translateX(-50%);
		}
		
		#carousel div.next img {
			width: 300px;
		}
		
		#carousel div.nextRightSecond {
			z-index: 4;
			left: 85%;
			transform: translateY(50%) translateX(-50%);
			opacity: 0.7;
		}
		
		#carousel div.nextRightSecond img {
			width: 200px;
		}
		
		/* third */
		#carousel2 {
			position: relative;
			height: 500px;
			top: 50%;
			transform: translateY(-50%);
			overflow: hidden;
		}
		
		#carousel2 div {
			position: absolute;
			transition: transform 1s, left 1s, opacity 1s, z-index 0s;
			opacity: 1;
		}
		
		#carousel2 div img {
			width: 400px;
			transition: width 1s;
			border-radius: 200px;
		}
		
		#carousel2 div.hideLeft {
			left: 0%;
			opacity: 0;
			transform: translateY(50%) translateX(-50%);
		}
		
		#carousel2 div.hideLeft img {
			width: 200px;
		}
		
		#carousel2 div.hideRight {
			left: 100%;
			opacity: 0;
			transform: translateY(50%) translateX(-50%);
		}
		
		#carousel2 div.hideRight img {
			width: 200px;
		}
		
		#carousel2 div.prev {
			z-index: 5;
			left: 30%;
			transform: translateY(50px) translateX(-50%);
		}
		
		#carousel2 div.prev img {
			width: 300px;
		}
		
		#carousel2 div.prevLeftSecond {
			z-index: 4;
			left: 15%;
			transform: translateY(50%) translateX(-50%);
			opacity: 0.7;
		}
		
		#carousel2 div.prevLeftSecond img {
			width: 200px;
		}
		
		#carousel2 div.selected {
			z-index: 10;
			left: 50%;
			transform: translateY(0px) translateX(-50%);
		}
		
		#carousel2 div.next {
			z-index: 5;
			left: 70%;
			transform: translateY(50px) translateX(-50%);
		}
		
		#carousel2 div.next img {
			width: 300px;
		}
		
		#carousel2 div.nextRightSecond {
			z-index: 4;
			left: 85%;
			transform: translateY(50%) translateX(-50%);
			opacity: 0.7;
		}
		
		#carousel2 div.nextRightSecond img {
			width: 200px;
		}
		
		.circle{
		    background-color: #ff9a2e;
		    border-radius: 20px;
		    width: 20px;
		    height: 20px;
		    float: left;
		    margin: 10px;
		    left: 17%;
		    position: absolute;
		    top: 15%;
		}
		
		#note_cnt {
		font-family: 'Nanum Square';
 	 }
		
		
		
	</style>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
					
						<c:if test="${sessionScope.mb==null}">
							<div id="eb_log"><a href="loginForm">LOGIN</a></div>
							<nav class="links">
								<ul>
									<li><a href="./">home</a></li>
									<li><a href="joinChoice">join</a></li>
								</ul>
							</nav>
						</c:if>
						
						<c:if  test="${sessionScope.mb!=null}">
							<div id="eb_log"><a href="#" onclick="logout()">LOGOUT</a></div>
							<nav class="links">
								<ul>
									<li><a href="./">home</a></li>
									<c:if test="${sessionScope.mb.m_sort != 3 || sessionScope.mb.m_sort != 0}">
									<li><a href="myPage?m_id=${sessionScope.mb.m_id}" >mypage</a></li>
									</c:if>
									<li><a href="noteList">note&nbsp;(<span id = "note_cnt">${sessionScope.cnt}</span>)</a><p></p></li>
								</ul>
							</nav>
						</c:if>
						<nav class="main">
                     <ul>
                        <!-- <li class="search">
                           <a class="fa-search" href="#search">Search</a>
                           <form id="search" method="get" action="#">
                              <input type="text" name="query" placeholder="Search" />
                           </form>
                        </li> -->
                        <li class="menu">
                           <a class="fa-bars" href="#menu">Menu</a>
                        </li>
                     </ul>
                  </nav>
					</header>

				<!-- Menu -->
					<section id="menu">
						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="siteIntroPage">
											<h3>사이트 소개</h3>
											<p>'소수의 취향', 어떤 뜻인가요?</p>
										</a>
									</li>
									<li>
										<a href="announceList">
											<h3>공지사항 / 이벤트</h3>
											<p>전해드릴 소식과 이벤트가 있습니다.</p>
										</a>
									</li>
									<li>
										<a href="hobbyClass">
											<h3>취미 클래스</h3>
											<p>당신의 새로운 취향을 찾아보세요!</p>
										</a>
									</li>
									<li>
										<a href="photoGallery_list">
											<h3>포토 갤러리</h3>
											<p>취미 아티스트's photo</p>
										</a>
									</li>
									<li>
										<a href="freeList">
											<h3>자유 게시판</h3>
											<p>이야기를 나누는 공간</p>
										</a>
									</li>
									<li>
										<a href="vote">
											<h3>투표 게시판</h3>
											<p>나도 취미 아티스트가 되고 싶다면?</p>
										</a>
									</li>
									<li>
										<a href="customerCenter">
											<h3>고객센터</h3>
											<p>저희에게 궁금한 점이 있나요?</p>
										</a>
									</li>
									<c:if test="${sessionScope.mb.m_sort == 0}">
										<li>
											<a href="adminMain">
												<h3>관리자 페이지</h3>
											</a>
										</li>
									</c:if>
								</ul>
							</section>
					</section>
			
		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/skel.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>	
	<script>
	
	//로그아웃
	function logout(){
		if (confirm("로그아웃 하시겠습니까?")==true){
			location.href="logout";
		}else{
			return;
		}
	}
	</script>
</html>