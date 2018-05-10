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
		
		table th{
			padding: 10px 0px 12px 24px !important;
		}
		
		table td{
		    padding: 15px 20px !important;
		}
		
		#header .links ul li{
			line-height: 1;
		}
		
		#eb_blank{
			width: 20px;
			height: 120px;
			display: hidden;
		}
		
		.btn{
		    font-size: 13.5px;
		    position: relative;
		    width: 120px;
		    border-radius: 7px;
		    line-height: 0px;
		    margin: 0px 10px 0px 0px;
		    display: inline;
		}
		
		.btn:hover{
		    font-size: 13.5px;
		    position: relative;
		    width: 120px;
		    border-radius: 7px;
		    line-height: 0px;
		    margin: 0px 10px 0px 0px;
		    display: inline;
			color: #ff9a2e;
			border-color: #ff9a2e;
		}
		
		.classList{
			position: relative;
			/* float: left; */
			width : 350px;
			height: 350px;
			/* margin: 27px; */
			/*background-color: lightgray;*/
		}
		
		.classList_sub{
		    position: relative;
		    display: none;
		    background-color: #ff9a2e;
		    width: 350px;
		    padding-top: 35%;
		    height: 350px;
		}
		
		.classList_sub p{
			position: relative;
			padding: 0px 0px;
			width : 350px;
			height: 350px;
		}
		
		.middle {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    opacity: .7;
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
		
		.searches{
		    position: relative;
    		/* top: 46%; */
    		margin: 0px 0px 40px 0px;
		}

		#position{
			position: relative;
			/* float: left; */
			width : 350px;
			height: 350px;
			/* margin: 27px; */
			/* background-color: green; */
		}
		
		#classToggle{
			/*position: absolute;*/
    		z-index: 2;
    		right: 4%;
    		top: 4%;
		}
		
		#classToggleHeart{
			position: absolute;
    		z-index: 2;
    		right: 4%;
    		top: 4%;
		}
		
		#classToggleHeart .heart{
			width: 35px;
			height: auto;
			position: relative;
		}
		
		#classToggleHeart .noheart{
			width: 35px;
			height: auto;
			position: relative;
		}
		
		#classToggle .star{
			width: 25px;
			height: auto;
			position: relative;
		}
		
		#classToggle .nostar{
			width: 25px;
			height: auto;
			position: relative;
		}
		#alert-box { 
			border:1px solid; padding:10px; 
			width: 50%;
		    height: 30%;
		    font-size: 15px;

		}
		
		.mainImg{
			width: 100%;
			height: 100%;
			object-fit: cover;
		}
		
		.mainImg_div{
			position: absolute;
			width: 100%;
		}
		
		 .mainText_div{
 	        border: 1px solid #E6E6E6;
		    width: 100%;
		    height: 31%;
		    font-size: 17px;
		    background-color: white;
		    opacity: 0.7;
		    margin: 0px 0px 20px 0px;
		    padding: 15px;
		    cursor: pointer;
		 }
		 
		 .click{
		 	position: relative !important;
			width: 60px !important;
			border-radius: 7px !important;
			color: #ff9a2e !important;
			border-color: #ff9a2e !important;
		 }
		
		 /* 내용 위치 */
		#introContent{
		    /* background-color: green; */
		    width: 100%;
		    height: auto;
		    margin: 0 auto;
		    align: center;
		}
		
		#position{
			position: relative;
			float: left;
			width : 350px;
			height: 350px;
			margin: 27px 27px 125px 27px;
			/* background-color: green; */
		}
		
		#btn_location{
		    width: 100%;
    		text-align: center;
		}
