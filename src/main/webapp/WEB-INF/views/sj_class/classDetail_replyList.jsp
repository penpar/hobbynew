<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 댓글 입력 -->	
<br/>
<div id = "second_subject" align="center" style="left: 30%;">
	<h3>댓글</h3>
	<p>댓글을 남겨주세요</p>
</div>
<br/>
<div id="eb_separate"></div>
<br/><br/>
<div id="comments">
	<textarea name="co_content" cols="30" rows="3" placeholder="* 댓글은 1000자까지 입력하실 수 있습니다." style="resize:none;"
	onKeyUp="checkLength(this);" onKeyDown="checkLength(this);" id="commText"></textarea>
	<img src="resources/assets/img/vote/lock_gray.png" id="lock_g" class="lock"/><br/> &nbsp;&nbsp;
	<input type="hidden" value="0" id="secretChk"/> <!-- 비밀글 체크(0/1) -->
	<input type="button" onclick="commentAjax(${param.c_index})" value="확인" id="commentAjax"/><!-- 댓글 ajax 호출 -->
</div>
<br/>

<!-- 댓글 리스트 -->
<div class="eb_commList">
	<c:if test="${classReplyList != '[]'}"> <!-- 댓글이 있을 경우 -->
		<h6><b>전체 댓글</b></h6>
		<div id="allComm"><br/>
			<c:forEach items="${classReplyList}" var="crList">
					<!-- 비밀 댓글이 아닐 경우 -->
					<c:if test="${crList.secretChk == 0}">
						${crList.m_id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${crList.cr_date}<br/><br/>
						<div style="position: relative;top: -57px;">
						<c:if test="${crList.m_id == sessionScope.mb.m_id || sessionScope.mb.m_sort == 0}">
							<input id="comDelete" type="button" value="삭제" onclick="comDelete(${crList.cr_index}, ${crList.c_index}, ${pageNum})"/>
							<!-- <input id="comUpdate" type="button" value="수정"/> -->
						</c:if>
						<c:if test="${crList.m_id != sessionScope.mb.m_id}">
							<input id='comReport' type='button' value='신고'  onclick="location.href='banWrite?sort=6&m_id2=${crList.m_id}&index=${crList.cr_index}&c_index=${param.c_index}'"/>
						</c:if>
						</div>
						${crList.cr_content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
						<br/><div id="eb_separate"></div><br/> <!-- 구분선 -->
					</c:if>
					
					<!-- 비밀 댓글일 경우 -->
					<c:if test="${crList.secretChk == 1}">
						<c:if test="${crList.m_id != sessionScope.mb.m_id && sessionScope.mb.m_sort != 0}">
							<img src="resources/assets/img/vote/lock_gray.png" id="lockCom" class="lock"/>
							<p>작성자와 운영자만 볼 수 있는 비밀 댓글입니다.</p>
							<div id='eb_separate'></div><br/>
						</c:if>
						
						<c:if test="${crList.m_id == sessionScope.mb.m_id || sessionScope.mb.m_sort == 0}">
							${crList.m_id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${crList.cr_date}
							<img src="resources/assets/img/vote/lock_gray.png" id="lockCom" class="locks"/>
							<br/><br/>
							<div style="position: relative;top: -57px;">
							<c:if test="${crList.m_id == sessionScope.mb.m_id || sessionScope.mb.m_sort == 0}">
								<input id="comDelete" class="btn9" type="button" value="삭제" onclick="comDelete(${crList.cr_index}, ${crList.c_index}, ${pageNum})"/>
								<!-- <input id="comUpdate" type="button" value="수정"/> -->
							</c:if>
							<c:if test="${crList.m_id != sessionScope.mb.m_id}">
								<input id='comReport' class="btn9" type='button' value='신고'  onclick="location.href='banWrite?sort=6&m_id2=${crList.m_id}&index=${crList.cr_index}&c_index=${param.c_index}'"/>
							</c:if>
							</div>
							${crList.cr_content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
							<br/><div id="eb_separate"></div><br/> <!-- 구분선 -->
						</c:if>
					</c:if>
				</c:forEach>
		</div>
	</c:if>
	<c:if test="${classReplyList == '[]'}"> <!-- 댓글이 없을 경우 -->
		댓글이 없습니다.
	</c:if>
	<c:if test="${classReplyList != '[]'}"> <!-- 댓글이 있을 경우 -->
		<div id="paging">
			${paging}
		</div>
	</c:if>
</div><br/>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
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
	
</script>