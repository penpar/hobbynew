// MySpaceMM 담당자 : 김재간

package icia.mvc.service;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Board;
import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Member;
import icia.mvc.bean.Pay;
import icia.mvc.dao.IMySpaceDAO;
import icia.mvc.dao.IPaymentDAO;
import icia.mvc.dao.ImemberDao;


@Service
public class PaymentMM{
	
	@Autowired
	private HttpSession session;
	@Autowired
	private IPaymentDAO payDao;
	private HttpServletRequest request;
	private ModelAndView mav;

	
	public ModelAndView classPayment(int index) {
		mav = new ModelAndView();
		List<ClassBean> cls = new ArrayList<ClassBean>();
		
		Member mb = (Member) session.getAttribute("mb");
		System.out.println(mb);
		String id = mb.getM_id();
		
		System.out.println("id ="+id);
		System.out.println(index);
		
		cls = payDao.classPayment(index);
		
		System.out.println(cls.size());
		System.out.println(cls.get(0).getM_id()+"  " +cls.get(0).getC_price());
		
		int saleP = cls.get(0).getC_price();
		
		saleP=(saleP*2)/100;
		System.out.println(saleP);
		
		int myP = mb.getP_point();
		
		String path = "/HNresources/uploadFolder/resources/hobbyClass/";
		mav.addObject("path", path);
		mav.addObject("myP",myP);
		mav.addObject("saleP",saleP);
		mav.addObject("clsList",cls);
		mav.setViewName("payment/payment");
		return mav;

	}

	public ModelAndView getClassList() {
		System.out.println("getClassList Service");
		mav = new ModelAndView();
		mav.setViewName("sj_class/hobbyClassList");
		return mav;
	}
	
	public ModelAndView payInsert(int c_index, int pl_pay) {
		mav = new ModelAndView();
		List<ClassBean> cls = new ArrayList<ClassBean>();
		Member mb = (Member) session.getAttribute("mb");
		System.out.println(mb);
		String id = mb.getM_id();
		Pay pay = new Pay();
		pay.setC_index(c_index);
		pay.setM_id(id);
		pay.setPl_pay(pl_pay);
		payDao.payInsert(pay);
		
		cls = payDao.classPayment(c_index);
		int point = cls.get(0).getC_price()-pl_pay;
		System.out.println("여기요");
		System.out.println(pl_pay);
		System.out.println(cls.get(0).getC_price());
		System.out.println(point);
		
		Member member = new Member();
		member.setM_id(id);
		member.setP_point(point);
		
		int suc = payDao.pDecrease(member);
		if(suc != 0){
			System.out.println("sucsess");	
		}
		mav.setViewName("redirect:/classDetail_contents?c_index="+c_index);
		return mav;
	}



	public ModelAndView payCancel(int c_index, ClassBean cls, int re_point) {
		mav = new ModelAndView();
		Member mb = (Member) session.getAttribute("mb");
		System.out.println(mb);
		String id = mb.getM_id();
		
		Pay pay = new Pay();
		pay.setC_index(c_index);
		pay.setM_id(id);
		
		payDao.payDelete(pay);

		Member member = new Member();
		member.setM_id(id);
		member.setP_point(re_point);
		
		int suc = payDao.pIncrease(member);
		return mav;
	}
	
	public ModelAndView payList(int index) { // 폼에다 쏴주기
		mav = new ModelAndView();
		Member mb = (Member) session.getAttribute("mb");
		System.out.println(mb);
		String id = mb.getM_id();
		
		List<ClassBean> cls = new ArrayList<ClassBean>();
		System.out.println("aaaaaaaaaaaaaaa");
		cls = payDao.classPayment(index);
		
		Pay pay= new Pay();
		pay.setM_id(id);
		pay.setC_index(index);
		
		List<Pay> paylist = new ArrayList<Pay>();
		paylist = payDao.payList(pay);
		
		int point = cls.get(0).getC_price() - paylist.get(0).getPl_pay();
		System.out.println(cls.get(0).getC_price()+" "+paylist.get(0).getPl_pay()+" "+point);

		String path = "/HNresources/uploadFolder/resources/hobbyClass/";
		mav.addObject("path", path); 
		mav.addObject("paylist",paylist); // paylist 
		mav.addObject("clsList",cls); // class 
		mav.addObject("point",point); // 
		mav.setViewName("payment/payCancel");
		return mav;
	}

	
	
	
	
}
