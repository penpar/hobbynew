package icia.mvc.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.ClassReply;
import icia.mvc.bean.Files;
import icia.mvc.bean.Member;
import icia.mvc.bean.Pay;
import icia.mvc.bean.Review;
import icia.mvc.bean.Vote;
import icia.mvc.dao.IclassDAO;
import icia.mvc.userClass.Paging;

@Service
public class ClassMM {

	@Autowired
	private IclassDAO cDao;
	@Autowired
	private AdminMM am;
	private ModelAndView mav;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	private ClassBean classBean;
	
	// 클래스 리스트
	public ModelAndView getClassList() {
		System.out.println("getClassList Service");
		mav = new ModelAndView();
		mav = am.getClassNameList();
		String path = "/HNresources/uploadFolder/resources/hobbyClass/";
		List<ClassBean> classList = cDao.getClassList();
		if(session.getAttribute("mb") != null){
			Member member = (Member) session.getAttribute("mb");
			String m_id = member.getM_id();
			List<Integer> myClassList = getMyClass(m_id);
			mav.addObject("myClassList",myClassList);
		}
		mav.addObject("classList", classList);
		mav.addObject("path", path);
		mav.setViewName("sj_class/hobbyClassList");
		return mav;
	}
	
	//현재 로그인한 사용자 관심 클래스 리스트 가져오기
	private List<Integer> getMyClass(String m_id) {
		System.out.println("m_id : "+m_id);
		List<Integer> myClassList = cDao.myClassList(m_id);
		System.out.println("myClassList size : "+myClassList.size());
		return myClassList;
	}

	//클래스 글쓰기
	@Transactional
	public ModelAndView ClassWrite(MultipartHttpServletRequest request) {
		System.out.println("classWrite service");
		mav = new ModelAndView();
		classBean = new ClassBean();
		int flag = 0;
		Member member = (Member) session.getAttribute("mb");
		String m_id = member.getM_id();
		classBean.setM_id(m_id);
		classBean.setCn_index(Integer.parseInt(request.getParameter("cn_index")));
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
		
		classBean.setC_price(Integer.parseInt(request.getParameter("c_price")));
		classBean.setC_content(request.getParameter("c_content").replaceAll("\r\n", "<br/>"));
		classBean.setC_refund(request.getParameter("c_refund").replaceAll("\r\n", "<br/>"));
		System.out.println("썸네일 파일 : "+request.getFile("c_mainImg"));
		/*
		파일 cs_index 구분
		0 = 대표이미지
		1 = 상세 설명 이미지(다중)
		2 = 기획서
		3 = 경력사항 및 자격증
		4 = 모임장소 사진
		*/
		// 상세 설명 이미지 업로드(다중)
		
		flag = cDao.classWrite(classBean);
		System.out.println("c_index : "+classBean.getC_index());
		System.out.println(request.getParameter("ch_voteUrl"));
		if(!request.getParameter("ch_voteUrl").equals("")){
			System.out.println("없으면 실행되지말라고 !");
			classBean.setCh_voteUrl(request.getParameter("ch_voteUrl"));
			flag = cDao.setVoteUrl(classBean);
		}
		System.out.println("클래스 내용 입력(실패:0) : "+flag);
		if(flag != 0){
			if(request.getFile("c_mainImg").getSize() > 0){
				flag = ClassFileUpload(request.getFile("c_mainImg"), 0); //대표이미지 업로드
			}
			if(request.getFiles("c_explainImg").get(0).getSize() > 0){
				flag = ClassFileUpload(request.getFiles("c_explainImg"), 1); //상세 설명 이미지(다중) 업로드
			}
			if(request.getFile("c_planDocument").getSize() > 0){
				flag = ClassFileUpload(request.getFile("c_planDocument"), 2); //기획서 업로드
			}
			if(request.getFile("c_career").getSize() > 0){
				flag = ClassFileUpload(request.getFile("c_career"), 3); //경력사항 및 자격증 업로드
			}
			if(request.getFile("c_placeImg").getSize() > 0){
				flag = ClassFileUpload(request.getFile("c_placeImg"), 4); //경력사항 및 자격증 업로드
			}
			if(flag == 0){
            	mav.addObject("msg", "글쓰기에 실패하였습니다.");
                System.out.println("글쓰기 실패");
                mav.setViewName("sj_class/classRecruifForm");
            }else{
            	mav.addObject("msg", "글쓰기에 성공하였습니다.");
                System.out.println("글쓰기 성공");
        		mav.setViewName("redirect:/hobbyClass");
            }
		}
		return mav;
	}
	
