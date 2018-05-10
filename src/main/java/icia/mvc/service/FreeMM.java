package icia.mvc.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Files;
import icia.mvc.bean.Free;
import icia.mvc.bean.Member;
import icia.mvc.bean.Notice;
import icia.mvc.bean.Recommand;
import icia.mvc.bean.Vote;
import icia.mvc.dao.IfreeDAO;
import icia.mvc.userClass.Paging;

@Service
public class FreeMM {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private IfreeDAO fDao;
	@Autowired
	private HttpServletRequest request;
	private ModelAndView mav;
	
	//글쓰기 폼 이동시 ClassName 값들 요청
	public ModelAndView freeWrite() {
		System.out.println("NYJ FreeMM freeWrite Call");
		System.out.println("===========================");
		mav=new ModelAndView();
		List<Free> numlist=null;
		String view=null;
		
		numlist = fDao.freeCN_indexCall();
		System.out.println(numlist);
		
		mav.addObject("numlist",numlist);
		
		view="NYJ/freeWrite";
		mav.setViewName(view);
		
		return mav;
	}
	
	//자유게시판 글쓰기
	public ModelAndView b_freeWrite(Free free, MultipartFile[] anFile) {
		System.out.println("NYJ FreeMM b_freeWrite Call");
		
		mav=new ModelAndView();
		String view=null;
		
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        free.setM_id(id);
        UploadFile uploadFile = new UploadFile();
        
        String path="";
        path = uploadFile.getPath(free.getFs_index());
        
        
        File dir=new File(path);
        if(!dir.isDirectory()){
        	dir.mkdir();
        }
        
        //말머리 []붙이기
        String title=free.getFb_title();
    	String fb_title= "["+title+"]";
    	System.out.println(fb_title);
    	
    	free.setFb_title(fb_title);
        
    	int flag=0;
    	
        if(fDao.comboardWrite(free)!=0){
        	System.out.println("자유게시판 게시판테이블 등록 성공");
        	
        	if(fDao.freeBoardWrite(free)!=0){
        		System.out.println("자유게시판 자유테이블 등록 성공");
        		
        		Files files = null;
        		if(anFile[0].getSize() > 0){
        			for(MultipartFile file:anFile){
            			String oriFileName = file.getOriginalFilename();
            			String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
            			System.out.println(sysFileName);
            			files = new Files();
            			File dest = new File(path, sysFileName);
            			
            			try {
    						FileCopyUtils.copy(file.getBytes(), dest);
    					} catch (IOException e) {
    						e.printStackTrace();
    					}//try catch End
            			
            			files.setM_id(id);
            			files.setF_oriName(oriFileName);
            			files.setF_newName(sysFileName);
            			files.setCb_index(free.getCb_index());
            			files.setFs_index(free.getFs_index());
            			
            			System.out.println("===========================");
            			System.out.println(files.getM_id());
            			System.out.println(files.getF_oriName());
            			System.out.println(files.getF_newName());
            			System.out.println(files.getCb_index());
            			System.out.println(files.getFs_index());
            			System.out.println("===========================");
            			
            			if(fDao.freeFileInsert(files)!=0){
            				System.out.println("자유게시판 파일테이블 등록 성공");
            				mav.addObject("msg","글 작성 성공");
            				
            				
            			}else{
            				System.out.println("자유게시판 파일테이블 등록 실패");
            				mav.addObject("msg","파일테이블 등록 실패");
            			}
            		}//for End
        		}
        	}else{
        		System.out.println("자유게시판 자유테이블 등록 실패");
        		mav.addObject("msg","자유테이블 등록 실패");
        	}//자유게시판 자유테이블 등록 End
        }else{
        	System.out.println("자유게시판 게시판테이블 등록 실패");
        	mav.addObject("msg","게시판 테이블 등록 실패");
        }//자유게시판 게시판 테이블 등록 End
        view="redirect:freeList";
        mav.setViewName(view);
		return mav;
	}

