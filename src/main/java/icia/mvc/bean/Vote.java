package icia.mvc.bean;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("vote")
public class Vote {
	private int cb_index;
	private String m_id;
	private String cb_subject;
	private int cb_click;
	private String cb_content;
	private Date cb_date;
	private int cb_sort;
	
	private List<String> vi_name;
	
	private Date v_startDay;
	private Date v_endDay;
	private int v_person;
	private String v_subject;
	private String v_content;
	private String vs_year;
	private String vs_month;
	private String vs_day;
	private String ve_year;
	private String ve_month;
	private String ve_day;
	
	private String vp_name;
	
	private int fs_index;
	private int fileChk;
	private String f_oriname;
	private String f_newName;
	
	private long v_time;
	private int v_people;
	
	private int secretChk;
	private int selectChk;
	private List<String> vList;
	
	private String[] names;	
	
	/*댓글*/
	private int co_index;
	private String co_content;
	private Date co_date;
	private int pageNum;
	
	
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
	public Date getV_startDay() {
		return v_startDay;
	}
	public Date getV_endDay() {
		return v_endDay;
	}
	public int getV_person() {
		return v_person;
	}
	public String getV_subject() {
		return v_subject;
	}
	public String getV_content() {
		return v_content;
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
	public void setV_startDay(Date v_startDay) {
		this.v_startDay = v_startDay;
	}
	public void setV_endDay(Date v_endDay) {
		this.v_endDay = v_endDay;
	}
	public void setV_person(int v_person) {
		this.v_person = v_person;
	}
	public void setV_subject(String v_subject) {
		this.v_subject = v_subject;
	}
	public void setV_content(String v_content) {
		this.v_content = v_content;
	}
	public String getVs_year() {
		return vs_year;
	}
	public String getVs_month() {
		return vs_month;
	}
	public String getVs_day() {
		return vs_day;
	}
	public String getVe_year() {
		return ve_year;
	}
	public String getVe_month() {
		return ve_month;
	}
	public String getVe_day() {
		return ve_day;
	}
	public int getFs_index() {
		return fs_index;
	}
	public void setVs_year(String vs_year) {
		this.vs_year = vs_year;
	}
	public void setVs_month(String vs_month) {
		this.vs_month = vs_month;
	}
	public void setVs_day(String vs_day) {
		this.vs_day = vs_day;
	}
	public void setVe_year(String ve_year) {
		this.ve_year = ve_year;
	}
	public void setVe_month(String ve_month) {
		this.ve_month = ve_month;
	}
	public void setVe_day(String ve_day) {
		this.ve_day = ve_day;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}
	public int getFileChk() {
		return fileChk;
	}
	public void setFileChk(int fileChk) {
		this.fileChk = fileChk;
	}
	public List<String> getVi_name() {
		return vi_name;
	}
	public void setVi_name(List<String> vi_name) {
		this.vi_name = vi_name;
	}
	public String getF_oriname() {
		return f_oriname;
	}
	public String getF_newName() {
		return f_newName;
	}
	public void setF_oriname(String f_oriname) {
		this.f_oriname = f_oriname;
	}
	public void setF_newName(String f_newName) {
		this.f_newName = f_newName;
	}
	public long getV_time() {
		return v_time;
	}
	public void setV_time(long calculator) {
		this.v_time = calculator;
	}
	public int getV_people() {
		return v_people;
	}
	public void setV_people(int v_people) {
		this.v_people = v_people;
	}
	public String getVp_name() {
		return vp_name;
	}
	public void setVp_name(String vp_name) {
		this.vp_name = vp_name;
	}
	public int getSecretChk() {
		return secretChk;
	}
	public void setSecretChk(int secretChk) {
		this.secretChk = secretChk;
	}
	public List<String> getvList() {
		return vList;
	}
	public void setvList(List<String> vList) {
		this.vList = vList;
	}
	public int getSelectChk() {
		return selectChk;
	}
	public void setSelectChk(int selectChk) {
		this.selectChk = selectChk;
	}
	/*public List<String> getNames() {
		return names;
	}
	public void setNames(List<String> names) {
		this.names = names;
	}*/
	public String[] getNames() {
		return names;
	}
	public void setNames(String[] names) {
		this.names = names;
	}
	public int getCo_index() {
		return co_index;
	}
	public String getCo_content() {
		return co_content;
	}
	public Date getCo_date() {
		return co_date;
	}
	public void setCo_index(int co_index) {
		this.co_index = co_index;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public void setCo_date(Date co_date) {
		this.co_date = co_date;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
}
