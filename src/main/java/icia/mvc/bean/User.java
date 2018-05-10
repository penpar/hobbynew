package icia.mvc.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("user")
public class User {
	String m_id;
	String m_pw;
	String m_name;
	String m_gender;
	String m_phone;
	String m_birth;
	String m_email;
	String m_address;
	String m_intro;
	Date m_date;
	String b_year;
	String b_month;
	String b_day;
	String m_year;
	String m_month;
	String m_day;
	int m_sort;
	int m_warn;
	int fs_index;
	String f_oriName;
	String f_newName;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_birth() {
		return m_birth;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public int getM_sort() {
		return m_sort;
	}
	public void setM_sort(int m_sort) {
		this.m_sort = m_sort;
	}
	public int getM_warn() {
		return m_warn;
	}
	public void setM_warn(int m_warn) {
		this.m_warn = m_warn;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
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
	public String getB_year() {
		return b_year;
	}
	public void setB_year(String b_year) {
		this.b_year = b_year;
	}
	public String getB_month() {
		return b_month;
	}
	public void setB_month(String b_month) {
		this.b_month = b_month;
	}
	public String getB_day() {
		return b_day;
	}
	public void setB_day(String b_day) {
		this.b_day = b_day;
	}
	public String getM_year() {
		return m_year;
	}
	public void setM_year(String m_year) {
		this.m_year = m_year;
	}
	public String getM_month() {
		return m_month;
	}
	public void setM_month(String m_month) {
		this.m_month = m_month;
	}
	public String getM_day() {
		return m_day;
	}
	public void setM_day(String m_day) {
		this.m_day = m_day;
	}
	public int getFs_index() {
		return fs_index;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}
}