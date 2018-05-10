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
		
		#second_subject{
			width: 400px;
			height: auto;
			position: relative;
			left: 34%;
			top: 12%;
		}
		
   		.menu h5{
   			cursor:pointer;
   			margin: 0;
   		}
   		
   		.menu{
    		display:block;
    	}
   		
    	.menu .hide{
    		display:none;
    		background-color: white;
    		padding: 15px 0px 15px 20px;
    		margin: 0;
    		border-bottom: 1px solid #D8D8D8;
    	}
    	
    	#clickDown{
   		    position: relative;
    		margin: 0 auto;
    		width: 80%;
    		text-align: left;
    		padding: 10px;
		}
		
		.menu h5{
			background-color: #E6E6E6;
			padding: 20px;
			border-bottom: 1px solid #D8D8D8;
		}
		
		.menu img{
			float: right;
			width: 20px;
			height: 20px;
			margin: 5px;
		}
		
		#eb_personal{
    		margin: 0px 0 80px 0;
    		width: 80px;
			border-radius: 7px;
			line-height: 2px;
    		font-size: 13px;
    		color: #6E6E6E;
		}
		
		#eb_personal:hover{
			color: #ff9a2e;
			border-color: #ff9a2e;
		}
		
		#personal_position{
			left : 50%;
			transform : translateX(36%);
		}
		
		#personal_position h6{
			display: inline;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>고객 센터</h1>
			<p>자주 묻는 질문</p>
		</div>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<div id="clickDown">
		    <ul style="list-style-type: none;">
		        <li class="menu">
		        	<h5>Q. '소수의 취향'은 어떤 서비스인가요? <img src="resources/assets/img/reference/select.png"/></h5>
		            <ul class="hide" style="list-style-type: none;"><br/>
		                <li><p>A. 저희 사이트는 회원 개개인의 특성을 파악하여 적합한 취미를 제공하는 서비스입니다.<br/>
						남들 다 하는, 그저 그런 흔한 취미에 질리셨다면 '소수의 취향'을 통해 새롭고 신선한 취미 추천 서비스를 받아 보세요!</p>
						</li>
		            </ul>
		        </li>
		 		<li class="menu">
		 			<h5>Q. 포인트는 어떻게 사용하나요? <img src="resources/assets/img/reference/select.png"/></h5>
		            <ul class="hide" style="list-style-type: none;"><br/>
		                <li><p>A. 신규 가입이나 취미 클래스 신청 시에 제공되는 포인트는, 다음 번 신청 시부터 사용 가능 합니다.<br/>
						포인트로 신청하고자 하는 클래스의 가격이 부담 되신다면, 포인트를 차감하여 일정 금액을 할인 받으실 수 있습니다.<br/>
						단, 포인트는 회원 등급에 따라 차등 적용됨을 잊지 말아주세요!<br/>
						* 적용 할인율은 신청 및 결제 시 확인하실 수 있습니다.</p>
						</li>
		            </ul>
		        </li>
		        <li class="menu">
		        	<h5>Q. 이미 신청한 취미 클래스를 취소할 수 있나요? <img src="resources/assets/img/reference/select.png"/></h5>
		            <ul class="hide" style="list-style-type: none;"><br/>
		                <li><p>A. 정당한 사유가 있을 시 가능합니다. 마이페이지의 결제 취소 창을 이용해주세요!<br/>
						만일 클래스 시작일보다 시일이 경과한 경우에는 해당 글을 작성한 취미 아티스트와 상의하셔야 합니다.<br/>
						* 취소 전, 취미 클래스 하단의 '환불 정책'을 꼭 확인 바랍니다.</p>
						</li>
		            </ul>
		        </li>
		        
		         <li class="menu">
		         	<h5>Q. '관심 클래스'가 뭔지 궁금해요. <img src="resources/assets/img/reference/select.png"/></h5>
		            <ul class="hide" style="list-style-type: none;"><br/>
		                <li><p>A. 관심 있는 클래스의 '♡'를 클릭해, 한 눈에 모아볼 수 있게 저장해둘 수 있는 공간입니다.<br/>
		                  다시 보고 싶은 취미는 '♡'를 눌러 나만의 취미 콜렉션을 만들어 보세요!<br/>
		                  참, 이 중 모집 마감이 임박한 취미 클래스들은 쪽지함으로 알림을 보내드린답니다.</p>
						</li>
		            </ul>
		        </li>
		    </ul>
	    </div>
	    <div id="personal_position">
		    <h6>원하는 질문이 없으신가요?</h6>&nbsp;&nbsp;
		    <input id="eb_personal" type="button" onclick="question()" value="1:1 문의"/>
	    </div>
	</body>
	<script>
		// 1:1 문의 이동
		function question(){
			var ebSession = "${sessionScope.mb.m_id}";
			if(ebSession == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="loginForm";
			}else{
				location.href="question";
			}
		}
		
		// slide Down
		$(document).ready(function(){
		    $(".menu>h5").click(function(){
		    	// a 클릭 시 subMenu 다음 ul 가져오기
		        var submenu = $(this).next("ul");
		
		        // submenu 가 화면상에 보일때는 위로 접고, 아니면 아래로 펼치기
		        if(submenu.is(":visible")){
		        	submenu.slideUp();
		        }else{
		        	submenu.slideDown();
		        }
		    });
		});
	</script>
</html>