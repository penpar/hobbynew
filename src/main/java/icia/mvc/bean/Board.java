package icia.mvc.bean;

public class Board {
	int cb_index;
	String m_id;
	String cb_subject;
	String cb_content;
	int cb_click;
	String cb_date;
	int cb_sort;
	int fs_index;
	String f_oriName;
	String f_newName;
	
	private String q_type;
	
	public int getCb_index() {
		return cb_index;
	}
	public void setCb_index(int cb_index) {
		this.cb_index = cb_index;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getCb_subject() {
		return cb_subject;
	}
	public void setCb_subject(String cb_subject) {
		this.cb_subject = cb_subject;
	}
	public String getCb_content() {
		return cb_content;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public int getCb_click() {
		return cb_click;
	}
	public void setCb_click(int cb_click) {
		this.cb_click = cb_click;
	}
	public String getCb_date() {
		return cb_date;
	}
	public void setCb_date(String cb_date) {
		this.cb_date = cb_date;
	}
	public int getCb_sort() {
		return cb_sort;
	}
	public void setCb_sort(int cb_sort) {
		this.cb_sort = cb_sort;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public int getFs_index() {
		return fs_index;
	}
	public String getF_oriName() {
		return f_oriName;
	}
	public String getF_newName() {
		return f_newName;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}
	public void setF_oriName(String f_oriName) {
		this.f_oriName = f_oriName;
	}
	public void setF_newName(String f_newName) {
		this.f_newName = f_newName;
	}
	
}
