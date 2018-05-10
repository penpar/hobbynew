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
				width: 120px;
				border-radius: 7px;
			    /* line-height: 3px; */
			    padding: 0px 0px 45px 0px;
			}
			
			.eb_btn2:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				padding: 0px 0px 45px 0px;
				width: 120px;
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
				width: 50%;
				height: auto;
				left: 24%;
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
				left: 19%;
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
				float: right;
			}
			
			#datailArea p{
		        position: absolute;
			    /* top: 50%; */
			    margin: -15px;
			    left: 9%;
			}
			
			#area2{
				display: inline;
				float: left;
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
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<div id = "second_subject" align="center">
			<h1>클래스 모집글 수정</h1>
			<!-- <p>카테고리의 설명글</p> -->
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<form id="cwFrom" action="classUpdateSet" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${param.c_index}" name="c_index">
		<div id="area1" class="classWriteDiv" align="center">
			<table  style="color: gray;">
				<tr>
					<td colspan="2">
						<select name="cn_index">
							<option value="0">-- 분류 --</option>
							<c:forEach items="${ClassNameList}" var="cnList">
							<option value="${cnList.cn_index}" <c:if test="${classUpdate.cn_index == cnList.cn_index}">selected</c:if>>${cnList.cn_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="c_subject" placeholder="제목" value="${classUpdate.c_subject}">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="c_simpleContent"placeholder="간단한 설명" value="${classUpdate.c_content}">
					</td>
				</tr>
				<tr>
					<td style="text-align: center; vertical-align: middle;">주소</td>
					<td>
						<input type="text" id="c_addr" name="c_addr" placeholder="주소" value="${classUpdate.c_mainAddr}" readonly>
						<input type="text" id="c_detailAddress" name="c_detailAddress" placeholder="상세주소" value="${classUpdate.c_detailAddr}">
						<input type="button" id="c_addSearchBtn" onclick="postcodeFind()" value="주소 찾기">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						대표 이미지
					</td>
					<td>
						<input type="file" name="c_mainImg" accept="image/*" onchange='chk_file_type(this)'>
					</td>
				</tr>
				<c:if test="${classUpdate.c_mainImg != null}">
				<tr>
					<td colspan="2">
						첨부된 파일 : ${classUpdate.c_mainImg}
						<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
						&nbsp;&nbsp;새로운 파일을 첨부하여 수정 할 경우, 기존의 파일은 삭제됩니다.</p>
					</td>
				</tr>
				</c:if>
				<tr>
					<td align="center" colspan="2">
						최소 인원&nbsp;|&nbsp;
						<input type="number" name="c_minPerson" min="1" max="1000" value="${classUpdate.c_minPerson}">
						최대 인원&nbsp;|&nbsp;
						<input type="number" name="c_maxPerson" min="1" max="1000" value="${classUpdate.c_maxPerson}">
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
							<option value="${2018+i}" <c:if test="${classUpdate.cs_year == 2018+i}">selected</c:if>>${2018+i}</option>
							</c:forEach>
						</select>
						<!-- 년 -->
						<select class="startDay" name="cs_month">
							<option value="0">- 월 -</option>
							<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}" <c:if test="${classUpdate.cs_month == i}">selected</c:if>>${i}</option>
							</c:forEach>
						</select>
						<select class="startDay" name="cs_day">
							<option value="0">- 일 -</option>
							<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}" <c:if test="${classUpdate.cs_day == i}">selected</c:if>>${i}</option>
							</c:forEach>
						</select>
						<!-- 일 -->
						&nbsp;∼&nbsp;
						<select class="endDay" name="ce_year">
							<option value="0">-연도-</option>
							<c:forEach var="i" begin="0" end="${2019-2018}">
							<option value="${2018+i}" <c:if test="${classUpdate.ce_year == 2018+i}">selected</c:if>>${2018+i}</option>
							</c:forEach>
						</select>
						<select class="endDay" name="ce_month">
							<option value="0">- 월 -</option>
							<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}" <c:if test="${classUpdate.ce_month == i}">selected</c:if>>${i}</option>
							</c:forEach>
						</select>
						<select class="endDay" name="ce_day">
							<option value="0">- 일 -</option>
							<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}" <c:if test="${classUpdate.ce_day == i}">selected</c:if>>${i}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" maxlength="7" name="c_price" placeholder="가격" value="${classUpdate.c_price}" onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						* 상세 설명은 직접 글을 쓰거나 파일 첨부를 통해 하실 수 있습니다.
						<br/>
						&nbsp;&nbsp;&nbsp;직접 쓴 글의 경우 이미지 아래에 위치하게 됩니다.
						<br/><br/>
						<textarea id="detailExplain" rows="5" cols="30" name="c_content" style="resize: none;" placeholder="상세 설명">${classUpdate.c_content}</textarea>
						<br/>
						<input type="file" name="c_explainImg" multiple="multiple" accept="image/*" onchange='chk_file_type(this)'>
					</td>
				</tr>
				<c:if test="${classUpdate.c_explainImg != null}">
				<tr>
					<td colspan="2">
						첨부된 파일 : 
						<c:forEach items="${classUpdate.c_explainImg}" var="epImg">
							${epImg}&nbsp;&nbsp;
						</c:forEach>
						<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
						&nbsp;&nbsp;새로운 파일을 첨부하여 수정 할 경우, 기존의 파일은 삭제됩니다.</p>
					</td>
				</tr>
				</c:if>
				<tr>
					<td colspan="2">
						<textarea id="c_refundExplain" rows="5" cols="30" name="c_refund" style="resize: none;" placeholder="환불 정책">${classUpdate.c_refund}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<br/>
		<div id="eb_separate"></div>
		<br/>
		<br/>
		<div id="area2" class="classWriteDiv" align="center">
			<table style="color: gray;">
				<tr>
					<td colspan="2">
						* 아래 항목부터는 클래스 심사를 위한 것이므로<br/>
						&nbsp;&nbsp;&nbsp;실제 클래스 모집글에 노출되지 않습니다.<br/>
						<input type="text" id="voteResultUrl" name="ch_voteUrl" placeholder="투표 결과 URL" value="${classUpdate.ch_voteUrl}">
						<img src="resources/sj/quest.png" id="question_Icon" onmouseover="questionDetail('in')" onmouseout="questionDetail('out')">
						<input type="button" id="getVoteList" class="eb_btn2" onclick="myVoteList('${sessionScope.mb.m_id}')" value="내 투표 확인하기">
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
				<c:if test="${classUpdate.c_planDocument != null}">
				<tr>
					<td colspan="2">
						첨부된 파일 : ${classUpdate.c_planDocument}
						<p style="margin: 1em 0 0 0;">* 새로운 파일을 첨부하여 수정 할 경우, 기존의 파일은 삭제됩니다.</p>
					</td>
				</tr>
				</c:if>
				<tr>
					<td>
						경력사항 및 자격증
					</td>
					<td>
						<input type="file" name="c_career">
					</td>
				</tr>
				<c:if test="${classUpdate.c_career != null}">
				<tr>
					<td colspan="2">
						첨부된 파일 : ${classUpdate.c_career}
						<p style="margin: 1em 0 0 0;">* 새로운 파일을 첨부하여 수정 할 경우, 기존의 파일은 삭제됩니다.</p>
					</td>
				</tr>
				</c:if>
				<tr>
					<td>
						모임장소 사진
					</td>
					<td>
						<input type="file" name="c_placeImg" accept="image/*" onchange="chk_file_type(this)">
					</td>
				</tr>
				<c:if test="${classUpdate.c_placeImg != null}">
				<tr>
					<td colspan="2">
						첨부된 파일 : ${classUpdate.c_placeImg}
						<p style="margin: 1em 0 0 0;">* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다.<br/>
						&nbsp;&nbsp;새로운 파일을 첨부하여 수정 할 경우, 기존의 파일은 삭제됩니다.</p>
					</td>
				</tr>
				</c:if>
				<tr>   
					<td colspan="2" style="text-align: center;">
						<input type="button" class="eb_btn" onclick="classUpdate()" value="수정">
						<input type="button" class="eb_btn" onclick="location.href='classDetail_contents?c_index=${param.c_index}'" value="취소">
					</td>
				</tr>
			</table>
		</div>
		</form>
		<div id="datailArea" class="classWriteDiv">
			<img id="detailImg" src="resources/sj/hover.png">
			<p>투표 결과는 일반 회원이 취미 아티스트의<br/>
			권한을 일회성으로 부여받기 위해, 투표 <br/>
			게시판을 이용하여 가수요 조사를 한<br/>
			결과를 말합니다. 취미 아티스트가 아닌<br/>
			경우, 해당 투표가 있는 투표 게시판의 글<br/>
			URL을 복사해 붙여넣어 주시기 바랍니다.</p>
		</div>
	</body>
	<script>
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
		
		function questionDetail(evt) {
			if(evt == "in"){ // evt가 in 일 경우 아래의 내용을 실행
                console.log('마우스 오버 이벤트');
				$("#datailArea").css("display", "block");
            }else{ // evt가 in이 아닐 경우 아래의 내용을 실행
                console.log('마우스 아웃 이벤트');
                $("#datailArea").css("display", "none");
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
		
		var sumImgChk = false; //썸네일 첨부 여부 true || false
		var mainImgChk = false; //대표이미지 첨부 여부 true || false
		var daySetChk = false; //모집기간 설정 여부 true || false
		var msg; //모집기간 설정 상태에 따른 메시지
		var priceSetChk = true; // 금액 입력 체크(입력했는지, 숫자만 입력했는지)
		var setAddrChk = false; // 주소를 입력했는지
		
		//클래스 작성  유효성 검사 & submit()
		function classUpdate() {
			/* fileCheck1();
			fileCheck2();
			addrChk();
			daySetCheck();
			if($("select[name='cn_index']").val() == "0"){
				alert("분류를 선택해주세요.");
			}else if($("input[name='c_subject']").val() == ""){
				alert("제목을 입력해주세요.");
			}else if($("input[name='c_simpleContent']").val() == ""){
				alert("간단한 설명을 입력해주세요.");
			}else if(setAddrChk == false){
				alert("주소를 입력해주세요.")
			}else if(sumImgChk == false){
				alert("썸네일 이미지를 첨부해주세요.\n\n사이즈는 최대 'x' X 'y' 까지 가능합니다.");
			}else if(mainImgChk == false){
				alert("메인 이미지를 첨부해주세요.\n\n사이즈는 최대 'x' X 'y' 까지 가능합니다.");
			}else if($("input[name='c_minPerson']").val() == 0 || $("input[name='c_maxPerson']").val() == 0){
				alert("신청 가능한 인원을 입력해주세요.\n\n1부터 1000까지 숫자만 입력가능합니다.");
			}else if($("input[name='c_minPerson']").val() > $("input[name='c_maxPerson']").val()){
				console.log($("input[name='c_minPerson']").val());
				console.log($("input[name='c_maxPerson']").val());
				alert("최대 인원은 최소 인원보다 작을 수 없습니다.\n\n최대 인원을 확인해주세요.");
			}else if(daySetChk == false){
				alert(msg);
			}else if(priceSetChk == false){
				alert("금액을 입력해주세요. (단위 : 원)");
			}else{
				$("#cwFrom").submit();
			} */
			$("#cwFrom").submit();
		}
		
		//썸네일 첨부 여부 
		function fileCheck1(){
			console.log($("input[name='c_sumImg']")[0].files.length);
			if($("input[name='c_sumImg']")[0].files.length != 0){
				sumImgChk = true;
			}
	    }
		
		//대표 이미지 첨부 여부
		function fileCheck2(){
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
		
		//msg
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>