	//클래스 상세보기
	public ModelAndView getClassDteail(int c_index) {
		System.out.println("getClassDteail Service");
		mav = new ModelAndView();
		classBean = cDao.getClassDetail(c_index);
		List<Integer> starPoint = cDao.getClassAver(c_index);
		int pointSum = 0;
		int pointAver = 0;
		for(int i=0;i<starPoint.size();i++){
			pointSum += starPoint.get(i);
		}
		System.out.println("평점 합 : "+pointSum);
		System.out.println("나누는 값 : "+starPoint.size());
		if(pointSum != 0){
			System.out.println(pointSum/starPoint.size());
			pointAver = pointSum/starPoint.size();
		}
		String m_id = null;
		if(session.getAttribute("mb") != null){
			Member member = (Member) session.getAttribute("mb");
			m_id = member.getM_id();
		}
		List<Pay> payList = cDao.getPayList(c_index);
		int chk = 0;
		System.out.println(payList.size());
		if(m_id != null){
			if(payList.size() > 0){
				for (int i=0;i<payList.size();i++) {
					if(payList.get(i).getM_id().equals(m_id)){
						chk = 1;
						System.out.println(i+"번째에서 멈춤");
						break;
					}
				}
			}
		}/*else{
			chk = 2;
		}*/
		mav.addObject("pListChk", chk);
		System.out.println("별점 평균 : "+pointAver);
		Map<String, Object> classDetail = new HashMap<String, Object>();
		classDetail.put("path","/HNresources/uploadFolder/resources/hobbyClass/");
		classDetail.put("c_starPoint", pointAver);
		classDetail.put("classBean", classBean);
		mav.addObject("classDetail", classDetail);
		mav.setViewName("sj_class/classDetail_contents");
		return mav;
	}

	//클래스 상세설명
	public ModelAndView getMainContent(int c_index) {
		mav = new ModelAndView();
		ClassBean classBean = cDao.getClassDetail(c_index);
		int c_addPoint = classBean.getC_price()/100*2;
		System.out.println("추가되는 포인트 계산 : "+c_addPoint);
		classBean.setC_explainImg(cDao.getExplainImg(c_index));
		for(int i=0;i<classBean.getC_explainImg().size();i++){
			System.out.println("상세설명 파일 이름 : "+classBean.getC_explainImg().get(i));
		}
		String m_id = null;
		if(session.getAttribute("mb") != null){
			Member member = (Member) session.getAttribute("mb");
			m_id = member.getM_id();
		}
		List<Pay> payList = cDao.getPayList(c_index);
		int chk = 0;
		System.out.println(payList.size());
		if(m_id != null){
			if(payList.size() > 0){
				for (int i=0;i<payList.size();i++) {
					if(payList.get(i).getM_id().equals(m_id)){
						chk = 1;
						System.out.println(i+"번째에서 멈춤");
						break;
					}
				}
			}
		}else{
			chk = 2;
		}
		mav.addObject("pListChk", chk);
		classBean.setM_intro(cDao.getMemberInfo(classBean.getM_id())); //판매자 자기소개 가져오기
		classBean.setC_addPoint(c_addPoint); //판매금액의 2% 포인트 화 시킨 값
		mav.addObject("mainContent", classBean);
		mav.setViewName("sj_class/classDetail_mainContent");
		return mav;
	}
	
	
	//클래스 결제 리스트 가져오기
	public ModelAndView getPayList(int c_index){
		mav = new ModelAndView();
		List<Pay> payList = cDao.getPayList(c_index);
		mav.addObject("payList",payList);
		mav.setViewName("sj_class/classDetail_classJoinList");
		return mav;
	}
	
	// 후기 작성 폼이동(위쪽에 클래스 이미지, 내용들 가져가야함)
	public ModelAndView reviewWriteForm(int c_index) {
		mav = new ModelAndView();
		classBean = cDao.getClassDetail(c_index);
		Map<String, Object> classDetail = new HashMap<String, Object>();
		classDetail.put("path","/HNresources/uploadFolder/resources/hobbyClass/");
		classDetail.put("classBean", classBean);
		mav.addObject("classDetail", classDetail);
		mav.setViewName("sj_class/review_Write");
		return mav;
	}

