package icia.mvc.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("report")
public class Report {
	private int rp_num;
	private String m_id;
	private String m_id2;
	private int rp_index;
	private int rp_sort;
	private String rp_reason;
	private String rp_content;
	private Date rp_date;
	
	public int getRp_index() {
		return rp_index;
	}
	public void setRp_index(int rp_index) {
		this.rp_index = rp_index;
	}
	public int getRp_num() {
		return rp_num;
	}
	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_id2() {
		return m_id2;
	}
	public void setM_id2(String m_id2) {
		this.m_id2 = m_id2;
	}
	
	public int getRp_sort() {
		return rp_sort;
	}
	public void setRp_sort(int rp_sort) {
		this.rp_sort = rp_sort;
	}
	public String getRp_reason() {
		return rp_reason;
	}
	public void setRp_reason(String rp_reason) {
		this.rp_reason = rp_reason;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public Date getRp_date() {
		return rp_date;
	}
	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}
}
