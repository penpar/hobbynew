package icia.mvc.bean;

import org.apache.ibatis.type.Alias;

@Alias("files")
public class Files {
	private int f_index;
	private int fs_index;
	private int cb_index;
	private int c_index;
	private int cs_index;
	private String m_id;
	private String f_oriName;
	private String f_newName;
	
	public int getF_index() {
		return f_index;
	}
	public int getFs_index() {
		return fs_index;
	}
	public int getCb_index() {
		return cb_index;
	}
	public String getM_id() {
		return m_id;
	}
	public String getF_oriName() {
		return f_oriName;
	}
	public String getF_newName() {
		return f_newName;
	}
	public void setF_index(int f_index) {
		this.f_index = f_index;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}
	public void setCb_index(int cb_index) {
		this.cb_index = cb_index;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setF_oriName(String f_oriName) {
		this.f_oriName = f_oriName;
	}
	public void setF_newName(String f_newName) {
		this.f_newName = f_newName;
	}
	public int getCs_index() {
		return cs_index;
	}
	public void setCs_index(int cs_index) {
		this.cs_index = cs_index;
	}
	public int getC_index() {
		return c_index;
	}
	public void setC_index(int c_index) {
		this.c_index = c_index;
	}
	
}
