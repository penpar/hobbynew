package icia.mvc.habbynew;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.service.MySpaceMM;
import icia.mvc.service.NoteMM;

@Controller
public class MySpaceController {
private ModelAndView mav;
	
	@Autowired
	private NoteMM nt;
	@Autowired
	private MySpaceMM ms;
	
	
	@Autowired
	private HttpSession session;
	
	HttpServletRequest request;
	
	@RequestMapping(value = "/mySpace", method = RequestMethod.GET)
	   public ModelAndView mySpace() {
			mav = new ModelAndView();
			mav.setViewName("myspace/mySpace"); 
			return mav;
	   }
	
	@RequestMapping(value = "/mySpaceList", method = RequestMethod.GET)
	   public ModelAndView myClassList(int sort) {
			mav = new ModelAndView();
			System.out.println("mySpaceList"+sort);
			Member mb = (Member) session.getAttribute("mb");
			String id = mb.getM_id();
			// 즐겨찾기 클래스 분류 번호 : 1 
			// 즐겨찾기 글 분류 번호 : 2 
			// 내가 쓴 글 분류 번호 : 3 
			// 내가 쓴  클래스 분류 번호 : 4
			switch(sort){
			case 1:
				mav = ms.MyClassList(mb); // 즐겨찾기한 클래스(클래스 이용)
				break;
			case 2:
				mav = ms.MyWriteList(1,mb); // 즐겨찾기한 글 (자유게시판 이용)
				break;
			case 3:                         // 내가 쓴 글
				if(mb.getM_sort()==1){   // 일반회원이 내가 쓴 글 클릭 했을 시
					mav = ms.MyWriteList(2, mb);
				}else if(mb.getM_sort()==3){  // 취미아티스트가 내가 쓴 글 클릭 했을 시
					mav = ms.MyWriteClassList(mb);	
				} else{
					mav = ms.MyWriteList(2, mb); // 제한적 아티스트가 내가 쓴 글 클릭 했을 시
				}
				break;
			case 4:
				mav = ms.MyWriteClassList(mb); // 취미아티스트, 제한적 아티스트 자신이 작성한 클래스 불러오기
				break;
			}
			return mav;
	   }
	
	@RequestMapping(value = "/myBookDel", method = RequestMethod.GET)
	   public ModelAndView myBookDel(int index) {
		
			System.out.println("index " + index);
			mav = new ModelAndView();
			ms.myBookDel(index);
			mav.setViewName("redirect:/mySpaceList?sort=2");
			
			return mav;
	   }
	
	@RequestMapping(value = "/myBookDel_f", method = RequestMethod.GET)
	   public ModelAndView myBookDel_f(int index) {
		
			System.out.println("myBookDel_f index " + index);
			mav = new ModelAndView();
			ms.myBookDel(index);
			mav.setViewName("redirect:/freeDetail?cb_index="+index);
			
			return mav;
	   }
	
	@RequestMapping(value = "/myBookIn_f", method = RequestMethod.GET)
	   public ModelAndView myBookIn_f(int index) {
		
			System.out.println("myBookIn_f index " + index);
			mav = new ModelAndView();
			ms.myBookIn(index);
			mav.setViewName("redirect:/mySpaceList?sort=2");
			
			return mav;
	   }
	
	@RequestMapping(value = "/myClassDel", method = RequestMethod.GET)
	   public ModelAndView myClassDel(int index) {
		
			System.out.println("myClassDel index " + index);
			mav = new ModelAndView();
			ms.myClassDel(index);
			mav.setViewName("redirect:/mySpaceList?sort=1");
			
			return mav;
	   }
	
	
	
}
