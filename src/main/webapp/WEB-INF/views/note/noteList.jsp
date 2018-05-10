<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE HTML>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<meta charset="utf-8"/>
	</head>
	<style>
		#eb_blank{
			width: 20px;
			height: 120px;
			display: hidden;
		}
		
		#eb_blanks{
			width: 20px;
			height: 40px;
			display: hidden;
		}
		
		.eb_btn{
		    width: 100px;
		    border-radius: 7px;
		    line-height: 3px;
		    font-size: 13px;
		    float:left;
		    display: inline;
	        margin: 0px 10px 0px 0px;
		}
		
		.eb_btn:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 100px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		    font-size: 13px;
		    float:left;
		    display: inline;
	        margin: 0px 10px 0px 0px;
		}
		
		.eb_btn2{
		    width: 100px;
		    border-radius: 7px;
		    line-height: 3px;
		    font-size: 13px;
		    float:right;
		    display: inline;
		}
		
		.eb_btn2:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 100px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		    font-size: 13px;
		    float:right;
		    display: inline;
		}
		
		.eb_btn3{
		    width: 65px;
		    border-radius: 7px;
		    line-height: 3px;
		    font-size: 13px;
		    float:right;
		    display: inline;
		}
		
		.eb_btn3:hover{
			/* position: relative;
			top:28%;
			left:47%; */
			width: 65px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		    font-size: 13px;
		    float:right;
		    display: inline;
		}
		
		td{
			text-align: left;
		}
		
		.eb_btn3{
	        width: 65px;
		    border-radius: 7px;
		    line-height: 3px;
		    font-size: 13px;
		    float: left;
		    display: inline;
		    margin: 5px;
		}
		
		.eb_btn3:hover{
	        width: 65px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px;
		    font-size: 13px;
		    float:left;
		    display: inline;
		}
	</style>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h1>쪽지함</h1>
			<p>회원님의 쪽지함</p>
		</div>
		
		<div id="eb_blanks"></div>
		<button value="팝업창 호출" onclick="showPopup();" class="eb_btn2">쪽지 쓰기</button>	
		<div>
			<button id = "send" class="eb_btn">받은 쪽지</button>
			<button id = "receive" class="eb_btn">보낸 쪽지</button>
		</div>
		
		<br/><br/><br/>
		<div id = "s"> 
			${nlist1} <!-- 상대방 >> 세션인 사람  -->
		</div>
		<div id = "r" style = "display:none">
			${nlist0} <!-- 세션인 사람 >> 상대방  -->
		</div>
		
	</body>
	<script>
		function showPopup() { 
			window.open("mailForm", "MailWrite", "width=530, height=630, left=100, top=50"); 
		}
		
		function countRead(a){
			window.location.reload();
			window.open("mailDetail?index="+a+"", "MailWrite", "width=530, height=630, left=100, top=50");	
		}
	
		// 차단 하시겠습까 ? 예/아니오 팝업창	
		function confirmBan(a,b){
		      if (confirm(b+"를 차단 하시겠습니까?")==true){
		    	  location.href="noteBlock?id_1="+a+"&id_2="+b+"";
		      }else{
		    	 false;
		        
		      } 
		      return;
		 }
		
		function check(x){
			var ch = false; 
			if($('input:checkbox[name=RowCheck1]').is(":checked")){
				if(confirm("진행 하시겠습니까?")==true){
				  	ch = true
				    }else{
				  	 false;
			    }
			}else{
				alert('체크박스를 클릭해 주세요.');
				ch = false
			}
		return ch;
		}
	
		$("input[name=btn_sort]").click(function(){
			if($('input:checkbox[name=RowCheck1]').is(":checked")){
				alert('체크박스 체크되어있습니다.');
				}else{
				alert('체크박스에 체크가 되어있지 않습니다.');
				}
		});
		
		$(document).ready(function(){
		    $("#send").click(function(){
		        $("#s").show();
		        $("#r").hide();
		    });
		    
		    $("#receive").click(function(){
		        $("#r").show();
		        $("#s").hide();
		    });
		});

		//	window.name = "parent";
		// 체크박스 전체 클릭	
		function allChk0(){
		      if( $("#allCheck0").is(':checked') ){
		        $(".RowCheck0").prop("checked", true);
		      }else{
		        $(".RowCheck0").prop("checked", false);
		      }
		}
		
		function allChk1(){
		   if( $("#allCheck1").is(':checked') ){
		        $(".RowCheck1").prop("checked", true);
		      }else{
		        $(".RowCheck1").prop("checked", false);
		     }
		}
	
  	</script>
	
	
</html>

