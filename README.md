# Hobbynew 

### 프로젝트 기획 <br/>
[소수의 취향.pdf](https://github.com/penpar/hobbynew/files/2129209/default.pdf)

### 주요 기술

• 검색 결과 데이터 요철 및 출력 : jQuery, Ajax, JSON <br/>
• 윕 화면 구성: HTML, CSS, BOOTSTRAP, javascript <br/>
• 결과를 얻기 위한 서버 처리 : JAVA, Servlet, JSP ,EL , XML <br/>
• 개발 환경 : Eclipse, Spring Tool Suite, Oracle, Apache Tomcat v8.5, SVN <br/> <br/>



### [ERD] DB 구조  <br/>

![erd_habby](https://user-images.githubusercontent.com/17943275/41738686-480a2376-7582-11e8-930f-ed815f1ca86c.png)

<br/>

### [JAVA pakage]

![JAVA_pakage](https://user-images.githubusercontent.com/17943275/41798811-9e9a15c0-765e-11e8-995d-e34adcbd249e.png)


### [작성한 XML]
#### NoteMapper.xml
~~~XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- NoteMapper.xml : 쪽지 관련 쿼리문 -->
<mapper namespace="icia.mvc.dao.INoteDAO">

	<!-- 쪽지 작성 -->
	<insert id="noteInsert" parameterType="icia.mvc.bean.Note">
		INSERT INTO NOTE VALUES(SEQ_NOTE.NEXTVAL, #{m_id}, #{m_id2}, #{n_state}, to_char(sysdate,'yyyy/mm/dd') ,#{n_subject}, #{n_content}, #{n_sort})
	</insert>
	
	<!-- 받은 쪽지 목록 -->
	<select id="getNoteList_0" parameterType="String" resultType="icia.mvc.bean.Note">
		SELECT N.N_INDEX, N.M_ID, N.M_ID2, N.N_STATE, TO_CHAR(N_DATE,'yyyy/mm/dd') AS N_DATE, N.N_SUBJECT, N.N_CONTENT
		FROM NOTE N
		WHERE m_id = #{id}
		order by N.N_INDEX DESC
	</select>
	
	<!-- 보낸 쪽지 목록 -->
	<select id="getNoteList_1" parameterType="String" resultType="icia.mvc.bean.Note">
		SELECT N.N_INDEX, N.M_ID, N.M_ID2, N.N_STATE, TO_CHAR(N_DATE,'yyyy/mm/dd') AS N_DATE, N.N_SUBJECT, N.N_CONTENT
		FROM NOTE N
		LEFT JOIN BLACKLIST B ON N.M_ID = B.M_ID2
		WHERE N.M_ID2 = #{id} AND B.M_ID2 IS NULL
		order by N.N_INDEX DESC
	</select>
	
	<!-- 보낸 쪽지 삭제 -->
	<delete id="noteDelete" parameterType="int">
		UPDATE NOTE SET N_STATE = '3' WHERE n_index = #{index}
	</delete>
	
	<!-- 쪽지 상세보기 -->
	<select id="noteDetail" parameterType="int" resultType="icia.mvc.bean.Note">
			SELECT * FROM NOTE WHERE n_index = #{index}
	</select>
	
	<!-- 쪽지 차단 (해당 아이디)-->
	<insert id="noteBlock" parameterType="map">
		INSERT INTO BlackList VALUES(#{M_ID}, #{M_ID2})
	</insert>
	
	<!-- 읽은 쪽지로 변경 -->
	<update id="noteWriteChange" parameterType="int">
		UPDATE NOTE SET N_SORT = '1' WHERE n_index = #{index}
	</update>
	
	<!-- 읽 쪽지 개수 -->
	<select id="noteCount" parameterType="String" resultType="int">
	SELECT count(N_SORT)
	FROM NOTE N
	LEFT JOIN BLACKLIST B ON N.M_ID = B.M_ID2
	WHERE N.M_ID2 = #{id} AND B.M_ID2 IS NULL AND n_sort = '0'
	</select>
	
	<!-- 쪽지 상태 확인 -->
	<select id="noteState" parameterType="icia.mvc.bean.Note">
		UPDATE NOTE SET N_STATE = #{n_state} WHERE n_index = #{n_index}
	</select>
	
	<!-- 자동 알림 쪽지 (마감 하루전)-->
	<select id="noteAuto" parameterType="String" resultType="String">
		SELECT C_SUBJECT FROM ATTENTION A
		LEFT JOIN CLASS C ON A.C_INDEX = C.C_INDEX
		WHERE C_STARTDAY = to_char(sysdate+1,'yyyy/mm/dd') AND A.M_ID = #{id}
	</select>
	
	<!-- 자동 알림 쪽지 아이디 체크 -->
	<select id = "noteCheck" parameterType="String" resultType="int">
		SELECT count(*) FROM NOTE
		WHERE M_id = 'admin' AND M_ID2 = 'aaaaaa' AND to_CHAR(N_DATE,'yyyy/mm/dd') = to_CHAR(sysdate,'yyyy/mm/dd')
	</select>
	
	<!-- 수신사 송신자 동일 ID인지 체크 -->
	<select id = "checkId" parameterType="String" resultType="int">
		SELECT count(*) FROM MEMBER
		WHERE M_ID = #{m_id2} 
	</select>
	
	<!-- 쪽지 상세보기 -->
	<select id = "noteM_id2" parameterType="int" resultType="Note">
		SELECT * FROM NOTE WHERE n_index = #{index}
	</select>
			
	<!-- 신고 작성  -->		
	<insert id = "banInsert" parameterType="Report">
		 INSERT INTO REPORT VALUES(SEQ_report.NEXTVAL,#{m_id},#{m_id2},#{rp_index},#{rp_sort},#{rp_reason},#{rp_content},to_char(sysdate,'yyyy/mm/dd'))
	</insert>	

</mapper>
~~~
#### mySpaceMapper.xml
~~~XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- mySpaceMapper.xml : 내공간 (장바구니, 즐겨찾기, 내가 쓴 글) -->
<mapper namespace="icia.mvc.dao.IMySpaceDAO" >
	
	<!-- 내가 쓴 글 리스트 -->
	<select id = "MyWriteList" parameterType="String" resultType="Board">
		SELECT * FROM COMBOARD WHERE m_id = #{id}
	</select>
	
	<!-- 클래스의 즐겨찾기 리스트 -->
	<select id = "MyBookList" parameterType="String" resultType="Board">
	    SELECT * FROM COMBOARD C
        RIGHT JOIN RECOMMAND R ON C.CB_INDEX = R.CB_INDEX
        WHERE R.M_ID = #{id}
	</select>
	
	<!-- 클래스의 미리보기 이미지 가져오기-->
	<select id="MyClassImg" parameterType="int" resultType="ClassBean">
		SELECT * FROM CLASS_VIEW2 WHERE C_INDEX=#{c_index}
	</select>
	
	<!-- 게시글 즐겨찾기 추가 -->
	<insert id="myBookIn" parameterType="map">
		INSERT INTO RECOMMAND VALUES(#{index},#{id},2)
	</insert>
	
	<!-- 게시글 즐겨찾기 삭제 -->
	<delete id = "myBookDel" parameterType="map">
		DELETE FROM RECOMMAND WHERE m_id = #{id} AND CB_INDEX = #{index}
	</delete>
	
	<!-- 클래스 장바구니 삭제 -->
	<delete id = "myClassDel" parameterType="map">
		DELETE FROM ATTENTION WHERE m_id = #{id} AND C_INDEX = #{index}
	</delete>
	
	<!-- 클래스 장바구니 리스트 -->
	<select id = "MyClassList" parameterType="String" resultType="ClassBean">
		SELECT C.C_INDEX, C.M_ID, C.C_SUBJECT, C.C_SIMPLECONTENT, C.C_MINPERSON, C.C_MAXPERSON, C.C_STARTDAY, C.C_ENDDAY, C.C_ADDRESS , C.C_PRICE, C.C_CONTENT, C.C_REFUND, C.C_STATUS, C.C_DATE FROM CLASS C
		LEFT JOIN ATTENTION A ON A.C_INDEX = C.C_INDEX
        WHERE A.m_id = #{id}
	</select>
	
	<select id = "MyWriteClassList" parameterType="String" resultType="ClassBean">
		SELECT * FROM Class WHERE m_id = #{id}
	</select>
	
	<select id = "MyClassEnrolled" parameterType="int" resultType="int">
	    SELECT COUNT(*) FROM Paylist WHERE C_INDEX= #{c_index}
	</select>
</mapper>

~~~
#### locationMapper.xml
~~~XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- locationMapper.xml : 위치 서비스 관련  -->
<mapper namespace="icia.mvc.dao.IlocationDAO">
	
	<!-- 등록된 클래스의 주소 가져오기 -->
	<select id="mmAdress" parameterType="String" resultType="String">
			SELECT M_ADDRESS FROM MEMBER WHERE m_id = #{id}
	</select>
	
	<!-- 해당 클래스의 정보 가져오기 -->	
	<select id="locatioInfo" resultType="classBean">
			SELECT * FROM CLASS
	</select>
	
	<!-- 등록된 클래스 필터 -->
	<select id="locSort" parameterType="int" resultType="classBean">	
			SELECT * FROM CLASS WHERE cn_index= #{sort}
	</select>
	</mapper>
~~~

#### paymentMapper.xml
~~~XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- paymentMapper.xml : 결제 관련 -->
<mapper namespace="icia.mvc.dao.IPaymentDAO">
	
	<!-- 결제 정보 가져오기 -->
	<select id="classPayment" parameterType="int" resultType="icia.mvc.bean.ClassBean">
		SELECT * FROM CLASS_VIEW2 WHERE C_INDEX=#{c_index}
	</select>
	
	<!-- PAYLIST에 결제 입력 -->
	<insert id="payInsert" parameterType="icia.mvc.bean.Pay">
		INSERT INTO PAYLIST VALUES(#{c_index},#{m_id},#{pl_pay},SYSDATE)
	</insert>
	
	<!-- 결제로 인한 포인트 감소 -->
	<update id = "pDecrease" parameterType="icia.mvc.bean.Member">
		UPDATE POINT
		SET P_POINT = (SELECT P_POINT FROM POINT WHERE M_ID=#{m_id}) - #{p_point}
		WHERE m_id = #{m_id}
	</update>
	
	<!-- 환불로 인한 포인트 증가 -->
	<update id = "pIncrease" parameterType="icia.mvc.bean.Member">
		UPDATE POINT
		SET P_POINT =(SELECT P_POINT FROM POINT WHERE M_ID=#{m_id}) + #{p_point}
		WHERE m_id = #{m_id}
	</update>
	
	<!-- 환불 -->
	<insert id="payDelete" parameterType="icia.mvc.bean.Member">
		DELETE FROM PAYLIST WHERE C_INDEX = #{c_index} AND M_ID=#{m_id} 
	</insert>
	
	<!-- 결제 리스트 불러오기 -->
	<select id="payList" parameterType="icia.mvc.bean.Pay" resultType="icia.mvc.bean.Pay">
		SELECT * from PAYLIST WHERE C_INDEX = #{c_index} AND M_ID=#{m_id} 
	
	</select>
</mapper>
~~~





