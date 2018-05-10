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
	
		#eb_blank{
			width: 20px;
			height: 70px;
			display: hidden;
		}
		
		#second_subject{
			width: 400px;
			height: auto;
			position: relative;
			left: 34%;
			top: 12%;
		}
		
		#eb_separate{
			width: 90%;
			height: 1px;
			background-color: lightgray;
		}
		
		.eb_suggest{
			position: relative;
			left: 8%;
			/* top: 12%; */
			float: left;
			text-align: center;
		}
		
		.alls{
			position: relative;
			overflow: hidden;
			height: 310px;
			width: 310px;
			border-radius: 500px;
			margin: 20px;
			/* align: center; */
		}
		
		/* .books_img{
			display: block;
			min-width: 100%;
			min-height: 100%;
		} */
		
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
		
		#eb_re{
			position: relative;
    		margin: 0px 0 80px 0;
    		left: -38.5%;
    		width: 80px;
			border-radius: 7px;
			line-height: 2px;
    		font-size: 12px;
    		color: #6E6E6E;
		}
		
		#eb_re:hover{
			color: #ff9a2e;
			border-color: #ff9a2e;
		}
		
		.alls img{
		    width: 100%;
    		height: 100%;
    		cursor: pointer;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>취미 분석 서비스</h1>
			<p>회원님의 취향을 분석한 결과입니다.</p>
		</div>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<!-- 추천 서비스 설명 -->
		<div class="eb_suggest_explane" align="center">
		
		<c:if test="${cList != null}">
			<!-- 첫번째가 도서일때 -->
			<c:if test="${key == 'bookList'}">
				<h6>회원님의 타입은 '열정적인 중재자'입니다.</h6>
            	<p>이 유형의 사람들은 최악의 상황에서도 긍정적이며, 더 나은 상황을 만들고자 노력하는 진정한 이상주의자입니다.<br/>
            	간혹 침착하고 내성적인 사람처럼 비쳐지기도 하지만, 그 안에는 불만 지피면 활활 타오를 수 있는 열정의 불꽃이 숨어있습니다.<br/>
            	인구의 대략 4%를 차지하는 이들은 간혹 사람들의 오해를 사기도 하지만, 일단 마음이 맞는 사람을 만나면 충만한 즐거움과<br/>
            	넘치는 영감을 경험할 수 있을 것입니다.<br/><br/>
				<br/>
				<b>#ABOUT YOUR HOBBY</b><br/>
				회원님은 개인적인 열정을 지니며, 예술적인 활동을 즐기는 경향이 있고 언어에 대한 애정으로 시나 책을 수집할 지도 모릅니다. <br/>
				친밀하고 비공식적인 만남을 좋아하고, 의례적인 큰 모임은 싫어합니다.<br/>
				따라서 회원님에게는 자연 또는 독립 출판물이나 잡지를 감상하는 취미를 추천해 드립니다.<br/>
           	</c:if>
           	
           	<!-- 첫번째가 영화일때 -->
			<c:if test="${key == 'movieList'}">	
				<h6>회원님의 타입은 '용의주도한 전략가'입니다.</h6>
            	<p>이 유형의 사람들은 체스를 두는 듯한 정확하고 계산된 움직임과 풍부한 지식을 소유하고 있습니다.<br/>
            	상상력이 풍부하면서도 결단력이 있으며, 야망이 있지만 대외적으로 표현하지 않으며, 놀랄 만큼 호기심이 많지만 쓸데없는 곳에<br/>
            	에너지를 낭비하는 법이 없습니다. 본인 자신에 대한 확신에 찬 자신감과, 함부로 범접할 수 없는 신비로운 아우라를 발산하는 이들은<br/>
            	통찰력과 관찰력, 기발한 아이디어, 그리고 뛰어난 논리력에 강한 의지와 인격이 합쳐져 변화를 이끄는 데 앞장섭니다.<br/><br/>
				<br/>
				<b>#ABOUT YOUR HOBBY</b><br/>
				회원님은 여가 활동의 성과에 대해 비판적인 경향이 있을지도 모릅니다. 여가 활동보다는 전문적 지식이 더 중요하기 때문입니다.<br/>
				여가선택에서 심각하고 목적적이어서 박물관을 찾아가거나, 마라톤을 하거나, 새로운 주제를 공부하는 것에서 만족을 찾을 것입니다. <br/>
				따라서 회원님에게는 미로 같은 곳에 숨어 있는 영화관이나, 비판적인 자세로 독립 영화를 감상하는 등의 취미를 추천해 드립니다.<br/>
           	</c:if>
           	
           	<!-- 첫번째가 음악일때 -->
			<c:if test="${key == 'musicList'}">
				<h6>회원님의 타입은 '선의의 옹호자'입니다.</h6>
            	<p>이 유형의 사람들은 모든 외교형 성향의 사람이 그렇듯, 이상향이나 도덕적 관념이 깊게 내재되어 있습니다.<br/>
            	바라는 이상향을 꿈꾸는데 절대 게으름 피우는 법이 없으며, 구체적으로 계획을 세워 이행해 나갑니다.<br/>
            	종종 구조 작업이나 자선 활동을 하는 곳에서도 볼 수 있는 이들은 다른 사람들을 돕는 것을 인생의 목적으로 여깁니다.<br/><br/>
            	<br/>
				<b>#ABOUT YOUR HOBBY</b><br/>
				회원님이 가진 독창성은 독서나 음악(연주, 작곡, 감상)과 같은 사려 깊고 개인적인 취미 활동을 통해 짙게 나타날 것입니다.<br/>
				또한 조용하면서 따뜻한 회원님의 특성에는 작고 친밀한 모임이 적당할 것입니다.<br/>
				예술적이고 문화적인 이벤트 감상, 또는 미적인 물건들을 수집하는 등의 취미를 추천해 드립니다.<br/>
           	</c:if>
           	
           	<!-- 첫번째가 공예일때 -->
			<c:if test="${key == 'craftList'}">
				<h6>회원님의 타입은 '사교적인 외교관'입니다.</h6>
            	<p>이 유형의 사람들을 한 마디로 말하자면, '인기쟁이'라 할 수 있겠습니다. 다양한 사교 모임을 통해 사람들에게 끊임없는 관심과<br/>
            	지지를 보내어 주위 사람들을 행복하고 즐겁게 해주고자 노력합니다. 천성적으로 사교적인 성향인 이들은 마음이 온화하고 이야기하기를<br/>
            	좋아해서 위원회나 기타 단체 등에서 인기가 있고 활동적인 경향이 있습니다.<br/><br/>
				<br/>
				<b>#ABOUT YOUR HOBBY</b><br/>
				회원님은 종종 타인에게 동정심이 있는 사람으로 비쳐지고, 사교적인 스포츠를 즐기는 경향이 있습니다.<br/>
				합창, 배구 놀이, 요리수업, 파티, 교회 활동 등이 회원님께 좋은 취미 활동이 될 것입니다.<br/>
           	</c:if>
           	
           	<!-- 첫번째가 사진일때 -->
			<c:if test="${key == 'photoList'}">
				<h6>회원님의 타입은 '논쟁을 즐기는 변론가'입니다.</h6>
            	<p>이 유형의 사람들은 지나치리만치 솔직하지만, 딱히 관심 있는 사안이 아님에도 불구하고 타인의 입장에서 진실 규명을 위해<br/>
            	힘든 줄 모르고 논쟁을 벌일 줄 압니다. 논쟁을 벌이는 주체이자 선의의 비판자로서 이들은 타인의 이성적인 논리를 보다 잘 이해하고<br/>
            	있을 뿐 아니라, 상대편의 관점의 차이도 정확히 꿰뚫어 봅니다.<br/><br/>
				<br/>
				<b>#ABOUT YOUR HOBBY</b><br/>
				회원님은 관습에 얽매이지 않는 환경에서 재미있는 사람들 주위에 있고 싶어 합니다. 참신함에 대한 욕망으로 독특한 이벤트에 마음이 끌리고,<br/>
				모험에 대한 애정으로 여행과 모험적 활동을 즐깁니다. 여가활동에 관해 태평스러우며, 종종 계획하지 않는 것을 더 좋아합니다.<br/>
				회원님께는 이국적인 장소로의 여행, 새로운 탐색, 색다른 문화 행사에 참여하여 다채로운 사진을 찍는 취미를 추천해 드립니다.<br/><br/>
           	</c:if>
           	
           	<!-- 첫번째가 운동일때 -->
			<c:if test="${key == 'exerciseList'}">
				<h6>회원님의 타입은 '만능 재주꾼'입니다.</h6>
            	<p>냉철한 이성주의적 성향과 왕성한 호기심을 가진 이 유형의 사람들은 직접 손으로 만지고 눈으로 보면서 탐색하는 것을 좋아합니다.<br/>
            	종종 기술자나 엔지니어이기도 한 이들에게 있어 손발을 걷어붙이고 작업에 뛰어들어 직접 분해하고 조립할 때보다 세상에 즐거운 일이<br/>
            	또 없을 것입니다. 매번 전보다 조금씩 향상되는 모습으로 말이죠.<br/>
            	<br/>
            	<b>#ABOUT YOUR HOBBY</b><br/>
				회원님의 여가 활동은 초연한 호기심으로 특징지어지며, 동굴 탐험이나 스카이 다이빙 같은 모험적인 활동을 선택하는 경향이 있습니다.<br/>
				기계를 조작하는 것을 좋아하며, 주의나 계획의 가시적인 노력을 기울이지 않고도 놀이 활동으로 쉽게 옮겨가는 경향이 있습니다.<br/>
				그 예는 양궁, 아마추어 1인 희극 또는 무대 마술, 스쿠버 다이빙 또는 레펠 등이 있습니다.<br/>
           	</c:if>

			<!-- 여백 -->
			<div id="eb_blank"></div>

			<!-- 구분선 -->
			<div id="eb_separate"></div>
			<br />
			<br />

			<h5>회원님에게 적합한 취미 클래스</h5>
			<br />
			
		<!-- 추천 결과 -->
			<!-- 도서 리스트 시작 -->
			<c:if test="${cList.bookList != null}">
				<c:forEach items="${cList.bookList}" var="bList" begin="0" end="2" step="1">
					<div class="eb_suggest">
						<div class="alls">
							<img src="${path}${bList.c_mainImg}" onclick="location.href='classDetail_contents?c_index=${bList.c_index}'"/>
							<!-- 나중에 취미 파일 업로드에서 가져올 것 -->
						</div>
						<br />
						<h6>도서 | ${bList.c_subject}</h6>
						<p>
							<c:if test="${bList.c_status == 0}">심사중</c:if>
							<!-- 나중에 삭제 -->
							<c:if test="${bList.c_status == 1}">준비중</c:if>
							<c:if test="${bList.c_status == 2}">모집중</c:if>
							<c:if test="${bList.c_status == 3}">모집 마감</c:if>
							<c:if test="${bList.c_status == 4}">완료</c:if>
						</p>
					</div>
				</c:forEach>
			</c:if>
			
			<!-- 도서 리스트 끝 -->
			
			<!-- 운동 리스트 시작 -->
			<c:if test="${cList.exerciseList != null}">
				<c:forEach items="${cList.exerciseList}" var="eList" begin="0" end="2" step="1">
					<div class="eb_suggest">
						<div class="alls">
							<img src="${path}${eList.c_mainImg}" onclick="location.href='classDetail_contents?c_index=${eList.c_index}'"/>
							<!-- 나중에 취미 파일 업로드에서 가져올 것 -->
						</div>
						<br />
						<h6>운동 | ${eList.c_subject}</h6>
						<p>
							<c:if test="${eList.c_status == 1}">준비중</c:if>
							<c:if test="${eList.c_status == 2}">모집중</c:if>
							<c:if test="${eList.c_status == 3}">모집 마감</c:if>
							<c:if test="${eList.c_status == 4}">완료</c:if>
						</p>
					</div>
				</c:forEach>
			</c:if>
			<!-- 여백 -->
			<div id="eb_blank"></div>
			<!-- 운동 리스트 끝 -->
			
			<!-- 사진 리스트 시작 -->
			<c:if test="${cList.photoList != null}">
				<c:forEach items="${cList.photoList}" var="pList" begin="0" end="2" step="1">
					<div class="eb_suggest">
						<div class="alls">
							<img src="${path}${pList.c_mainImg}" onclick="location.href='classDetail_contents?c_index=${pList.c_index}'"/>
							<!-- 나중에 취미 파일 업로드에서 가져올 것 -->
						</div>
						<br />
						<h6>운동 | ${pList.c_subject}</h6>
						<p>
							<c:if test="${pList.c_status == 0}">심사중</c:if>
							<!-- 나중에 삭제 -->
							<c:if test="${pList.c_status == 1}">준비중</c:if>
							<c:if test="${pList.c_status == 2}">모집중</c:if>
							<c:if test="${pList.c_status == 3}">모집 마감</c:if>
							<c:if test="${pList.c_status == 4}">완료</c:if>
						</p>
					</div>
				</c:forEach>
				<!-- 여백 -->
				<div id="eb_blank"></div>
			</c:if>
			<!-- 사진 리스트 끝 -->
			
			<!-- 음악 리스트 시작 -->
			<c:if test="${cList.musicList != null}">
				<c:forEach items="${cList.musicList}" var="mList" begin="0" end="2" step="1">
					<div class="eb_suggest">
						<div class="alls">
							<img src="${path}${mList.c_mainImg}" onclick="location.href='classDetail_contents?c_index=${mList.c_index}'"/>
							<!-- 나중에 취미 파일 업로드에서 가져올 것 -->
						</div>
						<br />
						<h6>음악 | ${mList.c_subject}</h6>
						<p>
							<c:if test="${mList.c_status == 0}">심사중</c:if>
							<!-- 나중에 삭제 -->
							<c:if test="${mList.c_status == 1}">준비중</c:if>
							<c:if test="${mList.c_status == 2}">모집중</c:if>
							<c:if test="${mList.c_status == 3}">모집 마감</c:if>
							<c:if test="${mList.c_status == 4}">완료</c:if>
						</p>
					</div>
				</c:forEach>
				<!-- 여백 -->
				<div id="eb_blank"></div>
			</c:if>
			<!-- 음악 리스트 끝 -->
			
			<!-- 영화 리스트 시작 -->
			<c:if test="${cList.movieList != null}">
				<c:forEach items="${cList.movieList}" var="mvList" begin="0" end="2" step="1">
					<div class="eb_suggest">
						<div class="alls">
							<img src="${path}${mvList.c_mainImg}" onclick="location.href='classDetail_contents?c_index=${mvList.c_index}'"/>
							<!-- 나중에 취미 파일 업로드에서 가져올 것 -->
						</div>
						<br />
						<h6>영화 | ${mvList.c_subject}</h6>
						<p>
							<c:if test="${mvList.c_status == 0}">심사중</c:if>
							<!-- 나중에 삭제 -->
							<c:if test="${mvList.c_status == 1}">준비중</c:if>
							<c:if test="${mvList.c_status == 2}">모집중</c:if>
							<c:if test="${mvList.c_status == 3}">모집 마감</c:if>
							<c:if test="${mvList.c_status == 4}">완료</c:if>
						</p>
					</div>
				</c:forEach>
				<!-- 여백 -->
				<div id="eb_blank"></div>
			</c:if>
			<!-- 영화 리스트 끝 -->
			
			<!-- 공예 리스트 시작 -->
			<c:if test="${cList.craftList != null}">
				<c:forEach items="${cList.craftList}" var="cfList" begin="0" end="2" step="1">
					<div class="eb_suggest">
						<div class="alls">
							<img src="${path}${cfList.c_mainImg}" onclick="location.href='classDetail_contents?c_index=${cfList.c_index}'"/>
							<!-- 나중에 취미 파일 업로드에서 가져올 것 -->
						</div>
						<br />
						<h6>공예 | ${cfList.c_subject}</h6>
						<p>
							<c:if test="${cfList.c_status == 0}">심사중</c:if>
							<!-- 나중에 삭제 -->
							<c:if test="${cfList.c_status == 1}">준비중</c:if>
							<c:if test="${cfList.c_status == 2}">모집중</c:if>
							<c:if test="${cfList.c_status == 3}">모집 마감</c:if>
							<c:if test="${cfList.c_status == 4}">완료</c:if>
						</p>
					</div>
				</c:forEach>
				<!-- 여백 -->
				<div id="eb_blank"></div>
			</c:if>
			<!-- 공예 리스트 끝 -->
		</c:if>
	</div>
	<br/>
	<input id="eb_re" type="button" onclick="location.href='has_index'" value="재검사"/>
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
		
		//추천 개수에 따른 버튼 위치 조정
		if($(".eb_suggest").length == 3){
			$("#eb_re").css("top", "420px");
		}else if($(".eb_suggest").length == 6){
			$("#eb_re").css("top", "820px");
		}else if($(".eb_suggest").length == 9){
			$("#eb_re").css("top", "1250px");
		}
	</script>
</html>