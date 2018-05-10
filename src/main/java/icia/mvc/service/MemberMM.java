package icia.mvc.service;

import java.net.StandardSocketOptions;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.mvc.bean.Member;
import icia.mvc.bean.Notice;
import icia.mvc.dao.INoteDAO;
import icia.mvc.dao.ImemberDao;

@Service
public class MemberMM {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private ImemberDao mDao;
	@Autowired
	
	private INoteDAO nDao;
	private HttpServletRequest request;
	private ModelAndView mav;
	
	//아이디 중복 체크
	public HashMap<String, Integer> mb_checkId(String m_id) {
		String view=null;
		System.out.println("NYJ mb_checkId Call");
		System.out.println("NYJ MemberMM m_id : "+m_id);
		
		int idChk=mDao.mb_checkId(m_id);//DB에 아이디 존재하면 1 없으면 0
		HashMap<String, Integer> idMap=new HashMap<String,Integer>();
		idMap.put("m_id", idChk);
		
		return idMap;
		
	}//overlap And

	//로그인
	public ModelAndView mb_Login(Member mb) {
		System.out.println(mb);
		System.out.println("NYJ login call");
		
		String view=null;
		mav=new ModelAndView();
		
		
		
		
		if(mDao.mb_Login(mb)==1){
			System.out.println("=============================");
			System.out.println("mDao.mb_Login(mb)==1");
			
				System.out.println("NYJ 로그인 성공");
				mb=mDao.getMemberInfo(mb.getM_id());//로그인한 회원 정보
				String getAddress = mb.getM_address();//주소 값 뽑음
				
				String[] address = getAddress.split("_");//주소 _로 분리하여 배열에 담음
				
				System.out.println(address[0]+"/"+address[1]);
				String addr = address[0];
				String detailAddress = address[1];
				System.out.println("NYJ MemberMM addr : "+addr);
				System.out.println("NYJ MemberMM detailAddress : "+detailAddress);
				mb.setM_addr(addr);
				mb.setM_detailAddress(detailAddress);
				System.out.println(mb.getM_addr());
				System.out.println(mb.getM_detailAddress());
				
				
				if(mb.getM_sort()==5){//탈퇴회원이 접속 시
					/*mav.addObject("check",5);*/
					mav.addObject("msg","탈퇴 된 회원입니다.");
					view="NYJ/loginForm";
				}else{
					session.setAttribute("mb",mb);//로그인 유지를 위해 세션에 저장
					int cnt = nDao.noteCount(mb.getM_id());
					session.setAttribute("cnt",cnt);
					
					view="redirect:/";
				}
				
		}else{
			System.out.println("NYJ 로그인 실패");
			/*mav.addObject("check",4);*/
			mav.addObject("msg","아이디 / 비밀번호가 일치하지 않습니다.");
			view="NYJ/loginForm";
		}
		
		mav.setViewName(view);
		return mav;
	}

	//회원가입
	public ModelAndView mb_Join(Member mb) {
		System.out.println("NYJ MemberMM mb_Join Call");
		mav=new ModelAndView();
		
		String view = null;
		System.out.println("NYJ MemberMM mb M_NAME : "+mb.getM_name());
		System.out.println("NYJ MemberMM mb M_ID : "+mb.getM_id());
		System.out.println("NYJ MemberMM mb M_PW : "+mb.getM_pw());
		System.out.println("NYJ MemberMM mb M_GENDER : "+mb.getM_gender());
		System.out.println("NYJ MemberMM mb M_PHONE : "+mb.getM_phone());
		System.out.println("NYJ MemberMM mb M_YEAR : "+mb.getM_year());
		System.out.println("NYJ MemberMM mb M_MONTH : "+mb.getM_month());
		System.out.println("NYJ MemberMM mb M_DAY : "+mb.getM_day());
		System.out.println("NYJ MemberMM mb M_EMAIL : "+mb.getM_email());
		System.out.println("NYJ MemberMM mb M_ADDRESS : "+mb.getM_addr());
		System.out.println("NYJ MemberMM mb M_DETAILADDRESS : "+mb.getM_detailAddress());
		System.out.println("NYJ MemberMM mb ch_check : "+mb.getCh_check());
		
		//생일 년월일 이어붙이기
		String m_birth = mb.getM_year()+"-"+mb.getM_month()+"-"+mb.getM_day();
		System.out.println("m_birth : "+m_birth);
		
		//String 형식을 Date형식으로 변환
		Date birth=Date.valueOf(m_birth);
		System.out.println("birth : "+birth);
		
		//주소와 상세주소 이어붙이기
		String address = mb.getM_addr()+"_"+mb.getM_detailAddress();
		System.out.println("address : "+address);
		
		mb.setM_birth(birth);
		mb.setM_address(address);
	
		try {
			if(mDao.mb_Join(mb)!=0){
				if(mb.getCh_check()!=null){//관심분야를 체크 안했을 시
					for(int i=0;i<mb.getCh_check().size();i++){
					mb.setM_hobby(mb.getCh_check().get(i));
					mDao.ch_check(mb);
					}
				}
				mDao.p_pointExp(mb);
				System.out.println("NYJ 회원가입 성공");
				/*mav.addObject("check",1);*///회원가입 성공시 loginForm에서 메세지 띄우기 위해
				mav.addObject("msg","회원가입에 성공했습니다.");
				view="NYJ/loginForm";
			}else{
				System.out.println("NYJ 회원가입 실패");
				/*mav.addObject("check",2)*/;
				mav.addObject("msg","회원가입에 실패했습니다. (code002) 관리자에게 문의바랍니다");
				view="NYJ/loginForm";
			}
		} catch (Exception e) {
			System.out.println("NYJ 회원가입 예외발생");
			/*mav.addObject("check",3);*/
			mav.addObject("msg","회원가입에 실패했습니다. (code003) 관리자에게 문의바랍니다");
			view="NYJ/loginForm";
		}
		
		mav.setViewName(view);
		return mav;
	}
	
