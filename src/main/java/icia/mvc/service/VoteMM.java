package icia.mvc.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Files;
import icia.mvc.bean.Member;
import icia.mvc.bean.Vote;
import icia.mvc.dao.VoteDAO;
import icia.mvc.userClass.Paging;

@Service
public class VoteMM {

	@Autowired // 서버 시작 시 주입
	private VoteDAO vDao;
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	// 글쓰기
	public ModelAndView vWrite(Vote vote, MultipartFile[] v_file) {
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		String view = "";
        Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
		vote.setM_id(id);
		
		/*//1.이클립스의 물리적 저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");*/
		//저장경로를 넣을 변수
		String path = ""; //저장 경로
		path = uploadFile.getPath(vote.getFs_index());
		System.out.println("투표 게시판 사진 저장 경로 : "+path);
		
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){  //upload폴더 없다면
			dir.mkdir();  //upload폴더 생성
		}
		
		int flag = vDao.comboardWrite(vote);
		if(flag != 0){
			// 날짜 합치기 (시작 기간)
			String result1 = vote.getVs_year()+"-"+vote.getVs_month()+"-"+vote.getVs_day();
			vote.setV_startDay(Date.valueOf(result1));
			
			// 날짜 합치기 (끝나는 기간)
			String result2 = vote.getVe_year()+"-"+vote.getVe_month()+"-"+vote.getVe_day();
			vote.setV_endDay(Date.valueOf(result2));
			System.out.println("투표 게시판 날짜 : "+vote.getV_startDay()+"//"+vote.getV_endDay());
			flag = vDao.voteWrite(vote); // DB에 vote 데이터 저장

			if(flag == 1){
				for(int i=0;i<vote.getVi_name().size();i++){
					Map<String, Object> nameList = new HashMap<String, Object>();
					nameList.put("cb_index", vote.getCb_index());
					nameList.put("vi_name", vote.getVi_name().get(i));
					flag = vDao.voteItemWrite(nameList); // DB에 voteItem(투표 항목) 데이터 저장
				}
				
				if(flag != 0){
					flag = vDao.votePoint(vote.getM_id()); // 글 작성 완료 시 포인트 부여
				}
				
				// 파일을 첨부했을 경우
				if(vote.getFileChk() == 1){
					System.out.println("가져온 cb_index : "+vote.getCb_index());
					Files files = null;
					
					if(flag != 0){
						for(MultipartFile file:v_file) {
				            String oriFileName = file.getOriginalFilename();
				            // 저장할 파일이름
				            String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
				            files = new Files();
				            File dest = new File(path, sysFileName);
				            try {
				            	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
							} catch (Exception e) {
								e.printStackTrace();
							}
				            
				            files.setM_id(id);
				            files.setF_oriName(oriFileName);
				            files.setF_newName(sysFileName);
				            files.setCb_index(vote.getCb_index());
				            files.setFs_index(vote.getFs_index());
				            flag = vDao.voteFileInsert(files);//db에 등록
					
				            if(flag == 0){
				            	mav.addObject("msg", "글쓰기에 실패하였습니다.");
				                view="han/voteWrite";// 글쓰기 등록 실패할 경우
				                System.out.println("글쓰기 실패");
				                mav.setViewName(view);
				                return mav;
				            }
				        }
					}
				}
			}
		}
		
		mav.addObject("msg", "글쓰기에 성공하였습니다.");
        view="redirect:vote"; // 글쓰기 등록 성공할 경우
        System.out.println("글쓰기 성공");
            
