package icia.mvc.habbynew;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.service.QuestionMM;

@Controller
public class QuestionController {
	
	private ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private QuestionMM qmm;

		// 고객센터 페이지 이동
		@RequestMapping(value = "/customerCenter", method = RequestMethod.GET)
		public ModelAndView survay() {
			mav = new ModelAndView();
			mav.setViewName("han/customerCenter");
			return mav;
		}
			
		// 1:1문의 페이지 이동
		@RequestMapping(value = "/question", method = RequestMethod.GET)
		public ModelAndView question(HttpServletRequest request) {
			mav = new ModelAndView();
			mav.addObject("msg", request.getParameter("msg"));
			mav.setViewName("han/question");
			return mav;
		}
		
		// 1:1 문의 작성
		@RequestMapping(value = "/questionWrite", method = RequestMethod.POST)
		public ModelAndView questionWrite(MultipartHttpServletRequest multi) {
			System.out.println("제목 :"+multi.getParameter("cb_subject"));
			System.out.println("문의 종류 :"+multi.getParameter("q_type"));
			System.out.println("문의 내용 :"+multi.getParameter("cb_content"));
			
			mav = qmm.questionWrite(multi);
			return mav;
			
		}
}
