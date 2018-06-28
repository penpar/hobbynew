
package icia.mvc.habbynew;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.bean.Note;
import icia.mvc.service.NoteMM;


@Controller
public class NoteController {
	private ModelAndView mav;
	
	@Autowired
	private NoteMM nt;
	
	@Autowired
	private HttpSession session;
	HttpServletRequest request;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/noteList", method = RequestMethod.GET)
	   public ModelAndView noteList() {
			Member mb = (Member) session.getAttribute("mb");
			String id = mb.getM_id();
			System.out.println("id ="+id);
			nt.noteAuto(id);
			mav = nt.nt_SendNoteList(id);	 
			return mav;
	   }
	
	// 쓰기
	@RequestMapping(value = "/mailForm", method = RequestMethod.GET)
	   public ModelAndView mailForm() {
			mav = new ModelAndView();
			mav.setViewName("note/mailWriteForm");
			System.out.println("mailForm !!");
			return mav;
	   }
	
	// 답장
	@RequestMapping(value = "/mailReForm", method = RequestMethod.GET)
	   public ModelAndView mailReForm(@RequestParam("m_id") String m_id) {
		System.out.println("답장으로 보내는 사람 : " + m_id);	
			mav = new ModelAndView();
			mav.addObject("m_id", m_id);
			mav.setViewName("note/mailWriteForm");
			return mav;
	   }	
	
	@RequestMapping(value = "/mailWrite", method = RequestMethod.GET)
	   public ModelAndView mailWrite() {
			mav = new ModelAndView();
			mav.setViewName("mailWrite");
			mav = nt.nt_NoteWrite();
			System.out.println("mailWrite 소환!!");
			
		   return mav;
	   }
	
	@RequestMapping(value = "/noteBlock", method = RequestMethod.GET)
	public String noteBlock(
			@RequestParam("id_1") String id_1, 
			@RequestParam("id_2") String id_2){
		System.out.println("black  "+ id_1+" " + id_2);
		nt.noteBlock(id_1,id_2);
		return "redirect:/noteList";
	}

	@RequestMapping(value = "/mailDetail", method = RequestMethod.GET)
	   public ModelAndView mailDetail(@RequestParam("index") int index) {
		   mav = nt.nt_NoteDetail(index);
		   return mav;
	   }

	@RequestMapping(value = "/mailDelete", method = RequestMethod.POST)
	public String mailDelete0(
			@RequestParam("RowCheck1") Integer[] rowCheck0, 
			@RequestParam("btn_sort") Integer[] btn_sort,
			ModelMap modelMap) throws Exception {
	
	    for(int sort : btn_sort) {
	    	System.out.println("sort :  " + sort);
	     	if(sort == 2) {
	    		List<Note> note = null;
	    		for (int index : rowCheck0) {
		    		note = nt.m_id2Ban(index); 	 
		    		System.out.println(note.get(0).getM_id());
		    		System.out.println(note.get(0).getN_index());		
				return "redirect:/banWrite?sort=4&m_id2="+note.get(0).getM_id()+"&index="+note.get(0).getN_index();
	    		}  
	    	}   
	    	else if(sort == 3) {
	    		System.out.println("보낸 쪽지 삭제 수행");
	    		for (int index : rowCheck0) {
			        System.out.println("메모 삭제1 = " + index);
			        int countDel = nt.noteDelete(index,3);  
		    	}  
	    		
	    	}else if(sort == 4) {
	    		System.out.println("받은 쪽지 삭제 수행");
	    		for (int index : rowCheck0) {
			        System.out.println("메모 삭제1 = " + index);
			        int countDel = nt.noteDelete(index,4);  
		    	}  
	    	}
	    }
	    return "redirect:/noteList";
	}
	
	
	@RequestMapping(value = "/mailDelete1", method = RequestMethod.POST)
	public String mailDelete1(
			@RequestParam("RowCheck1") Integer[] rowCheck1, 
			@RequestParam("btn_sort") Integer[] btn_sort,
			ModelMap modelMap) throws Exception {
	    
	    for(int sort : btn_sort) { // 삭제 실행
	    	System.out.println("sort :  " + sort);
	    	if(sort == 1) {
	    		for (int index : rowCheck1) {
			        int countDel = nt.noteDelete(index,1);  
		    	}  
	    	}
	    	else if(sort == 2) { // 신고 수행
	    		List<Note> note = null;
	    		for (int index : rowCheck1) {
		    		note = nt.m_id2Ban(index); 	 
		    	return "redirect:/banWrite?sort=4&m_id2="+note.get(0).getM_id()+"&index="+note.get(0).getN_index();
	    		}  
	    	}   	
	    }
	    return "redirect:/noteList";
	}
	
	@RequestMapping(value = "/banWrite", method = RequestMethod.GET) // 신고 폼으로 
	   public ModelAndView banWrite(int sort ,String m_id2,int index) {
			mav = new ModelAndView();
			mav.addObject("m_id2",m_id2);
			mav.addObject("sort",sort);
			mav.addObject("index",index);
			mav.setViewName("NYJ/banWrite");
			return mav;
	   }
	
	@RequestMapping(value = "/banInsert", method = RequestMethod.GET) // 신고 내용 작성
	   public ModelAndView banInsert(int sort, String m_id2, int index) {
			mav = new ModelAndView();
			mav = nt.banInsert(sort,index,m_id2);
			return mav;
	   }
	
	
	
	
	

	
	
}
