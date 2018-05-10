<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="resources/assets/css/main.css"/>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="resources/assets/js/jquery.min.js"></script>
	</head>
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 
		@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		
		/*이 부분은 무시*/
		/* body{
			padding: 50px;
		} */
		
		body{
			font-family: 'Nanum Square';
			font-size:18px;
		}
		
		.boardList{
			padding: 100px;
		}
		
		#eb_blank{
			width: 20px;
			height: 70px;
			display: hidden;
		}
		
		#second_subject{
			width: 400px;
			height: auto;
			position: relative;
			left: 40%;
			top: 12%;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>게시판 이름</h1>
			<p>카테고리의 설명글</p>
		</div>
	
		<!-- Posts List -->
		<section class="boardList">
			<ul class="posts">
				<li>
					<article>
						<header>
							<h3><a href="#">안녕하세요. 1번 글 주인입니다.</a></h3>
							<!-- 아래 time은 무시하고 각자 작성 시간 입력할 것 -->
							<time class="published" datetime="2015-10-20">October 20, 2015</time>
						</header>
					</article>
				</li>
				<li>
					<article>
						<header>
							<h3><a href="#">Convallis maximus nisl mattis nunc id lorem</a></h3>
							<time class="published" datetime="2015-10-15">October 15, 2015</time>
						</header>
					</article>
				</li>
				<li>
					<article>
						<header>
							<h3><a href="#">Euismod amet placerat vivamus porttitor</a></h3>
							<time class="published" datetime="2015-10-08">October 8, 2015</time>
						</header>
					</article>
				</li>
				<li>
					<article>
						<header>
							<h3><a href="#">Magna enim accumsan tortor cursus ultricies</a></h3>
							<time class="published" datetime="2015-10-08">October 8, 2015</time>
						</header>
					</article>
				</li>
				<li>
					<article>
						<header>
							<h3><a href="#">Congue ullam corper lorem ipsum dolor</a></h3>
							<time class="published" datetime="2015-10-06">October 7, 2015</time>
						</header>
					</article>
				</li>
			</ul>
		</section>
	</body>
</html>