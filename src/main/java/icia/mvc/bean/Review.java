package icia.mvc.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class Review {
	private int re_index; // 후기 번호
	private int c_index; // 클래스 번호
	private String m_id; // 작성자
	private String re_subject; // 제목
	private String re_content; // 내용
	private Date re_date; // 작성일
	private String re_mainImg; // 대표 이미지 파일 이름
	private int re_addPoint; // 결제 시 얻는 포인트 (결제 금액의 2%)
	private String a_rate; // 평점
	private String rf_oriName;
	private String rf_newName;
	
	public int getRe_index() {
		return re_index;
	}
	public void setRe_index(int re_index) {
		this.re_index = re_index;
	}
	public int getC_index() {
		return c_index;
	}
	public void setC_index(int c_index) {
		this.c_index = c_index;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRe_subject() {
		return re_subject;
	}
	public void setRe_subject(String re_subject) {
		this.re_subject = re_subject;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getRe_mainImg() {
		return re_mainImg;
	}
	public void setRe_mainImg(String re_mainImg) {
		this.re_mainImg = re_mainImg;
	}
	public int getRe_addPoint() {
		return re_addPoint;
	}
	public void setRe_addPoint(int re_addPoint) {
		this.re_addPoint = re_addPoint;
	}
	public String getA_rate() {
		return a_rate;
	}
	public void setA_rate(String a_rate) {
		this.a_rate = a_rate;
	}
	public String getRf_oriName() {
		return rf_oriName;
	}
	public void setRf_oriName(String rf_oriName) {
		this.rf_oriName = rf_oriName;
	}
	public String getRf_newName() {
		return rf_newName;
	}
	public void setRf_newName(String rf_newName) {
		this.rf_newName = rf_newName;
	}
}