	//자유게시판 리스트 가져오기
	public ModelAndView freeList() {
		System.out.println("NYJ FreeMM freeList Call");
		System.out.println("=======================");
		
		mav=new ModelAndView();
		String view=null;
		List<Free> flist=null;
		
		flist = fDao.freeList();
		System.out.println("NYJ FreeMM freeList flist"+flist);
		
		mav.addObject("flist",flist);
		view="NYJ/freeList";
		mav.setViewName(view);
		return mav;
	}

	//자유 게시글 상세보기
	public ModelAndView freeDetail(HttpServletRequest request) {
		System.out.println("NYJ FreeMM freeDetail Call");
		int cb_index=Integer.parseInt(request.getParameter("cb_index"));
		System.out.println(cb_index);
		
		//세션 아이디
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
		
        
		UploadFile uploadFile = new UploadFile();
		mav=new ModelAndView();
		String view = null;
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		//=====글 내용 select=====
		Free freeCom=fDao.getFreeDetail(cb_index);
		
		//==말머리랑 제목 꺼내서 합치기==
		String fb_title = freeCom.getFb_title();
		String cb_subject = freeCom.getCb_subject();
		
		System.out.println(fb_title);
		System.out.println(cb_subject);
		
		String det_subject = fb_title+" "+cb_subject;
		System.out.println(det_subject);
		
		freeCom.setDet_subject(det_subject);
		
		freeCom.setCb_index(cb_index);
		freeCom.setPageNum(pageNum);
		//=====파일 이름 select 후 split으로 경로 추출=====
		freeCom.setfList(fDao.freeGetFile(cb_index));//파일 전체 이름 select
		
		// ======== 즐겨찾기 리스트 불러오기
	
		HashMap<String, String> rc = new HashMap<String, String>();
		rc.put("m_id", id);
		rc.put("cb_index", String.valueOf(cb_index));
		
		int bookCnt = fDao.myBookList(rc);
		System.out.println("bookCnt :" + bookCnt );
		String path = uploadFile.getPath(2);
		String[] realPath = path.split(":");
		
		System.out.println(path);
		System.out.println("realPath : "+realPath[1]);
		
		System.out.println("===================");
		System.out.println("===================");
		
		//=====파일 select=====
		freeCom.setfAllList(fDao.freeGetFiles(cb_index));
		
		
		//=====댓글 리스트 가져오기=====
		List<Free> commList = fDao.getCommList(freeCom);
		
		System.out.println("댓글 리스트 "+commList);
		
		
		//=====댓글 총 갯수 가져오기=====
		int commCount = fDao.commCount(cb_index);
		System.out.println(commCount);
		
		System.out.println("===================");
		System.out.println("===================");
		
		//=====댓글 페이징=====
		
		Paging paging = new Paging(commCount,pageNum,7,5,"freeDetail",cb_index);
		
		//=====조회수 증가=====
		int viewUp = fDao.viewUp(cb_index);
		if(viewUp!=0){
			freeCom.setCb_click(fDao.getViewUp(cb_index));
		}
		
		//mav에 담아 Return
		mav.addObject("paging",paging.makeHtmlPaging());//댓글 페이징
		mav.addObject("commCount",commCount);//댓글 총 갯수
		mav.addObject("freeCom",freeCom);//게시물내용+파일 리스트
		mav.addObject("realPath",realPath[1]);//이미지 경로
		mav.addObject("commList",commList);//댓글 리스트
		mav.addObject("bookCnt",bookCnt);
		view="NYJ/freeDetail";
		
		mav.setViewName(view);
		
		
		return mav;
	}

	//댓글 입력
	public Map<String, Object> b_FreeComWrite(Free free) {
		System.out.println("NYJ FreeMM b_FreeComWrite Call");
		Map<String, Object> commMaps = new HashMap<String, Object>();
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		free.setPageNum(pageNum);
		int commCount = 0;
		int success = fDao.b_FreeComWrite(free);
		System.out.println("success : "+success);
		
		//댓글 리스트 다시 가져온다
		if(success!=0){
			System.out.println("댓글 입력 성공");
			List<Free> commList = fDao.getCommList(free);//댓글 입력
			commCount = fDao.commCount(free.getCb_index());//댓글 총 갯수
			
			for(int i=0;i<commList.size();i++){
				System.out.println(commList.get(i).getSecretChk());
			}
			
			if(commList.size()>0){
				commMaps.put("commCount", commCount);
				commMaps.put("commList", commList);
			}
			
		}else{
			System.out.println("댓글 입력 실패");
			commMaps.put("commList", null);
		}
		
		
		return commMaps;
	}

