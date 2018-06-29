package icia.mvc.habbynew;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.service.LocationMM;

@Controller
public class LocationController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private LocationMM loc;
	
	HttpServletRequest request;
	private ModelAndView mav;	
	
	@RequestMapping(value = "/locService", method = RequestMethod.GET)
	   public ModelAndView locService() {
			mav = new ModelAndView();
			Member mb = (Member) session.getAttribute("mb");
			System.out.println(mb);
			String id = mb.getM_id();
		   	mav = loc.locations(id);	
			return mav;
	   }
	
	@RequestMapping(value = "/locSort", method = RequestMethod.GET)
	   public ModelAndView locSort(int sort) {
			mav = new ModelAndView();
			Member mb = (Member) session.getAttribute("mb");
			System.out.println(mb);
			String id = mb.getM_id();
			mav = loc.locSort(sort,id);
			return mav;
	   }
	
	
	
	
	
	

}
