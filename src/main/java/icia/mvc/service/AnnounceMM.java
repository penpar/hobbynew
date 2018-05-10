package icia.mvc.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.bean.Notice;
import icia.mvc.bean.Vote;
import icia.mvc.dao.InoticeDAO;

@Service
public class AnnounceMM {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private InoticeDAO anDao;
	@Autowired
	private HttpServletRequest request;
	private ModelAndView mav;
	private Map<String,List<Notice>> sortMap;
	
	//공지사항 등록
	public ModelAndView b_NoticeWrite(MultipartHttpServletRequest multi) {
		mav=new ModelAndView();
		String view=null;
		int success = 0;
		
		System.out.println("NYJ b_NoticeWrit Call");
		
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        int check = Integer.parseInt(multi.getParameter("fileChk"));
        int mainChk = Integer.parseInt(multi.getParameter("mainChk"));
        
        System.out.println("check : "+check);
        Map<String,String> fMap=null;
        
        if(check==1){//파일 첨부했다면
            UploadFile upload = new UploadFile();
            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
        }else{
        	fMap = new HashMap<String, String>();
        }
        
        //DB에 저장
        
        Notice notice = new Notice();
        
        notice.setCb_subject(multi.getParameter("cb_subject")); //빈에 cb_subject 넣어줌
        notice.setCb_content(multi.getParameter("cb_content")); //빈에 cb_content 넣어줌
        notice.setM_id(mb.getM_id()); //빈에 m_id 넣어줌
        notice.setCb_sort(Integer.parseInt(multi.getParameter("cb_sort"))); // 게시판 구분
        System.out.println("ID : "+mb.getM_id());
        
        fMap.put("m_id", mb.getM_id());
        
        notice.setMainChk(mainChk);
        System.out.println("메인 노출 여부 : "+mainChk);
        if(mainChk == 1){
        	anDao.removeChk();
        }
        
        System.out.println("here : "+success);
    	success = b_Announce(notice,fMap,check);
    	if(success == 1){
    		System.out.println("공지사항 등록 성공");
        	mav.addObject("check","공지사항 등록 완료");
        	view="redirect:announceList";
    	}else{
    		System.out.println("공지사항 등록 실패");
            mav.addObject("check","공지사항 등록 실패");
            view="redirect:announceList";
    	}
        mav.setViewName(view);
        return mav;
	}//공지사항 등록 b_NoticeWrite End
	
	//공지사항 작성시 게시판 테이블 등록 -> 공지사항 테이블 등록 -> 파일 테이블 등록
	private int b_Announce(Notice notice, Map<String, String> fMap, int check) {
		int flag = 0;
		flag = anDao.b_NoticeWrite(notice); // comboard
		if(flag!=0){	//게시판 글쓰기 성공 시
			System.out.println("notice Cb_index : "+notice.getCb_index());
			flag = anDao.b_Announce(notice);//공지사항 글 등록
			if(flag!=0){
				if(check!=0){
					fMap.put("cb_index",String.valueOf(notice.getCb_index()));
					flag=anDao.b_AnFileInserte(fMap);
				}
			}
		}
		
		return flag;
	}
	
	
	