	//클래스 후기 리스트
	public ModelAndView getReviewContent(int c_index) {
		mav = new ModelAndView();
		List<Review> reviewList = cDao.getClassReview(c_index);
		if(reviewList.size()>0){
			mav.addObject("reviewList", reviewList);
			mav.addObject("path","/HNresources/uploadFolder/resources/review/");
		}else{
			mav.addObject("reviewList", null);
		}
		mav.setViewName("sj_class/classDetail_reviewContent");
		return mav;
	}

	// 클래스 후기 작성
	@Transactional
	public ModelAndView reviewWrite(Review review, MultipartFile[] re_file) {
		mav = new ModelAndView();
		MultipartFile f = re_file[0];
		System.out.println(f.getSize());
		Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
		review.setM_id(id);
		int success = 0;
		String msg = "";
		try {
			success = cDao.setClassReview(review);
			if(success != 0){
				System.out.println("뽑아온 후기 번호 : "+review.getRe_index());
				success = cDao.setAver(review);
				if(success != 0){
					if(f.getSize() != 0){
						/*//1.이클립스의 물리적 저장경로 찾기
						String root=multi.getSession().getServletContext().getRealPath("/");*/
						//저장경로를 넣을 변수
						String path = "D:/HNresources/uploadFolder/resources/review/"; //저장 경로
						System.out.println("저장 경로 : "+path);
						
						//2.폴더 생성을 꼭 할것...
						File dir=new File(path);
						if(!dir.isDirectory()){  //upload폴더 없다면
							dir.mkdirs();  //upload폴더 생성
						}
						for(MultipartFile file:re_file) {
				            String oriFileName = file.getOriginalFilename();
				            // 저장할 파일이름
				            String sysFileName = System.currentTimeMillis()+"."
									+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
				            File dest = new File(path, sysFileName);
				            try {
				            	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
							} catch (Exception e) {
								e.printStackTrace();
							}
				            review.setRf_oriName(oriFileName);
				            review.setRf_newName(sysFileName);
				            //db에 등록
				            System.out.println("cDao : "+cDao);
				            success = cDao.reviewFileInsert(review);
				        }
					}
				}
			}
			if(success != 0){
				mav.addObject("msg", "후기 등록에 성공했습니다.");
	        	mav.setViewName("redirect:classDetail_contents");
	        }else{
	        	mav.addObject("msg", "후기 등록에 실패했습니다.");
	        	mav.setViewName("redirect:reviewWriteForm");
	        }
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			mav.addObject("msg", "후기는 한번만 등록 가능합니다.");
			mav.setViewName("redirect:classDetail_contents");
		}
		mav.addObject("c_index", review.getC_index());
		return mav;
	}

