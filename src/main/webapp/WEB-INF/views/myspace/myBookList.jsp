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
		input[type="text"],
		select{
			display: inline;
			float: left;
			margin: 10px;
		}
		
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
		
		.classes{
			position: relative;
			width: 60px;
			border-radius: 7px;
		    line-height: 0px;
		    padding: 0px 0px 45px 0px;
	        left: 38.5%;
		    display: inline;
	        /* transform: translateX(-50%);
    		left: 50%; */
		}
		
		input[type="button"]{
			font-size: 12px;
			position: relative;
			width: 60px;
			border-radius: 7px;
		    line-height: 0px;
		    padding: 0px 0px 45px 0px;
		    margin: 0px 10px 0px 0px;
		    display: inline;
	        /* transform: translateX(-50%);
    		left: 50%; */
		}
		
		input[type="button"]:hover{
			position: relative;
			width: 60px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
			/* margin: 0px 0px 0px 27px; */		
			/* transform: translateX(-50%);
    		left: 50%; */
		    /* line-height: 0px; */
		    /* padding: 0px 0px 45px 0px; */
		}
		
		.classList{
			position: relative;
			/* float: left; */
			width : 350px;
			height: 350px;
			/* margin: 27px; */
			background-color: lightgray;
		}
		
		.classList_sub{
			position: relative;
			display: none;
			background-color: #ff9a2e;
			width : 350px;
			height: 350px;
		}
		
		.middle {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    opacity: .7;
		 }
		 
		 /* 내용 위치 */
		#introContent{
		    /* background-color: green; */
		    width: 100%;
		    height: auto;
		    margin: 0 auto;
		    align: center;
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
    		margin: 140px 0px 40px 0px;
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
			position: absolute;
    		z-index: 2;
    		right: 4%;
    		top: 4%;
		}
		
		#classToggle .heart{
			width: 35px;
			height: auto;
			position: relative;
		}
		
		#classToggle .noheart{
			width: 35px;
			height: auto;
			position: relative;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>취미 클래스</h1>
			<p>당신의 새로운 취향을 찾아보세요!</p>
		</div>
		<a href="classDetail_contents">임시용 a링크 (상세보기)</a>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<!-- 대분류 -->
		<!-- div 테스트용 // 한 개만 남기고 지울 것(나중에 forEach문 돌리기) -->
		<!-- 4개 이상이면 두 줄로 위치 잡을 것 -->
		<div class="classes">
			<input id="bookClass" type="button" value="도서"/>
			<input id="movieClass" type="button" value="영화"/>
			<input id="musicClass" type="button" value="음악"/>
			<input id="craftClass" type="button" value="공예"/>
			<input id="photoClass" type="button" value="사진"/>
			<input class="exerciseClass" type="button" value="운동"/>
			<input class="etcClass" type="button" value="기타"/>
			<input class="etcClass" type="button" value="기타"/>
		</div>

		<div class="searches">
			<select name="searchProcess" style="width:120px;margin:5px 0px 0px 0px">
				<option value="classAll" selected>전체</option>
				<option value="classPrepare">준비중</option>
				<option value="classRecruit">모집중</option>
				<option value="classRecruit_end">모집 마감</option>
				<option value="classEnd">완료</option>
			</select>
			<select  name="search" style="width:120px;margin:5px">
				<option value="classPerson" selected>작성자</option>
				<option value="classSubject">글 제목</option>
			</select>
			<input type="text" name="classSearch" placeholder="검색" style="width:200px;margin:5px"/>
			<input class="search_confirm" type="button" value="검색"/>
			<input id="classWrite" type="button" value="글쓰기" onclick="location.href='classRecruitForm'"
			style="margin:0px 27px 0px 0px;float:right"/>
			<br/>
		</div>
		
		<div id="introContent" style="text-align: center;" align="center">
			<%-- <c:if test="${pList.size() >= 1}"> --%>
				<%-- <c:forEach items="#{pList}" var="list"> --%>
					<div id="position">
						<div id="classToggle">
							<img id="heart" class="noheart" src="resources/sj/heart_toggle(white).png"/>
						</div>
						<div class="classList middle" onmouseover="mouseIn(this)" onmouseout="mouseOut(this)">
							<div class="classList_sub">
								<%-- <h6>${list.cb_subject}<br/>
								<c:if test="${list.cb_simpleContent != null}">
									${list.cb_simpleContent}</h6>
								</c:if>
								<c:if test="${list.cb_simpleContent == null}">
									${list.cb_content}</h6>
								</c:if> --%>
							</div>
						</div>
					</div>
				<%-- </c:forEach> --%>
			<%-- </c:if> --%>
			<!-- </div> -->
		</div>
		
		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>
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
		$("#classToggle").click(function(){
	        /* console.log(this.children[0].getAttribute("class")); */
	        var toggle = this.children[0].getAttribute("class");
            console.log(toggle);
            console.log(this.children[0]);
	        if(toggle == "heart"){
	        	this.children[0].setAttribute("class","noheart");
	        	$("#classToggle").html("<img src='resources/sj/heart_toggle(white).png'>");
	        	this.children[0].setAttribute("class","noheart");
	        }else if(toggle == "noheart"){
	        	this.children[0].setAttribute("class","heart");
	        	$("#classToggle").html("<img src='resources/sj/heart_toggle(red).png'>");
	        	this.children[0].setAttribute("class","heart");
	        }
        });
	</script>
</html>