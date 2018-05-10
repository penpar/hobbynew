package icia.mvc.bean;

import org.apache.ibatis.type.Alias;

@Alias("siteIntro")
public class SiteIntro {
	private int cb_index;
	private String cb_content;
	private String f_newName;
	
	public int getCb_index() {
		return cb_index;
	}
	public String getCb_content() {
		return cb_content;
	}
	public String getF_newName() {
		return f_newName;
	}
	public void setCb_index(int cb_index) {
		this.cb_index = cb_index;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public void setF_newName(String f_newName) {
		this.f_newName = f_newName;
	}
	
	
}
