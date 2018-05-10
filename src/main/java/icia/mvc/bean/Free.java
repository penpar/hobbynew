package icia.mvc.bean;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("free")
public class Free {
	private int cb_index;
	private String m_id;
	private String cb_subject;
	private int cb_click;
	private String cb_content;
	private Date cb_date;
	private String fm_date;
	private int cb_sort;
	
	private String fb_title;
	
	private int f_index;
	private String f_oriName;
	private String f_newName;
	private int fileChk;
	private List<String> fList;
	private List<String> fAllList;
	
	private int fs_index;
	private String fs_subject;
	
	private int co_index;
	private String co_content;
	private Date co_date;
	
	private int rc_sort;
	
	private int cn_index;
	private String cn_name;

	private String det_subject;
	
	private int secretChk;
	
	private int pageNum;
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

	public String getFm_date() {
		return fm_date;
	}

	public void setFm_date(String fm_date) {
		this.fm_date = fm_date;
	}

	public int getCb_sort() {
		return cb_sort;
	}

	public void setCb_sort(int cb_sort) {
		this.cb_sort = cb_sort;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
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

	public int getCo_index() {
		return co_index;
	}

	public void setCo_index(int co_index) {
		this.co_index = co_index;
	}

	public String getCo_content() {
		return co_content;
	}

	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}

	public Date getCo_date() {
		return co_date;
	}

	public void setCo_date(Date co_date) {
		this.co_date = co_date;
	}

	public int getRc_sort() {
		return rc_sort;
	}

	public void setRc_sort(int rc_sort) {
		this.rc_sort = rc_sort;
	}

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

	public String getDet_subject() {
		return det_subject;
	}

	public void setDet_subject(String det_subject) {
		this.det_subject = det_subject;
	}

	public List<String> getfList() {
		return fList;
	}

	public void setfList(List<String> fList) {
		this.fList = fList;
	}

	public int getSecretChk() {
		return secretChk;
	}

	public void setSecretChk(int secretChk) {
		this.secretChk = secretChk;
	}

	public List<String> getfAllList() {
		return fAllList;
	}

	public void setfAllList(List<String> fAllList) {
		this.fAllList = fAllList;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
	
	
}
