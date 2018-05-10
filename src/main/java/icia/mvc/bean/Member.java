package icia.mvc.bean;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

	
@Alias("member")
public class Member {
	private String m_name;  //컬럼명과 동일하게...
	private String m_id;
	private String m_pw;
	private String m_gender;
	private String m_phone;
	private String m_year;
	private String m_month;
	private String m_day;
	private Date m_birth;
	private String m_email;
	private String m_addr;
	private String m_detailAddress;
	private String m_address;
	private Date m_date;
	private String m_intro;
	private int m_sort;
	private int m_warn;
	private List<Integer> ch_check;
	private int m_hobby;
	private int p_pointExp;
	private int p_point;
	private int p_exp;
	
	private int fs_index;
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
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
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
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
	public Date getM_birth() {
		return m_birth;
	}
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_detailAddress() {
		return m_detailAddress;
	}
	public void setM_detailAddress(String m_detailAddress) {
		this.m_detailAddress = m_detailAddress;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
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
	public List<Integer> getCh_check() {
		return ch_check;
	}
	public void setCh_check(List<Integer> ch_check) {
		this.ch_check = ch_check;
	}
	public int getM_hobby() {
		return m_hobby;
	}
	public void setM_hobby(int m_hobby) {
		this.m_hobby = m_hobby;
	}
	public int getP_pointExp() {
		return p_pointExp;
	}
	public void setP_pointExp(int p_pointExp) {
		this.p_pointExp = p_pointExp;
	}
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	public int getP_exp() {
		return p_exp;
	}
	public void setP_exp(int p_exp) {
		this.p_exp = p_exp;
	}
	public int getFs_index() {
		return fs_index;
	}
	public void setFs_index(int fs_index) {
		this.fs_index = fs_index;
	}

	
	
	
	
	
}
