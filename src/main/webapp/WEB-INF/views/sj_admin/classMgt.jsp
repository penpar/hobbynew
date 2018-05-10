<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="resources/js/jquery-3.2.1.js"></script>
		<title>소수의 취향</title>
		<style>
			body{
				font-family: 'Nanum Square';
				font-size:18px;
			}
			
			#cnListTB{
			    position: relative;
			    /* left: 35%; */
			    width: 40%;
			    text-align: center;
			    margin: 0 auto;
			}
			
			#cnListDiv{
				text-align: center;
			}
			/* #classAddInput{
				position: relative;
				left: 35%;
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
			
			td{
				text-align: left;
				padding: 14px 20px !important;
			}
			
			#eb_btn{
			    width: 130px;
			    height: 40px;
			    border-radius: 7px;
			    line-height: 40px;
			    margin: 0 auto;
			}
			
			#eb_btn:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 130px;
				height: 40px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 40px;
			    margin: 0 auto;
			}
		</style>
	</head>
	<script type="text/javascript">
		var flag = "${flag}";
		console.log(flag);
	</script>
	<body>
		<!-- header -->
		<jsp:include page="../loginBox.jsp"/>
		<!-- 여백 -->
		<div id="eb_blank"></div>
		
		<div id = "second_subject" align="center">
			<h1>클래스 관리</h1>
			<p>클래스를 추가하거나 삭제할 수 있습니다.</p>
		</div>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
		<br/>
		
		<div id="cnListDiv">
			<table id="cnListTB">
			<c:forEach items="${ClassNameList}" var="cnList">
				<tr>
					<td>
						<b>${cnList.rnum}</b>
					</td>
					<td>
						${cnList.cn_name}
					</td>
					<td>
						 <a href="javascript:classDel('${cnList.cn_name}')">삭제</a>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="2">
						<input type="text" id="classAddInput" name="classAddName" placeholder="대분류 명">
					</td>
					<td>
						<a href="javascript:classAdd()">추가</a>
					</td>
				</tr>
				<c:if test="${error != null}">
				<tr>
					<td colspan="3">${error}</td>
				</tr>
				</c:if>
			</table><br/>
			<a href="adminMain" class="button" id="eb_btn">관리자 페이지</a>
		</div>
	</body>
	<script>
		/* $(document).onload(function () {
			if(${add} != null){
				if(${add} == "1"){
			}
		} */
		function classAdd() {
			var cn_name = $("#classAddInput").val();
			console.log(cn_name);
			location.href="cnAdd?cn_name="+cn_name;
		}
		
		function classDel(cn_name) {
			console.log(cn_name);
			if(confirm("삭제하시겠습니까?")){
				location.href="cnDel/"+cn_name;
			}
		}
		
		/* var msg = "${error}";
		if(msg != ""){
			alert(msg);
			location.href="classMgt";
		} */
		
		/* function classAdd(){
	        $.ajax({
	            type:'post',
	            url:'cnAdd',
	            data:{
	            	cn_name:$("#classAddInput").val()
	            },
	            dataType:'json',
	            success:function(data){
	                console.log(data.cnList);
	            },
	            error:function(error){
	                console.log(error);
	            }
	        });
		} */		
	</script>
</html>