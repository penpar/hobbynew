<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<img class='removeImg' src='resources/assets/img/vote/remove.png' onclick="close()"/>
<div id="freeListTableDiv" style="width: 86%; margin: 0 auto;">
	<div class="classify_top">
		<div class="classify_middle2" style="float:left;text-align:left;">
			<p><b>아이디</b>&ensp;&ensp;${judgeDetail[0].m_id}</p>
		</div>
		<div class="classify_middle2">
			<p><b>이름</b>&ensp;&ensp;${judgeDetail[0].m_name}</p>
		</div>
		<div class="classify_middle2">
			<p><b>성별</b>&ensp;&ensp;${judgeDetail[0].m_gender}</p>
		</div>
	</div>
	<div class="classify_top">
		<div class="classify_middle">
			<p><b>가입날짜</b>&ensp;&ensp;</p>
		</div>
		<div class="classify_middle" style="float:left;text-align:left;">
			<p>${judgeDetail[0].m_year}&ensp;&ensp;<b>(년)</b></p>
		</div>
		<div class="classify_middle">
			<p>${judgeDetail[0].m_month}&ensp;&ensp;<b>(월)</b></p>
		</div>
		<div class="classify_middle">
			<p>${judgeDetail[0].m_day}&ensp;&ensp;<b>(일)</b></p>
		</div>
	</div>
	<div class="classify_top">
		<div class="classify_middle">
			<p><b>생년월일</b>&ensp;&ensp;</p>
		</div>
		<div class="classify_middle" style="float:left;text-align:left;">
			<p>${judgeDetail[0].b_year}&ensp;&ensp;<b>(년)</b></p>
		</div>
		<div class="classify_middle">
			<p>${judgeDetail[0].b_month}&ensp;&ensp;<b>(월)</b></p>
		</div>
		<div class="classify_middle">
			<p>${judgeDetail[0].b_day}&ensp;&ensp;<b>(일)</b></p>
		</div>
	</div>
	<div class="classify_top">
		<div class="classify_middle3">
			<p><b>이메일</b>&ensp;&ensp;${judgeDetail[0].m_email}</p>
		</div>
	</div>
	<div class="classify_top">
		<div class="classify_middle3">
			<p><b>주소</b>&ensp;&ensp;${judgeDetail[0].m_address}</p>
		</div>
	</div>
	<div class="classify_top" style="border-bottom: 0;">
		<div class="classify_middle3" style="float:left;text-align:left;">
			<p>
				<b>자료 다운로드</b>&ensp;&ensp;
				<c:if test="${judgeDetail[0].f_newName != null}">
					<a href="joinFileDown?f_newName=${judgeDetail[0].f_newName}&f_oriName=${judgeDetail[0].f_oriName}&fs_index=${judgeDetail[0].fs_index}">${judgeDetail[0].f_newName}</a>
				</c:if>
				<c:if test="${judgeDetail[0].f_newName == null}">
					없음
				</c:if>
			</p>
		</div>
	</div>
	<div id="eb_separate"></div>
	<div class="classify_top" style="border-bottom: 0; margin: 0px 0px 10px 0px;">
		<div class="classify_middle3">
			<p><b>자기소개</b>&ensp;&ensp;${judgeDetail[0].m_intro}<br/></p>
		</div>
	</div>
	<div id="buttons_location" style="width: 30%; margin: 0 auto;">
		<input type="button" class="eb_btn" onclick="joinConfirm('${judgeDetail[0].m_id}', 0)" value="승인" style="left: 0px; width: 65px;">
		<input type="button" class="eb_btn" onclick="joinConfirm('${judgeDetail[0].m_id}', 1)" value="거절" style="left: 0px; width: 65px;">
	</div>
	<br/>
</div>
<script>
	$(".removeImg").click(function () {
		$(".eb_popup").css("display", "none");
	});
</script>