	//취미 아티스트 회원가입
	public ModelAndView mb_ArtJoin(MultipartHttpServletRequest multi) {
		System.out.println("NYJ MemberMM mb_ArtJoin Call");
		mav=new ModelAndView();
		String view = null;
		
		System.out.println("m_name : "+multi.getParameter("m_name"));
		System.out.println("m_id : "+multi.getParameter("m_id"));
		System.out.println("m_pw : "+multi.getParameter("m_pw"));
		System.out.println("m_gender : "+multi.getParameter("m_gender"));
		System.out.println("m_phone : "+multi.getParameter("m_phone"));
		System.out.println("m_year : "+multi.getParameter("m_year"));
		System.out.println("m_month : "+multi.getParameter("m_month"));
		System.out.println("m_day : "+multi.getParameter("m_day"));
		System.out.println("m_email : "+multi.getParameter("m_email"));
		System.out.println("m_addr : "+multi.getParameter("m_addr"));
		System.out.println("m_detailAddress : "+multi.getParameter("m_detailAddress"));
		System.out.println("m_intro : "+multi.getParameter("m_intro"));
		System.out.println("fs_index : "+multi.getParameter("fs_index"));
		System.out.println("fileChk : "+multi.getParameter("fileChk"));
		
		int fs_index = Integer.parseInt(multi.getParameter("fs_index"));
		int check = Integer.parseInt(multi.getParameter("fileChk"));
		
		Map<String,String> fMap=null;
		if(check==1){//파일 첨부했다면
            UploadFile upload = new UploadFile();
            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
        }else{
        	fMap = new HashMap<String, String>();
        }
		
		
		
		Member member = new Member();

		member.setM_name(multi.getParameter("m_name"));
		member.setM_id(multi.getParameter("m_id"));
		member.setM_pw(multi.getParameter("m_pw"));
		member.setM_gender(multi.getParameter("m_gender"));
		member.setM_phone(multi.getParameter("m_phone"));
		member.setM_email(multi.getParameter("m_email"));
		member.setM_intro(multi.getParameter("m_intro"));
		member.setFs_index(fs_index);
		//생일 이어 붙이기
		String m_birth = multi.getParameter("m_year")+"-"+multi.getParameter("m_month")+"-"+multi.getParameter("m_day");
		System.out.println("m_birth : "+m_birth);
		
		//생일 Date형식으로 변환
		Date birth = Date.valueOf(m_birth);
		
		//주소 이어 붙이기
		String address = multi.getParameter("m_addr")+"_"+multi.getParameter("m_detailAddress");
		System.out.println("address : "+address);
		
		member.setM_birth(birth);
		member.setM_address(address);
		
		
		
		
		if(mDao.mb_ArtJoin(member)!=0){
			System.out.println("취미 아티스트 멤버테이블 등록 성공");
			
			if(mb_ArtJoin(member,fMap,check)!=0){
				System.out.println("취미아티스트 파일테이블 등록 성공");
				mav.addObject("msg","회원가입 신청이 완료되었습니다. 취미아티스트는 관리자의 가입승인 후 로그인서비스를 이용하실 수 있습니다.");
			}else{
				System.out.println("취미아티스트 파일테이블 등록 실패");
				mav.addObject("msg","회원가입에 실패했습니다. (code007) 관리자에게 문의바랍니다");
			}
			
		}else{
			System.out.println("취미 아티스트 멤버테이블 등록 실패");
			mav.addObject("msg","회원가입 신청에 실패했습니다. (code006) 관리자에게 문의바랍니다");
		}
		
		view="NYJ/loginForm";
		mav.setViewName(view);
		
		return mav;
	}

	//취미아티스트 회원가입시 파일테이블 등록
	private int mb_ArtJoin(Member member, Map<String, String> fMap, int check) {
		fMap.put("m_id",member.getM_id());
		int flag=0;
		flag=mDao.m_ArtFileInserte(fMap);
		
		return flag;
	}

