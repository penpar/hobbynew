package icia.mvc.habbynew;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.annotation.ClassMemberValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Member;
import icia.mvc.service.LocationMM;
import icia.mvc.service.PaymentMM;

@Controller
public class PaymentController {

	@Autowired
	private HttpSession session;
	@Autowired
	private PaymentMM pay;
	
	HttpServletRequest request;
	
	private ModelAndView mav;	
	

	
	@RequestMapping(value = "/classPayment", method = RequestMethod.GET)
	   public ModelAndView classPayment(int c_index) {
			mav = new ModelAndView();
			
			System.out.println("classPayment !");
			
			mav = pay.classPayment(c_index);
		
			return mav;
	   }
	
	@RequestMapping(value = "/payInsert", method = RequestMethod.GET)
	   public ModelAndView payInsert(int c_index, int pl_pay, ClassBean cls) {
			mav = new ModelAndView();
			
			System.out.println("payInsert !");

			mav = pay.payInsert(c_index,pl_pay);
		
			return mav;
	   }
	
	@RequestMapping(value = "/payCancelForm", method = RequestMethod.GET)
	   public ModelAndView payCancelForm(int c_index) { //int index
			mav = new ModelAndView();
			System.out.println("classPayCancelForm !");

			//mav = pay.payCancel(c_index);
			
			
			
			mav = pay.payList(c_index);
			
			return mav;
	   }
	
	
	@RequestMapping(value = "/payCancel", method = RequestMethod.GET)
	   public ModelAndView payCancel(ClassBean cls,int c_index, int re_point) {
		
			System.out.println("환불 포인트"+re_point);
			mav = new ModelAndView();
			System.out.println("PayCancel !");
			
			System.out.println(cls.getC_index());
			System.out.println(c_index);
			
			mav = pay.payCancel(c_index, cls, re_point);
			mav.addObject("c_index", c_index);
			mav.setViewName("redirect:classDetail_contents");
			return mav;
	   }
	
	
}