	//공지사항 수정
		public ModelAndView announceChange(MultipartHttpServletRequest multi) {
			System.out.println("NYJ announceChange Call");
			
			System.out.println("NYJ b_NoticeChange cb_subject : "+multi.getParameter("cb_subject"));
			System.out.println("NYJ b_NoticeChange cb_content : "+multi.getParameter("cb_content"));
			System.out.println("NYJ b_NoticeChange cb_date : "+multi.getParameter("cb_date"));
			System.out.println("NYJ b_NoticeChange cb_sort : "+multi.getParameter("cb_sort"));
			
			System.out.println("NYJ b_NoticeChange cb_index : "+multi.getParameter("cb_index"));
			System.out.println("NYJ b_NoticeChange m_id : "+multi.getParameter("m_id"));
			
			System.out.println("NYJ b_NoticeChange an_main : "+multi.getParameter("an_main"));
			
			System.out.println("NYJ b_NoticeChange fs_index : "+multi.getParameter("fs_index"));
			System.out.println("NYJ b_NoticeChange f_newName : "+multi.getParameter("f_newName"));
			
			System.out.println("NYJ b_NoticeChange fileChk : "+multi.getParameter("fileChk"));
			
			mav=new ModelAndView();
			String view=null;
			Map<String,String> fMap=null;
			
			Member mb = (Member) session.getAttribute("mb");
	        String id = mb.getM_id();
	        int check = Integer.parseInt(multi.getParameter("fileChk"));
	        int cb_index=Integer.parseInt(multi.getParameter("cb_index"));
	        
	        //파일 수정시 서버에 올려두 파일 삭제 위해 path와 f_newName 선언
	        String path="D:/HNresources/uploadFolder/resources/announce/";
	        String f_newName=multi.getParameter("f_newName");
	        
	        System.out.println("check : "+check);
	        
	        //서버에 올린 파일 제거
	        if(check==1){//파일 첨부했다면
	        	//파일 제거
	        	File file = new File(path+f_newName);
	        	if(file.exists()){
	        		
	        		if(file.delete()){
	        			System.out.println("서버 파일 삭제 성공");
	        			
	        			if(anDao.anFileDel(cb_index)!=0){
	        				System.out.println("DB 파일 삭제 성공");
	        				
	        				UploadFile upload = new UploadFile();
	        	            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
	        				
	        				
	        			}else{
	        				System.out.println("DB 파일 삭제 실패");
	        			}
	        			
	        		}else{
	        			System.out.println("서버파일 삭제 실패");
	        		}//delete End
	        		
	        	}//exists End
	        }else{
	        	fMap = new HashMap<String, String>();
	        }//서버에 올린 파일 제거 End
	        
	        
	        
	        Notice notice = new Notice();

	        notice.setCb_index(cb_index);
	        notice.setCb_subject(multi.getParameter("cb_subject")); //빈에 cb_subject 넣어줌
	        notice.setCb_content(multi.getParameter("cb_content")); //빈에 cb_content 넣어줌
	        notice.setM_id(mb.getM_id()); //빈에 m_id 넣어줌
	        notice.setCb_sort(Integer.parseInt(multi.getParameter("cb_sort"))); // 게시판 구분
	        System.out.println("ID : "+mb.getM_id());
	        
	        fMap.put("m_id", mb.getM_id());
	        
	        if(b_noticeChange(notice,fMap,check)!=0){
	        	System.out.println("공지사항 등록 성공");
	        	fMap.put("cb_index",String.valueOf(notice.getCb_index()));
				if(anDao.b_AnFileInserte(fMap)!=0){
					System.out.println("공지사항 파일 수정 성공");
					
				}else{
					System.out.println("공지사항 파일 수정 실패");
				}
	        }else{
	            System.out.println("공지사항 등록 실패");
	        }
	        view="redirect:announceList";
	        mav.setViewName(view);
	        return mav;
	        
	        
		}//공지사항 수정 End
		
		
		//공지사항 수정 시 게시판테이블 업데이트
	private int b_noticeChange(Notice notice, Map<String, String> fMap, int check) {
		int flag = 0;
		flag = anDao.b_NoticeChange(notice);
		if(flag!=0){
			System.out.println("공지사항 게시판 테이블 수정 성공");
		}else{
			System.out.println("공지사항 게시판 테이블 수정 실패");
		}
		return flag;
		}


	//공지사항 리스트 요청
	public ModelAndView announceList() {
		System.out.println("NYJ ANNOUNCE MM announceList Call 공지사항 리스트 요청");
		
		mav=new ModelAndView();
		String view=null;
		List<Notice> anlist=null;
		
		anlist=anDao.getboardList();
		System.out.println("anlist"+anlist);
		
		mav.addObject("anlist",anlist);
		view="NYJ/announceList";
		mav.setViewName(view);
		return mav;
	}

	//공지사항 상세보기 요청
	public ModelAndView announceForm(HttpServletRequest request) {
		System.out.println("NYJ ANNOUNCE MM announceForm Call 공지사항 상세보기 요청");
		int cb_index=Integer.parseInt(request.getParameter("cb_index"));
		System.out.println(cb_index);
		
		mav=new ModelAndView();
		String view = null;
		
		List<Notice> nolist=anDao.getboardDetail(cb_index);
		
		System.out.println("nolist : "+nolist);
		
		session.setAttribute("nolist", nolist);
		view="NYJ/announceForm";
		
		mav.setViewName(view);
		
		return mav;
	}

