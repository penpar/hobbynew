package icia.mvc.habbynew;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.dao.INoteDAO;
import icia.mvc.service.AnnounceMM;
import icia.mvc.service.ClassMM;

@Controller
public class HomeController {
	
	@Autowired
	private ClassMM cm;
	@Autowired
	private AnnounceMM mm;
	
	@Autowired
	private INoteDAO nDao;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main() {
		mav = new ModelAndView();
		mav = cm.getMainClassList();
		
		/*mav = mm.getAnnList();*/
		
		try {
			Member mb = (Member) session.getAttribute("mb");
			int cnt = nDao.noteCount(mb.getM_id());
			session.setAttribute("cnt",cnt);
		} catch (Exception e) {
			mav.setViewName("main");
		}
		return mav;
	}
}

