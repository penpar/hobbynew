package icia.mvc.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("pay")
public class Pay {
	private int c_index; //클래스 번호
	private String m_id; //결제한 사람의 아이디
	private String m_name; //결제한 사람의 이름
	private String m_gender; //결제한 사람의 성별
	private int pl_pay; //결제금액
	private Date pl_date; //결제날짜
	
	public int getC_index() {
		return c_index;
	}
	public void setC_index(int c_index) {
		this.c_index = c_index;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public int getPl_pay() {
		return pl_pay;
	}
	public void setPl_pay(int pl_pay) {
		this.pl_pay = pl_pay;
	}
	public Date getPl_date() {
		return pl_date;
	}
	public void setPl_date(Date pl_date) {
		this.pl_date = pl_date;
	}
}
