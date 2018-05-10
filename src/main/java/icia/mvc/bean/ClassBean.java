package icia.mvc.bean;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("classBean")
public class ClassBean {
	private int c_index; // 클래스 번호
	private int cn_index; // 대분류 번호
	private String cn_name; // 대분류 이름
	private String m_id; // 작성자
	private String c_subject; // 제목
	private String c_simpleContent; // 간단한 설명
	private int c_minPerson; // 최소 참여인원
	private int c_maxPerson; // 최대 참여인원
	private String cs_year; // 시작 년도
	private String cs_month; // 시작 달
	private String cs_day; // 시작 일
	private String ce_year; // 종료 년도
	private String ce_month; // 종료 달
	private String ce_day; // 종료 일
	private Date c_startDay; //시작일 Date 형식으로 바꾼것
	private Date c_endDay; // 종료일 Date 형식으로 바꾼것
	private String c_mainAddr; // api 주소
	private String c_detailAddr; // 상세 주소
	private String c_address; // 합친 주소
	private int c_price; // 가격
	private String c_content; // 내용
	private String c_refund; // 환불정책
	private String c_status; // 진행상태
	private String ch_voteUrl; // 투표 url
	private Date c_date; // 작성일
	private String c_mainImg; // 대표 이미지 파일 이름
	private List<String> c_explainImg; // 상세 설명 파일 이름
	private String c_planDocument; // 기획서
	private String c_career; // 경력사항 및 자격증
	private String c_placeImg; //모임장소 사진
	private int c_count; // 신청자 수
	private int c_addPoint; // 결제 시 얻는 포인트 (결제 금액의 2%)
	private String m_intro; // 판매자 자기소개
	
	public int getC_index() {
		return c_index;
	}
	public void setC_index(int c_index) {
		this.c_index = c_index;
	}
	public int getCn_index() {
		return cn_index;
	}
	public void setCn_index(int cn_index) {
		this.cn_index = cn_index;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getC_subject() {
		return c_subject;
	}
	public void setC_subject(String c_subject) {
		this.c_subject = c_subject;
	}
	public String getC_simpleContent() {
		return c_simpleContent;
	}
	public void setC_simpleContent(String c_simpleContent) {
		this.c_simpleContent = c_simpleContent;
	}
	public int getC_minPerson() {
		return c_minPerson;
	}
	public void setC_minPerson(int c_minPerson) {
		this.c_minPerson = c_minPerson;
	}
	public int getC_maxPerson() {
		return c_maxPerson;
	}
	public void setC_maxPerson(int c_maxPerson) {
		this.c_maxPerson = c_maxPerson;
	}
	public Date getC_startDay() {
		return c_startDay;
	}
	public void setC_startDay(Date c_startDay) {
		this.c_startDay = c_startDay;
	}
	public Date getC_endDay() {
		return c_endDay;
	}
	public void setC_endDay(Date c_endDay) {
		this.c_endDay = c_endDay;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_refund() {
		return c_refund;
	}
	public void setC_refund(String c_refund) {
		this.c_refund = c_refund;
	}
	public String getC_status() {
		return c_status;
	}
	public void setC_status(String c_status) {
		this.c_status = c_status;
	}
	public String getCh_voteUrl() {
		return ch_voteUrl;
	}
	public void setCh_voteUrl(String ch_voteUrl) {
		this.ch_voteUrl = ch_voteUrl;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_mainImg() {
		return c_mainImg;
	}
	public void setC_mainImg(String c_mainImg) {
		this.c_mainImg = c_mainImg;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public String getC_planDocument() {
		return c_planDocument;
	}
	public void setC_planDocument(String c_planDocument) {
		this.c_planDocument = c_planDocument;
	}
	public String getC_career() {
		return c_career;
	}
	public void setC_career(String c_career) {
		this.c_career = c_career;
	}
	public String getC_placeImg() {
		return c_placeImg;
	}
	public void setC_placeImg(String c_placeImg) {
		this.c_placeImg = c_placeImg;
	}
	public int getC_addPoint() {
		return c_addPoint;
	}
	public void setC_addPoint(int c_addPoint) {
		this.c_addPoint = c_addPoint;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public List<String> getC_explainImg() {
		return c_explainImg;
	}
	public void setC_explainImg(List<String> c_explainImg) {
		this.c_explainImg = c_explainImg;
	}
	public String getC_mainAddr() {
		return c_mainAddr;
	}
	public void setC_mainAddr(String c_mainAddr) {
		this.c_mainAddr = c_mainAddr;
	}
	public String getC_detailAddr() {
		return c_detailAddr;
	}
	public void setC_detailAddr(String c_detailAddr) {
		this.c_detailAddr = c_detailAddr;
	}
	public String getCs_year() {
		return cs_year;
	}
	public void setCs_year(String cs_year) {
		this.cs_year = cs_year;
	}
	public String getCs_month() {
		return cs_month;
	}
	public void setCs_month(String cs_month) {
		this.cs_month = cs_month;
	}
	public String getCs_day() {
		return cs_day;
	}
	public void setCs_day(String cs_day) {
		this.cs_day = cs_day;
	}
	public String getCe_year() {
		return ce_year;
	}
	public void setCe_year(String ce_year) {
		this.ce_year = ce_year;
	}
	public String getCe_month() {
		return ce_month;
	}
	public void setCe_month(String ce_month) {
		this.ce_month = ce_month;
	}
	public String getCe_day() {
		return ce_day;
	}
	public void setCe_day(String ce_day) {
		this.ce_day = ce_day;
	}
	public String getCn_name() {
		return cn_name;
	}
	public void setCn_name(String cn_name) {
		this.cn_name = cn_name;
	}
}