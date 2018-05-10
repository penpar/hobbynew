package icia.mvc.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.bean.SiteIntro;
import icia.mvc.dao.SiteIntroDAO;

@Service
public class SiteMM {

	@Autowired
	private SiteIntroDAO stDao;
	
	@Autowired
	private HttpSession session;
	private ModelAndView mav;
	
	//사이트 소개 글쓰기
	public ModelAndView siteWrite(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
        Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        int check = Integer.parseInt(multi.getParameter("fileChk"));
        
        Map<String,String> stMap=null;
        if(check==1){//파일 첨부했다면
            UploadFile upload = new UploadFile();
            stMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
        }else{
        	stMap = new HashMap<String, String>();
        }
        
        //map에 저장
        stMap.put("m_id", id);
        stMap.put("cb_subject", "사이트 소개 제목");
        stMap.put("cb_content", multi.getParameter("siteWrite_content"));
        stMap.put("cb_sort", multi.getParameter("cb_sort"));
        
        String view = null;
        
        if(siteWrite(stMap,check)!=0){
        	mav.addObject("msg", "글쓰기에 성공하였습니다.");
            view="han/siteIntroPage"; // 글쓰기 등록 성공할 경우
            System.out.println("글쓰기 성공");
        }else{
        	mav.addObject("msg", "글쓰기에 실패하였습니다.");
            view="han/siteIntroPage";// 글쓰기 등록 실패할 경우
            System.out.println("글쓰기 성공 실패");
        }
        mav.setViewName(view);
        return mav;
	}

	// 글쓰기
	private int siteWrite(Map<String, String> stMap, int check) {
		int flag = 0;
		flag = stDao.comboardWrite(stMap);
    	if(flag ==1){
    		 if(check==1){
	            flag=stDao.siteFileInsert(stMap);
    		 }
    	}
        return flag;
	}
	
	// 이미지 가져오기
	public ModelAndView getSiteIntro() {
		mav = new ModelAndView();
		UploadFile upload = new UploadFile();
		String path = upload.getPath(4);
		SiteIntro siteIntro = stDao.getSiteIntro(1);
		String[] realPath = path.split(":");
		System.out.println(realPath[1]);
		mav.addObject("path", realPath[1]);
		mav.addObject("siteIntro", siteIntro);
		mav.setViewName("han/siteIntroPage");
		return mav;
	}
}
