package icia.mvc.habbynew;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import icia.mvc.bean.User;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Vote;

import icia.mvc.service.AdminMM;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMM am;
	private ModelAndView mav;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpServletResponse response;
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public ModelAndView adminMain() {
		mav = new ModelAndView();
		mav.setViewName("sj_admin/adminMain");
		return mav;
	}
	
	@RequestMapping(value = "/userMgt", method = RequestMethod.GET)
	public ModelAndView userMgt() {
		System.out.println("userList");
		mav = am.userList();
		return mav;
	}
	
	@RequestMapping(value = "/userSortList", method = RequestMethod.POST)
	public ModelAndView userListSort(@RequestParam("sort") int sort) {
		System.out.println("userSortList");
		mav = am.userSortList(sort);
		return mav;
	}
	
	@RequestMapping(value = "/userSearch", method = RequestMethod.POST)
	public ModelAndView userSearch(@RequestParam("searchValue") String searchValue) {
		System.out.println("userSearch");
		System.out.println(searchValue);
		mav = am.userSearch(searchValue);
		return mav;
	}
	
	@RequestMapping(value = "/qUserSearch", method = RequestMethod.POST)
	public ModelAndView qUserSearch(String searchValue) {
		System.out.println("userSearch");
		System.out.println(searchValue);
		mav = am.qUserSearch(searchValue);
		return mav;
	}
	
	
	@RequestMapping(value = "/userBen/{m_id}", method = RequestMethod.GET)
    public ModelAndView userBen(@PathVariable String m_id) {
		System.out.println("userBen");
		System.out.println(m_id);
        //url값을 파라미터로 전달하기 위해서 {url}과 동일하게 변수명을 선언하면 저장된다.
        //@PathVariable 을 사용하여 url 파라미터값을 받아올 수 있음.
        //restful은 무조건 json형식으로 반환.
        mav = am.userBen(m_id);
        return mav;
	}
	
	@RequestMapping(value = "/userWarn/{m_id}", method = RequestMethod.GET)
    public ModelAndView userWarn(@PathVariable String m_id) {
		System.out.println("userWarn");
		System.out.println(m_id);
        //url값을 파라미터로 전달하기 위해서 {url}과 동일하게 변수명을 선언하면 저장된다.
        //@PathVariable 을 사용하여 url 파라미터값을 받아올 수 있음.
        //restful은 무조건 json형식으로 반환.
        mav = am.userWarn(m_id);
        return mav;
	}
	
	@RequestMapping(value = "/reportMgt", method = RequestMethod.GET)
	public ModelAndView reportMgt() {
		System.out.println("reportMgt");
		mav = am.getReportList();
		return mav;
	}
	
	@RequestMapping(value = "/classMgt", method = RequestMethod.GET)
	public ModelAndView classMgt() {
		System.out.println("classMgt");
		mav = am.getClassNameList();
		return mav;
	}
	
	@RequestMapping(value = "/cnAdd", method = RequestMethod.GET)
	public ModelAndView cnAdd(@RequestParam("cn_name") String cn_name) {
		System.out.println("cnAdd");
		mav = am.cnAdd(cn_name);
		return mav;
	}
	
	/*@RequestMapping(value = "/cnAdd", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<ClassName>> cnAdd(String cn_name) {
		System.out.println("cnAdd");
		Map<String, List<ClassName>> cnMap = am.cnAdd(cn_name);
		return cnMap;
	}*/
	
	@RequestMapping(value = "/cnDel/{cn_name}", method = RequestMethod.GET)
	public ModelAndView cnDel(@PathVariable String cn_name) {
		System.out.println("cnDel");
		mav = am.cnDel(cn_name);
		return mav;
	}
	
	// 심사 관리 페이지 이동
	@RequestMapping(value = "/joinJudgeList", method = RequestMethod.GET)
	public ModelAndView joinJudgeList() {
		mav = new ModelAndView();
		mav.setViewName("sj_admin/joinJudgeList");
		return mav;
	}
	
	// 회원가입 심사 리스트 가져오기
	@RequestMapping(value = "/userChangeForm", method = RequestMethod.GET)
	public ModelAndView userChangeForm() {
		mav = new ModelAndView();
		mav.setViewName("sj_class/UserChangeForm");
		return mav;
	}
	
	// 문의 관리 페이지 이동 및 리스트
	@RequestMapping(value = "/questionMgt", method = RequestMethod.GET)
	public ModelAndView questionMgt() {		
		mav = am.questionMgt();
		return mav;
	}
	
	// 문의 관리 종류 분류
	@RequestMapping(value = "/questionSort", method = RequestMethod.POST)
	public ModelAndView questionSort(String sort) {
		System.out.println("sortList");
		mav = am.sortList(sort);
		return mav;
	}
	
	// 문의 관리 파일 다운로드
	@RequestMapping(value = "/qFileDown", method = RequestMethod.GET)
	public void qFileDown(String f_newName, String f_oriName, int fs_index) {
		System.out.println("qFile : "+f_newName+" / "+fs_index);
		am.qFileDown(f_newName, f_oriName, fs_index, request, response);
	}
	
	// 회원가입 심사중인 유저 리스트 ajax
	@RequestMapping(value = "/userJoinList", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<User>> userJoinList(User user) {
		Map<String, List<User>>joinJudgeMap = am.getJoinJudgeList(user);
		return joinJudgeMap;
	}
	
	// 심사중인 유저 상세보기
	@RequestMapping(value = "/userDetail", method = RequestMethod.POST)
	public ModelAndView userDetail(User user) {
		System.out.println("userDetail : "+user.getM_id());
		mav = am.userDetail(user);
		return mav;
	}
	
	// 회원가입 심사 파일 다운로드
	@RequestMapping(value = "/joinFileDown", method = RequestMethod.GET)
	public void joinFileDown(String f_newName, String f_oriName, int fs_index) {
		System.out.println("qFile : "+f_newName+" / "+fs_index);
		am.qFileDown(f_newName, f_oriName, fs_index, request, response);
	}
	
	// 일시적 사용자 전환
	@RequestMapping(value = "/changeWrite", method = RequestMethod.POST)
	public ModelAndView changeWrite(MultipartHttpServletRequest request) {
		mav = am.changeWrite(request);
		return mav;
	}

	// 회원가입 심사 후 유저 리스트 ajax
	@RequestMapping(value = "/joinConfirm", produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<User>> joinConfirm(String m_id, int flag) {
		Map<String, List<User>>joinJudgeMap = am.joinComfirm(m_id, flag);
		return joinJudgeMap;
	}
}