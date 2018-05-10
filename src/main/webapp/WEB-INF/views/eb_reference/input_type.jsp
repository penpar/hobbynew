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
	
		/*이 부분은 신경쓰지 마세요*/
		body{
			margin: 50px;
		}
		
		/* 주황색 버튼은 강조하고 싶을 때 사용하세요*/
		
		/* 기본 버튼 css(해당 클래스 / 아이디는 마음대로 변경) */
		/* position, top, left, width 등등 마음대로 수정하시되 color와 border 속성은 건드리지 마세요 */
		.eb_btn{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 150px;
			border-radius: 7px;
		    line-height: 3px;
		}
		
		.eb_btn:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 150px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		}
		
		/* select box */		
		select {
		    width: 200px; /* 원하는 너비설정 */
		    padding: 7px 10px; /* 여백으로 높이 설정 */
		    font-family: inherit;  /* 폰트 상속 */
		    /* 네이티브 화살표를 커스텀 화살표로 대체 */
		    background: url('resources/assets/img/reference/select.png') no-repeat 95% 50%;
		    background-size: 20px auto;
		    /* border: 1px solid #999; */
		    border-radius: 4px;
		    -webkit-appearance: none; /* 네이티브 외형 감추기 */
		    -moz-appearance: none;
		    appearance: none;
		}
	
		/* text */
		input[type="text"]{
			width: 50%;
			border-radius: 4px;
		}
		
		/* popup */
		html * {
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		}

		*, *:after, *:before {
		  -webkit-box-sizing: border-box;
		  -moz-box-sizing: border-box;
		  box-sizing: border-box;
		}

		.img-replace {
		/* replace text with an image */
			display: inline-block;
			overflow: hidden;
			text-indent: 100%;
			color: transparent;
			white-space: nowrap;
		}
		
		/* ------------------------------------------------------------------------------------- */
		.cd-nugget-info {
			text-align: center;
			position: absolute;
			width: 100%;
			height: 50px;
			line-height: 50px;
		}
		
		.cd-nugget-info a {
			position: relative;
			font-size: 14px;
			color: #5e6e8d;
			-webkit-transition: all 0.2s;
			-moz-transition: all 0.2s;
			transition: all 0.2s;
		}

		.no-touch .cd-nugget-info a:hover {
			opacity: .8;
		}

		.cd-nugget-info span {
			vertical-align: middle;
			display: inline-block;
		}

		.cd-nugget-info span svg {
			display: block;
		}

		.cd-nugget-info .cd-nugget-info-arrow {
			fill: #5e6e8d;
		}
		
		header {
			height: 200px;
			line-height: 200px;
			text-align: center;
 			background-color: #5e6e8d;
			color: #FFF;
		}
		
		header h1 {
			font-size: 20px;
			font-size: 1.25rem;
		}
				
		@media only screen and (min-width: 1170px) {
		  .cd-popup-trigger {
		    margin: 6em auto;
		  }
		}
		
		/* ------------------------------------------------------------------------------------- */
		.cd-popup {
 			position: fixed;
			height: 100%;
			width: 100%;
			/* background-color: rgba(94, 110, 141, 0.9); */
			opacity: 0;
			visibility: hidden;
			-webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
			-moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
			transition: opacity 0.3s 0s, visibility 0s 0.3s;
		}
		
		.cd-popup.is-visible {
			opacity: 1;
			visibility: visible;
			-webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
			-moz-transition: opacity 0.3s 0s, visibility 0s 0s;
			transition: opacity 0.3s 0s, visibility 0s 0s;
		}

		.cd-popup-container {
			position: relative;
			width: 90%;
			max-width: 400px;
			margin: 4em auto;
			background: #FFF;
			border-radius: .25em .25em .4em .4em;
			text-align: center;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
			-webkit-transform: translateY(-40px);
			-moz-transform: translateY(-40px);
			-ms-transform: translateY(-40px);
			-o-transform: translateY(-40px);
			transform: translateY(-40px);
			/* Force Hardware Acceleration in WebKit */
			-webkit-backface-visibility: hidden;
			-webkit-transition-property: -webkit-transform;
			-moz-transition-property: -moz-transform;
			transition-property: transform;
			-webkit-transition-duration: 0.3s;
			-moz-transition-duration: 0.3s;
			transition-duration: 0.3s;
		}
		
		.cd-popup-container p {
			padding: 3em 1em;
		}

		.cd-popup-container .cd-buttons:after {
			content: "";
			display: table;
			clear: both;
		}

		.cd-popup-container .cd-buttons li {
			float: left;
			width: 50%;
			list-style: none;
		}

		.cd-popup-container .cd-buttons a {
			display: block;
			height: 55px;
			line-height: 54px;
			text-transform: uppercase;
			color: #FFF;
			-webkit-transition: background-color 0.2s;
			-moz-transition: background-color 0.2s;
			transition: background-color 0.2s;
		}

		.cd-popup-container .cd-buttons li:first-child a {
			background: #fc7169;
			border-radius: 0 0 0 .25em;
		}

		.no-touch .cd-popup-container .cd-buttons li:first-child a:hover {
			background-color: #fc8982;
		}

		.cd-popup-container .cd-buttons li:last-child a {
			background: #b6bece;
			border-radius: 0 0 .25em 0;
		}

		.no-touch .cd-popup-container .cd-buttons li:last-child a:hover {
			background-color: #c5ccd8;
		}

		.cd-popup-container .cd-popup-close {
			position: absolute;
			top: 8px;
			right: 8px;
			width: 30px;
			height: 30px;
		}

		.cd-popup-container .cd-popup-close::before, .cd-popup-container .cd-popup-close::after {
			content: '';
			position: absolute;
			top: 12px;
			width: 14px;
			height: 3px;
			background-color: #8f9cb5;
		}

		.cd-popup-container .cd-popup-close::before {
			-webkit-transform: rotate(45deg);
			-moz-transform: rotate(45deg);
			-ms-transform: rotate(45deg);
			-o-transform: rotate(45deg);
			transform: rotate(45deg);
			left: 8px;
		}

		.cd-popup-container .cd-popup-close::after {
			-webkit-transform: rotate(-45deg);
			-moz-transform: rotate(-45deg);
			-ms-transform: rotate(-45deg);
			-o-transform: rotate(-45deg);
			transform: rotate(-45deg);
			right: 8px;
		}

		.is-visible .cd-popup-container {
			-webkit-transform: translateY(0);
			-moz-transform: translateY(0);
			-ms-transform: translateY(0);
			-o-transform: translateY(0);
			transform: translateY(0);
		}

		@media only screen and (min-width: 1170px) {
			.cd-popup-container {
				margin: 8em auto;
			}
		}

	</style>
	</head>
	<body>
		<a href="#" class="btn btn-sm btn-warning">확인</a>
		<br/><br/>
		
		<button class="eb_btn">확인(기본)</button>
		<br/><br/>
		
		<select>
		    <option selected>셀렉트박스</option>
		    <option>옵션1</option>
		    <option>옵션2</option>
		    <option>옵션3</option>
		</select>
		
		<br/><br/>
		<input type="text"/>
		
		<br/><br/>
		<!-- alert -->
		<a href="#0" class="cd-popup-trigger">click</a>

		<div class="cd-popup" role="alert">
		    <div class="cd-popup-container">
		        <p>Are you sure you want to delete this element?</p>
		        <ul class="cd-buttons">
		            <li><a href="#0">Yes</a></li>
		            <li><a href="#0">No</a></li>
		        </ul>
		        <a href="#0" class="cd-popup-close img-replace">Close</a>
		    </div> <!-- cd-popup-container -->
		</div> <!-- cd-popup -->
	</body>
	<script>
		/* popup */
		jQuery(document).ready(function($){
			
		    //open popup
		    $('.cd-popup-trigger').on('click', function(event){
		        event.preventDefault();
		        $('.cd-popup').addClass('is-visible');
		    });
		    
		    //close popup
		    $('.cd-popup').on('click', function(event){
		        if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
		            event.preventDefault();
		            $(this).removeClass('is-visible');
		        }
		    });
		    
		    //close popup when clicking the esc keyboard button
		    $(document).keyup(function(event){
		        if(event.which=='27'){
		            $('.cd-popup').removeClass('is-visible');
		        }
		    });
		});
	</script>
</html>