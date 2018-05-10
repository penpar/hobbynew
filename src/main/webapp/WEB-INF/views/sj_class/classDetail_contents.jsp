<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Karla" rel="stylesheet">
		<script src="resources/assets/js/jquery.min.js"></script>
		<title>소수의 취향</title>
	</head>
	<style>
			table td{
				/* padding: 0.30em 0.75em 1.7em 0em !important; */
			}
	
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
				height: 70px;
				display: hidden;
			}
			
			#eb_separate{
				position: relative;
				width: 100%;
				height: 1px;
				background-color: lightgray;
			}
			
			#subject{
				width: 50%;
				height: auto;
				margin: 0 auto;
				/* border: 1px solid black; */
				position: relative;
			}
		
			#buttons_location{
			    width: 30%;
			    position: relative;
			    display: inline-block;
			    /* border: 1px solid black; */
			    left: 31.5%;
		        float: right;
			}
			
			#buttons_location input[type="submit"], #buttons_location input[type="button"]{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 80px;
				line-height: 3px;
				border-radius: 7px;
				font-size: 12px;
			}
			
			#buttons_location input[type="submit"], #buttons_location input[type="button"]:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 80px;
				line-height: 3px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
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
			#progress{
		        width: 70px;
			    height: 37px;
			    border-radius: 7px;
			    color: white;
			    line-height: 36px;
			    font-size: 13px;
			    position: absolute;
			    font-weight: 200;
			    background-color: #ff9a2e;
			    float: left;
			    margin: 2%;
			}
			
			#classContent{
				width: 80%;
				height: 100%;
				/* background-color: white; */
				margin: 0 auto;
				text-align: center;
			}
			
			.titleImg{
				width: 100%;
				height: 40%;
				position: relative;
				background-color: lightgray;
			}
			
			.remoteCon{
			    position: fixed;
			    display: block;
			    left: 15%;
			    top: 26%;
			    z-index: 3;
			    text-align: center;
			    cursor: pointer;
			}
			
			.remoteCon div{
				width: 90px;
				height: 70px;
				line-height: 500%;
				/* background-color: lightgray; */
			}
			
			.stars{
			    left: 0%;
			    width: 100%;
	    	    padding: 10px;
				top: 0;
				position: absolute;
			}
			
			.stars img{
		        width: 30px;
			    height: auto;
			    /* right: 4%; */
			    /* top: -2%; */
			    float: right;
			    position: relative;
			    margin: 0px 4px 0px 0px;
			}
			
			#mainImg{
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
			
			.explainImg{
				width: 100%;
				height: auto;
			}
			
			.reviewDiv{
				width: 100%;
				height: 25%;
				/* border: 1px solid black; */
				margin: 0 auto;
			}
			
			.eb_separate{
				position: relative;
				width: 100%;
				height: 1px;
				background-color: lightgray;
			}
			
			.star{
				width: 2%;
			}
			
			.button_loc{
			    position: relative;
			    float: right;
			    display: inline-grid;
			}
			
			.button_loc input[type='button']{
				display: inline;
				width: 65px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 5px 0px 5px;
			    position: relative;
			    /* font-size: 12px; */
			    border-color: #ff9a2e;
			    color: #ff9a2e;
			}
			
			.button_loc input[type='button']:hover{
				margin: 3px;
				width: 65px;
				line-height: 3px;
				float: right;
				position: relative;
			    margin: 5px 5px 0px 5px;
				border-radius: 7px;
				color: #ff9a2e;
				/* font-size: 12px; */
				border-color: #ff9a2e;
			}
			
			.review_img{
				/* border: 1px solid black; */
				position: relative;
				width: 34%;
				height: 100%;
				float: left;
			}
			
			.review_img img{
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
			
			.review_body{
			    position: relative;
		        width: 50%;
			    height: 100%;
			    top: 14%;
			    float: right;
			    font-size: 15px;
			    line-height: 200%;
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
         
         	#goPrev:hover{
				color: #ff9a2e;
				border-color: #ff9a2e;
				position: relative;
			    width: 125px;
			    border-radius: 7px;
			    /* line-height: 0px !important; */
			    padding: 0px 0px 45px 0px;
			    /* transform: translateX(0); */
			    /* left: 50%; */
         	}
         	
         	#class_subject{
         		width: 100%;
			    float: left;
			    position: absolute;
         	}
         	#comments textarea{
			    position: relative;
			    width: 89%;
			    float: left;
         	}
         
			#comments{
				position: relative;
				width: 82.5%;
				height: 13.5%;
				margin: 0 auto;
				border-radius: 7px;
				padding: 15px;
				border: 1px solid #D8D8D8;
			}
         
			#comments input[type="button"]{
				position: relative;
				width: 65px;
				border-radius: 7px;
				padding: 0px 0px 45px 0px;
				left: 0%;
				top: 26%;
			}
         
			#lock_g{
				position: relative;
				float: left;
				width: 20px;
				height: auto;
				margin: 0px 0px 0px 20px;
			}
         
			#allComm{
				position: relative;
				width: 82.5%;
				height: auto;
				border-radius: 7px;
				margin: 0 auto;
				padding: 1% 2%;
				border: 1px solid #D8D8D8;
				text-align: left;
			}
			
			#eb_btn{
				width: 55px;
			    line-height: 3px;
			    float: right;
			    border-radius: 7px;
			    position: relative;
			    margin: 3px 4px -20px 0px;
			    font-size: 12px;
			    transform: translateY(-130%);
			}
			
			.eb_btn2{
			    width: 85px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			.eb_btn2:hover{
			    width: 85px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			#questionBtn{
				width: 165px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			#questionBtn:hover{
				width: 165px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			.eb_btn{
			    width: 150px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			.eb_btn:hover{
			    width: 150px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			#comDelete{
				width: 150px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			#comDelete:hover{
				width: 150px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			}
			
			
			/* .eb_commList input[type="button"]{
			    width: 85px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 15px 0px 5px;
			    position: relative;
			    font-size: 12px;
			    border-color: #ff9a2e;
			    color: #ff9a2e;
			}
		
			.eb_commList input[type="button"]:hover{
				width: 55px;
				line-height: 3px;
				float: right;
				position: relative;
			    margin: 3px 4px -20px 0px;
				border-radius: 7px;
				color: #ff9a2e;
				font-size: 12px;
			    transform: translateY(-130%);
				border-color: #ff9a2e;
			} */
   		
	   		#allComm img {
			    width: 36px;
		        margin: 0px 10px 0px 0px;
			}
			
			#allComm p{
			    margin: 0 0 1.5em 0;
			}
			
			.lock{
			    float: left;
		        position: relative;
	    		top: -8px;
			}
			
			.lock2{
			    float: left;
		        position: relative;
	    		top: 15px;
			}
			
			#eb_zero{
				width: 50px;
				height: 50px;
				text-align: center;
				vertical-align: center;
				background-color: #ff9a2e;
				border-radius: 40px;
			    margin: 0px 0px 0px 15px;
			}
			
			#eb_zero img{
			    width: 30px !important;
			    height: auto !important;
			    position: relative;
			    top: 21%;
			}
			
			#eb_one, #eb_two, #eb_three, #eb_four, #eb_five{
				display: none;
			}
			
			.eb_points{
			    width: 100%;
			    padding: 21px;
			    font-size: 15px;
			    height: 70px;
			    text-align: left;
			    border-radius: 7px;
			    margin: 25px 0px;
			    border: 1px solid #D8D8D8;
			}
			
			.eb_points2{
			 	width: 100%;
			    padding: 21px;
			    font-size: 15px;
			    height: auto;
			    text-align: center;
			    border-radius: 7px;
			    margin: 25px 0px;
			    border: 1px solid #D8D8D8;
			}
			
			
			#eb_back{
				background-color: white;
				display: none;
				width: 80px;
				height: auto;
				padding: 5px;
			}
			
			#eb_separate2{
				position: relative;
				width: 50%;
				height: 1px;
			    margin: 0px 0px 0px 20px;
				background-color: lightgray;
			}
			
			#eb_back p{
				font-size: 14px;
			    width: 80%;
			    margin: 0px 0px;
			}
			
			#paging{
				margin: 0 auto;
				width: 66%;
			}
			
			#paging a{
				font-family: 'Karla', sans-serif;
				font-size: 20px;
				margin: 6px;
			}
			
			#paging font{
				font-family: 'Karla', sans-serif;
				font-size: 20px;
				margin: 6px;
			}
			
			#reviewWriteBtn{
				display: inline;
				width: 85px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 5px 0px 5px;
			    position: relative;
			    /* font-size: 12px; */
			    border-color: #ff9a2e;
			    color: #ff9a2e;
			}
			
			#reviewWriteBtn:hover{
				width: 85px;
				line-height: 3px;
				float: right;
				position: relative;
			    margin: 5px 5px 0px 5px;
				border-radius: 7px;
				color: #ff9a2e;
				/* font-size: 12px; */
				border-color: #ff9a2e;
			}
			
			#comDelete, #comReport{
				display: inline;
				width: 65px;
			    line-height: 3px !important;
			    float: right;
			    border-radius: 7px;
			    margin: 5px 5px 0px 5px;
			    position: relative;
			    /* font-size: 12px; */
			    border-color: #ff9a2e;
			    color: #ff9a2e;
			}
			
			#comDelete:hover, #comReport:hover{
				width: 65px;
				line-height: 3px;
				float: right;
				position: relative;
			    margin: 5px 5px 0px 5px;
				border-radius: 7px;
				color: #ff9a2e;
				/* font-size: 12px; */
				border-color: #ff9a2e;
			}
			
			#class_Sample{
	            border: 1px solid #D8D8D8;
	            width: 60%;
	            height: 20%;
	            margin: 0 auto;
	            padding: 15px;
	         }
	         
	          #mainDiv{
	            width: 100px;
	            float: left;
	            margin: 0px 20px 0px 0px;
	         }
	         
			.locks{
				width: 23px !important;
				margin: 0px 10px 0px 0px;
				position: relative;
				top: -2px;
			}
	     
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div><br/>
	
		<div id = "subject" align="center">
			<!-- <h2>취미 클래스</h2> -->
			
			<div id="class_subject">
				<h4>${classDetail.classBean.c_subject}</h4>
			</div>
			<c:if test="${sessionScope.mb != null}">
				<c:if test="${sessionScope.mb.m_id == classDetail.classBean.m_id}">
					<div id="buttons_location">
						<input type="button" onclick="classUpdate(${param.c_index})" value="수정"/>&nbsp;&nbsp;
						<input type="button" onclick="classDelete(${param.c_index})" value="삭제"/>
					</div>
				</c:if>
				<c:if test="${sessionScope.mb.m_id != classDetail.classBean.m_id}">
					<div id="buttons_location">
						<input type="button" onclick="location.href='banWrite?sort=2&m_id2=${classDetail.classBean.m_id}&index=${classDetail.classBean.c_index}&c_index=${param.c_index}'" value="신고"/>
					</div>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.mb == null}">
				<div id="buttons_location" style="height: 4%;"></div>
			</c:if>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<!-- 리모콘 -->
		<div class="remoteCon">
			<div id="eb_zero"><img src="resources/sj/remoteon.png"/></div><br/>
				<div id="eb_back">
					<div id="eb_one">
						<div id="classEx" onclick="mainContent('${param.c_index}')"><p>상세설명</p></div>
					</div>
					
					<div id="eb_separate2"></div>
					<div id="eb_two">
						<div id="cReply" onclick="classReply('${param.c_index}')"><p>댓글</p></div>
					</div>
					
					<div id="eb_separate2"></div>
					<div id="eb_three">
						<div id="cReview" onclick="reviewContent('${param.c_index}')"><p>후기</p></div>
					</div>
						<div id="eb_separate2" class="heress"></div>
						<div id="eb_four">
							<div onclick="location.href='classPayment?c_index=${classDetail.classBean.c_index}'"><p>신청하기</p></div>
						</div>
					<div id="eb_separate2"></div>
					<div id="eb_five">
						<div onclick="location.href='hobbyClass'"><p>목록</p></div>
						<!-- <input id="goPrev" type="button" value="목록으로 이동" onclick="location.href='vote'"/> -->
					</div>
				</div>
		</div>
		
		<br/><br/>
		<div id="classContent" align="center">
			<!-- 대표 이미지 -->
			<div class="titleImg">
				<div id="progress">
				<c:choose>
					<c:when test="${classDetail.classBean.c_status == 1}">
						준비중
					</c:when>
					<c:when test="${classDetail.classBean.c_status == 2}">
						모집중
					</c:when>
					<c:when test="${classDetail.classBean.c_status == 3}">
						모집 마감
					</c:when>
					<c:when test="${classDetail.classBean.c_status == 4}">
						완료
					</c:when>
					<c:otherwise>
						심사중
					</c:otherwise>
				</c:choose>
			</div>
			
				<img id="mainImg" src="${classDetail.path}${classDetail.classBean.c_mainImg}">
				<!-- 별점 -->
				<div class="stars">
					<c:choose>
						<c:when test="${classDetail.c_starPoint == 5}">
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
						</c:when>
						<c:when test="${classDetail.c_starPoint == 4}">
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
						</c:when>
						<c:when test="${classDetail.c_starPoint == 3}">
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
						</c:when>
						<c:when test="${classDetail.c_starPoint == 2}">
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
						</c:when>
						<c:when test="${classDetail.c_starPoint == 1}">
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(yellow).png"/>
						</c:when>
						<c:otherwise>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
							<img src="resources/sj/star_toggle(white).png"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- ajax로 상세설명, 댓글, 후기 불러와서 표시해줄 공간 -->
			<div id="ajax_div">
				
			</div>
		</div>
		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>
		var eb_click = 0;
		// 리모콘 클릭 시
		/* $("#eb_zero").click(function(){
			if(eb_click == 0){
				$("#eb_one").css("display","block");
				$("#eb_two").css("display","block");
				$("#eb_three").css("display","block");
				$("#eb_four").css("display","block");
				$("#eb_five").css("display","block");
				$("#eb_back").css("display","block");
				eb_click++;
			}else{
				$("#eb_one").css("display","none");
				$("#eb_two").css("display","none");
				$("#eb_three").css("display","none");
				$("#eb_four").css("display","none");
				$("#eb_five").css("display","none");
				$("#eb_back").css("display","none");
				eb_click = 0;
			}
		}); */
		
		// slide Down
		$(document).ready(function(){
		    $("#eb_zero").click(function(){
		        var submenu = $("#eb_back");
		        // submenu 가 화면상에 보일때는 위로 접고, 아니면 아래로 펼치기
		        if(submenu.is(":visible")){
		        	submenu.slideUp();
		        	$("#eb_back").children().css("display","none");
		        }else{
		        	$("#eb_back").children().css("display","block");
		        	submenu.slideDown();
		        }
		    });
		    
		    var m_id = "${sessionScope.mb.m_id}";
		    var c_id = "${classDetail.classBean.m_id}";
		    if(m_id == c_id){
		    	$("#eb_four").css("display", "none");
		    }
		});
	
		//댓글 페이징
		function pagingComent(pageNum,c_index){
			$.ajax({
	            type:"post",
	            url:"getClassReply",
	            data:{
	            	c_index : c_index,
	            	pageNum:pageNum
	            },
	            dataType:"html",
	            success:function(data){
	            	console.log(data);
	            	$("#ajax_div").html(data);
	            },
	            error:function(error){
	                console.log(error);
	            }
        	});
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
		
		//주소 표시줄에 있는 c_index 가져와서 페이지 로드끝나면 ajax 실행에 사용
		var c_index = "${param.c_index}";
		
		//페이지 로드 시 바로 상세설명 찍히게 하기 위한 용도
		$(document).ready(function() {
			mainContent(c_index);
			var pChk = "${pListChk}";
			console.log(pChk);
			if(pChk == '0'){
				$("#eb_four").html("<div onclick=location.href='classPayment?c_index="+c_index+"'><p>신청하기</p></div>");
			}else if(pChk == '1'){
				$("#eb_four").html("<div onclick=location.href='payCancelForm?c_index="+c_index+"'><p>환불하기</p></div>");
			}else{
				$("#eb_four").html("<div onclick='loginChk()'><p>신청하기</p></div>");
			}
		});
		
		function loginChk() {
			alert("로그인을 해주세요.");
			location.href="loginForm";
		}
		
		//메시지 띄우기
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
			location.href="classDetail_contents?c_index="+c_index;
		}
		
	//상세설명 불러와서 div안에 찍어주기
	function mainContent(c_index) {
		$.ajax({
            type:'post',
            url:'getMainContent',
            data:{
            	"c_index":c_index
            },
            dataType:"html",
            success:function(data){
                $("#ajax_div").html(data);
            },
            error:function(error){
                console.log(error);
            }
        });

		/* var pChk = $("#pChks").val();
		console.log(pChk);
		if(pChk == '0'){
			$("#eb_four").html("<div onclick=location.href='classPayment?c_index="+c_index+"'><p>신청하기</p></div>");
		}else if(pChk == '1'){
			$("#eb_four").html("<div onclick=location.href='payCancelForm?c_index="+c_index+"'><p>환불하기</p></div>");
		}else{
			$("#eb_four").remove();
			$(".heress").remove();
		} */
	}
		
		//후기 불러와서 div안에 찍어주기
		function reviewContent(c_index) {
			$.ajax({
	            type:'post',
	            url:'getReviewContent',
	            data:{
	            	"c_index":c_index
	            },
	            dataType:"html",
	            success:function(data){
	                $("#ajax_div").html(data);
	                var sessionId = "${sessionScope.mb.m_id}";
	        		var classWriteId = "${classDetail.classBean.m_id}";
	        		console.log(sessionId);
	        		console.log(classWriteId);
	        		if(sessionId == classWriteId){
	        			$("#reviewWriteBtn").css("display", "none");
	        		}
	            },
	            error:function(error){
	                console.log(error);
	            }
	        });
		}
		
		//해당 글의 댓글 불러와서 div안에 찍어주기
		function classReply(c_index, pageNum) {
			$.ajax({
	            type:'post',
	            url:'getClassReply',
	            data:{
	            	"c_index":c_index,
	            	"pageNum": pageNum
	            },
	            dataType:"html",
	            success:function(data){
	                $("#ajax_div").html(data);
	                var sessionId = "${sessionScope.mb.m_id}";
	        		var classWriteId = "${classDetail.classBean.m_id}";
	        		console.log(sessionId);
	        		console.log(classWriteId);
	        		if(sessionId == classWriteId){
	        			$("#comments").css("display", "none");
	        		}
	            },
	            error:function(error){
	                console.log(error);
	            }
	        });
		}
		
		//신청인 목록 보기(팝업창 띄우기)
		function joinListPopup(c_index) {
			
			var popupX = (window.screen.width / 2) - (945 / 2); // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

			var popupY= (window.screen.height /2) - (605 / 2); // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			
			var popUrl = "classJoinList?c_index="+c_index;	//팝업창에 출력될 페이지 URL

			var popOption = "width=945, height=605, resizable=no, scrollbars=no, status=no, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY="+ popupY+";";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);
		}
		
		//판매자에게 문의(쪽지 팝업 띄우기)
		function question(m_id) { 
			console.log(m_id);
			window.open("mailForm?m_id2="+m_id, "MailWrite", "width=530, height=630, left=100, top=50");
		}
		
		//후기 삭제
		function reviewDel(c_index, re_index) {
			if (confirm("정말 삭제하시겠습니까?")==true){
				$.ajax({
		            type:'post',
		            url:'reviewDelete',
		            data:{
		            	"c_index": c_index,
		            	"re_index": re_index
		            },
		            dataType:"html",
		            success:function(data){
		            	console.log(data);
		            	$("#ajax_div").html(data);
		            	var sessionId = "${sessionScope.mb.m_id}";
		        		var classWriteId = "${classDetail.classBean.m_id}";
		        		console.log(sessionId);
		        		console.log(classWriteId);
		        		if(sessionId == classWriteId){
		        			$("#reviewWriteBtn").css("display", "none");
		        		}
		            },
		            error:function(error){
		                console.log(error);
		                console.log("ddd");
		            }
		        });
			}else{
				return;
			}
		}
		
		//클래스 수정하기 페이지 이동
		function classUpdate(c_index) {
			location.href="classUpdate?c_index="+c_index;
		}
		
		//후기 수정하기 페이지 이동
		function reviewUpdate(c_index, re_index) {
			location.href="reviewUpdateForm?c_index="+c_index+"&re_index="+re_index;
		}
		function classDelete(c_index) {
			location.href="classDelete?c_index="+c_index;
		}
		// 비밀글 체크
		var check = 1;
		var secretChk = 0;
		
		$("#lock_g").click(function(){
			if(check == 1){
				$("#lock_g").attr("src", "resources/assets/img/vote/lock_orange.png");
				check ++;
				$("#secretChk").val(1);
			}else if(check > 1){
				$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
				check = 1;
				$("#secretChk").val(0);
			}else{
				check = 1;
				$("#secretChk").val(0);
			}
		});
		
		/* textarea 글자수 제한(1000자) */
		function checkLength(comment) {
		    if (comment.value.length > 1000 ) {
		        comment.blur();
		        comment.value = comment.value.substring(0, 1000);
		        comment.focus();
		        return false;
		    }
		}
		
		// 댓글쓰기
		function commentAjax(c_index){
			console.log("비밀글 체크 : "+$("#secretChk").val());
			var m_id = "${sessionScope.mb.m_id}";
			var sessionSort = "${sessionScope.mb.m_sort}";
			var sessionId = "${sessionScope.mb.m_id}";
			console.log("회원 구분 : "+sessionSort);
			console.log(m_id);
			if(m_id == ""){
				alert("로그인을 해주세요.");
				location.href="loginForm";
			}else{
				$.ajax({
	            	type:"post",
	            	url:"classReplyInsert",
	            	data:{
	            		c_index : c_index,
	                	m_id : m_id,
	                    cr_content : $("#commText").val(),
	                    secretChk : $("#secretChk").val()
	                },
	                dataType:"html",
	                success:function(data){
	                	$("#commText").val("");
	                	$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
	    				$("#secretChk").val(0);
	                   	$("#ajax_div").html(data);
					},error:function(error){
	                    console.log(error);
	                }
	            });
			}
		}
		
		// 댓글 삭제
		function comDelete(cr_index, c_index, pageNum){
			if (confirm("정말 삭제하시겠습니까?")==true){
				var m_id = "${sessionScope.mb.m_id}";
				var sessionSort = "${sessionScope.mb.m_sort}";
				var sessionId = "${sessionScope.mb.m_id}";
				
				$.ajax({
	                type:"post",
	                url:"classReplyDelete",
	                data:{
	                	cr_index : cr_index,
	                	c_index : c_index,
	                	pageNum: pageNum
	                },
	                dataType:"html",
	                success:function(data){
	                	console.log(data.commList);
	                	$("#commText").val("");
	                	$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
	    				$("#secretChk").val(0);
	    				$("#ajax_div").html(data);
	    			}, error:function(error){
	    				console.log("댓글 실패");
	    				alert("댓글 삭제에 실패하였습니다.");
	                }
	            });
			}else{
			   return;
			}
		}
	</script>
</html>