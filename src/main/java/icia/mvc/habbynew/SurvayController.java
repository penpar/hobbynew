package icia.mvc.habbynew;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.service.SurvayMM;

@Controller
public class SurvayController {
	
	private ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private SurvayMM smm;
	
	// 취미 분석 설명 
	@RequestMapping(value = "/has_index", method = RequestMethod.GET)
	public ModelAndView has_index() {
		mav = new ModelAndView();
		mav.setViewName("han/has_index"); // has_index.jsp
		return mav;
	}
	
	// 취미 분석 페이지 이동
	@RequestMapping(value = "/analysisTest", method = RequestMethod.GET)
	public ModelAndView analysisTest() {
		mav = new ModelAndView();
		mav.setViewName("han/analysisTest");
		return mav;
	}
	
	/*@RequestMapping(value = "/survay/{checkList}", method = RequestMethod.GET)
	public ModelAndView survay(@PathVariable int[] checkList) {
		System.out.println(checkList[0]);
		mav = mm.survay(checkList);
		return mav;
	}*/
	
	// 취미 분석
	@RequestMapping(value = "/survay", method = RequestMethod.GET)
	public ModelAndView survay(@RequestParam("checkList") int[] checkList) {
		System.out.println(checkList[0]);
		mav = smm.m_HobbyAnalyze(checkList);
		return mav;
	}
}
