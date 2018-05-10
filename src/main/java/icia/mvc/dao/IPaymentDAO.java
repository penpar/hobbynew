package icia.mvc.dao;

import java.util.List;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Member;
import icia.mvc.bean.Pay;

public interface IPaymentDAO {

	List<ClassBean> classPayment(int c_index);
	
	void payInsert(Pay pay);
	
	int pDecrease(Member member);

	int pIncrease(Member member);

	void payDelete(Pay pay);

	List<Pay> payList(Pay pay);



}