	//수정 폼으로 이동 시
	public ModelAndView freeChangeForm() {
		System.out.println("NYJ FreeController freeChangeForm Call");
		System.out.println("===========================");
		int cb_index=Integer.parseInt(request.getParameter("cb_index"));
		System.out.println(cb_index);
		
		UploadFile uploadFile = new UploadFile();
		mav=new ModelAndView();
		String view = null;
		List<Free> numlist=null;
		
		//=====글 내용 select=====
		Free freeCom=fDao.getFreeDetail(cb_index);
		
		//==말머리랑 제목 꺼내서 합치기==
		String fb_title = freeCom.getFb_title();
		String cb_subject = freeCom.getCb_subject();
		
		System.out.println(fb_title);
		System.out.println(cb_subject);
		
		String det_subject = fb_title+" "+cb_subject;
		System.out.println(det_subject);
		
		freeCom.setDet_subject(det_subject);
		
		
		//=====파일 이름 select 후 split으로 경로 추출=====
		freeCom.setfList(fDao.freeGetFile(cb_index));//파일 전체 이름 select
		
		String path = uploadFile.getPath(2);
		String[] realPath = path.split(":");
		
		System.out.println(path);
		System.out.println("realPath : "+realPath[1]);
		
		System.out.println("===================");
		System.out.println("===================");
		
		//=====파일 select=====
		freeCom.setfAllList(fDao.freeGetFiles(cb_index));
		
		
		//=====댓글 리스트 가져오기=====
		List<Free> commList = fDao.getCommList(freeCom);
		System.out.println(commList);
		
		
		//=====댓글 총 갯수 가져오기=====
		int commCount = fDao.commCount(cb_index);
		System.out.println(commCount);
		
		System.out.println("===================");
		System.out.println("===================");
		
		//=====분류리스트 가져오기=====
		numlist = fDao.freeCN_indexCall();
		System.out.println(numlist);
		
		
		//mav에 담아 Return
		mav.addObject("freeCom",freeCom);//게시물내용+파일 리스트
		mav.addObject("realPath",realPath[1]);//이미지 경로
		mav.addObject("commList",commList);//댓글 리스트
		mav.addObject("commCount",commCount);//댓글 총 갯수
		mav.addObject("numlist",numlist);//분류 리스트(음악, 영화, 독서 등...)
		
		
		view="NYJ/freeChangeForm";
		
		mav.setViewName(view);
		
		
		return mav;
	}

