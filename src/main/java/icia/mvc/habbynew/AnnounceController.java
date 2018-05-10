package icia.mvc.habbynew;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Notice;
import icia.mvc.service.AnnounceMM;

@Controller

public class AnnounceController {
	
	private ModelAndView mav;
	@Autowired
	private AnnounceMM mm;
	@Autowired
	private HttpSession session;
	private Map<String,List<Notice>> sortMap;
	
	
		//공지사항 리스트
		@RequestMapping(value = "/announceList", method = RequestMethod.GET)
		public ModelAndView announceList() {
			System.out.println("NYJ NoticeController announceList Call");
			mav = new ModelAndView();
			mav = mm.announceList();
			
			return mav;
		}
		
		//공지사항 글쓰기 폼으로 이동
		@RequestMapping(value = "/announceWrite", method = RequestMethod.GET)
		public ModelAndView announceWrite() {
			System.out.println("NYJ NoticeController announceWrite Call");
			mav = new ModelAndView();
			mav.setViewName("NYJ/announceWrite");
			return mav;
		}
		
		//공지사항 상세보기
		@RequestMapping(value = "/announceForm", method = RequestMethod.GET)
		public ModelAndView announceForm(HttpServletRequest request) {
			System.out.println("NYJ NoticeController announceForm Call");
			mav = new ModelAndView();
			mav = mm.announceForm(request);
			return mav;
		}
	
		//공지사항 수정 폼으로 이동
		@RequestMapping(value = "/anChangeForm", method = RequestMethod.GET)
		public ModelAndView anChangeForm() {
			System.out.println("NYJ NoticeController anChangeForm Call");
			mav = new ModelAndView();
			mav.setViewName("NYJ/anChangeForm");
			return mav;
		}
		
		//공지사항 글쓰기
		@RequestMapping(value = "/b_NoticeWrite", method = RequestMethod.POST)
		public ModelAndView b_NoticeWrite(MultipartHttpServletRequest multi) {
			System.out.println("NYJ controller b_NoticeWrite : "+multi);
			mav=mm.b_NoticeWrite(multi);
			return mav;
		}
		
		//공지사항 수정
		@RequestMapping(value = "/b_NoticeChange", method = RequestMethod.POST)
		public ModelAndView b_NoticeChange(MultipartHttpServletRequest multi) {
			System.out.println("NYJ controller b_NoticeChange : "+multi);
			mav=mm.announceChange(multi);
			return mav;
		}
		
		//공지사항 삭제
		@RequestMapping(value = "/b_NoticeDel", method = RequestMethod.POST)
		public ModelAndView b_NoticeDel(MultipartHttpServletRequest multi) {
			System.out.println("NYJ controller b_NoticeDel : "+multi);
			mav=mm.b_NoticeDel(multi);
			return mav;
		}
		
		//공지사항 분류 (전체:0, 공지사항:1, 이벤트:6)
		@RequestMapping(value = "/b_NoticeSort", produces = "application/json; charset=utf8")
		   public @ResponseBody Map<String, List<Notice>> b_NoticeSort(int cb_sort) {
				System.out.println("Controller b_NoticeSort Call");
				System.out.println(cb_sort);
				Map<String, List<Notice>> sortMap=mm.b_NoticeSort(cb_sort);
				
				return sortMap;
		   }
		
		
		
}
