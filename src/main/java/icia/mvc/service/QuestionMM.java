package icia.mvc.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.bean.Question;
import icia.mvc.dao.QuestionDAO;

@Service
public class QuestionMM {
	
	@Autowired // 서버 시작 시 주입
    private QuestionDAO qDao;
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	//1:1 문의
	public ModelAndView questionWrite(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
        Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        int check = Integer.parseInt(multi.getParameter("fileChk"));

        System.out.println("check : "+check);
        Map<String,String> fMap=null;
        
        if(check==1){//파일 첨부했다면
            UploadFile upload = new UploadFile();
            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
        }else{
        	fMap = new HashMap<String, String>();
        }
        
        //DB에 저장
        Question question = new Question();
        
        question.setCb_subject(multi.getParameter("cb_subject")); //빈에 cb_subject 넣어줌
        question.setCb_content(multi.getParameter("cb_content")); //빈에 cb_content 넣어줌
        question.setQ_type(multi.getParameter("q_type")); //빈에 q_type 넣어줌
        question.setM_id(mb.getM_id()); //빈에 m_id 넣어줌
        question.setCb_sort(Integer.parseInt(multi.getParameter("cb_sort"))); // 게시판 구분
        System.out.println("ID : "+mb.getM_id());
        
        String view = null;
        fMap.put("m_id", mb.getM_id());
       
        
        if(questionWrite(question,fMap,check)!=0){
        	/*JOptionPane.showMessageDialog(null, "1:1 문의가 접수되었습니다.");*/
        	mav.addObject("msg", "1:1 문의가 접수되었습니다.");
            view="han/question"; // 글쓰기 등록 성공할 경우
            System.out.println("DB 등록 성공");
        }else{
        	/*JOptionPane.showMessageDialog(null, "1:1 문의 접수에 실패하였습니다. 다시 작성 부탁드립니다.");*/
        	mav.addObject("msg", "1:1 문의 접수에 실패하였습니다. 다시 작성 부탁드립니다.");
            view="han/question";// 글쓰기 등록 실패할 경우
            System.out.println("DB 등록 실패");
        }
        mav.setViewName(view);
        return mav;
    }
    
	// 글쓰기
    public int questionWrite(Question question, Map<String, String> fMap, int check) {    	
    	int flag = 0;
    	flag = qDao.comboardWrite(question);
        if(flag == 1){
        	System.out.println("cb_index : "+question.getCb_index());
        	flag = qDao.questionWrite(question);
        	if(flag ==1){
        		 if(check==1){
    	            fMap.put("cb_index", String.valueOf(question.getCb_index())); //스트링 형식으로 cb_index를 넣어줌 map을 <String,String> 해줬기 때문에
    	            flag=qDao.questionFileInsert(fMap);
        		 }
        	}
        }
        return flag;
    }
}
