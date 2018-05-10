package icia.mvc.habbynew;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.service.SiteMM;

@Controller
public class SiteIntroController {

	private ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SiteMM stmm;
	
	// 사이트 소개 페이지 이동
	@RequestMapping(value = "/siteIntroPage", method = RequestMethod.GET)
	public ModelAndView siteIntroPage() {
		mav = stmm.getSiteIntro(); // 리스트 출력
		return mav;
	}
	
	// 사이트 소개 - 글쓰기 페이지 이동
	@RequestMapping(value = "/siteIntroWrite", method = RequestMethod.GET)
	public ModelAndView siteIntroWrite() {
		mav = new ModelAndView();
		mav.setViewName("han/siteIntroWrite");
		return mav;
	}
	
	// 사이트 소개 - 글쓰기
	@RequestMapping(value = "/siteWrite", method = RequestMethod.POST)
	public ModelAndView siteWrite(MultipartHttpServletRequest multi) {
		System.out.println(multi.getParameter("siteWrite_content"));
		mav = stmm.siteWrite(multi);
		return mav;
	}
	
}
