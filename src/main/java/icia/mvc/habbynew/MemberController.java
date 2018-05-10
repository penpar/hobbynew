package icia.mvc.habbynew;

import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;

import icia.mvc.service.MemberMM;


@Controller
public class MemberController {
	
	private ModelAndView mav;
	@Autowired
	private MemberMM mm;
	@Autowired
	private HttpSession session;
	
	
	//로그인
	@RequestMapping(value = "/mb_Login", method = RequestMethod.POST)
	public ModelAndView mb_Login(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ controller mb : "+mb);
		mav=mm.mb_Login(mb);
		return mav;
	}
	
	
	//로그인 폼으로 이동
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		mav = new ModelAndView();
		mav.setViewName("NYJ/loginForm");
		return mav;
	}
	
	//일반 유저 회원가입
	@RequestMapping(value = "/mb_Join", method = RequestMethod.POST)
    public ModelAndView mb_Join(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller mb_Join Call");
        mav=mm.mb_Join(mb);    //DB에 회원추가
         
        return mav;
    }
	
	//취미아티스트 회원가입
	/*@RequestMapping(value = "/mb_ArtJoin", method = RequestMethod.POST)
    public ModelAndView mb_ArtJoin(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller mb_ArtJoin Call");
        mav=mm.mb_ArtJoin(mb);    //DB에 회원추가
        return mav;
    }*/
	
	//취미아티스트 회원가입
	@RequestMapping(value = "/mb_ArtJoin", method = RequestMethod.POST)
	public ModelAndView b_NoticeWrite(MultipartHttpServletRequest multi) {
		System.out.println("NYJ controller mb_ArtJoin : "+multi);
		mav=mm.mb_ArtJoin(multi);
		return mav;
	}
	
	//회원가입 선택 폼
	@RequestMapping(value = "/joinChoice", method = RequestMethod.GET)
	public ModelAndView joinChoice() {
		mav = new ModelAndView();
		mav.setViewName("NYJ/joinChoice");
		return mav;
	}

	//일반 유저 회원가입 폼
	@RequestMapping(value = "/joinUserForm", method = RequestMethod.GET)
	public ModelAndView userJoinForm() {
		mav = new ModelAndView();
		mav.setViewName("NYJ/joinUserForm");
		return mav;
	}

	//취미 아티스트 회원가입 폼
	@RequestMapping(value = "/joinArtForm", method = RequestMethod.GET)
	public ModelAndView artistJoinForm() {
		mav = new ModelAndView();
		mav.setViewName("NYJ/joinArtForm");
		return mav;
	}
	
	//아이디 중복체크
	@RequestMapping(value = "/mb_checkId", produces = "application/json; charset=utf8")
	   public @ResponseBody Map<String, Integer> mb_checkId(String m_id) {
			System.out.println("Controller mb_checkId Call");
			System.out.println("m_id : "+m_id);
			Map<String, Integer> overMap=mm.mb_checkId(m_id);
			
			return overMap;
	   }
	
	//아이디 비밀번호 찾기 폼으로 이동
	@RequestMapping(value = "/findIdPw", method = RequestMethod.GET)
	public ModelAndView findIdPw() {
		mav = new ModelAndView();
		mav.setViewName("NYJ/findIdPw");
		return mav;
	}
	
	//비밀번호 변경 취소 시 / 마이페이지 수정폼에서 취소 시 마이페이지로 이동
	@RequestMapping(value = "/backMyPage", method = RequestMethod.GET)
	public ModelAndView backMyPage( ) {
		mav = new ModelAndView();
		System.out.println("NYJ MemberController backMyPage Call");
		mav.setViewName("NYJ/myPage");
		return mav;
	}
	
		
	//마이페이지 폼으로 이동
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView myPage(String m_id) {
		mav = new ModelAndView();
		System.out.println("NYJ MemberController myPage : "+m_id);
		mav=mm.myPage(m_id);
		/*mav.setViewName("NYJ/myPage");*/
		return mav;
	}
	
	//마이페이지 수정 폼으로 이동
	@RequestMapping(value = "/myPageEdit", method = RequestMethod.GET)
	public ModelAndView myPageEdit() {
		System.out.println("NYJ Controller myPageEdit Call");
		mav = new ModelAndView();
		mav.setViewName("NYJ/myPageEdit");
		return mav;
	}
	
	//마이페이지 수정
	@RequestMapping(value = "/mp_MyInfoChange", method = RequestMethod.GET)
	public ModelAndView mp_MyInfoChange(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller mp_MyInfoChange Call: "+mb);
		mav=mm.mp_MyInfoChange(mb);
		return mav;
	}
	
	//회원 탈퇴
	@RequestMapping(value = "/ny_out", method = RequestMethod.GET)
	public ModelAndView ny_out(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller ny_out Call: "+mb);
		System.out.println(mb.getM_id());
		mav=mm.ny_out(mb);
		return mav;
	}
	
	//비밀번호 변경 폼으로 이동
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public ModelAndView mp_PwChange() {
		System.out.println("NYJ Controller changePw Call");
		mav = new ModelAndView();
		mav.setViewName("NYJ/changePw");
		return mav;
	}
	
	//비밀번호 변경
	@RequestMapping(value = "/mp_ChangePw", method = RequestMethod.GET)
	public ModelAndView mp_ChangePw(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller mp_ChangePw Call: "+mb);
		mav=mm.mp_ChangePw(mb);
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout() {
		System.out.println("NYJ Controller logout Call");
		mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//아이디 찾기 폼으로 이동
	@RequestMapping(value = "/idFindForm", method = RequestMethod.GET)
	public ModelAndView idFindForm() {
		System.out.println("NYJ Controller idFindForm Call");
		mav = new ModelAndView();
		mav.setViewName("NYJ/idFindForm");
		return mav;
	}
	
	//아이디 찾기
	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public ModelAndView idFind(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller idFind Call");
		System.out.println("NYJ controller idFind mb : "+mb);
		mav=mm.idFind(mb);
		return mav;
	}
	

	//비밀번호 찾기 폼으로 이동
	@RequestMapping(value = "/pwFindForm", method = RequestMethod.GET)
	public ModelAndView pwFindForm() {
		System.out.println("NYJ Controller pwFindForm Call");
		mav = new ModelAndView();
		mav.setViewName("NYJ/pwFindForm");
		return mav;
	}
	
	
	//비밀번호 찾기 pwFind
	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public ModelAndView pwFind(@ModelAttribute("mb") Member mb) {
		System.out.println("NYJ Controller pwFind Call");
		System.out.println("NYJ controller pwFind mb : "+mb);
		mav=mm.pwFind(mb);
		return mav;
	}
	
	
	

}