</style>
</head>
<body>
	<jsp:include page="../loginBox.jsp"></jsp:include>
	<!-- 여백 -->
		<div id = "second_subject" align="center">
			<h1>내 공간</h1>
			<p>회원님만의 소중한 공간</p>
		</div>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<div id="btn_location">
			<button class = "btn" onclick = "btn(1)">클래스</button>
			<button class = "btn" onclick = "btn(2)">즐겨찾기글</button>
			<button class = "btn" onclick = "btn(3)">내가 쓴 글</button>
		</div><br/><br/>
		${mwText}
	</body>
	
	<script>
		function mySpaceDetail(index){
		      if (confirm("해당 클래스로 이동하시겠습니까?")==true){
		    	  location.href="classDetail_contents?c_index="+index;
		      }else{
		    	 // starCheck = a.setAttribute("class" , "nostar");
		    	 // a.src = "resources/sj/star_toggle(yellow).png";
		    	false;   
		      } 
		      return;
		}

		function myBookDetail(index){
			 if (confirm("해당 게시판으로 이동하시겠습니까?")==true){
				 location.href="freeDetail?cb_index="+index;
		      }else{
		    	 // starCheck = a.setAttribute("class" , "nostar");
		    	 // a.src = "resources/sj/star_toggle(yellow).png";
		    	false;   
		      } 
		      return;
			
		}
		
	
		// 버튼에 따라 출력
		function btn(a){
			
			location.href="mySpaceList?sort="+a+"";	
			
		}
		
		function selectSel(a){
			
			var a = a.searchProcess.selectedIndex;
		
			
			 switch(a){
			   case 0:
					
					btn(3);
				 break;
				 
			   case 1:
				
					btn(4);
				 break;
			 }
			
		    return true;
	
		}
		
		
		function myClassDel(a,index){
			var starCheck = a.getAttribute("class");
			if(starCheck == "heart"){
			starCheck = a.setAttribute("class" , "noheart");
			a.src = "resources/sj/heart_toggle(white).png.png";
			}else{
			starCheck = a.setAttribute("class" , "heart");
			a.src = "resources/sj/heart_toggle(red).png.png";
			}
			
			var c = a.getAttribute("src");
			var d = a.getAttribute("class");
			var id = a.getAttribute("id");
		
		
			
			confirm2();
			function confirm2(){
			      if (confirm("관심클래스에서 삭제 하시겠습니까?")==true){
			    	 
			    		location.href="myClassDel?index="+index;
			      }else{
			    	 // starCheck = a.setAttribute("class" , "nostar");
			    	 // a.src = "resources/sj/star_toggle(yellow).png";
			    	false;   
			      } 
			      return;
			}
		}
		
		// star를 누를경우 삭제 함수
		function starDel(a,index){ // 스타 변환 역겹다
			var starCheck = a.getAttribute("class");
			if(starCheck == "star"){
			starCheck = a.setAttribute("class" , "nostar");
			a.src = "resources/sj/star_toggle(yellow).png";
			}else{
			starCheck = a.setAttribute("class" , "star");
			a.src = "resources/sj/star_toggle(white).png";
			}
			
			var c = a.getAttribute("src");
			var d = a.getAttribute("class");
			var id = a.getAttribute("id");
			
			confirm1();
			function confirm1(){
			      if (confirm("즐겨찾기 목록에서 삭제 하시겠습니까?")==true){
			    	 
			    	 location.href="myBookDel?index="+index+"";
			      }else{
			    	  starCheck = a.setAttribute("class" , "nostar");
			    	  a.src = "resources/sj/star_toggle(yellow).png";
			    	false;   
			      } 
			      return;
			}
		 }
		
		
		
		
		
		
		/* hover */
		function mouseIn(elem) {
			/* console.log("마우스 인");
			console.log(elem.children[0].getAttribute("class"));
			console.log(event.target.innerHTML); */
			$(elem.children[0]).css("display","block");
		}
		
		function mouseOut(elem) {
			/* console.log("마우스 인");
			console.log(elem.children[0].getAttribute("class"));
			console.log(event.target.innerHTML); */
			$(elem.children[0]).css("display","none");
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
		
		/* toggle */
		$("#classToggleHeart").click(function(){
	        /* console.log(this.children[0].getAttribute("class")); */
	        var toggle = this.children[0].getAttribute("class");
	        console.log(toggle);
	        console.log(this.children[0]);
	        if(toggle == "heart"){
	        	this.children[0].setAttribute("class","noheart");
	        	$("#classToggleHeart").html("<img src='resources/sj/heart_toggle(white).png'>");
	        	this.children[0].setAttribute("class","noheart");
	        }else if(toggle == "noheart"){
	        	this.children[0].setAttribute("class","heart");
	        	$("#classToggleHeart").html("<img src='resources/sj/heart_toggle(red).png'>");
	        	this.children[0].setAttribute("class","heart");
	        }
	    });
	</script>

</html>