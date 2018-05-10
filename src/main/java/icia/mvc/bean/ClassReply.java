package icia.mvc.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("classReply")
public class ClassReply {
	private int cr_index; // 댓글 번호
	private int c_index; // 클래스 번호
	private String m_id; // 작성자
	private String cr_content; // 내용
	private Date cr_date; // 작성일
	private int secretChk; // 비밀글 아닐경우 : 0 // 비밀글 일 경우 : 1
	private int pageNum;
	
	public int getCr_index() {
		return cr_index;
	}
	public void setCr_index(int cr_index) {
		this.cr_index = cr_index;
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
	public String getCr_content() {
		return cr_content;
	}
	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}
	public Date getCr_date() {
		return cr_date;
	}
	public void setCr_date(Date cr_date) {
		this.cr_date = cr_date;
	}
	public int getSecretChk() {
		return secretChk;
	}
	public void setSecretChk(int secretChk) {
		this.secretChk = secretChk;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
}