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
		    margin: 27px 27px 90px 27px;
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

	</style>
	</head>
	<body>
			<body>
	
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div class="classes">
			<c:forEach items="${ClassNameList}" var="cnList">
				<input type="button" value="${cnList.cn_name}" onclick="typeList(this, '${cnList.cn_index}')"/>
				<c:set var="i" value="${i+1}"/>
				<c:if test="${i%4 ==0}"><br/></c:if>
			</c:forEach>
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
							<div class="mainText_div" onclick="classDetail('${cList.c_index}')">
								제목 : ${cList.c_subject}<br/>작성자 : ${cList.m_id }<br/>
								[ ${cList.c_simpleContent} ]
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	</body>
	<script>
	
	
	function btn(a){
		
		location.href="mySpaceList?sort="+a+"";	
		
	}

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
	</script>
</html>