	//회원 탈퇴
	public ModelAndView ny_out(Member mb) {
		System.out.println("NYJ MemberMM ny_out 회원 탈퇴 Call");
		System.out.println(mb.getM_id());
		String view = null;
		
		if(mDao.mp_MyOut(mb.getM_id())==1){
			System.out.println("탈퇴 성공");
			session.invalidate();
			mav.addObject("msg","탈퇴되었습니다");
			view="main";
		}else{
			System.out.println("탈퇴 실패");
			mav.addObject("msg","탈퇴에 실패했습니다.(code008) 관리자에게 문의바랍니다");
		}
		
		mav.setViewName(view);
		return mav;
	}
	
	//마이페이지 정보수정
	public ModelAndView mp_MyInfoChange(Member mb) {
		String view=null;
		System.out.println("MemberMM mp_MyInfoChange Call 마이페이지 수정 요청");
		System.out.println("NYJ MemberMM mb M_NAME : "+mb.getM_name());
		System.out.println("NYJ MemberMM mb M_EMAIL : "+mb.getM_email());
		System.out.println("NYJ MemberMM mb M_PHONE : "+mb.getM_phone());
		System.out.println("NYJ MemberMM mb M_DETAILADDRESS : "+mb.getM_addr());
		System.out.println("NYJ MemberMM mb M_DETAILADDRESS : "+mb.getM_detailAddress());
		
		String address = mb.getM_addr()+"_"+mb.getM_detailAddress();
		System.out.println("address : "+address);

		mb.setM_address(address);
		
		if(mDao.mp_MyInfoChange(mb)==1){
			mb=mDao.getMemberInfo(mb.getM_id());
			System.out.println("수정 성공");
			/*session.invalidate();*/
			String getAddress = mb.getM_address();//주소 값 뽑음
			
			String[] splitAddress = getAddress.split("_");//주소 _로 분리하여 배열에 담음
			
			System.out.println(splitAddress[0]+"/"+splitAddress[1]);
			String addr = splitAddress[0];
			String detailAddress = splitAddress[1];
			System.out.println("NYJ MemberMM addr : "+addr);
			System.out.println("NYJ MemberMM detailAddress : "+detailAddress);
			mb.setM_addr(addr);
			mb.setM_detailAddress(detailAddress);
			
			session.setAttribute("mb",mb);
			view="myPage";
		}else{
			System.out.println("수정 실패");
			mav.addObject("msg","정보수정에 실패했습니다.(code009) 관리자에게 문의바랍니다");
			view="myPage";
		}
		
		return mav;
	}

	//비밀번호 변경
	public ModelAndView mp_ChangePw(Member mb) {
		System.out.println("NYJ MemberMM mp_ChangePw 비밀번호 변경 : "+mb.getM_id());
		System.out.println("NYJ MemberMM mp_ChangePw 비밀번호 변경 : "+mb.getM_pw());
		
		if(mDao.mp_ChangePw(mb)==1){
			System.out.println("비밀번호 변경 성공");
		}else{
			System.out.println("비밀번호 변경 실패");
		}
		
		return mav;
	}

	//마이페이지 이동 시 포인트 가져오기
	public ModelAndView myPage(String m_id) {
		String view=null;
		int myPoint = mDao.getPoint(m_id);
		System.out.println(myPoint);
		
		mav.addObject("myPoint",myPoint);
		view="NYJ/myPage";
		mav.setViewName(view);
		return mav;
	}
	
	//아이디 찾기
	public ModelAndView idFind(Member mb) {
		System.out.println("NYJ MemberMM idFind Call");
		mav=new ModelAndView();
		String view=null;
		System.out.println("NYJ MemberMM idFind mb : "+mb);
		String m_id = mDao.idFind(mb);
		System.out.println("찾은 아이디 : "+m_id);
		
		if(m_id!=null){
			System.out.println("아이디 찾기 성공");
			mav.addObject("m_id",m_id);
			view="NYJ/idFindResult";
		}else{
			System.out.println("아이디 찾기 실패");
			mav.addObject("msg","일치하는 정보가 없습니다.");
			view="NYJ/idFindForm";
		}
		mav.setViewName(view);
		
		return mav;
	}
	
	//비밀번호 찾기
	public ModelAndView pwFind(Member mb) {
		System.out.println("NYJ MemberMM pwFind Call");
		mav=new ModelAndView();
		String view=null;
		
		String m_pw = mDao.pwFind(mb);
		System.out.println("찾은 비밀번호 : "+m_pw);
		
		if(m_pw!=null){
			System.out.println("비밀번호 찾기 성공");
			mav.addObject("m_pw",m_pw);
			view="NYJ/pwFindResult";
		}else{
			System.out.println("비밀번호 찾기 실패");
			mav.addObject("msg","일치하는 정보가 없습니다.");
			view="NYJ/idFindForm";
		}
		
		mav.setViewName(view);
		
		return mav;
	}
	
	
}//MemberMM And
