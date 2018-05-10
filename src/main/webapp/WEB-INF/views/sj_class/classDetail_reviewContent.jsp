<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/assets/js/jquery.min.js"></script>
<br/>
<c:if test="${sessionScope.mb != null}">
	<input type="button" id="reviewWriteBtn" value="후기 쓰기" onclick="location.href='reviewWriteForm?c_index=${param.c_index}'" style="float: right;">
</c:if>
<div id = "second_subject" align="center" style="left: 30%;">
	<h3>후기</h3>
	<p>자신만의 후기를 남겨보세요!</p>
</div>
<br/>
<div id="eb_separate"></div>
<br/>
<br/>
<c:if test="${reviewList == null}">
<div>
	후기가 없습니다.
</div>
</c:if>
<c:if test="${reviewList != null}">
<c:forEach items="${reviewList}" var="rList">
	<div class="reviewDiv">
		<div class="button_loc">
			<c:if test="${rList.m_id == sessionScope.mb.m_id}">
				<input type="button" onclick="reviewUpdate('${rList.c_index}', '${rList.re_index}')" value="수정">
				<input type="button" onclick="reviewDel('${rList.c_index}', '${rList.re_index}')" value="삭제">
			</c:if>
			<c:if test="${sessionScope.mb != null}">
				<c:if test="${rList.m_id != sessionScope.mb.m_id}">
					<input type="button" onclick="location.href='banWrite?sort=5&m_id2=${rList.m_id}&index=${rList.re_index}&c_index=${param.c_index}'" value="신고">
				</c:if>
			</c:if>
		</div>
		<c:if test="${rList.rf_newName != null}">
			<div class="review_img">
				<img src="${path}${rList.rf_newName}">
			</div>
		</c:if>
		<c:if test="${rList.rf_newName == null}">
			<div class="review_img">
				<img src="resources/sj/no_Image.png">
			</div>
		</c:if>
		<div class="review_body">
			<c:choose>
				<c:when test="${rList.a_rate == 5}">
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
				</c:when>
				<c:when test="${rList.a_rate == 4}">
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
				</c:when>
				<c:when test="${rList.a_rate == 3}">
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
				</c:when>
				<c:when test="${rList.a_rate == 2}">
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
				</c:when>
				<c:when test="${rList.a_rate == 1}">
					<img class="star" src="resources/sj/star_toggle(yellow).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
				</c:when>
				<c:otherwise>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
					<img class="star" src="resources/sj/star_toggle(white).png"/>
				</c:otherwise>
			</c:choose>
			<br/>
			작성자 : ${rList.m_id}<br/>			
			제목 : ${rList.re_subject}<br/>
			내용 : ${rList.re_content}<br/>
			작성일 : ${rList.re_date}<br/>
		</div>
	</div>
	<br/>
	<br/>
	<div class="eb_separate"></div>
	<br/>
	<br/>
</c:forEach>
</c:if>