        mav.setViewName(view);
        return mav;
	}

	// 투표 게시판 리스트 불러오기
	public ModelAndView voteList(HttpServletRequest request) {
		String view=null;
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		
		List<Vote> vList = vDao.voteList(); // comboard 가져오기
		for(int i = 0;i<vList.size();i++){
			// 해당 글의 첫번째 사진 이름 가져오기(뽑아온 리스트에서 cb_index 뽑아 보내기)
			String f_newName = vDao.getVoteFile(vList.get(i).getCb_index());
			vList.get(i).setF_newName(f_newName);
			System.out.println(vList.get(i).getF_newName());
		}
		
		// 남은 투표 기간 계산하기
		for(int i=0;i<vList.size();i++){			
			SimpleDateFormat vDay = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			
			String vToday = vDay.format(cal.getTime());
			Date dtToday = Date.valueOf(vToday);
			System.out.println("오늘 날짜 : "+dtToday);
			
			String endDay = vDay.format(vList.get(i).getV_endDay());
			Date dtendDay = Date.valueOf(endDay);
			System.out.println("투표 마지막 날짜 : "+dtendDay);
			
			long calDate = dtToday.getTime() - dtendDay.getTime();
			long calculator = calDate/(24*60*60*1000);
			
			// 음수를 양수로 변환
			long result = calculator;
			result = Math.abs(result);
			System.out.println("계산 결과 : "+result);
			vList.get(i).setV_time(result);
		}
		
		String path = uploadFile.getPath(6);
		String[] realPath = path.split(":");
		System.out.println("path : "+realPath[1]);
		
		mav.addObject("vList", vList);
		mav.addObject("path", realPath[1]); // 사진 경로
		
		view="han/vote";
		mav.setViewName(view);
		return mav;
	}

	// 투표 글 상세보기
	public ModelAndView voteDetail(int cb_index) {
		System.out.println("here : "+cb_index);
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		HashMap<String, Object> vMap = new HashMap<String,Object>();
		Map<String, Object> vSelectMap = new HashMap<String, Object>();
		List<Vote> voteItemList = new ArrayList<Vote>();
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
        Map<String, Object> userCheck = new HashMap<String, Object>();
        userCheck.put("m_id", id);
        userCheck.put("cb_index", cb_index);
        int userChk = vDao.voteCheck(userCheck); // 투표했는지 확인
        
        
        System.out.println(userChk);
		if(userChk != 0){
			voteItemList = vDao.getItemList(cb_index);
			for(int i=0;i<voteItemList.size();i++){
				voteItemList.get(i).setV_people(vDao.getPeople(voteItemList.get(i)));
				voteItemList.get(i).setV_person(vDao.getVotePerson(cb_index));
				System.out.println(voteItemList.get(i).getV_people());
			}
			vSelectMap.put("ItemList", voteItemList);
			mav.addObject("vSelectMap", vSelectMap);
		}else{
			mav.addObject("vSelectMap", null);
		}
		
		/*comboard 가져오기*/
		Vote voteCom = vDao.voteDetail(cb_index);
		/*voteCom.setCb_content(voteCom.getCb_content().replace("\r\n","<br/>"));
		System.out.println("상세보기 제목 : "+voteCom.getCb_subject());*/
		
		vMap.put("cb_index", cb_index);
		voteCom.setvList(vDao.voteGetFile(cb_index));
		voteCom.setVi_name(vDao.voteName(cb_index));
		voteCom.setPageNum(pageNum);
		
		List<Vote> commList = vDao.getCommList(voteCom); // 댓글 가져오기
		System.out.println("댓글리스트"+commList);
		int commSum = vDao.commSum(cb_index); // 댓글 총 갯수 가져오기
		
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",cb_index);
		
		/*for(int i=0;i<commList.size();i++){
			commList.get(i).setCo_content(commList.get(i).getCo_content().replace("\r\n","<br/>"));
			System.out.println("엔터찍기"+commList.get(i).getCo_content());
		}*/
		
		int viewUp = vDao.viewUp(cb_index);		
		if(viewUp != 0){
			voteCom.setCb_click(vDao.getViewUp(cb_index));
		}
		
		String path = uploadFile.getPath(6);
		String[] realPath = path.split(":");
		//System.out.println("fs_index : "+photo.getFs_index());
		System.out.println("path : "+realPath[1]);
		
		mav.addObject("paging",paging.makeHtmlPaging());
		mav.addObject("commSum", commSum); // 댓글 총 갯수
		mav.addObject("voteCom",voteCom);
		mav.addObject("commList",commList);
		mav.addObject("realPath", realPath[1]);
		mav.setViewName("han/voteDetail");
		
		return mav;
	}

	
	// 댓글 페이징
	public Map<String, Object> pagingComent(int cb_index) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;

		UploadFile uploadFile = new UploadFile();
		HashMap<String, Object> vMap = new HashMap<String,Object>();
		Map<String, Object> vSelectMap = new HashMap<String, Object>();
		List<Vote> voteItemList = new ArrayList<Vote>();
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();

		Vote voteCom = vDao.voteDetail(cb_index);
		System.out.println("cb_index 1 :"+cb_index);
		System.out.println("cb_index 2 :"+voteCom.getCb_index());
		vMap.put("cb_index", cb_index);
		voteCom.setvList(vDao.voteGetFile(cb_index));
		voteCom.setVi_name(vDao.voteName(cb_index));
		voteCom.setPageNum(pageNum);
		
		List<Vote> commList = vDao.getCommList(voteCom); // 댓글 가져오기
		System.out.println("댓글 갯수"+commList.size());
		for(int i=0;i<commList.size();i++){
			System.out.println("index : "+commList.get(i).getCo_index());
		}
		int commSum = vDao.commSum(cb_index); // 댓글 총 갯수 가져오기
		
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",cb_index);
		
		map.put("paging",paging.makeHtmlPaging());
		map.put("commSum", commSum); // 댓글 총 갯수
		map.put("voteCom",voteCom);
		map.put("commList",commList);
		
		return map;
	}
	
	// 글 삭제
	public ModelAndView voteDelete(int cb_index, int fs_index) {
		mav = new ModelAndView();
		String view = "";
		int success = 0;
		Files files = null;
		if(fs_index == 0){
			success = vDao.voteComDelete(cb_index); //comboard 테이블 내용 삭제
			if(success != 0){
				mav.addObject("msg", "글 삭제에 성공하였습니다.");
				view="redirect:vote"; // controller	
			}else{
				mav.addObject("msg", "글 삭제에 실패하였습니다.");
				view="redirect:votet";
			}
		}else{
			// files 삭제 - 이름 가져오기
			int fileCount = vDao.voteFileCount(cb_index);
			String[] fileName = new String[fileCount];
			
			int rnum = 1;
			HashMap<String, Object> voteMap = new HashMap<String, Object>();
			voteMap.put("cb_index", cb_index);

			for(int i=0;i<fileCount;i++){
				voteMap.put("rnum", rnum);
				files = vDao.voteDelete(voteMap);
				fileName[i] = files.getF_newName();
				rnum++;
			}
			
			Vote vote = new Vote();
			vote.setCb_index(cb_index);
			
			if(fileName.length != 0){
				UploadFile uploadFile = new UploadFile(); 
				String path = uploadFile.getPath(fs_index);
				for(int i=0;i<fileName.length;i++){
					String f_newName = fileName[i];
					File file = new File(path+f_newName);
					if(file.exists()){ 
						if(file.delete()){
							System.out.println(i+"번째 파일 삭제 성공");
							success = 1;
						}else{
							System.out.println(i+"번째 파일 삭제 실패");
						}
					}
				}
				
				// files 삭제
				if(success != 0){
					success = vDao.voteFileDelete(vote); //files 테이블 내용 삭제
					if(success != 0){
						System.out.println("files 데이터 삭제 성공");
						success = vDao.voteComDelete(cb_index); //comboard 테이블 내용 삭제
						if(success != 0){
							System.out.println("comboard 데이터 삭제 성공");
							mav.addObject("msg", "글 삭제에 성공하였습니다.");
							view="redirect:vote"; // controller
						}else{
							mav.addObject("msg", "글 삭제에 실패하였습니다.");
							view="redirect:votet";
						}
					}
				}
			}
		}
        mav.setViewName(view);        
		return mav;
	}

	// 투표하기
	public Map<String, Object> vSelect(Vote vote) {
		Map<String, Object> vSelectMap = new HashMap<String, Object>();
		List<Vote> voteItemList = new ArrayList<Vote>();
		int success = 0;
		
		for(int i=0;i<vote.getNames().length;i++){
			vote.setVp_name(vote.getNames()[i]);
			success = vDao.vSelect(vote); // 0이면 실패, 성공하면 개수대로
		}
		if(success != 0){
			voteItemList = vDao.getItemList(vote.getCb_index());
			for(int i=0;i<voteItemList.size();i++){
				voteItemList.get(i).setV_people(vDao.getPeople(voteItemList.get(i)));
				System.out.println(voteItemList.get(i).getV_people());
			}
			vSelectMap.put("v_person", vDao.getVotePerson(vote.getCb_index()));
			vSelectMap.put("ItemList", voteItemList);
			vSelectMap.put("msg", "회원님의 투표가 반영되었습니다.");
		}else{
			vSelectMap.put("msg", "다시 투표해주세요.");
		}
		return vSelectMap;
	}

	// 댓글 쓰기
	public Map<String, Object> commentAjax(Vote vote) {
		Map<String, Object> commMaps = new HashMap<String, Object>();
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		vote.setPageNum(pageNum);
		int commSum = 0;
		//vote.setCo_content(vote.getCo_content().replace("\r\n","<br>")); // 엔터 처리
		int success = vDao.comment(vote);
		if(success != 0){
			System.out.println("댓글 입력 성공");
			success = vDao.voteReplyPoint(vote.getM_id());
			if(success != 0){
				List<Vote> commList = vDao.getCommList(vote); // 댓글 가져오기
				commSum = vDao.commSum(vote.getCb_index()); // 댓글 총 갯수 가져오기
				
				for(int i=0;i<commList.size();i++){
					System.out.println(commList.get(i).getSecretChk());
				}
				if(commList.size() > 0){
					commMaps.put("commSum", commSum);
					commMaps.put("commList", commList);	
				}
			}
		}else{
			System.out.println("댓글 입력 실패");
			commMaps.put("commList", null);
		}
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",vote.getCb_index());
		commMaps.put("pageNum", pageNum);
		commMaps.put("paging", paging.makeHtmlPaging());
		
		return commMaps;
	}

	// 댓글 삭제
	public Map<String, Object> comDelete(int co_index, int cb_index) {
		Vote vote = new Vote();
		Map<String, Object> commMaps = new HashMap<String, Object>();
		int success = vDao.comDelete(co_index);
		vote.setCb_index(cb_index);
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		vote.setPageNum(pageNum);
		int commSum = vDao.commSum(vote.getCb_index()); // 댓글 총 갯수 가져오기
		
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",vote.getCb_index());
		
		commMaps.put("paging", paging.makeHtmlPaging());
		
		if(success != 0){
			System.out.println("댓글 입력 성공");
			List<Vote> commList = vDao.getCommList(vote); // 댓글 가져오기
			/*for(int i=0;i<commList.size();i++){
				commList.get(i).setCo_content(commList.get(i).getCo_content().replace("\r\n","<br/>"));
				System.out.println("엔터찍기"+commList.get(i).getCo_content());
			}*/
			
			if(commList.size() > 0){
				commMaps.put("commSum", commSum);
				commMaps.put("pageNum", pageNum);
				commMaps.put("commList", commList);	
			}
		}else{
			System.out.println("댓글 입력 실패");
			commMaps.put("commList", null);
		}
		return commMaps;
	}

	// 글 수정
	public ModelAndView voteUpdate(int cb_index, int fs_index) {
		// comboard 값 가져오기
		String view=null;
		mav = new ModelAndView();
		Vote vote = new Vote();
		
		vote.setCb_index(cb_index);
		vote.setFs_index(fs_index);
		List<Vote> updateList = vDao.voteUpdate(vote);
		
		
		// 파일 이름 가져오기
		int fileCount = vDao.voteFileCount(cb_index);
		String[] fileName = new String[fileCount];
		
		int rnum = 1;
		HashMap<String, Object> voteUpMap = new HashMap<String, Object>();
		voteUpMap.put("cb_index", cb_index);
		
		for(int i=0;i<fileCount;i++){
			voteUpMap.put("rnum", rnum);
			fileName[i] = vDao.getOriFileName(voteUpMap);
			System.out.println("수정 파일 이름 : "+fileName[i]);
			rnum++;
		}
		
		mav.addObject("updateList", updateList);
		mav.addObject("fileName", fileName);
		view="han/voteUpdate";
		mav.setViewName(view);
        return mav;
	}

	// 글 수정
	public ModelAndView vUpdate(Vote vote, MultipartFile[] v_file) {
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		Member mb = (Member) session.getAttribute("mb");
		String m_id = mb.getM_id();
		
		/*//1.이클립스의 물리적 저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");*/
		//저장경로를 넣을 변수
		String path = ""; //저장 경로
		path = uploadFile.getPath(vote.getFs_index());
		System.out.println("저장 경로 : "+path);
		
		int success = 0;
		String view = "";
		
		// 파일 이름 가져오기
		int cb_index = vote.getCb_index();
		int fileCount = vDao.voteFileCount(cb_index);
		String[] fileName = new String[fileCount];
		
		int rnum = 1;
		Map<String, Object> voteUpMap = new HashMap<String, Object>();
		voteUpMap.put("cb_index", cb_index);
		
		Files files;
		for(int i=0;i<fileCount;i++){
			voteUpMap.put("rnum", rnum);
			files = vDao.voteDelete(voteUpMap);
			System.out.println("파일 이름 : "+files.getF_newName());
			
			fileName[i] = files.getF_newName();
			
			rnum++;
		}
		for(int i=0;i<fileName.length;i++){
			String f_newName = fileName[i]; // newName 들어있는 배열
			File file = new File(path+f_newName);
			if(file.exists()){ 
				if(file.delete()){
					System.out.println(i+"번째 파일 삭제 성공");
					success = 1;
				}else{
					System.out.println(i+"번째 파일 삭제 실패");
				}
			}
		}
		if(vote.getFileChk() == 1){
			success = vDao.voteFileDelete(vote); // 파일 이름 삭제
			System.out.println("파일 이름 삭제 여부"+success);
			if(success != 0){
				//2.폴더 생성을 꼭 할것...
				File dir=new File(path);
				if(!dir.isDirectory()){  //upload폴더 없다면
					dir.mkdir();  //upload폴더 생성
				}
				System.out.println("가져온 cb_index : "+vote.getCb_index());
				for(MultipartFile file:v_file) {
		            String oriFileName = file.getOriginalFilename();
		            // 저장할 파일이름
		            String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
		            files = new Files();
		            File dest = new File(path, sysFileName);
		            try {
		            	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
					} catch (Exception e) {
						System.out.println("Exception");
						e.printStackTrace();
					}
		            
		            files.setM_id(m_id);
		            files.setF_oriName(oriFileName);
		            files.setF_newName(sysFileName);
		            files.setCb_index(vote.getCb_index());
		            files.setFs_index(vote.getFs_index());
		            success = vDao.voteFileInsert(files);//db에 등록
		            
		            if(success != 1){
		            	mav.addObject("msg", "글 수정에 실패하였습니다.");
		                view="han/voteDetail";// 글쓰기 등록 실패할 경우
		                System.out.println("글 수정 실패");
		                mav.setViewName(view);
		            }
		            /*else{
		            	mav.addObject("msg", "글 수정에 성공하였습니다.");
		                view="han/photoGallery_list";// 글쓰기 등록 성공할 경우
		                System.out.println("글 수정 성공");
		                mav.setViewName(view);
		            }*/
				}
			}
		}
		mav.addObject("cb_index", cb_index);
		System.out.println(cb_index);
		mav.addObject("msg", "글 수정에 성공하였습니다.");
        view="redirect:voteDetail";// 글쓰기 등록 성공할 경우
        System.out.println("글 수정 성공");
        
        mav.setViewName(view);
		success = vDao.voteUpdate_last(vote);
		return mav;
	}

	
}
