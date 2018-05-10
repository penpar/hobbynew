package icia.mvc.bean;

import org.apache.ibatis.type.Alias;

@Alias("photo")
public class Photo {
	private int cb_index;
	private String m_id;
	private String cb_subject;
	private String cb_content;
	private String cb_simpleContent;
	private int cb_sort;
	private int fs_index;
	private String f_newName;
	private String[] f_allName;
	private int fileChk;
	
	public int getCb_index() {
		return cb_index;
	}
	public String getM_id() {
		return m_id;
	}
	public String getCb_subject() {
		return cb_subject;
	}
	public String getCb_content() {
		return cb_content;
	}
	public String getCb_simpleContent() {
		return cb_simpleContent;
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
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public void setCb_simpleContent(String cb_simpleContent) {
		this.cb_simpleContent = cb_simpleContent;
	}
	public int getFs_index() {
		return fs_index;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}
	public int getCb_sort() {
		return cb_sort;
	}
	public void setCb_sort(int cb_sort) {
		this.cb_sort = cb_sort;
	}
	public String getF_newName() {
		return f_newName;
	}
	public void setF_newName(String f_newName) {
		this.f_newName = f_newName;
	}
	public String[] getF_allName() {
		return f_allName;
	}
	public void setF_allName(String[] f_allName) {
		this.f_allName = f_allName;
	}
	public int getFileChk() {
		return fileChk;
	}
	public void setFileChk(int fileChk) {
		this.fileChk = fileChk;
	}
}
