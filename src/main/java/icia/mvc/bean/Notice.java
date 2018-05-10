package icia.mvc.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("Notice")
public class Notice {
	private int cb_index;
	private String m_id;
	private String cb_subject;
	private int cb_click;
	private String cb_content;
	private Date cb_date;
	private String fm_date;
	private int cb_sort;
	private int an_main;
	
	private int fs_index;
	private String fs_subject;
	
	private int f_index;
	private String f_oriName;
	private String f_newName;
	private int fileChk;
	private int mainChk;
	
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
	public int getCb_click() {
		return cb_click;
	}
	public void setCb_click(int cb_click) {
		this.cb_click = cb_click;
	}
	public String getCb_content() {
		return cb_content;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public Date getCb_date() {
		return cb_date;
	}
	public void setCb_date(Date cb_date) {
		this.cb_date = cb_date;
	}
	public int getCb_sort() {
		return cb_sort;
	}
	public void setCb_sort(int cb_sort) {
		this.cb_sort = cb_sort;
	}
	public int getAn_main() {
		return an_main;
	}
	public void setAn_main(int an_main) {
		this.an_main = an_main;
	}
	public int getFs_index() {
		return fs_index;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}
	public String getFs_subject() {
		return fs_subject;
	}
	public void setFs_subject(String fs_subject) {
		this.fs_subject = fs_subject;
	}
	public int getF_index() {
		return f_index;
	}
	public void setF_index(int f_index) {
		this.f_index = f_index;
	}
	public String getF_oriName() {
		return f_oriName;
	}
	public void setF_oriName(String f_oriName) {
		this.f_oriName = f_oriName;
	}
	public String getF_newName() {
		return f_newName;
	}
	public void setF_newName(String f_newName) {
		this.f_newName = f_newName;
	}
	public int getFileChk() {
		return fileChk;
	}
	public void setFileChk(int fileChk) {
		this.fileChk = fileChk;
	}
	public String getFm_date() {
		return fm_date;
	}
	public void setFm_date(String fm_date) {
		this.fm_date = fm_date;
	}
	public int getMainChk() {
		return mainChk;
	}
	public void setMainChk(int mainChk) {
		this.mainChk = mainChk;
	}
	
	
	
	
}
