package icia.mvc.habbynew;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Vote;
import icia.mvc.service.VoteMM;

@Controller
public class VoteController {
	
	private ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private VoteMM vmm;
	
	// 투표 게시판 페이지 이동
	@RequestMapping(value = "/vote", method = RequestMethod.GET)
	public ModelAndView analysisTest(HttpServletRequest request) {
		mav = vmm.voteList(request);
		return mav;
	}
	
	// 글쓰기 폼 이동
	@RequestMapping(value = "/voteWrite", method = RequestMethod.GET)
	public ModelAndView voteWrite() {
		mav = new ModelAndView();
		mav.setViewName("han/voteWrite");
		return mav;
	}
	
	// 공통 게시판 글쓰기
	@RequestMapping(value = "/vWrite", method = RequestMethod.POST)
	public ModelAndView vWrite(Vote vote, MultipartFile[] v_file) {
		System.out.println("투표 글쓰기 컨트롤러");
		mav = vmm.vWrite(vote, v_file);
		return mav;
	}
	
	// 상세보기 이동
	@RequestMapping(value = "/voteDetail", method = RequestMethod.GET)
	public ModelAndView voteDetail(int cb_index) {
		System.out.println("controller_Detail : "+cb_index);
		
		mav = vmm.voteDetail(cb_index);
		return mav;
	}
	
	// 댓글 페이징
		@RequestMapping(value = "/pagingComent", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> pagingComent(int cb_index) {
			System.out.println("controller_Detail : "+cb_index);
			
			Map<String, Object> map = vmm.pagingComent(cb_index);
			
			return map;
		}
	
	// 상세보기 투표
	@RequestMapping(value = "/voteSelect", produces = "application/json; charset=utf-8")
   public @ResponseBody Map<String, Object> voteSelect(HttpServletRequest request) {
		int cb_index = Integer.parseInt(request.getParameter("cb_index"));
		String m_id = request.getParameter("m_id");
		String[] names = request.getParameterValues("names");
		System.out.println(cb_index);
		System.out.println(m_id);		
		Vote vote = new Vote();
		vote.setCb_index(cb_index);
		vote.setM_id(m_id);
		vote.setNames(names);
		
		Map<String, Object> vSelectMap=vmm.vSelect(vote);
		return vSelectMap;
   }
	
	// 글 삭제
	@RequestMapping(value = "/voteDelete", method = RequestMethod.GET)
	public ModelAndView voteDelete(HttpServletRequest request) {
		int cb_index = Integer.parseInt(request.getParameter("cb_index"));
		int fs_index = Integer.parseInt(request.getParameter("fs_index"));
		System.out.println("글 삭제 index : "+cb_index+"fs_index : "+fs_index);
		
		mav = vmm.voteDelete(cb_index, fs_index);
		return mav;
	}
	
	// 댓글 쓰기
	@RequestMapping(value = "/commentAjax", produces = "application/json; charset=utf8")
	   public @ResponseBody Map<String, Object> commentAjax(Vote vote) {
			Map<String, Object> commMap=vmm.commentAjax(vote);
			return commMap;
	   }
	
	// 댓글 삭제
	@RequestMapping(value = "/comDelete", produces = "application/json; charset=utf8")
	   public @ResponseBody Map<String, Object> comDelete(int co_index, int cb_index) {
			Map<String, Object> comDeleteMap = vmm.comDelete(co_index, cb_index);
			return comDeleteMap;
	   }
	
	// 수정 페이지 이동
	@RequestMapping(value = "/voteUpdate", method = RequestMethod.GET)
	public ModelAndView voteUpdate(HttpServletRequest request) {
		mav = new ModelAndView();
		int cb_index = Integer.parseInt(request.getParameter("cb_index"));
		int fs_index = Integer.parseInt(request.getParameter("fs_index"));
		System.out.println("글 삭제 index : "+cb_index+"fs_index : "+fs_index);
		mav.setViewName("han/voteUpdate");
		mav = vmm.voteUpdate(cb_index, fs_index);
		return mav;
	}
	
	// 투표 게시판 수정
	@RequestMapping(value = "/vUpdate", method = RequestMethod.POST)
   public ModelAndView vUpdate(Vote vote, MultipartFile[] v_file) {
		mav = vmm.vUpdate(vote, v_file);
		return mav;
   }

}
