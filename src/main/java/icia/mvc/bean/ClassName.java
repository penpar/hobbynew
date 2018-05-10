package icia.mvc.bean;

import org.apache.ibatis.type.Alias;

@Alias("className")
public class ClassName {
	private int rnum;
	private int cn_index;
	private String cn_name;
	
	public int getCn_index() {
		return cn_index;
	}
	public void setCn_index(int cn_index) {
		this.cn_index = cn_index;
	}
	public String getCn_name() {
		return cn_name;
	}
	public void setCn_name(String cn_name) {
		this.cn_name = cn_name;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
}