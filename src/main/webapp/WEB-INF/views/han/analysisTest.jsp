<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="resources/assets/js/js-load.js"></script>
		<link type="text/css" rel="stylesheet" href="resources/assets/css/js-load.css" media="screen" />
		<title>소수의 취향</title>
	</head>
	<style>	
		@import url('https://fonts.googleapis.com/css?family=Lobster');
		
		p{
			margin: 0 !important;
		}
		
		#header .links ul li{
			line-height: 1;
		}
	
		body{
			font-family: 'Nanum Square';
			font-size:18px;
		}
		
		input[type="radio"]{
			border-radius: 30px !important;
			background-color: #D8D8D8 !important;
			border: 1px solid #BDBDBD !important;
			margin-right: 1em !important;
		}
		
		#contents{
			position: relative;
			top: 50%;
			margin: 0 auto;
			transform: translateY(6%);
		}
		
		/* .eb_numbers{
			background-color: #ff9a2e;
			border-radius: 5px;
			width: 25px;
			height: 25px;
			align: center;
			color: white;
		} */
		
		/* form {
			position: absolute;
			top: 25%;
			margin: 0 auto;
		} */
		
		/* .eb_selection{
			background-color: #E6E6E6;
			border-color: #D8D8D8;
			border-radius: 7px;
			padding: 15px 10px;
			width: 40%;
		} */
		
		li .eb_selection{
			padding: 15px 20px;
		}
		
		.eb_btn{
			/* position: relative;
			top:28%;
			left:47%; */
			border-radius: 5px !important;
		}
		
		input[type="checkbox"]:checked {
		    color: #ff9a2e;
		}
		
		a.top{
			/* display: none; */
			position: fixed;
			left: 95%;
			bottom: 30px;
			width: 50px;
			height: 50px;
			border-radius: 50px;
		}
		
		a.top img{
			position: relative;
			width: 50px;
			height: 50px;
		}
		
		#eb_end{
			display: none;
			width: 65px;
			margin: 0 auto;
		}
		.eb_btn, .btn{
	        width: 67px;
		    height: 34px;
		    background-color: #ff9a2e;
		    border-radius: 7px;
		    color: white;
		    line-height: -1px;
		    font-size: 18px;
		    font-family: 'Lobster', cursive;
		    padding: 4px;
		    margin: 0 auto;
		}
		
		.eb_btn:hover, .btn:hover{
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
		    margin: 0 auto;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		
		<!-- 기본 5문항씩 표현 -->
		<form id="eb_survay_complete" action="survay" method="post">
			<!-- <div id="eb_one" align="center"> --><!-- 중심 위치 -->
			<div id="contents" align="center">
				<div id="js-load" class="main">
					<ul class="lists" style="list-style-type: none">
						<li class="lists__item js-load" align="left">
							<br/><h5>1~5. 당신에게 더 가까운 모습은?</h5><br/>
							<input type="radio" name="one" value="6"/><p>실제 경험을 할 때가 보다 즐겁다</p><br/>
							<input type="radio" name="one" value="1"/><p>미래에 대한 상상의 나래를 펼 때가 보다 즐겁다</p><br/>
						</li>
						<li class="lists__item js-load" align="left"><br/>
							<!-- <h5>2. 당신에게 더 가까운 모습은?</h5> -->
							<input type="radio" name="two" value="4"/><p>집단 활동을 더 좋아한다</p><br/>
							<input type="radio" name="two" value="2"/><p>개인의 내적 활동을 더 좋아한다</p><br/>
						</li>
						<li class="lists__item js-load" align="left"><br/>
							<!-- <h5>2. 당신에게 더 가까운 모습은?</h5> -->
								<input type="radio" name="three" value="6"/><p>그동안 만들어온 경험과 실용성이 더 중요하다</p><br/>
								<input type="radio" name="three" value="5"/><p>변화의 가능성과 비전, 창의성이 중요하다</p><br/>
						</li>
						<li class="lists__item js-load" align="left"><br/>
							<!-- <h5>2. 당신에게 더 가까운 모습은?</h5> -->
							<input type="radio" name="four" value="2"/><p>내 자신이 객관적일 때가 마음이 편하다</p><br/>
							<input type="radio" name="four" value="3"/><p>내 자신이 주관적일 때가 마음이 편하다</p><br/>
						</li>
						<li class="lists__item js-load" align="left"><br/>
							<!-- <h5>2. 당신에게 더 가까운 모습은?</h5> -->
							<input type="radio" name="five" value="1"/><p>즉흥적이기보다는 신중한 편이다</p><br/>
							<input type="radio" name="five" value="3"/><p>신중하기보다는 즉흥적인 편이다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>6. 당신에게 더 가까운 모습은?</h5>
								<input type="radio" name="six" value="4"/><p>정확한 질문, 정확한 파악을 선호한다</p><br/>
								<input type="radio" name="six" value="5"/><p>질문은 상황을 불편하게 만드는 경우가 종종 있다고 생각한다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>7. 당신은 혼자서도 여가시간을 즐겁게 보내는 편인가요?</h5>
								<input type="radio" name="seven" value="3"/><p>그렇다</p><br/>
								<input type="radio" name="seven" value="4"/><p>아니다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>8. 자유로운 시간이 생겼을 때는</h5>
								<input type="radio" name="eight" value="1"/><p>평온한 시간을 보내는 편이 더 좋다</p><br/>
								<input type="radio" name="eight" value="4"/><p>다이나믹한 시간을 보내는 편이 더 좋다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>9. 당신은 사람들과의 관계에서 어떤 편인가요?</h5>
								<input type="radio" name="nine" value="6"/><p>자발적으로 상호작용하는 편이다</p><br/>
								<input type="radio" name="nine" value="3"/><p>주로 다가와주기를 바라는 편이다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>10. 친구들과의 모임 참석 결정을 할 때는</h5>
								<input type="radio" name="ten" value="1"/><p>미리 계획성 있게 하는 게 좋다</p><br/>
								<input type="radio" name="ten" value="5"/><p>당일 상황을 봐서 결정하는 게 좋다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>11. 당신은 화가 나면</h5>
								<input type="radio" name="eleven" value="6"/><p>말이 많아진다</p><br/>
								<input type="radio" name="eleven" value="2"/><p>말이 적어진다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>12. 당신은 결정을 내리기 전에</h5>
								<input type="radio" name="twelve" value="1"/><p>양측 의견을 고려한다</p><br/>
								<input type="radio" name="twelve" value="2"/><p>상황에 대한 좋고 나쁜 느낌을 고려한다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>13. 당신은 세부 계획을</h5>
								<input type="radio" name="thirteen" value="2"/><p>한 가지씩 차근차근 계획하는 편이다</p><br/>
								<input type="radio" name="thirteen" value="5"/><p>중간에 뛰어들어 방법을 만들어 나가는 편이다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>14. 무언가를 조종하여 움직이게 하는 활동은</h5>
								<input type="radio" name="fourteen" value="3"/><p>좋다</p><br/>
								<input type="radio" name="fourteen" value="5"/><p>별로다</p><br/>
						</li>
						<li class="lists__item js-load" align="left">
							<h5>15. 새로운 아이디어를 만들어내는 활동은</h5>
								<input type="radio" name="fifteen" value="6"/><p>좋다</p><br/>
								<input type="radio" name="fifteen" value="4"/><p>별로다</p><br/>
						</li>
					</ul>
					<!-- javascript:; - 최상단으로 이동하는 # 대신 버튼 기능만 이용하기 위해서 -->
					<div id="js-btn-wrap" class="btn-wrap">
					<div class="eb_btn btn btn-sm btn-warning" id="eb_my"><p>More</p></div>
					<div id="eb_end" class="btn btn-sm btn-warning"><p>Finish</p></div>
					<br/><br/><br/><br/>
					</div>
				</div>
			</div>
		</form>
		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>	
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
		
		// 취미 분석 데이터 전달
		$("#eb_end").click(function(){
			var checkList = new Array();
			var check = $("input[type='radio']");
			console.log(check);
			for(var i=0;i<check.length;i++){
				if(check[i].checked == true){
					console.log(check[i].value);
					checkList.push(check[i].value);
				}
			}
			if(checkList.length != 15){
				alert("체크되지 않은 항목이 있습니다. 다시 체크해주세요.");
			}else{
				location.href="./survay?checkList="+checkList;
			}
		});
	</script>
</html>