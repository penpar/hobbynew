<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<div class="eb_points">
		<p style="display:inline;"><b>결제 금액</b>&ensp;&ensp;${mainContent.c_price} 원 &ensp;&ensp;&ensp;|&ensp;&ensp;&ensp;
		<b>적립 포인트</b>&ensp;&ensp;${mainContent.c_addPoint} P</p>
		<input type="hidden" id="pChks" value="${pListChk}"/>
		<c:if test="${pListChk == 0}">
			<input type="button" class="eb_btn2" onclick="location.href='classPayment?c_index=${mainContent.c_index}'"
			value="신청하기" style="margin: 0px 0px 0px 0px;display: inline;">
		</c:if>
		<c:if test="${pListChk == 1}">
			<input type="button" class="eb_btn2"  onclick="location.href='payCancelForm?c_index=${mainContent.c_index}'"
			value="환불하기" style="margin: 0px 0px 0px 0px;display: inline;">
		</c:if>
	</div>
	
	<div class="eb_points">
		<p style="display:inline;"><b>모집기간</b>&ensp;&ensp;${mainContent.c_startDay}&nbsp; ∼ &nbsp;${mainContent.c_endDay}</p>
		 &ensp;&ensp;&ensp;|&ensp;&ensp;&ensp;
		<c:if test="${mainContent.m_id == sessionScope.mb.m_id}"> <!-- 해당 클래스의 판매자일 경우 버튼으로 변경 -->
			<input type="button" class="eb_btn" value="신청 인원  ${mainContent.c_count} / ${mainContent.c_maxPerson}"
			onclick="joinListPopup(${mainContent.c_index})" style="margin: 0px 0px 0px 0px;display: inline;">
		</c:if>
		<c:if test="${mainContent.m_id != sessionScope.mb.m_id}"> <!-- 판매자가 아닐 경우 텍스트 -->
			&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
			<b>신청 인원</b>&ensp;&ensp;(${mainContent.c_count} / ${mainContent.c_maxPerson})
		</c:if>
	</div>
	
	<div class="eb_points">
		<p style="display:inline;"><b>작성자</b>&ensp;&ensp;${mainContent.m_id}</p>
		<c:if test="${sessionScope.mb != null}">
			<c:if test="${mainContent.m_id != sessionScope.mb.m_id}">
				<input type="button" id="questionBtn" onclick="question('${mainContent.m_id}')"
				value="판매자에게 문의하기" style="margin: 0px 0px 0px 0px;display: inline;">
			</c:if>
		</c:if>
	</div>
	<div class="eb_points2">
		<h4>판매자 자기소개</h4>
		<p>${mainContent.m_intro}</p>
	</div>
	<table>
		<tr>
			<c:if test="${mainContent.c_explainImg.size() > 0 }">
			<tr style="text-align: center;">
				<td colspan="2" style="text-align: center;">
					<br/><h4>상세 설명</h4><br/><br/>
				<c:forEach items="${mainContent.c_explainImg}" var="exList">
					<img class="explainImg" src="/HNresources/uploadFolder/resources/hobbyClass/${exList}">
				</c:forEach>
				</td>
			</tr>
			</c:if>
			<br/><br/>
		</tr>
	</table>
	<div class="eb_points2">
		<h6>${mainContent.c_content}</h6>
	</div>
	<div id="eb_blank"></div><br/><br/>