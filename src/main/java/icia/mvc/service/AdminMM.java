package icia.mvc.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Board;
import icia.mvc.bean.ClassBean;
import icia.mvc.bean.ClassName;
import icia.mvc.bean.Files;
import icia.mvc.bean.Member;
import icia.mvc.bean.Report;
import icia.mvc.bean.User;
import icia.mvc.dao.IadminDAO;

@Service
public class AdminMM {

	@Autowired
	private IadminDAO aDao;

	@Autowired
	private HttpSession session;
	@Autowired
	private ClassMM cm;
	
	private ClassBean classBean;	
	private ModelAndView mav;
	
	Map<String, List<ClassName>> cnMap;
	// 회원 전체 목록
	public ModelAndView userList() {
		System.out.println("userList Service");
		mav = new ModelAndView();


		List<User> userList = aDao.getUserList();
		System.out.println("회원수 : "+userList.size());
		mav.addObject("userList", userList);
		mav.setViewName("sj_admin/memberManagement");

		return mav;
	}

	public ModelAndView userSortList(int sort) {
		System.out.println("userSortList Service");
		mav = new ModelAndView();
		List<User> userSortList;
		if(sort == -1){
			userSortList = aDao.getUserList();
			mav.addObject("m_sort", null);
		}else{
			userSortList = aDao.getUserSortList(sort);
			mav.addObject("m_sort", sort);
		}
		System.out.println("회원수 : "+userSortList.size());
		
		mav.addObject("userList", userSortList);
		mav.setViewName("sj_admin/memberManagement");
		return mav;
	}

	public ModelAndView userSearch(String searchValue) {
		System.out.println("userSearch Service");
		System.out.println(searchValue);
		mav = new ModelAndView();
		List<User> userSearchList = aDao.getUserSearchList(searchValue);
		mav.addObject("userList", userSearchList);
		mav.setViewName("sj_admin/memberManagement");
		return mav;
	}
	
	public ModelAndView qUserSearch(String searchValue) {
		mav = new ModelAndView();
		List<Board> userSearchList = aDao.qUserSearch(searchValue);
		mav.addObject("qstList", userSearchList);
		mav.setViewName("sj_admin/questionMgt");
		return mav;
	}

	public ModelAndView userBen(String m_id) {
		System.out.println("userBen Service");
		System.out.println(m_id);
		mav = new ModelAndView();
		int success = aDao.updateUserSort(m_id);
		if(success == 1){
			mav.setViewName("redirect:/userMgt");
		}
		return mav;
	}
	
	//경고버튼 누른 후 경고 사유 적은 뒤 경고횟수 추가용
	public ModelAndView userWarn(String m_id) {
		System.out.println("userWarn Service");
		mav = new ModelAndView();
		int result = aDao.updateUserWarn(m_id);
		int warnCount;
		if(result == 1){
			warnCount = aDao.getUserCount(m_id);
			if(warnCount == 3){
				userBen(m_id);
			}
		}
		mav.setViewName("redirect:/userMgt");
		return mav;
	}

	public ModelAndView getReportList() {
		System.out.println("userWarn Service");
		mav = new ModelAndView();
		List<Report> reportList = aDao.getReportList();
		mav.addObject("reportList", reportList);
		mav.setViewName("sj_report/reportList");
		return mav;
	}

	public ModelAndView getClassNameList() {
		System.out.println("getClassNameList Service");
		mav = new ModelAndView();
		List<ClassName> cnList = aDao.getClassNameList();
		mav.addObject("ClassNameList", cnList);
		mav.setViewName("sj_admin/classMgt");
		return mav;
	}

	public ModelAndView cnAdd(String cn_name) {
		System.out.println("cnAdd Service");
		mav = new ModelAndView();
		try {
			if(aDao.setClassName(cn_name) == 1){
				mav.setViewName("redirect:/classMgt");
			}
		} catch (Exception e) {
			mav.addObject("error", "중복된 분류명입니다.");
			List<ClassName> cnList = aDao.getClassNameList();
			mav.addObject("ClassNameList", cnList);
			mav.setViewName("sj_admin/classMgt");
		}
		return mav;
	}

	/*public Map<String, List<ClassName>> cnAdd(String cn_name) {
		System.out.println("cnAdd Service");
		if(aDao.setClassName(cn_name) != 0){
			List<ClassName> cnList = aDao.getClassNameList();
			cnMap = new HashMap<String, List<ClassName>>();
			cnMap.put("cnList", cnList);
		}else{
			cnMap = null;
		}
		return cnMap;
	}*/
	
	public ModelAndView cnDel(String cn_name) {
		System.out.println("cnDel Service");
		mav = new ModelAndView();
		if(aDao.delClassName(cn_name) == 1){
			mav.setViewName("redirect:/classMgt");
		}
		return mav;
	}

	// 문의 관리 리스트
	public ModelAndView questionMgt() {
		mav = new ModelAndView();
		String view=null;
		
		List<Board> qstList = aDao.questionMgt(); // comboard 가져오기
		
		if(qstList != null){
			mav.addObject("qstSort", "문의 종류");
			mav.addObject("qstList", qstList);
			view="sj_admin/questionMgt";
			mav.setViewName(view);
		}
		return mav;
	}

