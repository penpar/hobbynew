package icia.mvc.habbynew;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.ClassReply;
import icia.mvc.bean.Review;
import icia.mvc.service.AdminMM;
import icia.mvc.service.ClassMM;

@Controller
public class ClassController {
	
	@Autowired
	private ClassMM cm;
	@Autowired
	private AdminMM am;
	@Autowired
	private HttpServletRequest request;
	private ModelAndView mav;

	//클래스 리스트
	@RequestMapping(value = "/hobbyClass", method = RequestMethod.GET)
	public ModelAndView hobbyClass() {
		mav = cm.getClassList();
		return mav;
	}
	
	//클래스 글쓰기폼 이동
	@RequestMapping(value = "/classRecruitForm", method = RequestMethod.GET)
	public ModelAndView classRecruitForm() {
		mav = am.getClassNameList();
		mav.setViewName("sj_class/classRecruitForm");
		return mav;
	}
	
	//클래스 작성
	@RequestMapping(value = "/classWrite", method = RequestMethod.POST)
	public ModelAndView classWrite(MultipartHttpServletRequest request) {
		mav = cm.ClassWrite(request);
		return mav;
	}
	
	
	// 클래스 상세보기 페이지 이동
	@RequestMapping(value = "/classDetail_contents", method = RequestMethod.GET)
	public ModelAndView classDetail_contents(int c_index) {
		mav = cm.getClassDteail(c_index);
		return mav;
	}
	
	// 클래스 상세내용 뽑아서 다른 jsp에다 찍어둔 다음 해당 jsp를 div영역안에 load 시키기
	@RequestMapping(value = "/getMainContent", method = RequestMethod.POST)
	public ModelAndView getMainContent(int c_index) {
		mav = cm.getMainContent(c_index);
		return mav;
	}
	
	// 클래스 후기 뽑아서 다른 jsp에다 찍어둔 다음 해당 jsp를 div영역안에 load 시키기
	@RequestMapping(value = "/getReviewContent", method = RequestMethod.POST)
	public ModelAndView getReviewContent(int c_index) {
		mav = cm.getReviewContent(c_index);
		return mav;
	}
	
	//클래스 신청 인원
	@RequestMapping(value = "/classJoinList", method = RequestMethod.GET)
	public ModelAndView classJoinList(int c_index) {
		System.out.println("c_index : "+c_index);
		mav = cm.getPayList(c_index);
		return mav;
	}
	
	//후기 작성 페이지 이동
	@RequestMapping(value = "/reviewWriteForm", method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(int c_index) {
		System.out.println("c_index : "+c_index);
		mav = cm.reviewWriteForm(c_index);
		return mav; 
	}
	
	//후기 작성
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public ModelAndView reviewWrite(Review review, MultipartFile[] re_file) {
		mav = cm.reviewWrite(review, re_file);
		return mav;
	}
	
	//후기 수정 페이지 이동
	@RequestMapping(value = "/reviewUpdateForm", method = RequestMethod.GET)
	public ModelAndView reviewUpdateForm(int c_index, int re_index) {
		mav = cm.reviewUpdateForm(c_index, re_index);
		return mav;
	}
	
	//후기 수정 이동
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
	public ModelAndView reviewUpdate(Review review, MultipartFile[] re_file) {
		mav = cm.reviewUpdate(review, re_file);
		return mav;
	}
	
	//후기 삭제
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.POST)
	public ModelAndView reviewDelete(int c_index, int re_index) {
		mav = cm.reviewDelete(c_index, re_index);
		return mav;
	}
	
	// 클래스 수정 페이지 이동
	@RequestMapping(value = "/classUpdate", method = RequestMethod.GET)
	public ModelAndView classUpdate(int c_index) {
		mav = cm.ClassUpdate(c_index);
		return mav;
	}
	
	// 클래스 수정
	@RequestMapping(value = "/classUpdateSet", method = RequestMethod.POST)
	public ModelAndView classUpdateSet(MultipartHttpServletRequest request) {
		System.out.println("classUpdate");
		mav = cm.ClassUpdateSet(request);
		return mav;
	}
	
	// 클래스 삭제
	@RequestMapping(value = "/classDelete", method = RequestMethod.GET)
	public ModelAndView classDelete(int c_index) {
		System.out.println("classDelete");
		mav = cm.classDelete(c_index);
		return mav;
	}
	
	// 내가 쓴 투표 글 목록 팝업
	@RequestMapping(value = "/myVoteList", method = RequestMethod.GET)
	public ModelAndView myVoteList(String m_id) {
		System.out.println("myVoteList");
		mav = cm.myVoteList(m_id);
		return mav; 
	}
	
	// 클래스 댓글 가져오기
	@RequestMapping(value = "/getClassReply", method = RequestMethod.POST)
	public ModelAndView getClassReply(int c_index) {
		System.out.println("getClassReply");
		mav = cm.getClassReply(c_index);
		return mav;
	}
	
	//클래스 댓글 쓰기
	@RequestMapping(value = "/classReplyInsert", method = RequestMethod.POST)
	public ModelAndView classReplyInsert(ClassReply classReply) {
		System.out.println("classReplyInsert");
		mav = cm.classReplyInsert(classReply);
		return mav;
	}
	
	//클래스 댓글 삭제
	@RequestMapping(value = "/classReplyDelete", method = RequestMethod.POST)
	public ModelAndView classReplyDelete(ClassReply classReply) {
		System.out.println("classReplyInsert");
		mav = cm.classReplyDelete(classReply);
		return mav;
	}
	
	// 클래스 검색한 리스트 가져오기 ajax
	@RequestMapping(value = "/classSearch", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, Object> classSearch(String status, String filter, String keyword) {
		System.out.println("classSearch");
		System.out.println(status);
		Map<String, Object> classMap = cm.classSearch(status, filter, keyword);
		return classMap;
	}
	
	// 클래스 검색한 리스트 가져오기 ajax
	@RequestMapping(value = "/cnSearch", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, Object> cnSearch(int cn_index) {
		System.out.println("cnSearch");
		Map<String, Object> classMap = cm.cnSearch(cn_index);
		return classMap;
	}
	
	// 클래스 검색한 리스트 가져오기 ajax
	@RequestMapping(value = "/statusSearch", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, Object> statusSearch(String status) {
		System.out.println("statusSearch");
		Map<String, Object> classMap = cm.statusSearch(status);
		return classMap;
	}
	
	// 관심클래스 추가&삭제
	@RequestMapping(value = "/myClassMgt", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, Object> myClassMgt(String m_id, int c_index, int flag) {
		System.out.println("myClassMgt");
		Map<String, Object> classMap = cm.myClassMgt(m_id, c_index, flag);
		return classMap;
	}
	
	
}