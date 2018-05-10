<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/assets/js/jquery.min.js"></script>
		<title>소수의 취향</title>
		<style>
			@import url('https://fonts.googleapis.com/css?family=Lobster');
			
			/* body{
				font-family: 'Nanum Square';
				font-size:18px;
			} */
			
			.msgImg{
				width: 25px;
				opacity: 0.7;
			}
			
			.msgImg:hover {
				cursor: pointer;
			}
			
			#allUserSend{
				float: right;
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
			
			th{
			    padding: 10px !important;  
			    text-align: center !important;
			}
			
			#sortForm, #searchForm{
				margin: 5px;
			}
			
			.removeImg{
	        	width: 20px;
	    		height: 20px;
	    		position: relative;
	    		float: right;
	    		margin: 15px 15px 0px 0px;
	         	cursor: pointer;
         	}
			
			.eb_btn{
				width: 145px;
			    border-radius: 7px;
			    line-height: 3px !important;
			    left: 31%;
			    margin: 5px;
			    position: relative;
			}
			
			.eb_btn:hover{
			    width: 145px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px !important;
			    left: 31%;
			    position: relative;
			}
			
			.eb_btn3{
			    width: 120px;
			    border-radius: 7px;
			    line-height: 3px !important;
			    position: relative;
			    left: 45%;
			}
			
			.eb_btn3:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 120px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px !important;
			    position: relative;
		        left: 45%;
			}
			.eb_popup{
			    display: none;
			    position: fixed;
			    width: 32%;
			    height: 50%;
			    top: 30%;
			    left: 40%;
			    background-color: white;
			    transform: translateX(-20%);
			    align: center;
			    z-index: 5;
			    overflow-y: scroll;
			    overflow-x: hidden;
			}
 
			/* .background{
				display: none;
				position: fixed;
				width: 100%;
				height: 100%;
				background-color: white;
				opacity: 0.8;
				z-index: 4;
			} */
			
			.classify_top{
				width: 100%;
				height: 67px;
				border-bottom: 1px solid #D8D8D8;
				padding: 14px 5px 14px 14px;
				font-size: 15.5px;
			}
			
			.classify_middle{
			    width: 25%;
			    height: 100%;
			    float: left;
			    /* background-color: green; */
			    padding: 13px;
			}
			
			.classify_middle2{
			    width: 33.3%;
			    height: 100%;
			    float: left;
			    /* background-color: green; */
			    padding: 13px;
			}
			
			.classify_middle3{
			    width: 100%;
			    height: 100%;
			    float: left;
			    /* background-color: green; */
			    padding: 13px;
			}
			
			.classify_middle p{
				float:left;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<div class="eb_popup">
		</div>
		<div id = "second_subject" align="center">
			<h1>회원 관리</h1>
			<p>각종 심사를 관리합니다.</p>
		</div>
		<!-- <div class="background"></div> -->
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<input type="button" id="userJoin" class="eb_btn" value="회원가입 심사" onclick="userJoin()"/>
		<input type="button" id="userChange" class="eb_btn" value="전환 심사" onclick="userChange()"/>
		<input type="button" id="ClassRe" class="eb_btn" value="클래스 모집 심사" onclick="ClassRe()"/>
		<br><br><br>
		<table>
			<tr id="first_tr">
				<th>아이디</th>
				<th>이름</th>
				<th>가입 날짜</th>
			</tr>
			<!-- <tr>
				<td><a href="javascript:userDetail()">임시</a></td>
			</tr> -->
		</table>
		<br/>
		<input type="button" id="userSearch" class="eb_btn3" value="관리자 페이지" onclick="location.href='adminMain'"/>
	</body>
	<script>
		var m_id = "";
		//
		$(document).ready(function() {
			userJoin(m_id);
		});
		
		function userJoin(m_id){
			$.ajax({
                type:"post",
                url:"userJoinList",
                data:{
					"m_id": m_id
                },
                dataType:"json",
                success:function(data){
					console.log("회원가입 심사 리스트 출력");
					console.log(data.judgeList);
					var ajaxTag = "";
					$(".second_tr").remove();
					if(data.judgeList.length > 0){
						for(var i=0;i<data.judgeList.length;i++) {
							ajaxTag += "<tr class='second_tr'>";
							ajaxTag += "<td><a href=javascript:userDetail('"+data.judgeList[i].m_id+"')>"+data.judgeList[i].m_id+"</a></td>";
							ajaxTag += "<td>"+data.judgeList[i].m_name+"</td>";
							ajaxTag += "<td>"+data.judgeList[i].m_date+"</td>";
							ajaxTag += "</tr>";
						}
					}else{
						ajaxTag += "<tr class='second_tr'>";
						ajaxTag += "<td colspan='3' style='text-align: center;'><b>정보가 없습니다.</b></td>";
						ajaxTag += "</tr>";
					}
					$("#first_tr").after(ajaxTag);
                },
                error:function(error){
                    console.log(error);
                }
            });
		}

		function userDetail(m_id) {
			$(".eb_popup").css("display", "block");
			$.ajax({
                type:"post",
                url:"userDetail",
                data:{
                	"m_id": m_id
                },
                dataType:"html",
                success:function(data){
					console.log("회원가입 심사 리스트 출력");
					console.log(data);
					$(".eb_popup").html(data);
                },
                error:function(error){
                    console.log(error);
                }
            });
		}
		
		
		function joinConfirm(m_id, flag) {
			if(flag == 1){
				if(confirm("회원가입을 거절하시겠습니까?")==true){
					$(".eb_popup").css("display", "none");
					$.ajax({
			            type:'post',
			            url:'joinConfirm',
			            data:{
			            	"m_id": m_id,
			            	"flag": flag
			            },
			            dataType:"json",
			            success:function(data){
			            	console.log(data);
			            	alert("거절되었습니다.");
			            	var ajaxTag = "";
			            	$(".second_tr").remove();
							if(data.judgeList.length > 0){
								for(var i=0;i<data.judgeList.length;i++) {
									ajaxTag += "<tr class='second_tr'>";
									ajaxTag += "<td><a href=javascript:userDetail('"+data.judgeList[i].m_id+"')>"+data.judgeList[i].m_id+"</a></td>";
									ajaxTag += "<td>"+data.judgeList[i].m_name+"</td>";
									ajaxTag += "<td>"+data.judgeList[i].m_date+"</td>";
									ajaxTag += "</tr>";
								}
							}else{
								ajaxTag += "<tr class='second_tr'>";
								ajaxTag += "<td colspan='3' style='text-align: center;'><b>정보가 없습니다.</b></td>";
								ajaxTag += "</tr>";
							}
							$("#first_tr").after(ajaxTag);
			            },
			            error:function(error){
			                console.log(error);
			            }
			        });
				}else{
					return;
				}
			}else{
				if(confirm("회원가입을 승인하시겠습니까?")==true){
					$(".eb_popup").css("display", "none");
					$.ajax({
			            type:'post',
			            url:'joinConfirm',
			            data:{
			            	"m_id": m_id,
			            	"flag": flag
			            },
			            dataType:"json",
			            success:function(data){
			            	console.log(data);
			            	var ajaxTag = "";
							alert("승인되었습니다.");
			            	$(".second_tr").remove();
							if(data.judgeList.length > 0){
								for(var i=0;i<data.judgeList.length;i++) {
									ajaxTag += "<tr class='second_tr'>";
									ajaxTag += "<td><a href=javascript:userDetail('"+data.judgeList[i].m_id+"')>"+data.judgeList[i].m_id+"</a></td>";
									ajaxTag += "<td>"+data.judgeList[i].m_name+"</td>";
									ajaxTag += "<td>"+data.judgeList[i].m_date+"</td>";
									ajaxTag += "</tr>";
								}
							}else{
								ajaxTag += "<tr class='second_tr'>";
								ajaxTag += "<td colspan='3' style='text-align: center;'><b>정보가 없습니다.</b></td>";
								ajaxTag += "</tr>";
							}
							$("#first_tr").after(ajaxTag);
							question(m_id);
			            },
			            error:function(error){
			                console.log(error);
			            }
			        });
				}else{
					return;
				}
			}
		}
		//판매자에게 문의(쪽지 팝업 띄우기)
		function question(m_id) { 
			console.log(m_id);
			window.open("mailForm?m_id2="+m_id, "MailWrite", "width=530, height=630, left=100, top=50");
		}
		
	</script>
</html>