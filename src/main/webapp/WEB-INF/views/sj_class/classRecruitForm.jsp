<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/js/jquery-3.2.1.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<title>소수의 취향</title>
		<style>
			body{
				font-family: 'Nanum Square';
			}
			
			.eb_btn{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 70px;
				border-radius: 7px;
			    /* line-height: 3px; */
			    padding: 0px 0px 45px 0px;
			}
		
			.eb_btn:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				padding: 0px 0px 45px 0px;
				width: 70px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    /* line-height: 3px; */
			}
			
			.eb_btn2{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 130px;
				border-radius: 7px;
			    /* line-height: 3px; */
			    padding: 0px 0px 45px 0px;
			}
			
			.eb_btn2:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				padding: 0px 0px 45px 0px;
				width: 130px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    /* line-height: 3px; */
			}
			
			.startDay, .endDay{
				width: 15%;
				display: inline;
				font-size: 12;
				align: center;
				padding: 0 0 0 6px;
			}
			
			.classWriteDiv{
				position: relative;
				width: 60%;
				height: auto;
				margin: 0 auto;
			}
			
			/* #classWriteDiv #classWriteTB input[type='text'], #classWriteDiv #classWriteTB textarea{
				border: none;
			} */
			
			#eb_blank{
				width: 20px;
				height: 70px;
				display: hidden;
			}
			
			#second_subject{
				width: 400px;
				height: auto;
				position: relative;
				left: 40%;
				top: 12%;
			}
			
			#eb_separate{
				position: relative;
				width: 60%;
				height: 1px;
				left: 20%;
				background-color: lightgray;
			}
			
			#voteResultUrl{
				width: 92%;
				float: left;
				margin: 10px 0px;
			}
			
			#question_Icon{
				width: 27px;
				margin: 15px 0px 0px 15px;
			}
			
			#datailArea{
				position: relative;
				display: none;
				float: left;
			    margin: 20px 5px 12px 0px;
			}
			
			#datailArea p{
		        position: absolute;
			    /* top: 50%; */
			    margin: -15px;
			    left: 9%;
			}
			
			#detailImg{
			    margin: -33px 0px 0 0;
			    height: 168px;
			    position: absolute;
			}
			
			#c_detailAddress{
				width: 75%;
				margin: 5px 0 0 0;
				float: left;
			}
			
			#c_addSearchBtn{
				height: 3em;
				margin: 8px 11px 0px 0px;
				float: right;
				padding: 1px 6px;
			}
			
			.eb_btn3{
				width: 80px;
				border-radius: 7px;
				font-size: 12px;
				line-height: 3px !important;
			}
			
			.eb_btn3:hover{
				width: 80px;
				border-radius: 7px;
				font-size: 12px;
				line-height: 3px !important;
			}
			
			#buttons_location{
				position: relative;
				transform: translateX(-3%);
			}
			
			#buttons_location input[type="submit"], #buttons_location input[type="button"]{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 80px;
				border-radius: 7px;
				font-size: 12px;
			}
		
			#buttons_location input[type="submit"], #buttons_location input[type="button"]:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 80px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			}
			
			input[type='number']{
				padding: 0px 0px 0px 5px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<div id = "second_subject" align="center">
			<h1>클래스 모집글 작성</h1>
			<!-- <p>카테고리의 설명글</p> -->
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<form id="cwFrom" action="classWrite" method="post" enctype="multipart/form-data">
		<div id="area1" class="classWriteDiv" align="center">
			<table>
				<tr>
					<td colspan="2">
						<select name="cn_index">
							<option value="0">-- 분류 --</option>
							<c:forEach items="${ClassNameList}" var="cnList">
							<option value="${cnList.cn_index}">${cnList.cn_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="c_subject" placeholder="제목">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="c_simpleContent"placeholder="간단한 설명">
					</td>
				</tr>
				<tr>
					<td style="text-align: center; vertical-align: middle;">주소</td>
					<td>
						<input type="text" id="c_addr" name="c_addr" placeholder="주소" readonly>
						<input type="text" id="c_detailAddress" name="c_detailAddress" placeholder="상세주소">
						<input type="button" id="c_addSearchBtn" class="eb_btn3" onclick="postcodeFind()" value="주소 찾기">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						대표 이미지
					</td>
					<td>
						<input type="file" name="c_mainImg" accept="image/*" onchange="chk_file_type(this)" data-width="300" data-height="300" id="represent">
						<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
						* 대표 이미지는 정방형(정사각형) 이미지만 첨부 가능합니다.
						</p>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						최소 모집 인원&ensp;&ensp;&ensp;
						<input type="number" name="c_minPerson" min="1" max="1000" value="0">
						&ensp;&ensp;&ensp;최대 모집 인원&ensp;&ensp;&ensp;
						<input type="number" name="c_maxPerson" min="1" max="1000" value="0">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">모집기간</td>
				</tr>
				<tr>
					<td colspan="2">
						<select class="startDay" name="cs_year">
							<option value="0">-연도-</option>
							<c:forEach var="i" begin="0" end="${2019-2018}">
							<option value="${2018+i}">${2018+i}</option>
							</c:forEach>
						</select>
						<!-- 년 -->
						<select class="startDay" name="cs_month">
							<option value="0">- 월 -</option>
							<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
							</c:forEach>
						</select>
						<select class="startDay" name="cs_day">
							<option value="0">- 일 -</option>
							<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}</option>
							</c:forEach>
						</select>
						<!-- 일 -->
						&nbsp;∼&nbsp;
						<select class="endDay" name="ce_year">
							<option value="0">-연도-</option>
							<c:forEach var="i" begin="0" end="${2019-2018}">
							<option value="${2018+i}">${2018+i}</option>
							</c:forEach>
						</select>
						<select class="endDay" name="ce_month">
							<option value="0">- 월 -</option>
							<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
							</c:forEach>
						</select>
						<select class="endDay" name="ce_day">
							<option value="0">- 일 -</option>
							<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="c_price" maxlength="7" placeholder="가격" onkeydown="fn_press_han(this);"
						onkeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
						onkeypress="return fn_press(event, 'numbers');" style="IME-MODE:disabled;"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="color: gray;">
						* 상세 설명은 직접 글을 쓰거나 파일 첨부를 통해 하실 수 있습니다.
						<br/>
						&nbsp;&nbsp;&nbsp;직접 쓴 글의 경우 이미지 아래에 위치하게 됩니다.
						<br/><br/>
						<textarea id="detailExplain" rows="5" cols="30" name="c_content" style="resize: none;" placeholder="상세 설명"></textarea>
						<br/>
						<input type="file" name="c_explainImg" multiple="multiple" accept="image/*" onchange="chk_file_type(this)">
						<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="c_refundExplain" rows="5" cols="30" name="c_refund" style="resize: none;" placeholder="환불 정책"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<br/>
		<div id="eb_separate"></div>
		<br/>
		<br/>
		<div id="area2" class="classWriteDiv" align="center">
			<table>
				<tr>
					<td colspan="2" style="color: gray;">
						* 아래 항목부터는 클래스 심사를 위한 것이므로<br/>
						&nbsp;&nbsp;&nbsp;실제 클래스 모집글에 노출되지 않습니다.<br/>
						<input type="text" id="voteResultUrl" name="ch_voteUrl" placeholder="투표 결과 URL">
						<img src="resources/sj/quest.png" id="question_Icon" onclick="datailArea()">
						<input type="button" id="getVoteList" class="eb_btn2" onclick="myVoteList('${sessionScope.mb.m_id}')" value="내 투표 확인하기">
						<br/>
						<p id="datailArea">투표 결과는 일반 회원이 취미 아티스트의 권한을 일회성으로 부여받기 위해, 투표<br/>
							게시판을 이용하여 가수요 조사를 한 결과를 말합니다. 취미 아티스트가 아닌 경우,<br/>
							해당 투표가 있는 투표 게시판의 글 URL을 복사해 붙여넣어 주시기 바랍니다.
						</p>
					</td>
				</tr>
				<tr>
					<td>
						기획서
					</td>
					<td>
						<input type="file" name="c_planDocument">
					</td>
				</tr>
				<tr>
					<td>
						경력사항 및 자격증
					</td>
					<td>
						<input type="file" name="c_career">
					</td>
				</tr>
				<tr>
					<td>
						모임장소 사진
					</td>
					<td>
						<input type="file" name="c_placeImg" accept="image/*" onchange="chk_file_type(this)">
						<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.</p>
					</td>
				</tr>
			</table>
			<div id="buttons_location">
				<input type="button" class="eb_btn" onclick="classWrite()" value="확인">
				<input type="button" class="eb_btn" onclick="location.href='hobbyClass'" value="취소">
			</div>
			<br/><br/>
		</div>
		</form>
	</body>
	<script>
		// 정사각형 대표 이미지만 받기
		$(document).on('change', '#represent', function(){
			var $width = $(this).attr('data-width');
			var $height = $(this).attr('data-height');
			var $target = $(this);

 			if(window.FileReader){ //FileReader를 지원하는 브라우저의 경우 IE 10이상, 크롬..
				var reader = new FileReader();
       			reader.onload = function (e) {
           		$('body').append('<img src="" id="temp_img" style="display:none;" />'); //보이지 않는 임시 img 태그를 생성.
          		$img = $('#temp_img').attr('src', e.target.result); //파일을 선택했을 경우 정보를 $img 객체에 저장

           		if($img.width() != $img.height()){ //가로 세로 사이즈 비교 후 반환
	                alert('대표 이미지의 경우 정방형만 업로드 가능합니다.');
	                $target.val('');
	
	                $('#temp_img').remove(); //위에서 생성한 임시 img 태그 삭제
	                return;
	            }
	      	};
     		reader.readAsDataURL($(this)[0].files[0]); //파일을 img 태그에 보여줄 수 있도록 base64로 url을 생성합니다.
		} /* else { //FileReader를 지원하지 않는 브라우저의 경우 IE 9 이하
			$(this)[0].select();
			var src = document.selection.createRange().text;
			$('body').append('<img src="" id="temp_img" style="display:none;" />');
			$img = $('#temp_img').attr('src', src);
			$('#temp_img').remove();

   			if($img.width() != $width || $img.height() != $height){
        		alert('지정된 크기와 맞지 않습니다.('+$width + 'x'+ $height +')');
	        	$(this).val('');
	        	return;
    		}
 		}
		$('#temp_img').remove(); */
	});
	
		// 정규식
		/* 숫자만 입력받기 */
	    function fn_press(event, type) {
	        if(type == "numbers") {
	        	if(event.keyCode < 48 || event.keyCode > 57) return false;
	            //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
	        }
	    }
		
	    /* 한글입력 방지 */
	    function fn_press_han(obj)
	    {
	        //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
	        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
	        || event.keyCode == 46 ) return;
	        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	        obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	    }
	
		//주소 검색
		function postcodeFind() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var fullAddr = '';
	                var extraAddr = '';
	
	                if (data.userSelectedType === 'R') {
	                    fullAddr = data.roadAddress;
	
	                } else {
	                    fullAddr = data.jibunAddress;
	                }
	
	                if(data.userSelectedType === 'R'){
	
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	
	                document.getElementById('c_addr').value = fullAddr;
	                document.getElementById('c_detailAddress').focus();
	            }
	        }).open();
	    }//주소 검색 End
		
	    /* //물음표 hover
		function questionDetail(evt) {
			if(evt == "in"){ // evt가 in 일 경우 아래의 내용을 실행
                console.log('마우스 오버 이벤트');
				$("#datailArea").css("display", "block");
            }else{ // evt가 in이 아닐 경우 아래의 내용을 실행
                console.log('마우스 아웃 이벤트');
                $("#datailArea").css("display", "none");
            }
		} */
		
		// 물음표 click
		var click = 0;
		function datailArea(){
			if(click == 0){
				$("#datailArea").css("display","block");
				click ++;
			}else if(click > 0){
				$("#datailArea").css("display","none");
				click = 0;
			}
		}
		
		//신청인 목록 보기(팝업창 띄우기)
		var popupX = (window.screen.width / 2) - (687 / 2); // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height /2) - (582 / 2); // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		
		//내 투표 URL 가져오기
		function myVoteList(m_id) {
			var popUrl = "myVoteList?m_id="+m_id;	//팝업창에 출력될 페이지 URL

			var popOption = "width=687, height=582, location=no, menubar=no, toolbar=no, resizable=no, scrollbars=no, status=no, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY="+ popupY+";";    //팝업창 옵션(optoin)

			window.open(popUrl,"나의 투표 목록",popOption);
		}
		
		var mainImgChk = false; //대표이미지 첨부 여부 true || false
		var daySetChk = false; //모집기간 설정 여부 true || false
		var msg = ""; //모집기간 설정 상태에 따른 메시지
		var priceSetChk = false; // 금액 입력 체크(입력했는지, 숫자만 입력했는지)
		var setAddrChk = false; // 주소를 입력했는지
		var priceMsg = "";
		//클래스 작성  유효성 검사 & submit()
		function classWrite() {
			fileCheck1();
			addrChk();
			/* daySetCheck(); */
			priceChk();
			var minPerson = parseInt($("input[name='c_minPerson']").val());
			var maxPerson = parseInt($("input[name='c_maxPerson']").val());
			if($("select[name='cn_index']").val() == "0"){
				alert("분류를 선택해주세요.");
			}else if($("input[name='c_subject']").val() == ""){
				alert("제목을 입력해주세요.");
			}else if($("input[name='c_subject']").val().length > 20){
				alert("제목은 최대 20자 까지 입력가능합니다.");
			}else if($("input[name='c_simpleContent']").val() == ""){
				alert("간단한 설명을 입력해주세요.");
			}else if($("input[name='c_simpleContent']").val() > 30){
				alert("간단한 설명은 최대 30자 까지 입력가능합니다.");
			}else if(setAddrChk == false){
				alert("주소를 입력해주세요.")
			}else if($("#c_detailAddress").val().length > 20){
				alert("상세주소는 최대 20자까지 입력가능합니다.")
			}else if(mainImgChk == false){
				alert("대표 이미지를 첨부해주세요.");
			}else if($("input[name='c_minPerson']").val() == 0 || $("input[name='c_maxPerson']").val() == 0){
				alert("신청 가능한 인원을 입력해주세요.\n\n1부터 1000까지 숫자만 입력가능합니다.");
			}else if(minPerson > maxPerson){
				alert("최대 인원은 최소 인원보다 작을 수 없습니다.\n\n최대 인원을 확인해주세요.");
			}/* else if(daySetChk == false){
				if(msg != ""){
					alert(msg);
				}
			} */else if(priceSetChk == false){
				if(priceMsg != ""){
					alert(priceMsg);
				}
			}else if($("#detailExplain")["0"].value.length > 2000){
				alert("상세 설명은 최대 2000자 까지 입력 가능합니다. (현재 : "+$("#detailExplain")["0"].value.length+"자)");
			}else if($("#detailExplain")["0"].value.length == 0){
				alert("상세 설명을 입력해주세요.");
			}else if($("#c_refundExplain")["0"].value.length > 1000){
				alert("환불 정책은 최대 1000자 까지 입력 가능합니다. (현재 : "+$("#c_refundExplain")["0"].value.length+"자)");
			}else if($("#c_refundExplain")["0"].value.length == 0){
				alert("환불 정책을 입력해주세요.");
			}else{
				$("#cwFrom").submit();
			}
		}

		//대표 이미지 첨부 여부
		function fileCheck1(){
			console.log($("input[name='c_mainImg']")[0].files.length);
			if($("input[name='c_mainImg']")[0].files.length != 0){
				mainImgChk = true;
			}
	    }
		
		//모집기간 설정 여부
		function daySetCheck() {
			var sc_year = parseInt($(".startDay")[0].value); //시작 년도
			var sc_month = parseInt($(".startDay")[1].value); //시작 달
			var sc_day = parseInt($(".startDay")[2].value); //시작 일
			var se_year = parseInt($(".endDay")[0].value); //종료 년도
			var se_month = parseInt($(".endDay")[1].value); //종료 달
			var se_day = parseInt($(".endDay")[2].value); //종료 일
			
			if(sc_year == 0){
				msg = "시작 년도를 입력해주세요";
			}else if(sc_month == 0){
				msg = "시작 달을 설정해주세요";
			}else if(sc_day == 0){
				msg = "시작 일을 설정해주세요";
			}else if(se_year == 0){
				msg = "종료 년도를 설정해주세요";
			}else if(se_month == 0){
				msg = "종료 달을 설정해주세요";
			}else if(se_day == 0){
				msg = "종료 일을 설정해주세요";
			}else if(sc_year > se_year){
				msg = "종료 년도가 시작 년도보다 작을 수 없습니다.";
			}else if(sc_year == se_year){
				if(sc_month > se_month){
					msg = "종료 달은 시작 달 보다 작을 수 없습니다.";
				}else if(sc_month == se_month){
					if(sc_day > se_day){
						msg = "종료 일은 시작 일보다 작을 수 없습니다.";
					}else{
						daySetChk = true;
					}
				}
			}else{
				daySetChk = true;
			}
		}
		
		// 주소 입력
		function addrChk() {
			if($("#c_addr").val() != ""){
				if($("#c_detailAddress").val() != ""){
					setAddrChk = true;
				}
			}
		}
		
		//가격 입력 확인
		function priceChk() {
			var objEv = $("input[name='c_price']").val();
			var numPattern = /([^0-9])/;
			var chk = objEv.match(numPattern);
			console.log(chk);
			if(objEv == ""){
				priceMsg = "가격을 입력해 주세요.";
			}else{
				if(chk != null){
					priceMsg = "숫자만 입력해 주세요.";
					$("input[name='c_price']").val("");
				}else{
					priceSetChk = true;
				}
			}
		}
		//첨부 파일 확인
		function chk_file_type(obj) {
			var file_kind = obj.value.lastIndexOf('.');
			var file_name = obj.value.substring(file_kind+1,obj.length);
			var file_type = file_name.toLowerCase();
			console.log(file_kind);
			console.log(file_name);
			console.log(file_type);

			var check_file_type = new Array();

			check_file_type=['jpg','gif','png','jpeg','bmp', 'tif', 'tiff'];
			if(check_file_type.indexOf(file_type)==-1){
				alert('이미지 파일만 선택할 수 있습니다.');
				$("input[type='file']").val("");
				var parent_Obj=obj.parentNode
				var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
				return false;
			}
		}
	</script>
</html>