	// 문의 관리 종류 분류
	public ModelAndView sortList(String sort) {
		mav = new ModelAndView();
		List<Board> sortLists;
		
		if(sort.equals("문의 종류")){
			sortLists = aDao.questionMgt();
			mav.addObject("m_sort", null);
		}else{
			sortLists = aDao.questionMgtSort(sort); // 전체가 아닌 경우 분류
			mav.addObject("sortLists", sortLists);
		}
		
		mav.addObject("qstSort", sort);
		mav.addObject("qstList", sortLists);
		mav.setViewName("sj_admin/questionMgt");
		return mav;
	}

	// 문의 관리 파일 다운로드
	public void qFileDown(String f_newName, String f_oriName, int fs_index, HttpServletRequest request, HttpServletResponse response) {
		UploadFile uploadFile = new UploadFile();
		String savePath;
		
		String root = uploadFile.getPath(fs_index);
        savePath = root+f_newName;
        System.out.println(savePath);

        try {         
        	File file=new File(savePath);
        	byte b[] = new byte[(int) file.length()];
        	String encoding = new String(f_oriName.getBytes("UTF-8"),"8859_1"); //한글 인코딩
 
        	//page의 content-type을 동적으로 하기위해 초기화 시킴
        	response.reset();
        	response.setContentType("application/octet-stream");           
        	response.setHeader("Content-Disposition", "attachment;filename="+encoding);
        	response.setHeader("Content-Length", String.valueOf(file.length()));
  
        	if (file.isFile()){ // 파일이 있을경우
        		System.out.println("file.isfile : "+file.isFile());
        		FileInputStream fileInputStream = new FileInputStream(file);
        		ServletOutputStream servletOutputStream = response.getOutputStream();                      
        		
        		//  파일을 읽어서 클라이언트쪽으로 저장한다.
        		int readNum = 0;
        		while ((readNum = fileInputStream.read(b)) != -1) {
        			System.out.println("readnum : "+ readNum);
        				servletOutputStream.write(b, 0, readNum);
        		}
	        	servletOutputStream.close();
	        	fileInputStream.close();
          }
        } catch (Exception e) {         
        	e.printStackTrace();         
        }      
	}

	public Map<String, List<User>> getJoinJudgeList(User user) {
		Map<String, List<User>>joinJudgeMap = new HashMap<String, List<User>>();
		List<User>joinJudgeList = aDao.getJudgeList(user);
		joinJudgeMap.put("judgeList", joinJudgeList);
		return joinJudgeMap;
	}

	public ModelAndView userDetail(User user) {
		System.out.println("userDetail : "+user.getM_id());
		mav = new ModelAndView();
		List<User>uList = aDao.getJudgeList(user);
		System.out.println("uList size : "+uList.size());
		System.out.println("m_birth : "+uList.get(0).getM_birth());
		System.out.println("m_date : "+uList.get(0).getM_date());
		String[] m_birth = uList.get(0).getM_birth().split(" ");
		String[] birth = m_birth[0].split("-");
		uList.get(0).setB_year(birth[0]);
		uList.get(0).setB_month(birth[1]);
		uList.get(0).setB_day(birth[2]);
		Date m_date = uList.get(0).getM_date();
		String date = m_date.toString();
		String[] mdate = date.split("-");
		uList.get(0).setM_year(mdate[0]);
		uList.get(0).setM_month(mdate[1]);
		uList.get(0).setM_day(mdate[2]);
		System.out.println("m_addr : "+uList.get(0).getM_address());
		uList.get(0).setM_address(uList.get(0).getM_address().replace("_", "&nbsp;"));
		mav.addObject("judgeDetail", uList);
		mav.setViewName("sj_admin/JoinJudgeDetail");
		return mav;
	}
	
