package icia.mvc.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("question")
public class Question {
	private int cb_index;
	private String m_id;
	private String cb_subject;
	private int cb_click;
	private String cb_content;
	private Date cb_date;
	private int cb_sort;	
	private  String q_type;
	
	public int getCb_index() {
		return cb_index;
	}
	public String getM_id() {
		return m_id;
	}
	public String getCb_subject() {
		return cb_subject;
	}
	public int getCb_click() {
		return cb_click;
	}
	public String getCb_content() {
		return cb_content;
	}
	public Date getCb_date() {
		return cb_date;
	}
	public int getCb_sort() {
		return cb_sort;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setCb_index(int cb_index) {
		this.cb_index = cb_index;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setCb_subject(String cb_subject) {
		this.cb_subject = cb_subject;
	}
	public void setCb_click(int cb_click) {
		this.cb_click = cb_click;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public void setCb_date(Date cb_date) {
		this.cb_date = cb_date;
	}
	public void setCb_sort(int cb_sort) {
		this.cb_sort = cb_sort;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	
}
