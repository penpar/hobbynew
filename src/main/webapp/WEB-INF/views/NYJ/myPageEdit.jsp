<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>소수의 취향</title>
		<script src="resources/js/jquery-2.1.1.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<style>
			#header .links ul li{
	         	line-height: 1;
	     	}
	     	
	     	#eb_blank{
				width: 20px;
				height: 120px;
				display: hidden;
			}
			
			#tables{
				width: 60%;
	     		margin: 0 auto;
			}
			
			#findAddress{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 90px;
				border-radius: 7px;
				float:right;
			    line-height: 3px;
		        margin: 10px 0px 1px 0px;
			}
			
			#findAddress:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 90px;
				border-radius: 7px;
				color: #ff9a2e;
				float:right;
				border-color: #ff9a2e;
			    line-height: 3px;
		        margin: 10px 0px 1px 0px;
			}
			
			#middle{
				position: relative;
			    /* margin: 0 auto; */
			    left: 50%;
			    transform: translateX(-7%);
			}
			
			#middle input[type="button"]{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 85px;
				border-radius: 7px;
			    line-height: 3px;
			}
			
			#middle input[type="button"]:hover{
				/* position: relative;
				top:28%;
				left:47%; */
				width: 85px;
				border-radius: 7px;
				color: #ff9a2e;
				border-color: #ff9a2e;
			    line-height: 3px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../loginBox.jsp"></jsp:include>
		
		<!-- 여백 -->
		<div id="eb_blank"></div>
	
		<div id = "second_subject" align="center">
			<h2>My Page</h2>
			<p>수정할 내용을 입력해주세요.</p>
		</div>
		<div id="eb_blank"></div>
	
		<form id="myPageForm" name="myPageForm" action="mp_MyInfoChange">
			<table id="tables">
					<tr>
						<td>아이디<input type="hidden" id="m_id" name="m_id" value="${sessionScope.mb.m_id}"></td>
						<td>${sessionScope.mb.m_id}</td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input type="text" id="m_name" name="m_name" value="${sessionScope.mb.m_name}"></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td><input type="text" id="m_email" name="m_email" value="${sessionScope.mb.m_email}"></td>
					</tr>
					
					<tr>
						<td>연락처</td>
						<td><input type="text" id="m_phone" name="m_phone" value="${sessionScope.mb.m_phone}"></td>
					</tr>
					
					<tr>
						<td>주소</td>
						<td><input type="text" id="m_addr" name="m_addr" value="${sessionScope.mb.m_addr}" style="margin: 8px 0px;" readonly><!-- <br/> -->
						<input type="text" id="m_detailAddress" name="m_detailAddress" value="${sessionScope.mb.m_detailAddress}">
						<input type="button" onclick="postcodeFind()" value="주소 찾기" id="findAddress"></td>
					</tr>

					<tr>
						<td>포인트</td>
						<td>${sessionScope.mb.p_point}</td>
					</tr>
			</table>
			<br/>
			<div id="middle">
				<input type="button"  onclick="nyEdit()"value="수정완료">
				<input type="button"  onclick="nyComeback()" value="취소">
			</div>
		</form>
	</body>
	<script>
	var nameEmpty = false;//이름 공백 체크
	var emailEmpty = false;//이메일 공백 체크
	var phoneEmpty = false;//휴대폰 공백 체크
	var detailAddrEmpty = false;//상세 주소 공백체크
	
	var nameChk = false;//이름 유효성 체크
	var emailChk = false;//이메일 유효성 체크
	var phoneChk = false;//핸드폰 유효성 체크
	
	var namec = /^[가-힝]{2,}$/;	//이름 유효성
	var emailc = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;	//이메일 유효성
	var phonec = /^[0-9]{10,11}$/;	//휴대폰 유효성
	
	
	//수정완료 버튼 클릭 시
	function nyEdit(){
		
		
		
		if($('#m_name').val()==""){
			nameEmpty=false;
			
		}else if($('#m_name').val()!=""){
				if(!namec.test($('#m_name').val())){
					nameChk=false;
				}else{
					nameChk=true;
				}
			nameEmpty=true;
			
		}
		
		if($('#m_email').val()==""){
			emailEmpty=false;
		}else if($('#m_email').val()!=""){
			if(!emailc.test($('#m_email').val())){
				emailChk=false;
			}else{
				emailChk=true;
			}
			emailEmpty=true;
		}
		
		
		if($('#m_phone').val()==""){
			phoneEmpty=false;
		}else if($('#m_phone').val()!=""){
			if(!phonec.test($('#m_phone').val())){
				phoneChk=false;
			}else{
				phoneChk=true;
			}
			phoneEmpty=true;
		}
		
		
		if($('#m_detailAddress').val()==""){
			detailAddrEmpty=false;
		}else if($('#m_detailAddress').val()!=""){
			detailAddrEmpty=true;
		}
		
		
		
		//전체 유효성
		
		if(nameEmpty==false){
			alert("이름을 입력해주세요");
		}else if(nameChk==false){
			alert("이름은 2~10자 한글이여야합니다");
		}else if(emailEmpty==false){
			alert("이메일을 입력해주세요");
		}else if(emailChk==false){
			alert("이메일 형식이 올바르지 않습니다");
		}else if(phoneEmpty==false){
			alert("휴대폰 번호를 입력해주세요");
		}else if(phoneChk==false){
			alert("휴대폰 번호는 '-'를 제외한 10자리 or 11자리 숫자이여야 합니다.");
		}else if(detailAddrEmpty==false){
			alert("상세주소를 입력해주세요");
		}else{
			if(confirm("수정된 정보로 변경하시겠습니까?")==true){
				console.log("submit");
				$("#myPageForm").submit();
			}else{
				return;
			}
		}
		
		
		
		
	}//수정완료 버튼 클릭 시 nyEdit End
	
	//취소 버튼 클릭 시
	function nyComeback(){
		if(confirm("수정을 취소하시겠습니까?")==true){
			location.href="backMyPage"
		}else{
			return;
		}
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


                document.getElementById('m_addr').value = fullAddr;
                document.getElementById('m_detailAddress').focus();
            }
        }).open();
    }//주소 검색 End
	
	</script>
</html>