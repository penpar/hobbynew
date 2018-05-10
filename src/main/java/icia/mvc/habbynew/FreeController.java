package icia.mvc.habbynew;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Free;
import icia.mvc.bean.Photo;
import icia.mvc.bean.Vote;
import icia.mvc.service.FreeMM;

@Controller
public class FreeController {
	
	private ModelAndView mav;
	@Autowired
	private FreeMM mm;
	@Autowired
	private HttpSession session;


	
		//자유게시판 리스트로 이동
		@RequestMapping(value = "/freeList", method = RequestMethod.GET)
		public ModelAndView freeList() {
			System.out.println("=======================");
			System.out.println("NYJ FreeController freeList Call");
			mav = new ModelAndView();
			mav = mm.freeList();
			return mav;
		}
		
		//자유게시판 글쓰기 폼으로 이동
		@RequestMapping(value = "/freeWrite", method = RequestMethod.GET)
		public ModelAndView freeWrite() {
			System.out.println("===========================");
			System.out.println("NYJ FreeController freeWrite Call");
			mav = new ModelAndView();
			mav = mm.freeWrite();
			return mav;
		}
		
		//자유게시판 글쓰기
		@RequestMapping(value = "/b_freeWrite", method = RequestMethod.POST)
		public ModelAndView b_freeWrite(Free free, MultipartFile[] anFile) {
			System.out.println("===========================");
			System.out.println("NYJ Freecontroller b_freeWrite : "+anFile);
			mav=mm.b_freeWrite(free,anFile);
			return mav;
		}
		
		
		//자유게시판 상세보기
		@RequestMapping(value = "/freeDetail", method = RequestMethod.GET)
		public ModelAndView freeDetail(HttpServletRequest request) {
			System.out.println("NYJ FreeController freeDetail Call");
			mav = new ModelAndView();
			mav = mm.freeDetail(request);
			
			return mav;
		}
		
		//자유게시판 댓글 입력
		@RequestMapping(value = "/b_FreeComWrite", produces = "application/json; charset=utf8")
	   public @ResponseBody Map<String, Object> b_FreeComWrite(Free free) {
			System.out.println("NYJ FreeController b_FreeComWrite Call");
			Map<String, Object> commMap=mm.b_FreeComWrite(free);
			return commMap;
	   }
		
		//자유게시판 댓글 페이징
		@RequestMapping(value = "/freePagingComent", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> freePagingComent(int cb_index) {
			System.out.println("=================================");
			System.out.println("NYJ FreeController freePagingComent : "+cb_index);
			
			Map<String, Object> map = mm.freePagingComent(cb_index);
			
			return map;
		}
		
		//자유게시판 댓글 삭제
		@RequestMapping(value = "/freeComDelete", produces = "application/json; charset=utf8")
	   public @ResponseBody Map<String, Object> freeComDelete(int co_index, int cb_index) {
		Map<String, Object> comDeleteMap = mm.freeComDelete(co_index, cb_index);
		return comDeleteMap;
	   }
		
		//자유게시판 수정 폼으로 이동
		@RequestMapping(value = "/freeChangeForm", method = RequestMethod.GET)
		public ModelAndView freeChangeForm() {
			System.out.println("===========================");
			System.out.println("NYJ FreeController freeChangeForm Call");
			mav = new ModelAndView();
			mav = mm.freeChangeForm();
			return mav;
		}
		
		
		
		//자유게시판 글 수정
		@RequestMapping(value = "/b_freeChange", method = RequestMethod.POST)
		public ModelAndView b_freeChange(Free free, MultipartFile[] anFile) {
			System.out.println("===========================");
			System.out.println("NYJ Freecontroller b_freeChange : "+anFile);
			mav=mm.b_freeChange(free,anFile);
			return mav;
		}
		
		
		
		//자유게시판 글 삭제
		@RequestMapping(value = "/b_FreeDel", method = RequestMethod.GET)
		public ModelAndView b_FreeDel(int cb_index) {
			System.out.println("===========================");
			System.out.println("NYJ NoticeController b_FreeDel Call");
			mav = new ModelAndView();
			mav = mm.b_FreeDel(cb_index);
			return mav;
		}
}
