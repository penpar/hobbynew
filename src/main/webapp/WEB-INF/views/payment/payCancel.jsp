<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>소수의 취향</title>
	<style>
        #class_Sample p{
	        font-size: 15px;
    		line-height: 200% !important;
    		margin: 0;
        }
        
        #class_Sample1{
           border: 1px solid #E6E6E6;
           width: 40%;
           height: 20%;
           margin: 0 auto;
        }
        
        #mainDiv{
            width: 100px;
            float: left;
            margin: 0px 20px 0px 0px;
         }
         
         #mainImg{
             width: 90px;
             height: 100%;
             object-fit: cover;
         }
        
        #tables{
			width: 60%;
     		margin: 0 auto;
		}
		
		#class_Sample{
            border: 1px solid #D8D8D8;
            width: 60%;
            height: 20%;
            margin: 0 auto;
            padding: 15px;
         }
         
         /* #class_Sample{
            border: 1px solid black;
		    width: 60%;
		    height: 200px;
		    margin: 0 auto;
	        
        } */
        
        .openMenu{
			width: 70px;
			border-radius: 7px;
		    line-height: 3px !important;
        }
        
        .openMenu:hover{
			width: 70px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px !important;
        }
        
        .commit{
			width: 70px;
			border-radius: 7px;
		    line-height: 3px !important;
		    font-size: 14px;
	        position: relative;
    		left: 45%;
        }
        
        .commit:hover{
			width: 70px;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;
		    line-height: 3px !important;
		    font-size: 12px;
		    position: relative;
    		left: 45%;
        }
        
        #content{
        	margin: 0 auto;
        }
        
        #middle{
			position: relative;
		    /* margin: 0 auto; */
		    left: -3%;
		    /* transform: translateX(-8.5%); */
		}
		
		#here{
			height: 60px;
			/* padding: 0px 0px 0px 40px; */
		}
	</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
	    <!-- 여백 -->
		<div id="eb_blank"></div>
	    <div id = "second_subject" align="center" style="left: 30%;">
	        <h1>환불</h1>
	        <p>환불을 진행해 주세요.</p>
      	</div>
		<div id="eb_blank"></div>
		
		<div id="content">
			<!-- 후기쓰려는 클래스의 대표이미지, 상품명, 간단한 설명, 기간, 가격-->
			<div id="class_Sample">
	         <div id="mainDiv">
	         	<!-- 나중에 사진으로 교체하기 --> 
	            <img id="mainImg" src="${path}${clsList[0].c_mainImg}"/>
	         </div>
	         <p><b>상품명</b>&nbsp;&nbsp;${clsList[0].c_subject}&nbsp;/&nbsp;
	         	<b>간단한 설명</b>&nbsp;&nbsp;${clsList[0].c_simpleContent}<br/>
				<b>기간</b>&nbsp;&nbsp;${clsList[0].c_startDay}&nbsp;∼&nbsp;${clsList[0].c_endDay}<br/>
				<b>가격</b>&nbsp;&nbsp;${clsList[0].c_price}원</p>
			</div>
			<br/><br/>
	      	<form name = "payForm" action = "payCancel" onsubmit='return check()'>
				<table id="tables">
		    			<!-- <tr>
						<td>내 포인트 확인하기&nbsp;&nbsp;&nbsp;&nbsp;<input class="openMenu" type="button" value="확인"/><br/>
							<div id="here" style="display:none"><br/>
							<img src="resources/assets/img/next.png" style="width:15px;height:auto;"/>&nbsp;
								<b>내 포인트</b>&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.mb.p_point}&nbsp;원   &emsp;&emsp;&emsp;
								<img src="resources/assets/img/next.png" style="width:15px;height:auto;"/>&nbsp;
								<b>적용 가능한 포인트</b>&nbsp;&nbsp;&nbsp;&nbsp;${saleP}&nbsp;원
							
							</div>
						</td>
					</tr>	 -->				
					<tr>
						<td id="points1">반환 포인트   &nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="text"  id="re_point" name ="re_point" value = "${point}" readonly style="width:81%;display:inline;"></td>
					</tr>
						<tr>
						<td id="points2">환불 금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="payL" name = "pl_pay" value = "${paylist[0].pl_pay}" readonly style="width:81%;display:inline;"></span></td>
					</tr>
				</table>
				<input type = "hidden" name = "ClassBean" value = "${clsList[0]}">
				<input type = "hidden" name = "c_index" value = "${clsList[0].c_index}">
				<br/>
				<div id="middle">
					<input type="submit" class="commit" value="환불" onclick="location.href='classDetail_contents?c_index=${param.c_index}'"/>
					<input type="submit" class="commit" value="취소" onclick="location.href='classDetail_contents?c_index=${param.c_index}'"/>
				</div>
				
				</form>
		</div>	
	</body>
	<script>
	
	$('#re_point').blur(function() {  
	
		 
	    
	    x=document.payForm
	     inputNum =x.re_point.value
	     
	     var max = ${saleP}
		 var myPoint = ${sessionScope.mb.p_point}
	  
		 
		  if (inputNum>=0&& inputNum<=max) {
			
	        }else{
	            alert("최대 적용 가능한 포인트는 "+max+"입니다.");    
	            var value = $('#re_point').val();
	
	            if(myPoint<max){
	            	$('#re_point').val(myPoint); 
	         
	            }else{
	            	
	            	$('#re_point').val(max); 
	            }	
	        }
		  
		  salePay();
		  
		  
		  function salePay(){
			 var a1= ${clsList[0].c_price};
			 var a2 =$('#re_point').val();
			 var aSum = a1 - a2;
			 alert(aSum);
			 
			 $('#payL').val(aSum);
		  }
		  
		  
			
		  
	});
	
	  $('#re_point').focus(function() { 
		  
		 var value = $('#re_point').val()
		 console.log(value);
		 
	  $('#re_point').val('');
		 
		 /*
		  if($('#re_point').val() ==0){
	  }*/
 	 });
	
	
		var clickSum = 0;
		// slide Down
		$('.openMenu').click(function() {
			if(clickSum == 0){
				$('#here').slideDown('slow', function(){
					$('#here').css("display","block");
				});
				clickSum = 1;
			}else{
				$('#here').slideUp('slow', function(){
					$('#here').css("display","none");
				});
				clickSum = 0;
			}
			
		});
		
		
		function check(){
			if (confirm("결제 하시겠습니까?")==true){
				alert("결제 성공");
				return true;
			}else{
				alert("결제 실패");
				return false;
			}
		}	
		
		
		
		
		
		
	</script>
</html>