	//공지사항 삭제
	public ModelAndView b_NoticeDel(MultipartHttpServletRequest multi) {
		System.out.println("================b_NoticeDel====================");
		System.out.println("NYJ AnnounceMM b_NoticeDel call");
		mav=new ModelAndView();
		String view=null;
		Map<String,String> fMap=null;
		
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        int cb_index=Integer.parseInt(multi.getParameter("cb_index"));  
        
        String path="D:/HNresources/uploadFolder/resources/announce/";
        String f_newName=multi.getParameter("f_newName");
        int fileChk = Integer.parseInt(multi.getParameter("fileChk"));
        
        System.out.println("=====================================");
        System.out.println("NYJ b_NoticeDel cb_index: "+cb_index);
        System.out.println("NYJ b_NoticeDel id: "+id);
        System.out.println("NYJ b_NoticeDel f_newName : "+f_newName);
        System.out.println("NYJ b_NoticeDel fileChk : "+fileChk);
        
        File file = new File(path+f_newName);
        
        if(fileChk!=0){
			if(file.exists()){
	
	    		if(file.delete()){
	    			System.out.println("서버 파일 삭제 성공");
	    			
	    			if(anDao.anFileDel(cb_index)!=0){
	    				System.out.println("DB 파일 삭제 성공");
	    				
	    				if(anDao.announceDel(cb_index)!=0){
	    					System.out.println("공지사항 테이블 삭제 성공");
	    					
	    					if(anDao.comboardDel(cb_index)!=0){
	    						System.out.println("게시판 테이블 삭제 성공");
	    						
	    					}else{
	    						System.out.println("게시판 테이블 삭제 실패");
	    					}//게시판 테이블 삭제 End
	    					
	    				}else{
	    					System.out.println("공지사항 테이블 삭제 실패");
	    				}//공지사항 테이블 삭제 End
	    				
	    			}else{
	    				System.out.println("DB 파일 삭제 실패");
	    			}//DB 파일 삭제 End
	    			
	    		}else{
	    			System.out.println("서버파일 삭제 실패");
	    		}//delete End
	    		
	    	}//exists End
			
        }else{
        	if(anDao.announceDel(cb_index)!=0){
				System.out.println("공지사항 테이블 삭제 성공");
				
				if(anDao.comboardDel(cb_index)!=0){
					System.out.println("게시판 테이블 삭제 성공");
					
				}else{
					System.out.println("게시판 테이블 삭제 실패");
				}//게시판 테이블 삭제 End
				
			}else{
				System.out.println("공지사항 테이블 삭제 실패");
			}//공지사항 테이블 삭제 End
        	
        }//공지사항 삭제 작업 End
		
		view="redirect:announceList";
		mav.setViewName(view);
		return mav;
	}

	//공지사항 분류 (전체:0, 공지사항:1, 이벤트:6)
	public Map<String, List<Notice>> b_NoticeSort(int cb_sort) {
		String view;
		mav=new ModelAndView();
		sortMap=new HashMap<String,List<Notice>>();
		List<Notice> anlist=null;
		System.out.println("NYJ AnnounceMM b_NoticeSort cb_sort : "+cb_sort);
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		if(cb_sort==7){
			anlist=anDao.getboardList();
			
			System.out.println(anlist.get(0).getCb_date());
			
			for(int i=0;i<anlist.size();i++){
				Date date = anlist.get(i).getCb_date();
				
				String cb_date=fmt.format(date);
				
				anlist.get(i).setFm_date(cb_date);
			}
			
			sortMap.put("anlist", anlist);
			System.out.println("NYJ AnnounceMM b_NoticeSort"+sortMap);
		}else{
			
			anlist=anDao.b_NoticeSort(cb_sort);
			
			for(int i=0;i<anlist.size();i++){
				Date date = anlist.get(i).getCb_date();
				
				String cb_date=fmt.format(date);
				
				anlist.get(i).setFm_date(cb_date);
			}
			
			sortMap.put("anlist", anlist);
			System.out.println("NYJ AnnounceMM b_NoticeSort"+sortMap);
		}
		
		return sortMap;
	}

	// 메인 롤링에 공지사항 뿌리기
	public ModelAndView getAnnList() {
		String view= null;
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		
		List<Notice> anList = anDao.getAnnList(); // comboard 가져오기
			
		String path = uploadFile.getPath(6);
		String[] realPath = path.split(":");
		System.out.println("path : "+realPath[1]);
		
		mav.addObject("anList", anList);
		mav.addObject("path", realPath[1]); // 사진 경로
		
		view="main";
		mav.setViewName(view);
		return mav;
	}
}
