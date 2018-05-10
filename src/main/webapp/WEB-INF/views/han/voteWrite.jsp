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
		
		.eb_vote{
			width: 70%;
			margin: 0 auto;
		}
		
		#buttons_location{
			left : 50%;
			transform : translateX(42%);
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
		
		.startDay, .endDay{
            width: 15%;
            display: inline;
            font-size: 12;
            align: center;
            padding: 0 0 0 6px;
         }
		
		#eb_separate{
        	position: relative;
			width: 75%;
			height: 1px;
			margin: 0 auto;
    		background-color: lightgray;
         }
         
         .plus{
         	width: 46px;
         	height: auto;
        	margin: 0px 0px 0px 10px;
        	cursor: pointer;
         }
         
         .removeImg{
        	width: 15px;
    		height: 15px;
    		position: relative;
    		margin: 0px 5px 0px 20px;
         	cursor: pointer;
         }
         
         input[type="checkbox"], input[type="radio"]{
         	margin: 6px 12px;
    		float: left;
    		margin-right: 1em;
         }
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>투표 게시판</h1>
			<p>나도 취미 아티스트가 되고 싶다면?</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<form id="voteWrite" action="vWrite" method="post" enctype="multipart/form-data">
			<table class="eb_vote">
				<tr>
					<td><input type="text" name="cb_subject" placeholder="제목"/></td>
				</tr>
				<tr>
					<td><textarea name="cb_content" cols="30" rows="10" placeholder="내용" style="resize:none;"></textarea></td>
				</tr>
				<tr>
					<td><b>파일 첨부</b>&nbsp;&nbsp;&nbsp;
					<input type="file" name="v_file" onchange="fileCheck(this)" multiple="multiple" accept=".jpg,.png,.gif,.tif,.tiff">
						<br/><br/>
						<p>* 가장 먼저 첨부한 이미지 파일이 대표 이미지가 됩니다. 해당 이미지는 투표 게시판 목록에 썸네일로 노출됩니다.</p>
						<p>* jpg, png, gif, tif, tiff 확장자만 첨부 가능합니다. </p>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
				</tr>
				</table>
				<br/><br/>
				
				<div id="eb_separate"></div>
				<br/><br/>
				
				<table class="eb_vote">
				<tr>
               		<td align="center" colspan="2">투표 기간</td>
            	</tr>
				<tr>
					<td>
						<!-- 년 -->
						<select class="startDay" name="vs_year">
							<option value="0">-연도-</option>
							<c:forEach var="i" begin="0" end="${2019-2018}">
								<option value="${2018+i}">${2018+i}</option>
							</c:forEach>
                  		</select>
                  		
						<!-- 월 -->
						<select class="startDay" name="vs_month">
							<option value="0">- 월 -</option>
							<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i}">${i}</option>
						 	</c:forEach>
						</select>
						
						<select class="startDay" name="vs_day">
							<option value="0">- 일 -</option>
							<c:forEach var="i" begin="1" end="31" step="1">
								<option value="${i}">${i}</option>
						 	</c:forEach>
						</select>
						
						<!-- 일 -->
						&nbsp;&nbsp;&nbsp;∼&nbsp;&nbsp;&nbsp;
						<select class="endDay" name="ve_year">
							<option value="0">-연도-</option>
							<c:forEach var="i" begin="0" end="${2019-2018}">
						 		<option value="${2018+i}">${2018+i}</option>
						 	</c:forEach>
						</select>
						
						<select class="endDay" name="ve_month">
							<option value="0">- 월 -</option>
							<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i}">${i}</option>
						 	</c:forEach>
						</select>
						
						<select class="endDay" name="ve_day">
							<option value="0">- 일 -</option>
							<c:forEach var="i" begin="1" end="31" step="1">
								<option value="${i}">${i}</option>
						 	</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="v_subject" placeholder="투표 제목"/>
					</td>
				</tr>
				<tr>
					<td><textarea name="v_content" cols="20" rows="5" placeholder="투표 설명" style="resize:none;"></textarea></td>
				</tr>
				<tr>
					<td><input type="text" name="v_person" placeholder="투표 인원" onkeydown="fn_press_han(this);"
					onkeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
					onkeypress="return fn_press(event, 'numbers');" style="IME-MODE:disabled;"/></td>
				</tr>
				<tr class="here">
					<td>
						<input class="remove" type="text" name="vi_name" placeholder="투표 항목" style="width:93%;float:left;"/>
						<img class="plus" src="resources/assets/img/vote/plus.png" onclick="append()"/>
					</td>
				</tr>
				<tr><td><input id="selectChk" type="checkbox" name="selectChk" value="0"/> 다중 선택</td></tr>
			</table><br/>
			<input type="hidden" value="2" name="cb_sort"/><!-- 게시판 구분 -->
			<input type="hidden" value="6" name="fs_index"/><!-- 파일 구분 -->
		</form>	
		<br/>
		<div id="buttons_location">
			<input type="button" value="확인" onclick="indexValChk()"/>&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='vote'"/>
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
	
		// plus 클릭 시 항목 추가
		var click = 0;
		function append(){
			click ++;
			if(click < 7){
				$(".here").last().after(
					"<tr class='here'>"
					+"<td><input class='remove' type='text' name='vi_name' placeholder='투표 항목' style='width:88%;float:left;'/>"
					+"<img class='removeImg' src='resources/assets/img/vote/remove.png' onclick='removeImg(this)'/>"
					+"<img class='plus' src='resources/assets/img/vote/plus.png' onclick='append()'/></td></tr>");
			}else{
				alert("투표 항목은 최대 7개까지만 추가할 수 있습니다.");	
			}
		}
		
		// remove 클릭 시 항목 삭제
		function removeImg(e){
			console.log(event);
			var pa = event.target.parentElement.parentElement;
			pa.remove();
		}
		
		function fileCheck(elem){
	        console.log(elem.value);
	        if(elem.value==""){
	            console.log("empty");
	            $("#fileChk").val(0);//파일 첨부 안함
	        }else{
	            console.log("unempty");
	            $("#fileChk").val(1);//파일 첨부 했음
	        }
	    }
		
		/* var daySetChk = false; //모집기간 설정 여부 true || false
		var msg;
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
	               }
	            }else if(sc_month < se_month){
	            	if(sc_day > se_day){
	            	  msg = "종료 일은 시작 일보다 작을 수 없습니다.";
	            	}
	            }
	         }else{
	            daySetChk = true;
	         }
	      } */
	      function indexValChk() {
	         var indexList = $("input[name='vi_name']");
	         var arr = new Array();
	         console.log(indexList);
	         for(var i=0;i<indexList.length;i++){
	            if(indexList[i].value != ""){
	            	console.log(indexList[i].value);
	            	arr.push("1");
	            	/* indexChk = true; */
	            }else{
	            	console.log("투표항목없음");
	            	/* indexChk = false; */
	            }
	         }
	         
	         if(indexList.length == arr.length){
	        	 if($("#selectChk").is(":checked")){
	        		 $("#selectChk").val(1);
	        		 console.log($("#selectChk").val());
	        	 }else{
	        		 $("#selectChk").val(0);
		        	 console.log($("#selectChk").val());
	        	 }
	        	 vWrite();
	         }else{
	        	 alert("투표 항목을 2개 이상 입력해주세요.");
	         }
      	}
	      /* else if(daySetChk == false){
				alert(msg);
			} */

		// 유효성 체크
		function vWrite(){
			/* daySetCheck(); */
			if($("input[name='cb_subject']").val() == ""){
				alert("제목을 입력해주세요.");
			}else if($("textarea[name='cb_content']").val() == ""){
				alert("내용을 입력해주세요.");
			}else if($("input[name='v_subject").val() == ""){
				alert("투표 제목을 입력해주세요.");
			}else if($("textarea[name='v_content']").val() == ""){
				alert("투표 설명을 입력해주세요.");
			}else if($("input[name='v_person']").val() == ""){
				alert("투표 인원을 입력해주세요.");
			}else{
				$("#voteWrite").submit();
			}
		}
		
		var msg1 = "${msg}";
		if(msg1 != ""){
			alert(msg1);
		}
	</script>
</html>