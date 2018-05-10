<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Karla" rel="stylesheet">
		<script src="resources/assets/js/jquery.min.js"></script>
		<title>소수의 취향</title>
	</head>
	<style>		
	
		#header .links ul li{
			line-height: 1;
		}
		
		#eb_blank{
			width: 20px;
			height: 120px;
			display: hidden;
		}
		
		/* 맨 위로 이동 */
		a.top{
			/* display: none; */
			position: fixed;
			left: 95%;
			bottom: 30px;
			width: 50px;
			height: 50px;
			border-radius: 50px;
			z-index: 6;
		}
		
		a.top img{
			position: relative;
			width: 50px;
			height: 50px;
		}
		
		#voteWrite, #voteUpdate, #voteReport{
			position: relative;
			width: 60px;
			float: right;
			border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
        	margin: 0px 0px 0px 15px;	    
	        /* transform: translateX(-50%);
    		left: 50%; */
		}
		
		#voteWrite:hover, #voteUpdate:hover, #voteReport:hover{
			position: relative;
			width: 60px;
			float: right;
			border-radius: 7px;
			color: #ff9a2e;
			border-color: #ff9a2e;	
		    margin: 0px 0px 0px 15px;
			/* transform: translateX(-50%);
    		left: 50%; */
		    /* line-height: 0px; */
		    /* padding: 0px 0px 45px 0px; */
		}
		
		#selectAjax{
			position: relative;
		    width: 90px;
		    border-radius: 5px;
		    line-height: 0px;
		    padding: 2px 20px 0px 16px;
		}
		
		#selectAjax:hover{
			position: relative;
			width: 90px;
			border-radius: 5px;
			line-height: 0px;
			color: #ff9a2e;
			border-color: #ff9a2e;
			padding: 2px 20px 0px 16px;
		}
		
		/* 내용 위치 */
		#voteContent{
	        /* background-color: green; */
		    width: 100%;
		    height: auto;
		    margin: 0 auto;
		    position: relative;
		    align: center;
		}
		
		.eb_lists{
		    position: relative;
		    border: 1px solid #D8D8D8;
		    border-radius: 7px;
		    text-align: left;
		    display: inline-block;
		    padding: 7px;
		    margin: 20px 0px auto;
		    width: 66%;
		}
		
		.eb_lists2{
		    position: relative;
		    border: 1px solid #D8D8D8;
		    border-radius: 7px;
		    text-align: left;
		    display: inline-block;
		    padding: 15px 30px;
		    margin: 20px 0px auto;
		    width: 66%;
		}
		
		#eb_separate{
        	position: relative;
			width: 100%;
			height: 1px;
			margin: 0 auto;
    		background-color: lightgray;
         }
         
         #comments textarea{
		    position: relative;
		    width: 89%;
		    float: left;
         }
         
          #comments{
	        position: relative;
		    width: 66%;
		    height: 13.5%;
		    margin: 0 auto;
		    border-radius: 7px;
		    padding: 15px;
		    border: 1px solid #D8D8D8;
         }
         
         #comments input[type="button"]{
   	        position: relative;
		    width: 65px;
		    border-radius: 7px;
		    padding: 0px 0px 45px 0px;
	        left: 0%;
    		top: 29%;
         }
         
         #lock_g{
         	position: relative;
         	float: left;
         	width: 20px;
         	height: auto;
       	    margin: 0px 0px 0px 20px;
         }
         
         #allComm{
       	    position: relative;
		    width: 66%;
		    height: auto;
		    border-radius: 7px;
		    margin: 0 auto;
		    padding: 1% 2%;
		    border: 1px solid #D8D8D8;
	        text-align: left;
         }
         
         #goPrev{
         	position: relative;
		    width: 125px;
		    border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
		    /* transform: translateX(0); */
		    /* left: 50%; */
         }
         
         #goPrev:hover{
			color: #ff9a2e;
			border-color: #ff9a2e;
			position: relative;
		    width: 125px;
		    border-radius: 7px;
		    /* line-height: 0px !important; */
		    padding: 0px 0px 45px 0px;
		    /* transform: translateX(0); */
		    /* left: 50%; */
         }
         
         #terms{
       	    border: 1px solid #D8D8D8;
		    border-radius: 7px;
		    width: 32%;
		    padding: 20px;
		    background-color: white;
		    margin: 3% 1% 0% 13%;
		    float: left;
         }
         
         #votePerson{
         	border: 1px solid #D8D8D8;
		    border-radius: 7px;
		    width: 32%;
		    padding: 20px;
		    background-color: white;
		    margin: 3% 20% 0% 1%;
		    float: left;
         }
         
         #middle{
         	position: relative;
   		 	left: 50%;
    		transform: translateX(-46%);
         }
         .a{
       	   	    position: relative;
			    left: -30%;
			}
         .block{
             height: 15%;
         }
         
         .progress{
   			width: 0%;
			height: 6px;
			position: relative;
			z-index: 3;
			background-color: #ff9a2e;
   		}
   		
   		/* .progressBar_bottom{
   			width: 100%;
			height: 6px;
			z-index: 2;
			background-color: lightgray;
   		} */
   		
   		.eb_commList input[type="button"]{
		    width: 55px;
		    line-height: 3px;
		    float: right;
		    border-radius: 7px;
		    position: relative;
		    margin: 3px 4px -20px 0px;
		    font-size: 12px;
		    transform: translateY(-130%);
		}
		
		.eb_commList input[type="button"]:hover{
			width: 55px;
			line-height: 3px;
			float: right;
			position: relative;
		    margin: 3px 4px -20px 0px;
			border-radius: 7px;
			color: #ff9a2e;
			font-size: 12px;
		    transform: translateY(-130%);
			border-color: #ff9a2e;
		}
   		
   		#allComm img {
		    width: 36px;
	        margin: 0px 10px 0px 0px;
		}
		
		#allComm p{
		    margin: 0 0 1.5em 0;
		}
		
		.lock{
		    float: left;
	        position: relative;
    		top: -8px;
		}
		
		.lock2{
		    float: left;
	        position: relative;
    		top: 15px;
		}
		
		#paging{
			margin: 0 auto;
			width: 66%;
		}
		
		#paging a{
			font-family: 'Karla', sans-serif;
			font-size: 20px;
			margin: 6px;
		}
		
		#paging font{
			font-family: 'Karla', sans-serif;
			font-size: 20px;
			margin: 6px;
		}
		
		.locks{
			width: 23px !important;
    		margin: 0px 10px 0px 0px;
    		position: relative;
    		top: -2px;
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
		<c:if test="${voteCom.m_id == sessionScope.mb.m_id || sessionScope.mb.m_sort == 0}">
			<input id="voteWrite" type="button" value="삭제" onclick="voteDel(${voteCom.cb_index}, ${voteCom.fs_index})"/>
			<input id="voteUpdate" type="button" value="수정" onclick="voteUpdate(${voteCom.cb_index}, ${voteCom.fs_index})"/>
		</c:if>
		<c:if test="${voteCom.m_id != sessionScope.mb.m_id}">
			<input id="voteReport" type="button" value="신고" onclick="banWrite('${voteCom.cb_index}','${voteCom.m_id}','0')"/>
		</c:if>
		
		<!-- 여백 -->
		<br/><br/>
		<div id="eb_blank"></div>
		<div id="eb_separate"></div>
		<br/><br/>

		<div id="voteContent" style="text-align: center;" align="center">
			<h4>${voteCom.cb_subject}</h4>
			<p><b >조회수&nbsp;${voteCom.cb_click}</b></p><br/>
			
			<c:forEach items="${voteCom.vList}" var="list">
				<div class="vImg">
					<img src="${realPath}${list}" style="width:35%;height:auto;"/>
				</div><br/><br/>
			</c:forEach>
			<h6 style="width:70%;margin:0 auto;">${voteCom.cb_content}</h6>
			
			<br/><br/><br/>
			<div id="eb_separate"></div>
			<br/><br/>
			
			<div id="middle">
				<div id="terms">
					<b>투표 기간</b>&nbsp;&nbsp;${voteCom.v_startDay} ~ ${voteCom.v_endDay}
				</div>
				<div id="votePerson">
					<b>참여 인원</b>&nbsp;&nbsp;${voteCom.v_people} / ${voteCom.v_person}
				</div>
	 		</div>
	 		<div class="block"></div>
			<!-- 투표 -->
			<!-- 투표하기 누르면 안의 내용 변경 -->
			<div class="ebHtml">
				<c:if test="${vSelectMap != null}">
					<div class="eb_lists2">
						<c:forEach items="${vSelectMap.ItemList}" var="vList">
							<h6>
								${vList.vp_name}&nbsp;&nbsp;&nbsp;
								<fmt:parseNumber var="w" integerOnly="true" value="${vList.v_people / vList.v_person * 100}"/>
								<b>투표율&nbsp;</b>${w}%(총 ${vList.v_people}명 참여)
							</h6>
						</c:forEach>
					</div><br/><br/>
				</c:if>
				
				<c:if test="${voteCom.m_id != sessionScope.mb.m_id}">		
					<c:if test="${vSelectMap == null}">
						<c:if test="${voteCom.selectChk == 1}">
							<b class="a">투표 항목</b><br/>
							<c:forEach items="${voteCom.vi_name}" var="nameList">
								<div class="eb_lists">
									<input class="names" name="vote"  type="checkbox" value="${nameList}"  style="margin: 5px 0 0 0;"/>&nbsp;&nbsp;${nameList}
								</div>
							</c:forEach>
						</c:if>
						
						<c:if test="${voteCom.selectChk == 0}">
							<b class="a">투표 항목</b><br/>
							<c:forEach items="${voteCom.vi_name}" var="nameList">
								<div class="eb_lists">
									<input class="names" name="vote" type="radio" value="${nameList}" style="margin: 5px 0 0 0;"/>&nbsp;&nbsp;${nameList}
								</div><br/>
							</c:forEach>
						</c:if>
						
						<br/><br/>
						<!-- 투표 ajax 호출 -->
						<input type="button" onclick="selectAjax('${voteCom.cb_index}', '${voteCom.selectChk}')" value="투표하기" id="selectAjax" style="float:none;"/>
						<br/>
					</c:if>
				</c:if>
			</div>
				
			<!-- 댓글 입력 -->	
			<br/><br/>
				<div id="eb_separate"></div>
			<br/><br/>
			<div id="comments">
				<textarea name="co_content" cols="30" rows="3" placeholder="* 댓글은 1000자까지 입력하실 수 있습니다." style="resize:none;"
				onKeyUp="checkLength(this);" onKeyDown="checkLength(this);" id="commText"></textarea>
				<img src="resources/assets/img/vote/lock_gray.png" id="lock_g" class="lock"/><br/> &nbsp;&nbsp;
				<input type="hidden" value="0" id="secretChk"/> <!-- 비밀글 체크(0/1) -->
				<input type="button" onclick="commentAjax(${voteCom.cb_index})" value="확인" id="commentAjax"/><!-- 댓글 ajax 호출 -->
			</div><br/>
				
			<!-- 댓글 리스트 -->
			<div class="eb_commList">
				<c:if test="${commList != '[]'}"> <!-- 댓글이 있을 경우 -->
					<h6><b>전체 댓글</b>&nbsp;${commSum}</h6>
					<div id="allComm"><br/>
						<c:forEach items="${commList}" var="comList">
								<!-- 비밀 댓글이 아닐 경우 -->
								<c:if test="${comList.secretChk == 0}">
									${comList.m_id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comList.co_date}<br/><br/>
									<c:if test="${sessionScope.mb.m_sort == 0}">
										<input id='comReport' type='button' value='신고'  onclick="banWrite('${comList.cb_index}','${comList.m_id}','0')"/>
										<input id="comDelete" type="button" value="삭제" onclick="comDelete(${comList.co_index}, ${comList.cb_index})"/>
									</c:if>
									
									<c:if test="${comList.m_id == sessionScope.mb.m_id && sessionScope.mb.m_sort != 0}">
										<input id="comDelete" type="button" value="삭제" onclick="comDelete(${comList.co_index}, ${comList.cb_index})"/>
										<!-- <input id="comUpdate" type="button" value="수정"/> -->
									</c:if>
									<c:if test="${comList.m_id != sessionScope.mb.m_id && sessionScope.mb.m_sort != 0}">
										<input id='comReport' type='button' value='신고'  onclick="banWrite('${comList.cb_index}','${comList.m_id}','0')"/>
									</c:if>
									${comList.co_content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
									<br/><div id="eb_separate"></div><br/> <!-- 구분선 -->
								</c:if>
								
								<!-- 비밀 댓글일 경우 -->
								<c:if test="${comList.secretChk == 1}">
									<c:if test="${comList.m_id != sessionScope.mb.m_id && sessionScope.mb.m_sort != 0 && voteCom.m_id != sessionScope.mb.m_id}">
										&ensp;&ensp;<img src="resources/assets/img/vote/lock_gray.png" id="lockCom" class="lock"/>
										<p>작성자와 운영자만 볼 수 있는 비밀 댓글입니다.</p>
										<div id='eb_separate'></div><br/>
									</c:if>
									
									<c:if test="${comList.m_id == sessionScope.mb.m_id || sessionScope.mb.m_sort == 0 || voteCom.m_id == sessionScope.mb.m_id}">
										${comList.m_id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comList.co_date}
										<img src="resources/assets/img/vote/lock_gray.png" id="lockCom" class="locks"/>
										<br/><br/>
										<c:if test="${sessionScope.mb.m_sort == 0}">
											<input id='comReport' type='button' value='신고'  onclick="banWrite('${comList.cb_index}','${comList.m_id}','0')"/>
											<input id="comDelete" type="button" value="삭제" onclick="comDelete(${comList.co_index}, ${comList.cb_index})"/>
										</c:if>
										<c:if test="${comList.m_id == sessionScope.mb.m_id && sessionScope.mb.m_sort != 0}">
											<input id="comDelete" type="button" value="삭제" onclick="comDelete(${comList.co_index}, ${comList.cb_index})"/>
											<!-- <input id="comUpdate" type="button" value="수정"/> -->
										</c:if>
										<c:if test="${comList.m_id != sessionScope.mb.m_id && sessionScope.mb.m_sort != 0}">
											<input id='comReport' type='button' value='신고'  onclick="banWrite('${comList.cb_index}','${comList.m_id}','0')"/>
										</c:if>
										${comList.co_content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
										<br/><div id="eb_separate"></div><br/> <!-- 구분선 -->
									</c:if>
								</c:if>
							</c:forEach>
					</div>
				</c:if>
				
			</div><br/>
			
			<div id="paging">
				<c:if test="${commList != '[]'}"> <!-- 댓글이 있을 경우 -->
					${paging}
				</c:if>
			</div><br/>
				
			<input id="goPrev" type="button" value="목록으로 이동" onclick="location.href='vote'"/>
			<br/><br/><br/>
		</div>
		
		
		<!-- 맨 위로 이동 -->
		<a href="#" class="top"><img src="resources/assets/img/top.png"/></a>
	</body>
	<script>
	
	var m_id = "${sessionScope.mb.m_id}";
	var sessionSort = "${sessionScope.mb.m_sort}";
	var sessionId = "${sessionScope.mb.m_id}";
	var writeId = "${voteCom.m_id}";
	
	function pagingComent(pageNum,cb_index){ //댓글 페이징
		$.ajax({
               type:"post",
               url:"pagingComent",
               data:{
               	cb_index : cb_index,
               	pageNum:pageNum
               },
               dataType:"JSON",
               success:function(data){
               	console.log(data);
               	$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
   				$("#secretChk").val(0);
               	var commResult = "";	
                   if(data.commList != null){
          				commResult += "<h6><b>전체 댓글</b>&nbsp;"+data.commSum+"</h6>";
          				if(data.commList.length == 0){
          					$(".eb_commList").html();
          				}else{
          					commResult += "<div id='allComm'><br/>";
          					for(var i=0;i<data.commList.length;i++){
                  				
          						// 비밀글 체크 안했을 시
          						if(data.commList[i].secretChk == 0){
                   				commResult += data.commList[i].m_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.commList[i].co_date+"<br/><br/>";
                   				if(data.commList[i].m_id == sessionId && sessionSort != 0){ // 글쓴 아이디와 로그인한 아이디가 같고 운영자가 아닐 때
                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
	                   				/* commResult += "<input id='comUpdate' type='button' value='수정'/>"; */
                   				}else if(data.commList[i].m_id != m_id && sessionSort != 0){ //글쓴 아이디와 로그인한 아이디가 다르고 운영자가 아닐 때
                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
                   				}else if(sessionSort == 0){
                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";              					
                   				}
                   				commResult += data.commList[i].co_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>";
                   				if(i !=data.commList.length-1){
                   				commResult += "<br/><div id='eb_separate'></div><br/>";
                   				}else{
           							commResult += "<br/>";	
           						}
                   				
	                   			// 비밀글 체크 시
	                   			// 글쓴 아이디와 로그인한 아이디가 다를 때
                  				}else if(data.commList[i].secretChk == 1){
                  					if(data.commList[i].m_id != m_id && sessionSort != 0 && writeId != m_id){
                  						commResult += "<img src='resources/assets/img/vote/lock_gray.png' id='lockCom' class='lock2'/> &nbsp;&nbsp;";
               						commResult += "<p>작성자와 운영자만 볼 수 있는 비밀 댓글입니다.</p><br/>";
               						if(i !=data.commList.length-1){
               							commResult += "<div id='eb_separate'></div><br/>";	
               						}else{
               							commResult += "<br/>";	
               						}
               						
                  					}else if(data.commList[i].m_id == m_id || sessionSort == 0 || voteComId == sessionId){
                  						commResult += data.commList[i].m_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.commList[i].co_date;
                  						commResult += "&ensp;&ensp;<img src='resources/assets/img/vote/lock_gray.png' id='lockCom' class='locks'/><br/><br/>";
   	                   				if(data.commList[i].m_id == m_id && sessionSort != 0){ // 글쓴 아이디와 로그인한 아이디가 같고 운영자가 아닐 때
   	                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
   		                   				/* commResult += "<input id='comUpdate' type='button' value='수정'/>"; */
   	                   				}else if(data.commList[i].m_id != m_id && sessionSort != 0){ //글쓴 아이디와 로그인한 아이디가 다르고 운영자가 아닐 때
   	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
   	                   				}else if(sessionSort == 0){
   	                   				commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
   	                   				}
   	                   				commResult += data.commList[i].co_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>";
   	                   				if(i !=data.commList.length-1){
   	                   				commResult += "<br/><div id='eb_separate'></div><br/>";
   	                   				}else{
               							commResult += "<br/>";	
               						}
                  					}
                  				}
          					}
          					commResult += "</div>";
                    	$(".eb_commList").html(commResult);
                    	$("#paging").html(data.paging);
          				}
                }else{
                	console.log("댓글 실패");
                }
               	
               },
               error:function(error){
                   console.log(error);
               }
           });
		}
	
		// 신고 링크
		function banWrite(cb_index,m_id,sort){
			location.href="banWrite?index="+cb_index+"&m_id2="+m_id+"&sort="+sort;
		}
	
		// 글 수정
		function voteUpdate(cb_index, fs_index){
			location.href='voteUpdate?cb_index='+cb_index+'&fs_index='+fs_index;
		}
	
		// 글 삭제
		function voteDel(cb_index, fs_index){
			if (confirm("정말 삭제하시겠습니까?")==true){
				location.href='voteDelete?cb_index='+cb_index+'&fs_index='+fs_index;
		      }else{
		         return;
		      }
		}
	
		// 비밀글 체크
		var check = 1;
		var secretChk = 0;
		
		$("#lock_g").click(function(){
			if(check == 1){
				$("#lock_g").attr("src", "resources/assets/img/vote/lock_orange.png");
				check ++;
				$("#secretChk").val(1);
			}else if(check > 1){
				$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
				check = 1;
				$("#secretChk").val(0);
			}else{
				check = 1;
				$("#secretChk").val(0);
			}
		});
		
		/* textarea 글자수 제한(1000자) */
		function checkLength(comment) {
		    if (comment.value.length > 1000 ) {
		        comment.blur();
		        comment.value = comment.value.substring(0, 1000);
		        comment.focus();
		        return false;
		    }
		}
		
		// 투표하기
		function selectAjax(cb_index, selectChk){
			var names = [];
			/* if(selectChk == 1){ */
			var check = $("input[name='vote']");
			var m_id = "${sessionScope.mb.m_id}";
			console.log(check);
			
			for(var i=0;i<check.length;i++){
				if(check[i].checked == true){
					console.log(check[i].value);
					names.push(check[i].value);
				}
			}
			
			if(names.length == 0){
				alert("투표 항목을 선택해주세요.");
			}else{
				$.ajaxSettings.traditional = true;
				
				$.ajax({
	                type:"post",
	                url:"voteSelect",
	                data:{
	                	cb_index : cb_index,
	                	m_id : m_id,
	                	"names" : names
	                },
	                dataType:"JSON",
	                success:function(data){
						console.log("투표 성공");
						alert(data.msg);
						var voteResult = "";
						if(data.ItemList.length > 0){
							voteResult+= "<div class='eb_lists2'>";
							for(var i=0;i<data.ItemList.length;i++){
								voteResult+= "<h6>"+data.ItemList[i].vp_name+"&nbsp;&nbsp;&nbsp;<b>투표율&nbsp;</b>";
								voteResult+= data.ItemList[i].v_people/data.v_person*100+"%(총"+data.ItemList[i].v_people+"명 참여)</h6>";
							}
						}
						voteResult+= "</div><br/><br/>";
						$(".ebHtml").html(voteResult);
	                },
	                error:function(error){
	                    console.log(error);
	                }
	            });
			}
		}
			
		var voteComId = "${voteCom.m_id}";
		
		// 댓글쓰기
		function commentAjax(cb_index){
			console.log("비밀글 체크 : "+$("#secretChk").val());
			
			console.log("회원 구분 : "+sessionSort);
			
			$.ajax({
                type:"post",
                url:"commentAjax",
                data:{
                	cb_index : cb_index,
                	m_id : m_id,
                    co_content : $("#commText").val(),
                    secretChk : $("#secretChk").val()
                },
                dataType:"JSON",
                success:function(data){
                	console.log(data);
                	console.log(data.commList);
                	$("#commText").val("");
                	
                	
                	$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
    				$("#secretChk").val(0);
                	var commResult = "";	
                    if(data.commList != null){
           				commResult += "<h6><b>전체 댓글</b>&nbsp;"+data.commSum+"</h6>";
           				if(data.commList.length == 0){
           					$(".eb_commList").html();
           				}else{
           					commResult += "<div id='allComm'><br/>";
           					for(var i=0;i<data.commList.length;i++){
                   				
           						// 비밀글 체크 안했을 시
           						if(data.commList[i].secretChk == 0){
	                   				commResult += data.commList[i].m_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.commList[i].co_date+"<br/><br/>";
	                   				if(data.commList[i].m_id == m_id && sessionSort != 0){ // 글쓴 아이디와 로그인한 아이디가 같고 운영자가 아닐 때
	                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+")'/>";
		                   				/* commResult += "<input id='comUpdate' type='button' value='수정'/>"; */
	                   				}else if(data.commList[i].m_id != m_id && sessionSort != 0){ //글쓴 아이디와 로그인한 아이디가 다르고 운영자가 아닐 때
	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
	                   				}else if(sessionSort == 0){
	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
	                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+data.pageNum+")'/>";
	                   				}
	                   				commResult += data.commList[i].co_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>";
	                   				if(i !=data.commList.length-1){
	                   				commResult += "<br/><div id='eb_separate'></div><br/>";
	                   				}else{
            							commResult += "<br/>";	
            						}
	                   				
	                   			// 비밀글 체크 시
	                   			// 글쓴 아이디와 로그인한 아이디가 다를 때
                   				}else if(data.commList[i].secretChk == 1){
                   					if(data.commList[i].m_id != m_id && sessionSort != 0 && writeId != m_id){
                   						commResult += "<img src='resources/assets/img/vote/lock_gray.png' id='lockCom' class='lock2'/> &nbsp;&nbsp;";
                						commResult += "<p>작성자와 운영자만 볼 수 있는 비밀 댓글입니다.</p><br/>";
                						if(i !=data.commList.length-1){
                							commResult += "<div id='eb_separate'></div><br/>";	
                						}else{
                							commResult += "<br/>";	
                						}
                						
                   					}else if(data.commList[i].m_id == m_id || sessionSort == 0 || voteComId == sessionId){
                   						commResult += data.commList[i].m_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.commList[i].co_date;
                   						commResult += "&ensp;&ensp;<img src='resources/assets/img/vote/lock_gray.png' id='lockCom' class='locks'/><br/><br/>";
    	                   				if(data.commList[i].m_id == m_id && sessionSort != 0){ // 글쓴 아이디와 로그인한 아이디가 같고 운영자가 아닐 때
    	                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+")'/>";
    		                   				/* commResult += "<input id='comUpdate' type='button' value='수정'/>"; */
    	                   				}else if(data.commList[i].m_id != m_id && sessionSort != 0){ //글쓴 아이디와 로그인한 아이디가 다르고 운영자가 아닐 때
    	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
    	                   				}else if(sessionSort == 0){
    	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
		                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
    	                   				}
    	                   				commResult += data.commList[i].co_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>";
    	                   				if(i !=data.commList.length-1){
    	                   				commResult += "<br/><div id='eb_separate'></div><br/>";
    	                   				}else{
                							commResult += "<br/>";	
                						}
                   					}
                   				}
           					}
           					commResult += "</div>";
	                    	$(".eb_commList").html(commResult);
	                    	$("#paging").html(data.paging);
           				}
	                }else{
	                	console.log("댓글 실패");
	                }
				}, error:function(error){
                    console.log(error);
                }
            });
		}
	
		// 댓글 삭제
		function comDelete(co_index, cb_index,pageNum){
			if (confirm("정말 삭제하시겠습니까?")==true){
				var m_id = "${sessionScope.mb.m_id}";
				var sessionSort = "${sessionScope.mb.m_sort}";
				var sessionId = "${sessionScope.mb.m_id}";
				
				$.ajax({
	                type:"post",
	                url:"comDelete",
	                data:{
	                	co_index : co_index,
	                	cb_index : cb_index,
	                	pageNum : pageNum
	                },
	                dataType:"JSON",
	                success:function(data){
	                	console.log(data.commList);
	                	alert("댓글 삭제에 성공하였습니다.");
	                	$("#commText").val("");
	                	$("#lock_g").attr("src", "resources/assets/img/vote/lock_gray.png");
	    				$("#secretChk").val(0);
	                	var commResult = "";	
	                	if(data.commList != null){
	           				commResult += "<h6><b>전체 댓글</b>&nbsp;"+data.commSum+"</h6>";
	           				if(data.commList.length == 0 || data.commList == null){
	           					$(".eb_commList").html();
	           				}else{
	           					commResult += "<div id='allComm'><br/>";
	           					for(var i=0;i<data.commList.length;i++){               				
	                   				
	           					// 비밀글 체크 안했을 시
	           						if(data.commList[i].secretChk == 0){
		                   				commResult += data.commList[i].m_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.commList[i].co_date+"<br/><br/>";
		                   				if(data.commList[i].m_id == m_id && sessionSort != 0){ // 글쓴 아이디와 로그인한 아이디가 같고 운영자가 아닐 때
		                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
			                   				/* commResult += "<input id='comUpdate' type='button' value='수정'/>"; */
		                   				}else if(data.commList[i].m_id != m_id && sessionSort !=0){ //글쓴 아이디와 로그인한 아이디가 다르고 운영자가 아닐 때
		                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
		                   				}else if(sessionSort ==0){
		                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
		                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
    	                   				}
		                   				commResult += data.commList[i].co_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>";
		                   				if(i !=data.commList.length-1){
		                   				commResult += "<br/><div id='eb_separate'></div><br/>";
		                   				}else{
	            							commResult += "<br/>";	
	            						}
		                   				
		                   			// 비밀글 체크 시
		                   			// 글쓴 아이디와 로그인한 아이디가 다를 때
	                   				}else if(data.commList[i].secretChk == 1){
	                   					if(data.commList[i].m_id != m_id && sessionSort != 0 && writeId != m_id){ 
	                   						commResult += "<img src='resources/assets/img/vote/lock_gray.png' id='lockCom' class='lock2'/> &nbsp;&nbsp;";
	                						commResult += "<p>작성자와 운영자만 볼 수 있는 비밀 댓글입니다.</p><br/>";
	                						if(i !=data.commList.length-1){
	                							commResult += "<div id='eb_separate'></div><br/>";	
	                						}else{
	                							commResult += "<br/>";	
	                						}
	                   					}else if(data.commList[i].m_id == m_id || sessionSort == 0 || voteComId == sessionId){
	                   						commResult += data.commList[i].m_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.commList[i].co_date;
	                   						commResult += "&ensp;&ensp;<img src='resources/assets/img/vote/lock_gray.png' id='lockCom' class='locks'/><br/><br/>";
	    	                   				if(data.commList[i].m_id == m_id && sessionSort != 0){ // 글쓴 아이디와 로그인한 아이디가 같고 운영자가 아닐 때
	    	                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
	    		                   				/* commResult += "<input id='comUpdate' type='button' value='수정'/>"; */
	    	                   				}else if(data.commList[i].m_id != m_id && sessionSort !=0){ //글쓴 아이디와 로그인한 아이디가 다르고 운영자가 아닐 때
	    	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
	    	                   				}else if(sessionSort ==  0){
	    	                   					commResult += "<input id='comReport' type='button' value='신고' onclick=banWrite('"+data.commList[i].cb_index+"','"+data.commList[i].m_id+"','0')/>";
			                   					commResult += "<input id='comDelete' type='button' value='삭제' onclick='comDelete("+data.commList[i].co_index+","+data.commList[i].cb_index+","+pageNum+")'/>";
	    	                   				}
	    	                   				commResult += data.commList[i].co_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>";
	    	                   				if(i !=data.commList.length-1){
	    	                   				commResult += "<br/><div id='eb_separate'></div><br/>";
	    	                   				}else{
	                							commResult += "<br/>";	
	                						}
	                   					}
	                   				}
	                   			}
	           					commResult += "</div>";
		                    	$(".eb_commList").html(commResult);
		                    	$("#paging").html(data.paging);
	       					}
		                }else{
		                	console.log("댓글 실패");
		                	$(".eb_commList").html("");
		                	
		                }
	    			}, error:function(error){
	    				console.log("댓글 실패");
	    				alert("댓글 삭제에 실패하였습니다.");
	                }
	            });
			}else{
			   return;
			}
		}
		
		// alert
		var msg = "${param.msg}";
		if(msg != ""){
			alert(msg);
		}
	
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
	</script>
</html>