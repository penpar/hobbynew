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
		input[type="text"],	select{
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
		    /* margin: 27px 27px 90px 27px; */
	        left: 38.5%;
		    display: inline;
	        /* transform: translateX(-50%); */
    		/* left: 50%; */
		}
		
		input[type="button"]{
			font-size: 12px;
			position: relative;
			width: 60px;
			border-radius: 7px;
		    line-height: 0px;
		    padding: 0px 0px 45px 0px;
		    margin: 0px 10px 10px 0px;
		    display: inline;
	        /* transform: translateX(-50%); */
    		/* left: 50%; */
		}
		
		input[type="button"]:hover{
			position: relative;
			width: 60px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e; */
			/* margin: 0px 0px 0px 27px; */		
			/* transform: translateX(-50%); */
    		/* left: 50%; */
		    /* line-height: 0px; */
		    /* padding: 0px 0px 45px 0px; */
		}
		
		.classList{
			position: relative;
			/* float: left; */
			width : 350px;
			height: 350px;
			/* margin: 27px; */
			/* background-color: lightgray; */
		}
		
		.classList_sub{
			position: relative;
			display: none;
			background-color: #ff9a2e;
			width : 350px;
			height: 350px;
			cursor: pointer;
			padding-top: 35%;
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
    		margin: 5% 0px 2% 0px;
		}

		#position{
			position: relative;
			float: left;
			width : 350px;
			height: 350px;
			margin: 27px 27px 125px 27px;
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
		    opacity: 0.8;
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
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<!-- 대분류 -->
		<!-- div 테스트용 // 한 개만 남기고 지울 것(나중에 forEach문 돌리기) -->
		<!-- 4개 이상이면 두 줄로 위치 잡을 것 -->
		<div class="classes">
			<c:forEach items="${ClassNameList}" var="cnList">
				<input type="button" value="${cnList.cn_name}" onclick="typeList(this, '${cnList.cn_index}')"/>
				<c:set var="i" value="${i+1}"/>
				<c:if test="${i%4 ==0}"><br/></c:if>
			</c:forEach>
		</div>

		<div class="searches">
			<select name="searchProcess" onchange="statusSearch()" style="width:120px;margin:5px 0px 0px 0px">
				<option value="0">전체</option>
				<option value="1">준비중</option>
				<option value="2">모집중</option>
				<option value="3">모집 마감</option>
				<option value="4">완료</option>
			</select>
			<select  name="search" style="width:120px;margin:5px">
				<option value="m_id">작성자</option>
				<option value="c_subject">글 제목</option>
			</select>
			<input type="text" name="classSearch" placeholder="검색" style="width:200px;margin:5px"/>
			<input class="search_confirm" type="button" onclick="classSearch()" value="검색"/>
			<c:if test="${sessionScope.mb != null && sessionScope.mb.m_sort == 2 || sessionScope.mb.m_sort == 3}">
				<input id="classWrite" type="button" value="글쓰기" onclick="location.href='classRecruitForm'" style="margin:0px 27px 0px 0px;float:right"/>
			</c:if>
			<br/>
		</div>

		<div id="introContent" style="text-align: center;" align="center">
			<c:if test="${classList != '[]'}">
				<c:forEach items="#{classList}" var="cList">
					<c:if test="${cList.c_status != 0}">
						<div id="position">
							<div id="classToggle">
								<img id="heart" class="noheart" src="resources/sj/heart_toggle(white).png" onclick="myClass(this,'${cList.c_index}')"/>
								<input type="hidden" class="c_index" value="${cList.c_index}">
							</div>
							<div class="mainImg_div" onclick="classDetail('${cList.c_index}')">
								<img class="mainImg" src="${path}${cList.c_mainImg}">
							</div>
							<div class="classList middle" onmouseover="mouseIn(this)" onmouseout="mouseOut(this)" onclick="classDetail('${cList.c_index}')">
								<div class="classList_sub">
									<h4>진행상황</h4>
									<c:if test="${cList.c_count != null}">
										${cList.c_count} / ${cList.c_maxPerson}
									</c:if>
									<c:if test="${cList.c_count == null}">
										0 / ${cList.c_maxPerson}
									</c:if>
								</div>
							</div>
							<div class="mainText_div" onclick="classDetail('${cList.c_index}')" style="font-size: 14px;line-height: 180%;">
								<b>제목</b>&ensp;${cList.c_subject}<br/><b>작성자</b>&ensp;${cList.m_id }<br/>
								< ${cList.c_simpleContent} >
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
			location.href="hobbyClass";
		}
	
		//서비스에서 보내져온 관심클래스 리스트
		var myClassList = "${myClassList}";
		//페이지 로드 시 바로 관심클래스에 맞게 하트 변경
		$(document).ready(function() {
			heartCheck();
		});
		
		function heartCheck() {
			console.log("ddd");
			var c_index = $(".c_index");
			for(var i=0;i<c_index.length;i++){
				if(myClassList.indexOf(c_index[i].attributes[2].value) != -1){
					console.log("??");
					$(c_index[i].previousElementSibling).attr("class", "heart");
					$(c_index[i].previousElementSibling).attr("src", "resources/sj/heart_toggle(red).png");
				}
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
		function myClass(a,c_index){
        	console.log(c_index);
			var starCheck = a.getAttribute("class");
			var m_id = "${sessionScope.mb.m_id}";
			if(m_id != ""){
				if(starCheck == "heart"){
					//삭제
					if(confirm("관심클래스를 삭제하시겠습니까?")==true){
						myClassMgt(m_id, c_index, 0);
						starCheck = a.setAttribute("class" , "noheart");
						a.src = "resources/sj/heart_toggle(white).png";
					}else{
						return;
					}
				}else{
					//추가
					if(confirm("관심클래스를 추가하시겠습니까?")==true){
						myClassMgt(m_id, c_index, 1);
						starCheck = a.setAttribute("class" , "heart");
						a.src = "resources/sj/heart_toggle(red).png";
					}else{
						return;
					}
				}
			}else{
				alert("로그인을 해주세요.");
				location.href="loginForm";
			}
		}
		/* 상세보기 */
		function classDetail(c_index) {
			location.href="classDetail_contents?c_index="+c_index;
		}
		
		/* 클래스 검색 */
		function classSearch() {
			var status = $("select[name='searchProcess']").val();
			var filter = $("select[name='search']").val();
			var keyword = $("input[name='classSearch']").val();
			console.log(status);
			console.log(filter);
			console.log(keyword);
			if(keyword != ""){
				$.ajax({
		            type:'post',
		            url:'classSearch',
		            data:{
		            	status: status,
		            	filter: filter,
		            	keyword: keyword,
		            },
		            dataType:'json', // html방식으로 호출 (전에는 JSON)
		            success:function(data){ // 성공시 불러온 데이터를 팝업창 위에 덮어쓰겠다
		            	console.log(data);
		            	var path = "${path}";
		            	var classList = "";
		            	if(data.searchList.length > 0){
		            		for(var i=0;i<data.searchList.length;i++){
		            			if(data.searchList[i].c_status != "0"){
		            				classList += "<div id='position'>";
		            				classList += "<div id='classToggle'>";
		            				classList += "<img id='heart' class='noheart' src='resources/sj/heart_toggle(white).png' onclick=myClass(this,'"+data.searchList[i].c_index+"')>";
		            				classList += "<input type='hidden' class='c_index' value="+data.searchList[i].c_index+">"
		            				classList += "</div>";
		            				classList += "<div class='mainImg_div' onclick='classDetail("+data.searchList[i].c_index+")'>";
		            				classList += "<img class='mainImg' src='"+path+data.searchList[i].c_mainImg+"'>";
		            				classList += "</div>";
		            				classList += "<div class='classList middle' onmouseover='mouseIn(this)' onmouseout='mouseOut(this)' onclick=classDetail('"+data.searchList[i].c_index+"')>";
		            				classList += "<div class='classList_sub'>";
		            				classList += "<h4>";
		            				if(data.searchList[i].c_status == 1){
		            					classList += "준비중";
		            				}else if(data.searchList[i].c_status == 2){
		            					classList += "모집중";
		            				}else if(data.searchList[i].c_status == 3){
		            					classList += "모집 마감";
		            				}else if(data.searchList[i].c_status == 4){
		            					classList += "완료";
		            				}
		            				classList += "</h4>";
		            				if(data.searchList[i].c_count != null){
		            					classList += data.searchList[i].c_count+" / "+data.searchList[i].c_maxPerson;
		            				}else{
		            					"0 / "+data.searchList[i].c_maxPerson;
		            				}
		            				classList += "</div>";
		            				classList += "</div>";
		            				classList += "<div class='mainText_div' onclick=classDetail('"+data.searchList[i].c_index+"') style='font-size: 14px;line-height: 180%;'>";
		            				classList += "<b>제목</b>&ensp;"+data.searchList[i].c_subject+"<br/><b>작성자</b>&ensp;"+data.searchList[i].m_id+"<br/>";
		            				classList += "< "+data.searchList[i].c_simpleContent+" >";
		            				classList += "</div>";
		            				classList += "</div>";
		            			}
		            		}
		            		$("#introContent").html(classList);
		            		heartCheck();
		            	}else{
		            		alert("검색 결과가 없습니다.");
		            	}
		            },
		            error:function(error){
		                console.log(error);
		            }
		        });
			}else{
				alert("검색어를 입력해주세요.");
			}
		}
		
		//대분류 클릭 시 검색 ajax
		function typeList(e, cn_index) {
			/* console.log(event);
			console.log(cn_index); */
			event.target.classList.add("click");
			/* $(".click").css("background-color", "#ff9a2e"); */
			/* $(".click").css("color", "white"); */
			/* event.target.style.borderColor = "#ff9a2e"; */
			/* event.target.style.backgroundColor = "#ff9a2e"; */
			/* event.target.style.color = "white"; */
			$.ajax({
	            type:'post',
	            url:'cnSearch',
	            data:{
	            	cn_index: cn_index
	            },
	            dataType:'json', // html방식으로 호출 (전에는 JSON)
	            success:function(data){ // 성공시 불러온 데이터를 팝업창 위에 덮어쓰겠다
	            	console.log(data);
	            	var path = "${path}";
	            	var classList = "";
	            	if(data.searchList.length > 0){
	            		for(var i=0;i<data.searchList.length;i++){
	            			if(data.searchList[i].c_status != "0"){
	            				classList += "<div id='position'>";
	            				classList += "<div id='classToggle'>";
	            				classList += "<img id='heart' class='noheart' src='resources/sj/heart_toggle(white).png' onclick=myClass(this,'"+data.searchList[i].c_index+"')>";
	            				classList += "<input type='hidden' class='c_index' value="+data.searchList[i].c_index+">"
	            				classList += "</div>";
	            				classList += "<div class='mainImg_div' onclick='classDetail("+data.searchList[i].c_index+")'>";
	            				classList += "<img class='mainImg' src='"+path+data.searchList[i].c_mainImg+"'>";
	            				classList += "</div>";
	            				classList += "<div class='classList middle' onmouseover='mouseIn(this)' onmouseout='mouseOut(this)' onclick=classDetail('"+data.searchList[i].c_index+"')>";
	            				classList += "<div class='classList_sub'>";
	            				classList += "<h4>";
	            				if(data.searchList[i].c_status == 1){
	            					classList += "준비중";
	            				}else if(data.searchList[i].c_status == 2){
	            					classList += "모집중";
	            				}else if(data.searchList[i].c_status == 3){
	            					classList += "모집 마감";
	            				}else if(data.searchList[i].c_status == 4){
	            					classList += "완료";
	            				}
	            				classList += "</h4>";
	            				if(data.searchList[i].c_count != null){
	            					classList += data.searchList[i].c_count+" / "+data.searchList[i].c_maxPerson;
	            				}else{
	            					"0 / "+data.searchList[i].c_maxPerson;
	            				}
	            				classList += "</div>";
	            				classList += "</div>";
	            				classList += "<div class='mainText_div' onclick=classDetail('"+data.searchList[i].c_index+"') style='font-size: 14px;line-height: 180%;'>";
	            				classList += "<b>제목</b>&ensp;"+data.searchList[i].c_subject+"<br/><b>작성자</b>&ensp;"+data.searchList[i].m_id+"<br/>";
	            				classList += "< "+data.searchList[i].c_simpleContent+" >";
	            				classList += "</div>";
	            				classList += "</div>";
	            			}
	            		}
	            		$("#introContent").html(classList);
	            		heartCheck();
	            	}else{
	            		alert("검색 결과가 없습니다.");
	            	}
	            },
	            error:function(error){
	                console.log(error);
	            }
	        });
		}
		
		// 진행상태 선택 시 검색 ajax
		function statusSearch() {
			var status = $("select[name='searchProcess']").val();
			console.log(status);
			$.ajax({
	            type:'post',
	            url:'statusSearch',
	            data:{
	            	status: status
	            },
	            dataType:'json', // html방식으로 호출 (전에는 JSON)
	            success:function(data){ // 성공시 불러온 데이터를 팝업창 위에 덮어쓰겠다
	            	console.log(data);
	            	var path = "${path}";
	            	var classList = "";
	            	if(data.searchList.length > 0){
	            		for(var i=0;i<data.searchList.length;i++){
	            			if(data.searchList[i].c_status != "0"){
	            				classList += "<div id='position'>";
	            				classList += "<div id='classToggle'>";
	            				classList += "<img id='heart' class='noheart' src='resources/sj/heart_toggle(white).png' onclick=myClass(this,'"+data.searchList[i].c_index+"')>";
	            				classList += "<input type='hidden' class='c_index' value="+data.searchList[i].c_index+">"
	            				classList += "</div>";
	            				classList += "<div class='mainImg_div' onclick='classDetail("+data.searchList[i].c_index+")'>";
	            				classList += "<img class='mainImg' src='"+path+data.searchList[i].c_mainImg+"'>";
	            				classList += "</div>";
	            				classList += "<div class='classList middle' onmouseover='mouseIn(this)' onmouseout='mouseOut(this)' onclick=classDetail('"+data.searchList[i].c_index+"')>";
	            				classList += "<div class='classList_sub'>";
	            				classList += "<h4>";
	            				if(data.searchList[i].c_status == 1){
	            					classList += "준비중";
	            				}else if(data.searchList[i].c_status == 2){
	            					classList += "모집중";
	            				}else if(data.searchList[i].c_status == 3){
	            					classList += "모집 마감";
	            				}else if(data.searchList[i].c_status == 4){
	            					classList += "완료";
	            				}
	            				classList += "</h4>";
	            				if(data.searchList[i].c_count != null){
	            					classList += data.searchList[i].c_count+" / "+data.searchList[i].c_maxPerson;
	            				}else{
	            					"0 / "+data.searchList[i].c_maxPerson;
	            				}
	            				classList += "</div>";
	            				classList += "</div>";
	            				classList += "<div class='mainText_div' onclick=classDetail('"+data.searchList[i].c_index+"') style='font-size: 14px;line-height: 180%;'>";
	            				classList += "<b>제목</b>&ensp;"+data.searchList[i].c_subject+"<br/><b>작성자</b>&ensp;"+data.searchList[i].m_id+"<br/>";
	            				classList += "< "+data.searchList[i].c_simpleContent+" >";
	            				classList += "</div>";
	            				classList += "</div>";
	            			}
	            		}
	            		$("#introContent").html(classList);
	            		heartCheck();
	            	}else{
	            		alert("검색 결과가 없습니다.");
	            	}
	            },
	            error:function(error){
	                console.log(error);
	            }
	        });
		}
		
		//관심 클래스 변경
		function myClassMgt(m_id, c_index, flag) {
			$.ajax({
	            type:'post',
	            url:'myClassMgt',
	            data:{
	            	"m_id": m_id,
	            	"c_index": c_index,
	            	"flag": flag
	            },
	            dataType:'json', // html방식으로 호출 (전에는 JSON)
	            success:function(data){ // 성공시 불러온 데이터를 팝업창 위에 덮어쓰겠다
	            	console.log(data);
	            	/* if(data.msg == 0){
	            		console.log("관심클래스 변경 실패");
	            	}else{
	            		console.log("관심클래스 변경 성공");
	            	} */
	            },
	            error:function(error){
	                console.log(error);
	            }
	        });
		}
	</script>
</html>