	//자유게시판 글 수정
	public ModelAndView b_freeChange(Free free, MultipartFile[] anFile) {
		System.out.println("NYJ FreeMM b_freeChange Call");
		System.out.println("=======================================");
		System.out.println("NYJ b_freeChange fb_title : "+free.getFb_title());
		System.out.println("NYJ b_freeChange cb_subject : "+free.getCb_subject());
		System.out.println("NYJ b_freeChange cb_content : "+free.getCb_content());
		System.out.println("NYJ b_freeChange cb_date : "+free.getCb_date());
		System.out.println("NYJ b_freeChange cb_sort : "+free.getCb_sort());
		System.out.println("NYJ b_freeChange cn_index : "+free.getCn_index());
		
		System.out.println("NYJ b_freeChange cb_index : "+free.getCb_index());
		System.out.println("NYJ b_freeChange m_id : "+free.getM_id());
		
		System.out.println("NYJ b_freeChange fs_index : "+free.getFs_index());
		System.out.println("NYJ b_freeChange anFile : "+anFile);
		
		System.out.println("NYJ b_freeChange fileChk : "+free.getFileChk());
		
		
		System.out.println("=======================================");
		
		mav=new ModelAndView();
		String view=null;
		Map<String,String> fMap=null;
		UploadFile uploadFile = new UploadFile();
		
		Member mb = (Member) session.getAttribute("mb");
		String m_id = mb.getM_id();
		
        String path = "";
        path = uploadFile.getPath(free.getFs_index());
        System.out.println("저장경로 : "+path);
        
        int success =0;
        int check =free.getFileChk();
        int cb_index=free.getCb_index();
        
        System.out.println("check : "+check);
        
        //해당 글의 파일 갯수 불러오기
       /* int fileCount = fDao.freeFileCount(cb_index);
        String[] fileName = new String[fileCount];
        System.out.println("fileName : "+fileName);*/
        
        /*HashMap<String, Object> freeMap = new HashMap<String, Object>();
        freeMap.put("cb_index", cb_index);*/
        
        Files files = null;
        List<Free> fNameList = fDao.findDelFile(cb_index);
        System.out.println("fNameList : "+fNameList);
        

       //파일 첨부 했다면
        if(free.getFileChk()==1){
        	
        	//서버 파일 삭제
        	for(int i=0;i<fNameList.size();i++){
            	System.out.println("등록되어있는 이미지 : "+fNameList.get(i).getF_newName());
            	File file = new File(path+fNameList.get(i).getF_newName());
            	if(file.exists()){
            		
    				if(file.delete()){
    					System.out.println(i+"번째 파일 삭제 성공");
    				}else{
    					System.out.println(i+"번째 파일 삭제 실패");
    				}//if delete End
    				
    			}//if exists End
            	
            }//for End
        	
        	if(fDao.freeFileDelete(free)!=0){
        		System.out.println("DB 파일 삭제 성공");
        			
        		if(fDao.comboardChange(free)!=0){
        			System.out.println("게시판 테이블 수정 성공");
        			
        			/*//==말머리 []붙이고 제목 합치기==
        			String title = free.getFb_title();
        			String cb_subject = free.getCb_subject();
        			
        			String fb_title= "["+title+"]";
        			
        			System.out.println(fb_title);
        			System.out.println(cb_subject);
        					
        			String det_subject = fb_title+" "+cb_subject;
        			System.out.println(det_subject);
        					
        			free.setDet_subject(det_subject);*/
        			
        			if(fDao.b_freeChange(free)!=0){
        				System.out.println("자유테이블 수정 성공");
        				
                		for(MultipartFile file:anFile){
                			String oriFileName = file.getOriginalFilename();
                			String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
                			System.out.println(sysFileName);
                			files = new Files();
                			File dest = new File(path, sysFileName);
                			
                			try {
        						FileCopyUtils.copy(file.getBytes(), dest);
        					} catch (IOException e) {
        						e.printStackTrace();
        					}//try catch End
                			
                			files.setM_id(m_id);
                			files.setF_oriName(oriFileName);
                			files.setF_newName(sysFileName);
                			files.setCb_index(free.getCb_index());
                			files.setFs_index(free.getFs_index());
                			
                			System.out.println("===========================");
                			System.out.println(files.getM_id());
                			System.out.println(files.getF_oriName());
                			System.out.println(files.getF_newName());
                			System.out.println(files.getCb_index());
                			System.out.println(files.getFs_index());
                			System.out.println("===========================");
                			
                			if(fDao.freeFileInsert(files)!=0){
                				System.out.println("자유게시판 파일테이블 등록 성공");
                				mav.addObject("msg","글 수정 성공");
                				
                				
                			}else{
                				System.out.println("자유게시판 파일테이블 등록 실패");
                				mav.addObject("msg","글 수정 실패");
                				
                			}
                				
                		}//for End
        				
        				
        			}else{
        				System.out.println("자유테이블 수정 실패");
        			}//b_freeChange 자유테이블 수정 End
        			
        		}else{
        			
        			System.out.println("게시판 테이블 수정 실패");
        			
        		}//comboardChange 게시판 테이블 수정 End
        		
        	}else{
        		System.out.println("DB 파일 삭제 실패");
        		
        	}//freeFileDelete DB 파일 삭제 End
        	
        	
        	
        }else{
        	
        	
        	
        	
        	
        	
        	
        }
        
        view="redirect:freeList";
        mav.setViewName(view);
				
		return mav;
	}
	