	//후기 삭제
	@Transactional
	public ModelAndView reviewDelete(int c_index, int re_index) {
		mav = new ModelAndView();
		int flag = 0;
		try {
			if(cDao.getReviewFileCount(re_index)>0){
				List<String>rfList = cDao.getReviewFile(re_index);
				String path = "";
				for(int i=0;i<rfList.size();i++){
					String f_newName = rfList.get(i);
					File file = new File(path+f_newName);
					if(file.exists()){ 
						if(file.delete()){
							System.out.println(i+"번째 파일 삭제 성공");
						}else{
							System.out.println(i+"번째 파일 삭제 실패");
						}
					}
				}
				flag = 1;
				System.out.println("파일 삭제 성공");
			}else{
				cDao.reviewDel(re_index);
			}
			if(flag != 0){
				cDao.reviewDel(re_index);
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			flag = 0;
			System.out.println("파일 삭제 실패");
		}
		if(flag != 0){
			mav.addObject("msg", "후기 삭제에 성공하였습니다.");
			mav = getReviewContent(c_index);
		}else{
			mav.addObject("msg", "후기 삭제에 실패하였습니다.");
			mav.addObject("c_index", c_index);
			mav.setViewName("redirect:classDetail_contents");
		}
		return mav;
	}

	//클래스 수정 페이지 이동
	public ModelAndView ClassUpdate(int c_index) {
		System.out.println("classUpdate Service");
		mav = new ModelAndView();
		classBean = cDao.getClassDetail(c_index); //금액, 모집기간, 신청 인원, 총 인원, 작성자, 등급, 상세설명
		String[] addArray = classBean.getC_address().split("_");
		classBean.setC_mainAddr(addArray[0]);
		classBean.setC_detailAddr(addArray[1]);
		Date date = classBean.getC_startDay();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startDay = transFormat.format(date);
		String[] c_startDay = startDay.split("-");
		date = classBean.getC_endDay();
		String endDay = transFormat.format(date);
		String[] c_endDay = endDay.split("-");
		classBean.setCs_year(c_startDay[0]);
		classBean.setCs_month(c_startDay[1]);
		classBean.setCs_day(c_startDay[2]);
		classBean.setCe_year(c_endDay[0]);
		classBean.setCe_month(c_endDay[1]);
		classBean.setCe_day(c_endDay[2]);
		Map<String, Object>fMap = new HashMap<String, Object>();
		fMap.put("c_index", c_index);
		for(int i=0;i<5;i++){
			fMap.put("cs_index", i);
			if(i == 0){
				classBean.setC_mainImg(cDao.getFileName(fMap));
			}else if(i == 1){
				classBean.setC_explainImg(cDao.getFileNames(fMap));
			}else if(i == 2){
				classBean.setC_planDocument(cDao.getFileName(fMap));
			}else if(i == 3){
				classBean.setC_career(cDao.getFileName(fMap));
			}else{
				classBean.setC_placeImg(cDao.getFileName(fMap));
			}
		}
		mav = am.getClassNameList();
		mav.addObject("path","/HNresources/uploadFolder/resources/hobbyClass/");
		mav.addObject("classUpdate", classBean);
		mav.setViewName("sj_class/classUpdateForm");
		return mav;
	}

	//클래스 수정
	public ModelAndView ClassUpdateSet(MultipartHttpServletRequest request) {
		System.out.println("ClassUpdateSet service");
		mav = new ModelAndView();
		classBean = new ClassBean();
		int flag = 0;
		classBean.setC_index(Integer.parseInt(request.getParameter("c_index")));
		classBean.setCn_index(Integer.parseInt(request.getParameter("cn_index")));
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
		classBean.setC_price(Integer.parseInt(request.getParameter("c_price")));
		classBean.setC_content(request.getParameter("c_content").replaceAll("\r\n", "<br/>"));
		classBean.setC_refund(request.getParameter("c_refund").replaceAll("\r\n", "<br/>"));
		if(!request.getParameter("ch_voteUrl").equals("")){
			classBean.setCh_voteUrl(request.getParameter("ch_voteUrl"));
			flag = cDao.updateVoteUrl(classBean);
		}
		/*
		파일 cs_index 구분
		0 = 대표이미지
		1 = 상세 설명 이미지(다중)
		2 = 기획서
		3 = 경력사항 및 자격증
		4 = 모임장소 사진
		*/
		// 상세 설명 이미지 업로드(다중)
		
		flag = cDao.classUpdate(classBean);
		System.out.println("클래스 내용 입력(실패:0) : "+flag);
		if(flag != 0){
			if(request.getFile("c_mainImg").getSize() > 0){
				flag = classFileDelete(classBean.getC_index(), 0);
				if(flag != 0){
					flag = ClassFileUpload(request.getFile("c_mainImg"), 0); //대표이미지 업로드
					if(flag == 0){
						mav.addObject("msg", "대표이미지 업로드가 실패하였습니다.");
						mav.addObject("c_index", classBean.getC_index());
		                mav.setViewName("redirect:/classUpdate");
					}
				}
			}
			if(request.getFiles("c_explainImg").get(0).getSize() > 0){
				flag = classFileDelete(classBean.getC_index(), 1);
				if(flag != 0){
					flag = ClassFileUpload(request.getFiles("c_explainImg"), 1); //상세 설명 이미지(다중) 업로드
					if(flag == 0){
						mav.addObject("msg", "상세 설명 이미지 업로드가 실패하였습니다.");
						mav.addObject("c_index", classBean.getC_index());
		                mav.setViewName("redirect:/classUpdate");
					}
				}
			}
			if(request.getFile("c_planDocument").getSize() > 0){
				flag = classFileDelete(classBean.getC_index(), 2);
				if(flag != 0){
					flag = ClassFileUpload(request.getFile("c_planDocument"), 2); //기획서 업로드
					if(flag == 0){
						mav.addObject("msg", "기획서 업로드가 실패하였습니다.");
						mav.addObject("c_index", classBean.getC_index());
						mav.setViewName("redirect:/classUpdate");
					}
				}
			}
			if(request.getFile("c_career").getSize() > 0){
				flag = classFileDelete(classBean.getC_index(), 3);
				if(flag != 0){
					flag = ClassFileUpload(request.getFile("c_career"), 3); //경력사항 및 자격증 업로드
					if(flag == 0){
						mav.addObject("msg", "경력사항 및 자격증 업로드가 실패하였습니다.");
						mav.addObject("c_index", classBean.getC_index());
		                mav.setViewName("redirect:/classUpdate");
					}
				}
			}
			if(request.getFile("c_placeImg").getSize() > 0){
				flag = classFileDelete(classBean.getC_index(), 4);
				if(flag != 0){
					flag = ClassFileUpload(request.getFile("c_placeImg"), 4); //모임장소 이미지 업로드
					if(flag == 0){
						mav.addObject("msg", "모임장소 이미지 업로드가 실패하였습니다.");
						mav.addObject("c_index", classBean.getC_index());
		                mav.setViewName("redirect:/classUpdate");
					}
				}
			}
			if(flag != 0){
	            System.out.println("글수정 성공");
	            mav.addObject("c_index", classBean.getC_index());
	    		mav.setViewName("redirect:/classDetail_contents");
	        }else{
	        	mav.addObject("msg", "글수정이 실패하였습니다.");
				mav.addObject("c_index", classBean.getC_index());
                mav.setViewName("redirect:/classUpdate");
	        }
		}
		return mav;
	}

	//내 투표 리스트 가져오기
	public ModelAndView myVoteList(String m_id) {
		System.out.println("myVoteList service");
		mav = new ModelAndView();
		List<Vote>voteList = cDao.getMyVoteList(m_id);
		for(int i=0;i<voteList.size();i++){
		}
		mav.addObject("voteList", voteList);
		mav.setViewName("sj_class/myVoteList");
		return mav;
	}

	//클래스 글쓰기 전용 파일업로드
	@Transactional
	private int ClassFileUpload(MultipartFile file, int cs_index){
		int flag = 0;
		//1.이클립스의 물리적 저장경로 찾기
		//저장경로를 넣을 변수
		String path = "D:/HNresources/uploadFolder/resources/hobbyClass/"; //저장 경로
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
	    String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
	    File dest = new File(path, sysFileName);
	    try {
	    	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}
	    files.setF_oriName(oriFileName);
	    files.setF_newName(sysFileName);
	    files.setC_index(classBean.getC_index());
	    files.setCs_index(cs_index);
	    flag = cDao.classFileInsert(files);//db에 등록
	    System.out.println("파일 이름 입력(실패:0) : "+flag);
		return flag;
	}

	//클래스 글쓰기용 파일업로드(다중)
	@Transactional
	private int ClassFileUpload(List<MultipartFile> fileList, int cs_index) {
		int flag = 0;
		String path = "D:/HNresources/uploadFolder/resources/hobbyClass/"; //저장 경로
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
	        String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
	        File dest = new File(path, sysFileName);
	        try {
	        	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
			} catch (Exception e) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				e.printStackTrace();
			}
	        files.setF_oriName(oriFileName);
	        files.setF_newName(sysFileName);
	        files.setC_index(classBean.getC_index());
	        files.setCs_index(cs_index);
	        flag = cDao.classFileInsert(files);//db에 등록
	        System.out.println(i+1+"번째 파일 이름 입력(실패:0) : "+flag);
		}
		return flag;
	}

	//파일 삭제
	@Transactional
	private int classFileDelete(int c_index, int cs_index) {
		int flag = 0;
		String path = "D:/HNresources/uploadFolder/resources/hobbyClass/"; //저장 경로
		Map<String, Integer> indexMap = new HashMap<String, Integer>();
		indexMap.put("c_index", c_index);
		indexMap.put("cs_index", cs_index);
		try{
			if(cs_index == 1){
				List<String>newList = cDao.getFileNewNames(indexMap);
				for(int i=0;i<newList.size();i++){
					String f_newName = newList.get(i);
					File file = new File(path+f_newName);
					if(file.exists()){ 
						if(file.delete()){
							System.out.println(i+"번째 파일 삭제 성공");
							flag = 1;
						}else{
							System.out.println(i+"번째 파일 삭제 실패");
						}
					}
				}
			}else{
				String f_newName = cDao.getFileNewName(indexMap);
				File file = new File(path+f_newName);
				if(file.exists()){ 
					if(file.delete()){
						System.out.println("파일 삭제 성공");
						flag = 1;
					}else{
						System.out.println("파일 삭제 실패");
					}
				}
			}
			//db 삭제 부분
			flag = cDao.classFileDelete(indexMap);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return flag;
	}

	// 수정 페이지 이동
	public ModelAndView reviewUpdateForm(int c_index, int re_index) {
		mav = new ModelAndView();
		classBean = cDao.getClassDetail(c_index);
		Map<String, Object> classDetail = new HashMap<String, Object>();
		classDetail.put("path","/HNresources/uploadFolder/resources/hobbyClass/");
		classDetail.put("classBean", classBean);
		Review review = cDao.getReview(re_index);
		mav.addObject("classDetail", classDetail);
		mav.addObject("reviewUpdate", review);
		mav.setViewName("sj_class/review_Update");
		return mav;
	}

	// 수정하기
	@Transactional
	public ModelAndView reviewUpdate(Review review, MultipartFile[] re_file) {
		mav = new ModelAndView();
		MultipartFile f = re_file[0];
		System.out.println(f.getSize());
		int re_index = review.getRe_index();
		int success = 0;
		try {
			success = cDao.setReviewUpdate(review); //후기 수정
			if(success != 0){
				success = cDao.updateAver(review); // 평점 수정
				if(success != 0){
					if(f.getSize() != 0){
						int flag = 0;
						try {
							if(cDao.getReviewFileCount(re_index)>0){
								List<String>rfList = cDao.getReviewFile(re_index);
								String path = "";
								for(int i=0;i<rfList.size();i++){
									String f_newName = rfList.get(i);
									File file = new File(path+f_newName);
									if(file.exists()){ 
										if(file.delete()){
											System.out.println(i+"번째 파일 삭제 성공");
										}else{
											System.out.println(i+"번째 파일 삭제 실패");
											mav.addObject("msg", "후기 수정에 실패했습니다.");
								        	mav.setViewName("redirect:reviewWriteForm");
								        	return mav;
										}
									}
								}
								flag = 1;
								System.out.println("파일 삭제 성공");
							}
							if(flag != 0){
								flag = cDao.reviewFileDelete(re_index);
							}else{
								mav.addObject("msg", "후기 수정에 실패했습니다.");
					        	mav.setViewName("redirect:reviewWriteForm");
							}
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							flag = 0;
							System.out.println("파일 삭제 실패");
						}
						if(flag != 0){
							/*//1.이클립스의 물리적 저장경로 찾기
							String root=multi.getSession().getServletContext().getRealPath("/");*/
							//저장경로를 넣을 변수
							String path = "D:/HNresources/uploadFolder/resources/review/"; //저장 경로
							System.out.println("저장 경로 : "+path);
							
							//2.폴더 생성을 꼭 할것...
							File dir=new File(path);
							if(!dir.isDirectory()){  //upload폴더 없다면
								dir.mkdirs();  //upload폴더 생성
							}
							for(MultipartFile file:re_file) {
					            String oriFileName = file.getOriginalFilename();
					            // 저장할 파일이름
					            String sysFileName = System.currentTimeMillis()+"."
										+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
					            File dest = new File(path, sysFileName);
					            try {
					            	FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
								} catch (Exception e) {
									e.printStackTrace();
								}
					            review.setRf_oriName(oriFileName);
					            review.setRf_newName(sysFileName);
					            //db에 등록
					            System.out.println("cDao : "+cDao);
					            success = cDao.reviewFileInsert(review);
					        }
						}
					}
				}
			}
			if(success != 0){
				mav.addObject("msg", "후기 수정에 성공했습니다.");
	        	mav.setViewName("redirect:classDetail_contents");
	        }else{
	        	mav.addObject("msg", "후기 수정에 실패했습니다.");
	        	mav.setViewName("redirect:reviewWriteForm");
	        }
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			mav.addObject("msg", "후기 수정에 실패했습니다.");
			mav.setViewName("redirect:reviewWriteForm");
		}
		mav.addObject("c_index", review.getC_index());
		return mav;
	}

	//클래스 댓글 가져오기
	public ModelAndView getClassReply(int c_index) {
		mav = new ModelAndView();
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		Map<String, Integer>pagingMap = new HashMap<String, Integer>();
		pagingMap.put("c_index", c_index);
		pagingMap.put("pageNum", pageNum);
		List<ClassReply> replyList = cDao.getReplyList(pagingMap);
		int commSum = cDao.getReplyCount(c_index);
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",c_index);
		mav.addObject("pageNum", pageNum);
		mav.addObject("paging",paging.makeHtmlPaging());
		mav.addObject("classReplyList", replyList);
		mav.setViewName("sj_class/classDetail_replyList");
		return mav;
	}

	//클래스 댓글 작성
	@Transactional
	public ModelAndView classReplyInsert(ClassReply classReply) {
		mav = new ModelAndView();
		int success = cDao.classReplyInsert(classReply);
		if(success != 0){
			mav.addObject("msg", null);
		}else{
			mav.addObject("msg", "댓글 입력이 실패했습니다.");
		}
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		Map<String, Integer>pagingMap = new HashMap<String, Integer>();
		pagingMap.put("c_index", classReply.getC_index());
		pagingMap.put("pageNum", pageNum);
		List<ClassReply> replyList = cDao.getReplyList(pagingMap);
		int commSum = cDao.getReplyCount(classReply.getC_index());
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",classReply.getC_index());
		mav.addObject("pageNum", pageNum);
		mav.addObject("paging",paging.makeHtmlPaging());
		mav.addObject("classReplyList", replyList);
		mav.setViewName("sj_class/classDetail_replyList");
		return mav;
	}

	//댓글 삭제
	@Transactional
	public ModelAndView classReplyDelete(ClassReply classReply) {
		mav = new ModelAndView();
		int success = cDao.classReplyDelete(classReply.getCr_index());
		if(success != 0){
			mav.addObject("msg", null);
		}else{
			mav.addObject("msg", "댓글 삭제에 실패했습니다.");
		}
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")):1;
		Map<String, Integer>pagingMap = new HashMap<String, Integer>();
		pagingMap.put("c_index", classReply.getC_index());
		pagingMap.put("pageNum", pageNum);
		List<ClassReply> replyList = cDao.getReplyList(pagingMap);
		int commSum = cDao.getReplyCount(classReply.getC_index());
		Paging paging = new Paging(commSum,pageNum,7,5,"voteDetail",classReply.getC_index());
		mav.addObject("pageNum", pageNum);
		mav.addObject("paging",paging.makeHtmlPaging());
		mav.addObject("classReplyList", replyList);
		mav.setViewName("sj_class/classDetail_replyList");
		return mav;
	}

	//클래스 키워드 검색 ajax
	public Map<String, Object> classSearch(String status, String filter, String keyword) {
		System.out.println("status : "+status);
		System.out.println("filter : "+filter);
		System.out.println("keyword : "+keyword);
		Map<String, Object> classMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("status", status);
		searchMap.put("filter", filter);
		searchMap.put("keyword", keyword);
		List<ClassBean> classList = cDao.classSearch(searchMap);
		System.out.println("사이즈1 : "+classList.size());
		List<Integer> delIndex = new ArrayList<Integer>();
		for(int i=0;i<classList.size();i++){
			System.out.println("상태 : "+classList.get(i).getC_status());
			if(classList.get(i).getC_status().equals("0")){
				System.out.println("0 인애 index : "+i);
				delIndex.add(i);
			}
		}
		for(int i=0;i<delIndex.size();i++){
			classList.remove(i);
		}
		System.out.println("사이즈2 : "+classList.size());
		if(session.getAttribute("mb") != null){
			Member member = (Member) session.getAttribute("mb");
			String m_id = member.getM_id();
			List<Integer> myClassList = getMyClass(m_id);
			classMap.put("myClassList", myClassList);
		}else{
			classMap.put("myClassList", null);
		}
		classMap.put("searchList", classList);
		return classMap;
	}

	//클래스 대분류 클릭 시 검색 ajax
	public Map<String, Object> cnSearch(int cn_index) {
		System.out.println("cn_index : "+cn_index);
		Map<String, Object> classMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("cn_index", cn_index);
		searchMap.put("status", null);
		searchMap.put("keyword", null);
		searchMap.put("filter", null);
		List<ClassBean> classList = cDao.classSearch(searchMap);
		System.out.println("사이즈1 : "+classList.size());
		List<Integer> delIndex = new ArrayList<Integer>();
		for(int i=0;i<classList.size();i++){
			System.out.println("상태 : "+classList.get(i).getC_status());
			if(classList.get(i).getC_status().equals("0")){
				System.out.println("0 인애 index : "+i);
				delIndex.add(i);
			}
		}
		for(int i=0;i<delIndex.size();i++){
			classList.remove(i);
		}
		System.out.println("사이즈2 : "+classList.size());
		if(session.getAttribute("mb") != null){
			Member member = (Member) session.getAttribute("mb");
			String m_id = member.getM_id();
			List<Integer> myClassList = getMyClass(m_id);
			classMap.put("myClassList", myClassList);
		}else{
			classMap.put("myClassList", null);
		}
		classMap.put("searchList", classList);
		return classMap;
	}

	//클래스 진행상태 선택 시 검색 ajax
	public Map<String, Object> statusSearch(String status) {
		System.out.println("status : "+status);
		Map<String, Object> classMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("cn_index", null);
		searchMap.put("status", status);
		searchMap.put("keyword", null);
		searchMap.put("filter", null);
		List<ClassBean> classList = cDao.classSearch(searchMap);
		System.out.println("사이즈1 : "+classList.size());
		List<Integer> delIndex = new ArrayList<Integer>();
		for(int i=0;i<classList.size();i++){
			System.out.println("상태 : "+classList.get(i).getC_status());
			if(classList.get(i).getC_status().equals("0")){
				System.out.println("0 인애 index : "+i);
				delIndex.add(i);
			}
		}
		for(int i=0;i<delIndex.size();i++){
			classList.remove(i);
		}
		System.out.println("사이즈2 : "+classList.size());
		Member member = new Member();
		if(session.getAttribute("mb") != null){
			member = (Member) session.getAttribute("mb");
			String m_id = member.getM_id();
			List<Integer> myClassList = getMyClass(m_id);
			classMap.put("myClassList", myClassList);
		}else{
			classMap.put("myClassList", null);
		}
		classMap.put("searchList", classList);
		return classMap;
	}
	
	//관심클래스 추가 & 삭제
	public Map<String, Object> myClassMgt(String m_id, int c_index, int flag) {
		Map<String, Object> classMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("m_id", m_id);
		searchMap.put("c_index", c_index);
		int success = 0;
		if(flag == 1){
			success = cDao.myClassAdd(searchMap);
		}else{
			success = cDao.myClassDel(searchMap);
		}
		if(success != 0){
			classMap.put("msg", 1);
		}else{
			classMap.put("msg", 0);
		}
		return classMap;
	}

	@Transactional
	public ModelAndView classDelete(int c_index) {
		mav = new ModelAndView();
		int flag = classFileDelete(c_index, -1);
		if(flag != 0){
			flag = cDao.classDelete(c_index);
			if(flag != 0){
				mav.addObject("msg", "클래스가 삭제되었습니다.");
			}else{
				mav.addObject("msg", "클래스 삭제가 실패했습니다.");
			}
		}else{
			mav.addObject("msg", "클래스 삭제가 실패했습니다.");
		}
		mav.setViewName("redirect:hobbyClass");
		return mav;
	}

	// 메인 페이지 클래스 입히기
	public ModelAndView getMainClassList() {
		mav = new ModelAndView();
		List<ClassBean>mainList = new ArrayList<ClassBean>();
		List<ClassBean>rateList = new ArrayList<ClassBean>();
		rateList = cDao.rateList();
		mainList = cDao.dateList();
		mav.addObject("path","/HNresources/uploadFolder/resources/hobbyClass/");
		mav.addObject("rateList", rateList);
		mav.addObject("mainList", mainList);
		mav.setViewName("main");
		return mav;
	}
}