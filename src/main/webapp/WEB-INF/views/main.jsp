<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
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
		
		html, body, main {
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		#header .links ul li{
			line-height: 1;
		}
	
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
			left: 40%;
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
		
		.buttons{
			position: relative;
			top:28%;
			left:47%;
			width: 200px;
		}
		
		.buttons:hover{
			position: relative;
			top:28%;
			left:47%;
			z-index:15;
		}
		
		.buttons #prev, .buttons #next, .buttons #next2, .buttons #prev2{
			border-radius: 7px;
		}
		
		.box h1{
			position: relative;
			margin: 0 auto;
			font-family: 'Nanum Square';
		}
		
		.box p{
			position: relative;
			margin: 0 auto;
			font-family: 'Nanum Square';
		}
		
		#eb_about{
			position: relative;
			left: 10%;
			top: -34%;
		}
		
		#eb_survay{
			position: relative;
			top: 32%;
			left: 22%;
			width: 300px;
			height: 380px;
			padding: 70px;
			background-color: #f4f4f4;
			border-radius: 20px;
		}
		
		#eb_survay img{
			position: relative;
			width: 150px;
			height: auto;
		}
		
		#eb_location{
			position: relative;
			top: -9%;
			left: 41%;
			width: 300px;
			height: 380px;
			padding: 70px;
			background-color: #f4f4f4;
			border-radius: 20px;
		}
		
		#eb_location img{
			position: relative;
			width: 200px;
			height: auto;
		}
		
		#eb_change{
			position: relative;
			top: -49%;
			left: 60%;
			width: 317px;
			height: 380px;
			padding: 70px;
			background-color: #f4f4f4;
			border-radius: 20px;
		}
		
		#eb_change img{
			position: relative;
			width: 140px;
			height: auto;
		}
		
		a.top {
			position: fixed;
			left: 50%;
			bottom: 50px;
			display: none;
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
		
		#note_cnt {
			font-family: 'Nanum Square';
		}
		
		.mainClassImg{
			object-fit: cover;
		}
	</style>
	<body>
		<!-- 1번째 스크롤 -->
		<div class="box">
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
						<!-- Search -->
							<!-- <section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section> -->

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
					
					<!-- 여백 -->
					<div id="eb_blank2"></div>
					
					<!-- logo -->
					<img id="eb_logo" src="resources/assets/img/logo.png"/>
					
					<!-- 여백 -->
					<div id="eb_blank"></div>
				<!-- Main -->
					<div id="main">
						<div class="w3-content w3-display-container" style="max-width:800px">
							<img class="mySlides" src="resources/assets/img/main_rolling1.jpg" style="width:100%;height:100%;">
							<img class="mySlides" src="resources/assets/img/main_rolling2.png" style="width:100%;height:100%;">
							<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
							<div class="w3-left w3-hover-text-white" onclick="plusDivs(-1)">&#10094;</div>
							<div class="w3-right w3-hover-text-white" onclick="plusDivs(1)">&#10095;</div>
							<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
							<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
							</div>
						</div>
					</div>
					
					<img id="eb_scroll" src="resources/assets/img/scrolling.png"/>
				</div>	
			</div>
			
			<!-- 2번째 스크롤 -->
			<div class="box" style="height:100%;">
				<div id = "second_subject" align="center"> <!-- 2번째 스크롤 div로 묶어서 가운데로 이동 시킴! -->
				<%-- <c:if test="${sessionScope.mb != null}">
					<h1>관심분야별 추천</h1>
					<p>회원님이 선택한 관심 분야 중 평점이 높은 순</p>
				</c:if> --%>
				<%-- <c:if test="${sessionScope.mb == null}"> --%>
					<h1>최신 클래스 추천</h1>
					<p>클래스 작성일 최신순</p>
				<%-- </c:if> --%>
				</div>	
					
				<main>
					<div id="carousel">
						<c:forEach items="${mainList}" var="mList">
							<c:set var="i" value="${i+1}"/>
								<c:if test="${i==1}">
									<div class="hideLeft"  align="center">
								</c:if>
								<c:if test="${i==2}">
									<div class="prevLeftSecond"  align="center">
								</c:if>
								<c:if test="${i==3}">
									<div class="prev"  align="center">
								</c:if>
								<c:if test="${i==4}">
									<div class="selected"  align="center">
								</c:if>
								<c:if test="${i==5}">
									<div class="next"  align="center">
								</c:if>
								<c:if test="${i==6}">
									<div class="nextRightSecond"  align="center">
								</c:if>
								<c:if test="${i==7}">
									<div class="hideRight"  align="center">
								</c:if>
								<img class="mainClassImg" src="${path}${mList.c_mainImg}"><br/><br/>
								<h6> ${mList.cn_name} | <a href="classDetail_contents?c_index=${mList.c_index}">${mList.c_subject}</a></h6>
								<p>${mList.c_simpleContent}</p>
							</div>
						</c:forEach>
				<div class="buttons" style="display: none;">
					<button id="prev">Prev</button>
					<button id="next">Next</button>
			    </div>
			
			</main>
		</div>
			
			<!-- 3번째 스크롤 -->
	    	<div class="box" style="height:100%;">
	    		<div id = "third_subject" align="center">
					<h1>평점별 추천</h1>
					<p>회원님들의 좋은 평을 많이 받은 클래스 순</p>
				</div>
					
				<main>
					<div id="carousel2">
						<c:forEach items="${rateList}" var="rList">
							<c:set var="e" value="${e+1}"/>
								<c:if test="${e==1}">
									<div class="hideLeft"  align="center">
								</c:if>
								<c:if test="${e==2}">
									<div class="prevLeftSecond"  align="center">
								</c:if>
								<c:if test="${e==3}">
									<div class="prev"  align="center">
								</c:if>
								<c:if test="${e==4}">
									<div class="selected"  align="center">
								</c:if>
								<c:if test="${e==5}">
									<div class="next"  align="center">
								</c:if>
								<c:if test="${e==6}">
									<div class="nextRightSecond"  align="center">
								</c:if>
								<c:if test="${e==7}">
									<div class="hideRight"  align="center">
								</c:if>
								<img class="mainClassImg" src="${path}${rList.c_mainImg}"><br/><br/>
								<h6> ${rList.cn_name} | <a href="classDetail_contents?c_index=${rList.c_index}">${rList.c_subject}</a></h6>
								<p>${rList.c_simpleContent}</p>
							</div>
						</c:forEach>
					</div>
			
				<div class="buttons" style="display: none;">
					<button id="prev2">Prev</button>
					<button id="next2">Next</button>
			    </div>
			</main>
	    	</div>

	    	<!-- 4번째 스크롤 -->
	    	<div class="box" style="height:100%;">
	    		<c:if test="${sessionScope.mb.m_id != null}">
	    			<div id="eb_survay" align="center">
		    			<a href="has_index">
			    			<img src="resources/assets/img/survay.png"/><br/><br/>
			    			<h6>취향 설문 조사</h6>
			    			<p>나에게 어떤 취미가 좋을지 모르겠다면 click!</p>
		    			</a>
	    			</div>
	    		</c:if>
	    		<c:if test="${sessionScope.mb.m_id == null}">
	    			<div id="eb_survay" align="center">
						<a href="javascript:kickOut()">
			    			<img src="resources/assets/img/survay.png"/><br/><br/>
			    			<h6>취향 설문 조사</h6>
			    			<p>나에게 어떤 취미가 좋을지 모르겠다면 click!</p>
		    			</a>
	    			</div>
	    		</c:if>
	    		
	    		<c:if test="${sessionScope.mb.m_id != null}">
	    			<div id="eb_location" align="center">
		    			<a href="locService">
			    			<img src="resources/assets/img/location.png"/><br/><br/>
			    			<h6>위치 기반 추천</h6>
			    			<p>내 주변에는 어떤 클래스들이 있을까?</p>
    					</a>
	    			</div>
	    		</c:if>
	    		<c:if test="${sessionScope.mb.m_id == null}">
	    			<div id="eb_location" align="center">
		    			<a href="javascript:kickOut()">
			    			<img src="resources/assets/img/location.png"/><br/><br/>
			    			<h6>위치 기반 추천</h6>
			    			<p>내 주변에는 어떤 클래스들이 있을까?</p>
	    				</a>
	    			</div>
	    		</c:if>
	    		
	    		<c:if test="${sessionScope.mb.m_id != null}">
    				<div id="eb_change" align="center">
    					<a href="userChangeForm">
		    				<img src="resources/assets/img/change.png"/><br/><br/>
		    				<h6>일시적 사용자전환</h6>
		    				<p>이제 나도 취미 아티스트!</p>
	    				</a>
    				</div>
    			</c:if>
    			<c:if test="${sessionScope.mb.m_id == null}">
    				<div id="eb_change" align="center">
	    				<a href="javascript:kickOut()">
		    				<img src="resources/assets/img/change.png"/><br/><br/>
		    				<h6>일시적 사용자전환</h6>
		    				<p>이제 나도 취미 아티스트!</p>
		    			</a>
	    			</div>
    			</c:if>
	    	
	    		<!-- About -->
				<div id="eb_about"><!-- 위치 이동 -->
					<section class="blurb">
						<h2>ABOUT</h2>
					</section>
	
					<!-- Footer -->
					<section id="footer">
						<ul class="icons">
							<li><a href="https://twitter.com/?lang=ko" class="fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="https://ko-kr.facebook.com/" class="fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="https://www.instagram.com/?hl=ko" class="fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="https://www.google.nl/" class="fa-envelope"><span class="label">Email</span></a></li>
							<p class="copyright">&copy; Hobby New</p>
						</ul>
					</section>
				</div>
	    	</div>
			
			<!-- 맨 위로 이동 -->
			<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
			
			<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/skel.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>
	</body>
	
	<script>
		// 쫓아내기
		function kickOut(){
			alert("로그인이 필요한 서비스입니다.");
			location.href="loginForm";
		}
		console.log("${mainList}");
		//
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
		}
		
		/* $(document).ready(function(){
			imgSizeAuto();
		}); */
		
		/* rolling */
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}

		function currentDiv(n) {
		  showDivs(slideIndex = n);
		}

		function showDivs(n) {
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("demo");
		  if (n > x.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = x.length}
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";
		  }
		  
		  for (i = 0; i < dots.length; i++) {
		     dots[i].className = dots[i].className.replace(" w3-white", "");
		  }
		  
		  x[slideIndex-1].style.display = "block";  
		  dots[slideIndex-1].className += " w3-white";
		}
		
		/* hover */
		$("#eb_log").hover(function(){
			$("#eb_log").css("color","orange");
			$("#eb_log").css("cursor","pointer");
		});
		
		/* hover */
		$("#eb_log").mouseout(function(){
			$("#eb_log").css("color","gray");
			$("#eb_log").css("cursor","default");
		});
		
		/* logout */
		$("#eb_log").click(function(){
			location.href="#";
			console.log("logout");
		});
		
		
		/* scroll event */
		window.onload = function () {
       		$(".box").each(function () {
       			// 개별적으로 Wheel 이벤트 적용
              	$(this).on("mousewheel DOMMouseScroll", function (e) {
              	console.log(e);
                  e.preventDefault();
                  
                  var delta = 0;
                  if (!event) event = window.event;
                  if (event.wheelDelta) {
                      delta = event.wheelDelta / 120;
                      if (window.opera) delta = -delta;
                  } else if (event.detail) delta = -event.detail / 3;
                  var moveTop = null;
                  // 마우스휠을 위에서 아래로
                  if (delta < 0) {
                      if ($(this).next() != undefined) {
                          moveTop = $(this).next().offset().top;
                      }
                  // 마우스휠을 아래에서 위로
                  } else {
                      if ($(this).prev() != undefined) {
                          moveTop = $(this).prev().offset().top;
                      }
                  }
                  
                  // 화면 이동 0.8초(800)
                  $("html,body").stop().animate({
                      scrollTop: moveTop + 'px'
                  }, {
                      	duration: 800, complete: function () {
                      	}
                  	});
              	});
          	});
      	}
		
		/* second - select scrolling */
		function moveToSelected(element) {
			if (element == "next") {
				var selected = $(".selected").next();
			} else if (element == "prev") {
				var selected = $(".selected").prev();
			} else {
				var selected = element;
			}
	
			var next = $(selected).next();
			var prev = $(selected).prev();
			var prevSecond = $(prev).prev();
			var nextSecond = $(next).next();
	
			$(selected).removeClass().addClass("selected");
			
			$(prev).removeClass().addClass("prev");
			$(next).removeClass().addClass("next");
	
			$(nextSecond).removeClass().addClass("nextRightSecond");
			$(prevSecond).removeClass().addClass("prevLeftSecond");
	
			$(nextSecond).nextAll().removeClass().addClass('hideRight');
			$(prevSecond).prevAll().removeClass().addClass('hideLeft');
		}

		$(document).keydown(function(e) {
		    switch(e.which) {
		        case 37: // left
		        moveToSelected('prev');
		        break;
		
		        case 39: // right
		        moveToSelected('next');
		        break;
		
		        default: return;
		    }
		    e.preventDefault();
		});

		$('#carousel div').click(function() {
		  moveToSelected($(this));
		});
		
		$('#prev').click(function() {
			moveToSelected('prev');
		});

		$('#next').click(function() {
			moveToSelected('next');
		});
		
		$('#prev2').click(function() {
			moveToSelected('prev');
		});

		$('#next2').click(function() {
			moveToSelected('next');
		});
		
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
		
		/* 마지막 페이지 hover */
		$("#eb_survay").mouseenter(function(){
			$("#eb_survay").css("background-color","#E6E6E6");
		});
		
		$("#eb_survay").mouseleave(function(){
			$("#eb_survay").css("background-color","#f4f4f4");
		});
		
		$("#eb_location").mouseenter(function(){
			$("#eb_location").css("background-color","#E6E6E6");
		});
		
		$("#eb_location").mouseleave(function(){
			$("#eb_location").css("background-color","#f4f4f4");
		});
		
		$("#eb_change").mouseenter(function(){
			$("#eb_change").css("background-color","#E6E6E6");
		});
		
		$("#eb_change").mouseleave(function(){
			$("#eb_change").css("background-color","#f4f4f4");
		});
		
		//로그아웃
		function logout(){
			if (confirm("로그아웃 하시겠습니까?")==true){
				location.href="logout";
			}else{
				return;
			}
		}
		
		function imgSizeAuto() {
			console.log(document.getElementsByClassName("mainClassImg")["0"].height);
			var img = document.getElementsByClassName("mainClassImg");
			for(var i=0;i<img.length;i++){
				if(img[i].width != img[i].height){
					console.log(i+1+"번째 이미지 정사각형");
					img[i].height = img[i].width;
				}
			}
		}
	</script>
</html>