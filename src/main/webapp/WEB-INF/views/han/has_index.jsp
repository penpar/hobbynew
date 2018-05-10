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
		@import url('https://fonts.googleapis.com/css?family=Lobster');
		
		body{
			font-family: 'Nanum Square';
			font-size:18px;
		}
		
		#header .links ul li{
			line-height: 1;
		}
		
		.eb_explane{
			padding: 100px;
			border: 1px solid lightgray;
		}
		
		#eb_title{
			width: 400px;
			height: auto;
			position: relative;
			left: 34%;
			top: 12%;
		}
		
		#eb_blank{
			width: 20px;
			height: 70px;
			display: hidden;
		}
		
		#eb_separate{
			width: 90%;
			height: 1px;
			background-color: lightgray;
		}
		
		.orange_btn p{
	        width: 67px;
		    height: 34px;
		    background-color: #ff9a2e;
		    border-radius: 7px;
		    color: white;
		    line-height: -1px;
		    font-size: 18px;
		    font-family: 'Lobster', cursive;
		    padding: 4px;
		}
		
		.orange_btn p:hover{
		    width: 67px;
		    height: 34px;
		    background-color: white;
		    border-radius: 7px;
		    color: #ff9a2e;
		    line-height: -1px;
		    font-size: 18px;
		    font-family: 'Lobster', cursive;
		    border: 1px solid #ff9a2e;
		    padding: 4px;
		    cursor: pointer;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<div id = "eb_title" align="center">
			<h1>취미 분석 서비스</h1>
			<p>회원님의 취향을 분석해 알맞은 클래스를 추천해드립니다.</p>
		</div><br/><br/><br/>
	
		<!-- 설명 -->
		<div id="eb_explane" align="center">
			<p>
				바야흐로 '취미 권하는 시대'입니다.<br/>
				삶의 만족을 위해 사람들은 취미를 내세운 작은 사치와 투자를 아끼지 않습니다.<br/>
				당장 클릭 몇 번이면 경험할 수 있는 취미 서비스가 속속 등장하면서,<br/>
				취미가 하나의 산업으로까지 떠오르고 있습니다.<br/>
				<br/>
				제대로 된 취미 하나쯤은 필수로 갖춰야 할 시대!<br/>
				하지만 뭘 해야 좋을지, 내게 어떤 취미가 적당할지 모르겠다면?<br/>
				'소수의 취향'에서 제공하는 취미 분석 서비스를 이용해 한 번 찾아보는 게 어떨까요?<br/>
			</p><br/>
			<!-- 구분선 -->
			<div id="eb_separate"></div>
			<br/><br/>
			<h6>해당 검사는 감각적 인식형(SP), 감각적 판단형(SJ), 직관적 사고형(NT), 직관적 감정형(NF)의<br/>
				4가지 성격 유형을 바탕으로 8가지의 성격 유형을 조합, 분류하여 이루어지며<br/>
				한국 심리 검사 연구소의 성격 유형과 삶의 양식, Work, Play and Type,<br/>
				Judith A.Provost의 도움으로 만들어졌습니다.
			</h6><br/><br/>
			<div class="orange_btn"><p>Start!</p></div>
		</div>
	</body>
	<script>
		$(".orange_btn").click(function(){
			location.href="analysisTest";
		});
	</script>
</html>