	// 전환 심사 글쓰기
	@Transactional
	public ModelAndView changeWrite(MultipartHttpServletRequest request) {
		mav = new ModelAndView();
		classBean = new ClassBean();
		int flag = 0;
		
		Member member = (Member) session.getAttribute("mb");
		String m_id = member.getM_id();
		classBean.setM_id(m_id);
		classBean.setC_subject(request.getParameter("c_subject"));
		classBean.setC_simpleContent(request.getParameter("c_simpleContent"));
		classBean.setC_address(request.getParameter("c_addr")+"_"+request.getParameter("c_detailAddress"));
		classBean.setC_minPerson(Integer.parseInt(request.getParameter("c_minPerson")));
		classBean.setC_maxPerson(Integer.parseInt(request.getParameter("c_maxPerson")));
		
		String startDay = request.getParameter("cs_year")+"-"+request.getParameter("cs_month")+"-"+request.getParameter("cs_day"); // Date형으로 변환
		System.out.println(Date.valueOf(startDay));
		
		classBean.setC_startDay(Date.valueOf(startDay));
		String endDay = request.getParameter("ce_year")+"-"+request.getParameter("ce_month")+"-"+request.getParameter("ce_day"); // Date형으로 변환
		System.out.println(Date.valueOf(endDay));
		classBean.setC_endDay(Date.valueOf(endDay));
		/*
		파일 cs_index 구분
		0 = 대표이미지
		1 = 상세 설명 이미지(다중)
		2 = 기획서
		3 = 경력사항 및 자격증
		4 = 모임장소 사진
		*/
		// 상세 설명 이미지 업로드(다중)
		
		flag = aDao.changeWrite(classBean);
		System.out.println("c_index : "+classBean.getC_index());
		System.out.println(request.getParameter("ch_voteUrl"));
		
		if(!request.getParameter("ch_voteUrl").equals("")){
			System.out.println("없으면 실행되지말라고 !");
			classBean.setCh_voteUrl(request.getParameter("ch_voteUrl"));
			flag = aDao.setVoteUrl(classBean);
		}
		System.out.println("클래스 내용 입력(실패:0) : "+flag);
		
		// 파일
		if(flag != 0){
			if(request.getFile("c_planDocument").getSize() > 0){
				flag = ClassFileUpload2(request.getFile("c_planDocument"), 2); //기획서 업로드
			}
			if(request.getFile("c_career").getSize() > 0){
				flag = ClassFileUpload(request.getFiles("c_career"), 3); //경력사항 및 자격증 업로드
			}
			if(request.getFile("c_placeImg").getSize() > 0){
				flag = ClassFileUpload(request.getFiles("c_placeImg"), 4); //모임 장소
			}
			if(flag == 0){
            	mav.addObject("msg", "전환 심사 요청에 실패하였습니다. 다시 작성해 주십시오.");
                System.out.println("글쓰기 실패");
                mav.setViewName("sj_class/UserChangeForm");
            }else{
            	mav.addObject("msg", "전환 심사 요청이 완료되었습니다.");
                System.out.println("글쓰기 성공");
        		mav.setViewName("redirect:/");
            }
		}
		return mav;
	}

	//클래스 글쓰기 전용 파일업로드(단일)
	private int ClassFileUpload2(MultipartFile file, int cs_index){
		int flag = 0;
		//1.이클립스의 물리적 저장경로 찾기
		//저장경로를 넣을 변수
		String path = "D:/HNresources/uploadFolder/resources/userChange/"; //저장 경로
		System.out.println("저장 경로 : "+path);
		
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){  //upload폴더 없다면
			dir.mkdir();  //upload폴더 생성
		}
		System.out.println("가져온 c_index : "+classBean.getC_index());
		Files files = new Files();
	    String oriFileName = file.getOriginalFilename();
	    // 저장할 파일이름
	    String sysFileName = System.currentTimeMillis()+"."+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
	    File dest = new File(path, sysFileName);
	    try {
	    	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
		} catch (Exception e) {
			e.printStackTrace();
		}
	    files.setF_oriName(oriFileName);
	    files.setF_newName(sysFileName);
	    files.setC_index(classBean.getC_index());
	    files.setCs_index(cs_index);
	    flag = aDao.changeFileInsert(files);//db에 등록
	    System.out.println("파일 이름 입력(실패:0) : "+flag);
		return flag;
	}

	//클래스 글쓰기용 파일업로드(다중)
	private int ClassFileUpload(List<MultipartFile> fileList, int cs_index) {
		int flag = 0;
		String path = "D:/HNresources/uploadFolder/resources/userChange/"; //저장 경로
		System.out.println("저장 경로 : "+path);
		
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){  //upload폴더 없다면
			dir.mkdir();  //upload폴더 생성
		}
		System.out.println("가져온 c_index : "+classBean.getC_index());
		MultipartFile file = null;
		for(int i=0;i<fileList.size();i++){
			file = fileList.get(i);
			Files files = new Files();
	        String oriFileName = file.getOriginalFilename();
	        // 저장할 파일이름
	        String sysFileName = System.currentTimeMillis()+"."+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
	        File dest = new File(path, sysFileName);
	        try {
	        	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
			} catch (Exception e) {
				e.printStackTrace();
			}
	        files.setF_oriName(oriFileName);
	        files.setF_newName(sysFileName);
	        files.setC_index(classBean.getC_index());
	        files.setCs_index(cs_index);
	        flag = aDao.changeFileInsert(files);//db에 등록
	        System.out.println(i+1+"번째 파일 이름 입력(실패:0) : "+flag);
		}
		return flag;
	}

	public Map<String, List<User>> joinComfirm(String m_id, int flag) {
		Map<String, List<User>>joinJudgeMap = new HashMap<String, List<User>>();
		User user = new User();
		int success = 0;
		if(flag == 0){
			success = aDao.joinComfirm(m_id);
		}else{
			success = aDao.joinDelete(m_id);
		}
		if(success != 0){
			user.setM_id("");
			List<User>joinJudgeList = aDao.getJudgeList(user);
			joinJudgeMap.put("judgeList", joinJudgeList);
		}
		return joinJudgeMap;
	}
}