	//자유게시판 게시글 삭제
	public ModelAndView b_FreeDel(int cb_index) {
		System.out.println("NYJ FreeMM b_FreeDel Call");
		System.out.println("===========================");
		
		mav=new ModelAndView();
		String view=null;
		
		List<Free> fNameList = fDao.findDelFile(cb_index);
		Files files = null;
		System.out.println("fNameList : "+fNameList);
		
		UploadFile uploadFile = new UploadFile();
		String path = "D:/HNresources/uploadFolder/resources/freeboard/";
        System.out.println("저장경로 : "+path);
		
		for(int i=0;i<fNameList.size();i++){
        	System.out.println("등록되어있는 이미지 : "+fNameList.get(i).getF_newName());
        	File file = new File(path+fNameList.get(i).getF_newName());
        	if(file.exists()){
        		
				if(file.delete()){
					System.out.println(i+"번째 파일 삭제 성공");
				}else{
					System.out.println(i+"번째 파일 삭제 실패");
				}//if delete End
				
			}//if exists End
        	
        }//for End
		
		if(fDao.freeFileDel(cb_index)!=0){
    		System.out.println("DB 파일 삭제 성공");
    		
    		if(fDao.b_FreeDel(cb_index)!=0){
    			System.out.println("자유테이블 삭제 성공");
    			
    			if(fDao.comboardFreeDel(cb_index)!=0){
    				System.out.println("게시판 테이블 삭제 성공");
    			}else{
    				System.out.println("게시판 테이블 삭제 실패");
    			}
    			
    			
    		}else{
    			System.out.println("자유테이블 삭제 실패");
    		}
    		
		}else{
			System.out.println("DB파일 삭제 실패");
			
		}
		
		view="redirect:freeList";
        mav.setViewName(view);
		
		return mav;
	}
	
	//댓글 페이징
	public Map<String, Object> freePagingComent(int cb_index) {
		System.out.println("NYJ FreeMM freePagingComent Call");
		System.out.println("=================================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		
		UploadFile uploadFile = new UploadFile();
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        Free free = new Free();
        
        free.setCb_index(cb_index);
        free.setPageNum(pageNum);
        
        List<Free> commList = fDao.getFreeCommList(free); // 댓글 가져오기
		System.out.println("댓글 갯수"+commList.size());
		for(int i=0;i<commList.size();i++){
			System.out.println("index : "+commList.get(i).getCo_index());
		}
		int commCount = fDao.commCount(cb_index); // 댓글 총 갯수 가져오기
		
		Paging paging = new Paging(commCount,pageNum,7,5,"freeDetail",cb_index);
		
		map.put("paging",paging.makeHtmlPaging());
		map.put("commCount", commCount); // 댓글 총 갯수
		map.put("freeCom",free);
		map.put("commList",commList);
		
		return map;
	}

	//댓글 삭제
	public Map<String, Object> freeComDelete(int co_index, int cb_index) {
		Free free = new Free();
		Map<String, Object> commMaps = new HashMap<String, Object>();
		int success = fDao.comDelete(co_index);
		System.out.println("댓글 삭제 여부"+success);
		
		free.setCb_index(cb_index);
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		free.setPageNum(pageNum);
		
		int commCount = fDao.commCount(cb_index); // 댓글 총 갯수 가져오기
		
		Paging paging = new Paging(commCount,pageNum,7,5,"freeDetail",cb_index);
		
		commMaps.put("paging", paging.makeHtmlPaging());
		
		if(success !=0){
			System.out.println("댓글삭제 성공");
			List<Free> commList = fDao.getCommList(free);
			
			if(commList.size() > 0){
				commMaps.put("commCount", commCount);
				commMaps.put("pageNum", pageNum);
				commMaps.put("commList", commList);	
			}
			
		}else{
			System.out.println("댓글 삭제 실패");
			commMaps.put("commList", null);
			
		}
		
		return commMaps;
	}

	
	
	

}
