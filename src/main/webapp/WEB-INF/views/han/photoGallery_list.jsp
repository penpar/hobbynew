<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
		#introContent{
		    /* background-color: green; */
		    width: 100%;
		    height: auto;
		    margin: 0 auto;
		    align: center;
		}
		
		input[type="button"]{
			position: relative;
		    width: 60px;
		    /* right: 0%; */
		    float: right;
		    border-radius: 7px;
		    line-height: 0px;
		    padding: 0px 0px 45px 0px;
		    margin: 0px 27px 0px 0px;
		}
		
		input[type="button"]:hover{
			position: relative;
			width: 60px;
			border-radius: 7px;
			float: right;
			color: #ff9a2e;
			border-color: #ff9a2e;
			margin: 0px 27px 0px 0px;
		    /* padding: 0px 0px 45px 0px; */
		}
		
		.photoList{
			position: relative;
			float: left;
			width : 350px;
			height: 350px;
			margin: 27px;
			/* background-color: lightgray; */
		}
		
		.photoList img{
			width: 100%;
		}
		
		.photoList_sub{
			position: relative;
			display: none;
			background-color: #ff9a2e;
			width : 350px;
			height: 350px;
		}
		
		.photoList_sub h6 {
            top: 35%;
            width: 100%;
            position: relative;
        }
		
		.middle {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		 }
		 
		 .eb_popup{
		 	display: none;
		 	position: fixed;
		 	width: 45%;
		 	height: 67%;
		 	top: 25%;
		 	left: 50%;
		 	/* background-color: white; */
	 	    transform: translateX(-20%);
		 	align : center;
		 	z-index: 5;
		 }
		 
		 .numbers{
		 	display: none;
	 	    position: fixed;
        	top: 53%;
		    width: 100%;
		    height: auto;
		    transform: translateY(-50%);
		    cursor: pointer;
		    z-index: 6;
		 }
		 
		 .numbers .one{
	 	    left: -42%;
	 	    position: relative;
	 	    width: 35px;
    		height: auto;
		 }
		 
		 .numbers .two{
		 	left: 5.5%;
		 	position: relative;
		 	width: 35px;
    		height: auto;
		 }
		 
		 .background{
		 	display: none;
		 	position: fixed;
		 	width: 100%;
		 	height: 100%;
		 	background-color: white;
		 	opacity: 0.8;
		 	z-index: 4;
		 }
		 
		 /* .eb_separate{
			top: 78%;
			width: 100%;
			height: 1px;
			background-color: lightgray;
			position: relative;
   		} */
   		
   		/* .eb_photos{
 			z-index: 5;
		    position: relative;
		    overflow: hidden;
		    height: 78%;
		    width: 100%;
   		} */
   		
   		/* .detailImg{
   			height: 100%;
   			display: block;
   		} */
   		
   		.eb_bottom{
			z-index: 10;
		    position: absolute;
		    /* background-color: green; */
		    width: 100%;
		    height: 100%;
		    top: 0%;
		    color: black;
		    display: none;
		    /* transform: translateX(50%); */
		    /* margin: 0 auto; */
   		}
   		
   		#buttons_location{
    		position: absolute;
    		width: 100%;
   		}
   		
   		#buttons_location input[type="submit"], #buttons_location input[type="button"]{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
    		border-radius: 7px;
    		padding: 0px 0px 0px 0px;
    		line-height: 3;
    		font-size: 12px;
    		right: 10%;
    		margin: 3px;
		}
		
		#buttons_location input[type="submit"], #buttons_location input[type="button"]:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 80px;
			border-radius: 7px;
			padding: 0px 0px 0px 0px;
    		line-height: 3;
			color: #ff9a2e;
			border-color: #ff9a2e;
			right: 10%;
			margin: 3px;
		}
		
		/* .btn1{
			left: 162px;
    		top: -58px;
		}
		
		.btn2{
			left: 162px;
    		top: -78px;
		} */
		
		#writes{
			position: absolute;
		    top: 26%;
		    left: 77%;
		}
		
		.ebsImg{
			width: 40px;
		    height: auto;
		    top: 88%;
		    left: 88%;
		    position: absolute;
		    z-index: 10;
		}
		
		/* .eb_bottom h6{
			position: absolute;
		    width: 100%;
		    z-index: 10;
		    display: table-cell;
		    text-align: center;
		    vertical-align: middle;
		} */
		
		#loadingbars{
			text-align: center;
		}
	</style>
	<body>
		<div class="background"></div>
		<jsp:include page="../loginBox.jsp" />
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>포토 갤러리</h1>
			<p>취미 아티스트's PHOTO</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<c:if test="${sessionScope.mb.m_id != null}">
			<input type="button" id="writes" value="글쓰기" onclick="location.href='photoGallery_write'"/>
		</c:if>
		
		<div id="introContent" style="text-align: center;" align="center">
			<c:if test="${pList.size() >= 1}">
				<c:forEach items="#{pList}" var="list" begin="0" end="5" step="1">
					<div class="photoList middle" style="background-image: url('${path}${list.f_newName}');
					background-size: 100%; background-repeat: no-repeat; background-position: center center;"
					onmouseover="mouseIn(this)" onmouseout="mouseOut(this)">
						<div class="photoList_sub" onclick="photoAjax(${list.cb_index})">
							<h6>${list.cb_subject}<br/>
							<c:if test="${list.cb_simpleContent != null}">
								${list.cb_simpleContent}</h6>
							</c:if>
							<c:if test="${list.cb_simpleContent == null}">
								${list.cb_content}</h6>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<div class="eb_popup"></div>
			<div class="numbers">
				<img class="one" src="resources/assets/img/prev.png" onclick="prevImg(-1)"/>
				<img class="two" src="resources/assets/img/next.png" onclick="prevImg(1)"/>
			</div>
		</div>
		<div id="loadingbars"><img style="width: 50px" alt="" src="resources/assets/img/loading.gif"></div>
		<!-- <main>
		    <div class="article-list" id="article-list"></div>
		    <ul class="article-list__pagination article-list__pagination--inactive" id="article-list-pagination"></ul>
		</main> -->
		
		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>
		//반응형 용 포토리스트 가져오기
		 $(document).ready(function(){
			$.ajax({
	            type:'get',
	            url:'photoGallery',
	            data:{},
	            dataType:'json', // html방식으로 호출 (전에는 JSON)
	            success:function(data){// 성공시 불러온 데이터를 팝업창 위에 덮어쓰겠다
	            	console.log(data);
	            	scrollList(data);
	            },
	            error:function(error){
	                alert('error');
	                console.log(error);
	            }
	        });
		});
	
		var listLength;
		var z;
		var mPostScrabListZ;
	  
		function scrollList(data){//리스트 뿌려주기
			listLength = data.pList.length;
			pListZ = data.pList;
		   
			if(z>=listLength){
				z = listLength;
			}else if(listLength < 6){
				z = listLength;
			}else{
				z = 6;
		    }
		   
			window.onscroll = function(ev) {
			    if ((window.innerHeight + window.scrollY) >= $(window).height()) {
		    		console.log("아이받니");
			      	scrollMethod(data.pList,data.path);
			    }
			};
		}
	   
		function scrollMethod(pList,path){ //반응형 스크롤
			console.log(pList);
			console.log(path);
			console.log(listLength);
	      
			if(z != listLength){
				$("#loadingbars").css("display","block");
				setTimeout(function(){
					i = z;
					z = z+6;
					
					if(i >= listLength){
						i = listLength;
						z = listLength;
					}else if(z >= listLength){
						z = listLength;
					}
		      		
					var cc = "";
					for (var zz = i; zz < z; zz++) {
						
						cc += "<div class='photoList middle' style='background-image: url("+path+pList[zz].f_newName+"); ";
						cc += "background-size: 100%; background-repeat: no-repeat; background-position: center center;'";
						cc += "onmouseover='mouseIn(this)' onmouseout='mouseOut(this)'>";
						cc += "<div class='photoList_sub' onclick=photoAjax('"+pList[zz].cb_index+"')>";
						cc += "<h6>"+pList[zz].cb_subject+"<br/>";
								
						if(pList[i].cb_simpleContent != null){
							cc += pList[zz].cb_simpleContent+"</h6>";
					   }else if(pList[zz].cb_simpleContent == null){
							cc += pList[zz].cb_content+"</h6>";
					   }
					   cc += "</div></div>";
					}
				$("#loadingbars").css("display","none");
				$("#introContent").append(cc);
		        },1000);
		   }
   		}

		// alert
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
			location.href="photoGallery_list";
		}
	
		/* rolling */
		var slideIndex;
		
		function prevImg(n) {
		  showDivs(slideIndex += n);
		  $("#ebs").css("display","none");
		  $(".eb_bottom").css("display","none");
		}

		function nextImg(n) {
		  showDivs(slideIndex = n);
		  $("#ebs").css("display","none");
		  $(".eb_bottom").css("display","none");
		}
		
		var xx;
		var yy;
		
		function showDivs(n){
			var i;
			var x = document.getElementsByClassName("detailImg");
			var imgSize = $(".detailImg");
			console.log(x[0].style);
			
			if(x.length > 1){
				if(n == x.length){ // 만약 n이 이미지 갯수보다 크면
					$(".one").css("display", "inline");
					$(".two").css("display", "none");
					console.log("같을 때 : "+n);
				}else if(n <= 1){ // 만약 n이 이미지 갯수보다 작으면
					slideIndex = 1;
					$(".one").css("display", "none");
					$(".two").css("display", "inline");
					console.log("1일때 : "+n);
				}
			}else{
				$(".one").css("display", "none");
				$(".two").css("display", "none");
			}
			
			if(1 < n && n < x.length){
				$(".one").css("display", "inline");
				$(".two").css("display", "inline");
			}
			
			
			for (i = 0; i < x.length; i++) {
			     x[i].style.display="none";
			  }
			  
			x[slideIndex-1].style.display="block";
			  
			  // 이미지 원본 크기 구하기
			  xx = imgSize[slideIndex-1].width;
			  yy = imgSize[slideIndex-1].height;
			  console.log(imgSize[slideIndex-1].width);
			  console.log(imgSize[slideIndex-1].height);
			  $("#ebs").css("width", xx);
			  $("#ebs").css("height", yy);
			  if(xx<yy){
				  console.log("세로가 큼");
				  $(".eb_popup").css("transform","translateX(-20%)");
				  $(".ebsImg").css("left","85%");
				  $(".ebsImg").css("top","89%");
				  $(".ebsImg").css("cursor","pointer");
				  console.log("성공");
				  
			  }else if(xx > yy){
				  console.log("가로가 큼");
				  $(".eb_popup").css("transform","translateX(-44%)");
				  $(".ebsImg").css("cursor","pointer");
				  $(".ebsImg").css("left","92%");
				  console.log("성공");
				  
			  }else if(xx == yy){
				  console.log("정사각형");
				  $(".eb_popup").css("transform","translateX(-29%)");
				  $(".ebsImg").css("cursor","pointer");
				  console.log("성공");
			  }
		}
		
		/* popup */
		$(".background").click(function(){
			$(".eb_popup").css("display", "none");
			$(".background").css("display", "none");
			$(".numbers").css("display", "none");
		});
		
		function photoAjax(cb_index){
			var ebSession = "${sessionScope.mb.m_id}";
			if(ebSession == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="loginForm";
			}else{
				
				$(".eb_popup").css("display", "block");
				$(".background").css("display", "block");
				$(".numbers").css("display", "block");
				
				console.log("photoAjax");
				$.ajax({
		            type:'get',
		            url:'photoAjax',
		            data:{
		                cb_index: cb_index
		            },
		            dataType:'json', // html방식으로 호출 (전에는 JSON)
		            success:function(data){ // 성공시 불러온 데이터를 팝업창 위에 덮어쓰겠다
		            	console.log(data.photoDetail.cb_subject);
		            	console.log(data.path);
		            	var sessionSort = "${sessionScope.mb.m_sort}";
		            	console.log("운영자 : "+sessionSort);
		            	
		            	var photoDetail = "";
		            	photoDetail += "<div class='eb_photos' style='z-index: 5; position: absolute; overflow: hidden; height: 78%; width: auto;'>";
		            	photoDetail += "<img src='resources/assets/img/photo/more.png' class='ebsImg' onclick='more()'>";
		            	
		            	for(var i=0;i<data.photoDetail.f_allName.length;i++){
		            		console.log(data.path+data.photoDetail.f_allName[i]);
		            		photoDetail += "<img class='detailImg' style='display: none; height: 100%;' src="+data.path+data.photoDetail.f_allName[i]+">";
		            	}
		            	photoDetail += "<div class='eb_bottom' style='z-index:10;position:absolute;width:100%;height:100%;color:black;display:none'>";
		            	photoDetail += "<h6 style='position:absolute;z-index:10;display:table-cell;text-aign:center;vertical-align:middle;width:100%;height:100%;transform:translateY(40%)'>";
		            	photoDetail += data.photoDetail.cb_subject+"<br/>"+data.photoDetail.cb_content+"</h6>";
						
		            	var aaa = data.photoDetail.m_id;
		            	var bbb = data.sessionId.m_id;
		            	
		           		if(aaa == bbb || sessionSort == 0){
		           			photoDetail += "<input type='button' class='btn1' value='수정' onclick='photoUpdate("+data.photoDetail.cb_index+")' style='z-index:10;left:80%;top:13%;position:absolute;'/>";
			            	photoDetail += "<br/><br/><input type='button' class='btn2' value='삭제' onclick='photoGallery_delete("+data.photoDetail.cb_index+")' style='z-index:10;left:80%;top:3%;position:absolute;'/>";
		           		}else if(aaa!=bbb || sessionSort != 0){
		           			photoDetail += "<br/><br/><input type='button' class='btn2' value='신고' onclick=banWrite('"+data.photoDetail.cb_index+"','"+aaa+"','3') style='z-index:10;left:80%;top:3%;position:absolute;'/>";
		           		}

		            	photoDetail += "<div id='ebs' style='background-color:white;width:100%;height:78%;z-index:9;top:0px;position:fixed;opacity:0.7;display:none'>";
		            	photoDetail += "</div></div></div><br/>";
		                $('.eb_popup').html(photoDetail);
		                
						if(xx<yy){
						 console.log("세로가 큼");
						 $(".eb_popup").css("transform","translateX(-20%)");
						 $(".ebsImg").css("left","85%");
						 $(".ebsImg").css("top","89%");
						 console.log("성공");
						 
						}else if(xx > yy){
						 console.log("가로가 큼");
						 $(".eb_popup").css("transform","translateX(-44%)");
						 console.log("성공");
						 
						}else{
						 console.log("정사각형");
						 $(".eb_popup").css("transform","translateX(-29%)");
						 console.log("성공");
						}
			             
		                slideIndex = 1;
		        		showDivs(slideIndex);
		            },
		            
		            error:function(error){
		                alert('error');
		                console.log(error);
		            }
		        });
			}
		}
		
		// 신고 링크
		function banWrite(cb_index,m_id,sort){
			console.log("인덱스 "+cb_index+" / "+"아이디 "+m_id+" / "+"구분 "+sort);
			location.href="banWrite?index="+cb_index+"&m_id2="+m_id+"&sort="+sort;
		}
		
		// 이미지 더보기
		function more() {
			console.log("더보기 시작");
			$("#ebs").css("display","block");
			$(".eb_bottom").css("display","table");
		}
		
		// 수정 페이지 이동
		function photoUpdate(cb_index) {
			location.href="photoGallery_update?cb_index="+cb_index;
		}
		
		// 삭제
		function photoGallery_delete(cb_index) {
			if (confirm("정말 삭제하시겠습니까?")==true){
				location.href="photoGallery_delete?cb_index="+cb_index;
		      }else{
		         return;
		      }
		}
		
		//팝업 해제(키보드 esc누를 시)
		/* $(document).on('keydown',function(event){
			console.log(event);
			if(event.keyCode!=27) return;
			if(layerWindow.hasClass('background') && layerWindow.hasClass('eb_popup')){
					layerWindow.removeClass('background');
					layerWindow.removeClass('eb_popup');
					window.location.reload();//reload 시킴으로써 목록을 새로고침
			}
		}); */
	
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
		
	</script>
</html>