package icia.mvc.service;

import java.io.File;
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
import icia.mvc.bean.Photo;
import icia.mvc.dao.PhotoDAO;

@Service
public class PhotoMM {

	@Autowired // 서버 시작 시 주입
	private PhotoDAO pDao;
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	//포토 갤러리 글쓰기
	public ModelAndView photoWrite(Photo photo, MultipartFile[] p_file) {
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		String view = "";
        Member mb = (Member) session.getAttribute("mb");
        String id = mb.getM_id();
		photo.setM_id(id);
		
		/*//1.이클립스의 물리적 저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");*/
		//저장경로를 넣을 변수
		String path = ""; //저장 경로
		path = uploadFile.getPath(photo.getFs_index());
		System.out.println("저장 경로 : "+path);
		
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){  //upload폴더 없다면
			dir.mkdir();  //upload폴더 생성
		}
		
		int flag = pDao.comboardWrite(photo);
		if(flag != 0){
			flag = pDao.photoPoint(photo.getM_id()); // 글 작성 완료 시 포인트 부여
		}
		System.out.println("가져온 cb_index : "+photo.getCb_index());
		Files files = null;
		
		if(flag == 1){
			for(MultipartFile file:p_file) {
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
	            files.setCb_index(photo.getCb_index());
	            files.setFs_index(photo.getFs_index());
	            flag = pDao.photoFileInsert(files);//db에 등록
	            
	            if(flag != 1){
	            	mav.addObject("msg", "글쓰기에 실패하였습니다.");
	                view="han/photoGallery_write";// 글쓰기 등록 실패할 경우
	                System.out.println("글쓰기 실패");
	                mav.setViewName(view);
	                return mav;
	            }
	        }
		}
		
    	mav.addObject("msg", "글쓰기에 성공하였습니다.");
        view="redirect:photoGallery_list"; // 글쓰기 등록 성공할 경우
        System.out.println("글쓰기 성공");
            
        mav.setViewName(view);
        return mav;
	}

	// 포토 갤러리 리스트 가져오기
	public ModelAndView photoList(HttpServletRequest request) {
		String view=null;
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		/*Map<String, Integer> divMap = new HashMap<String, Integer>();
		divMap.put("divMinCount", 1);
		divMap.put("divMaxCount", 6);
		List<Photo> pList = pDao.photoList(divMap);*/
		List<Photo> pList = pDao.photoList();
		for(int i = 0;i<pList.size();i++){
			String f_newName = pDao.getPhotoFile(pList.get(i).getCb_index());
			pList.get(i).setF_newName(f_newName);
		}
		
		String simpleContent = ""; //14자넘은애 넣는곳
		for(int i=0;i<pList.size();i++){
			System.out.println(pList.get(i).getCb_content());
			if(pList.get(i).getCb_content().length() > 14){
				simpleContent = pList.get(i).getCb_content().substring(0, 14);
				System.out.println("14글자로 자른애 : "+simpleContent);
				simpleContent += "...";
				System.out.println("처리 후 : "+simpleContent);
				pList.get(i).setCb_simpleContent(simpleContent);
			}
		}
		
		String path = uploadFile.getPath(7);
		String[] realPath = path.split(":");
		System.out.println("fs_index : "+7);
		System.out.println("path : "+realPath[1]);
		
		String msg = request.getParameter("msg");
		System.out.println(msg);
		
		mav.addObject("msg", msg);
		mav.addObject("pList", pList);
		mav.addObject("path", realPath[1]);
		
		view="han/photoGallery_list";
		mav.setViewName(view);
        return mav;
	}
	
	// 포토갤러리 상세보기
	public Map<String, Object> photoAjax(int cb_index) {
		System.out.println("포토 갤러리 상세보기 - data : "+cb_index);
		UploadFile uploadFile = new UploadFile();
		HashMap<String, Object> ptMap = new HashMap<String,Object>();
		
		Photo photo = pDao.photoAjax(cb_index);
		System.out.println("상세보기 제목 : "+photo.getCb_subject());
		
		int fileCount = pDao.photoFileCount(cb_index);
		System.out.println("사진 갯수 : "+fileCount);
		
		int rnum = 1;
		ptMap.put("cb_index", cb_index);
		
		String[] fileName = new String[fileCount];
		for(int i=0;i<fileCount;i++){
			ptMap.put("rnum", rnum);
			fileName[i] = pDao.getAllFileName(ptMap);
			//System.out.println(rnum+"번 사진 이름 : "+photo.getF_allName());
			rnum++;
		}
		photo.setF_allName(fileName);
		System.out.println(photo.getF_allName().length);
		String path = uploadFile.getPath(7);
		String[] realPath = path.split(":");
		//System.out.println("fs_index : "+photo.getFs_index());
		System.out.println("path : "+realPath[1]);
		
		// 세션 아이디 뽑기
		Member mb = (Member) session.getAttribute("mb");
		System.out.println("mb"+mb);
		
		ptMap.put("sessionId", mb);
		ptMap.put("photoDetail", photo);
		ptMap.put("path", realPath[1]);
		return ptMap;
	}

	// 포토갤러리 수정(원래 있던 데이터 찍어놓기)
	public ModelAndView PhotoGallery_update(int cb_index) {
		System.out.println("포토갤러리 수정 index : "+cb_index);
		
		// comboard 값 가져오기
		String view=null;
		mav = new ModelAndView();
		List<Photo> updateList = pDao.photoGallery_update(cb_index);
		
		// 파일 이름 가져오기
		int fileCount = pDao.photoFileCount(cb_index);
		String[] fileName = new String[fileCount];
		
		int rnum = 1;
		HashMap<String, Object> photoMap = new HashMap<String, Object>();
		photoMap.put("cb_index", cb_index);
		
		for(int i=0;i<fileCount;i++){
			photoMap.put("rnum", rnum);
			fileName[i] = pDao.getOriFileName(photoMap);
			rnum++;
		}
		
		mav.addObject("updateList", updateList);
		mav.addObject("fileName", fileName);
		view="han/PhotoGallery_update";
		mav.setViewName(view);
        return mav;
	}

	// 포토갤러리 수정
	public ModelAndView photoUpdate(Photo photo, MultipartFile[] p_file) {
		mav = new ModelAndView();
		UploadFile uploadFile = new UploadFile();
		Member mb = (Member) session.getAttribute("mb");
		String m_id = mb.getM_id();
		/*//1.이클립스의 물리적 저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");*/
		//저장경로를 넣을 변수
		String path = ""; //저장 경로
		path = uploadFile.getPath(photo.getFs_index());
		System.out.println("저장 경로 : "+path);
		
		int success = 0;
		String view = "";
		
		// 파일 이름 가져오기
		int cb_index = photo.getCb_index();
		int fileCount = pDao.photoFileCount(cb_index);
		String[] fileName = new String[fileCount];
		
		int rnum = 1;
		HashMap<String, Object> photoMap = new HashMap<String, Object>();
		photoMap.put("cb_index", cb_index);
		Files files = null;
		
		for(int i=0;i<fileCount;i++){
			photoMap.put("rnum", rnum);
			files = pDao.photoDelete(photoMap);
			fileName[i] = files.getF_newName();
			rnum++;
		}
		
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
		
		if(photo.getFileChk() == 1){
			success = pDao.photoFileDelete(photo);
			System.out.println("파일 이름 삭제 여부"+success);
			if(success != 0){
				//2.폴더 생성을 꼭 할것...
				File dir=new File(path);
				if(!dir.isDirectory()){  //upload폴더 없다면
					dir.mkdir();  //upload폴더 생성
				}
				System.out.println("가져온 cb_index : "+photo.getCb_index());
				for(MultipartFile file:p_file) {
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
		            files.setCb_index(photo.getCb_index());
		            files.setFs_index(photo.getFs_index());
		            success = pDao.photoFileInsert(files);//db에 등록
		            
		            if(success != 1){
		            	mav.addObject("msg", "글 수정에 실패하였습니다.");
		                view="han/PhotoGallery_update";// 글쓰기 등록 실패할 경우
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
		mav.addObject("msg", "글 수정에 성공하였습니다.");
        view="redirect:photoGallery_list";// 글쓰기 등록 성공할 경우
        System.out.println("글 수정 성공");
        
        mav.setViewName(view);
		success = pDao.photoUpdate(photo);
		return mav;
	}

	// 글 삭제
	public ModelAndView photoGallery_delete(int cb_index) {
		mav = new ModelAndView();
		String view = "";
		int success = 0;
		Files files = null;
		// files 삭제 - 이름 가져오기
		//pDao.photoDelete(cb_index);
		
		// 파일 이름 가져오기
		int fileCount = pDao.photoFileCount(cb_index);
		String[] fileName = new String[fileCount];
		
		int rnum = 1;
		HashMap<String, Object> photoMap = new HashMap<String, Object>();
		photoMap.put("cb_index", cb_index);
		
		for(int i=0;i<fileCount;i++){
			photoMap.put("rnum", rnum);
			files = pDao.photoDelete(photoMap);
			fileName[i] = files.getF_newName();
			rnum++;
		}
		Photo photo = new Photo();
		photo.setCb_index(cb_index);
		int fs_index = files.getFs_index();
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
			if(success != 0){
				success = pDao.photoFileDelete(photo); //files 테이블 내용 삭제
				if(success != 0){
					System.out.println("files 데이터 삭제 성공");
					success = pDao.photoGallery_delete(cb_index); //comboard 테이블 내용 삭제
					if(success != 0){
						System.out.println("comboard 데이터 삭제 성공");
					}else{
						System.out.println("comboard 데이터 삭제 실패");
					}
				}
			}
			//success = pDao.photoGallery_delete(cb_index); // 성공한 숫자만큼 반환
			mav.addObject("msg", "글 삭제에 성공하였습니다.");
			view="redirect:photoGallery_list";
		}else{
			mav.addObject("msg", "글 삭제에 실패하였습니다.");
			view="redirect:photoGallery_list";
		}
        mav.setViewName(view);        
		return mav;
	}

	//리스트 가져오기
	public Map<String, Object> photoGallery(HttpServletRequest request) {
		String view=null;
		Map<String, Object> map = new HashMap<String, Object>();
		UploadFile uploadFile = new UploadFile();
		/*Map<String, Integer> divMap = new HashMap<String, Integer>();
		divMap.put("divMinCount", 1);
		divMap.put("divMaxCount", 6);
		List<Photo> pList = pDao.photoList(divMap);*/
		List<Photo> pList = pDao.photoList();
		for(int i = 0;i<pList.size();i++){
			String f_newName = pDao.getPhotoFile(pList.get(i).getCb_index());
			pList.get(i).setF_newName(f_newName);
		}
		
		String simpleContent = ""; //14자넘은애 넣는곳
		for(int i=0;i<pList.size();i++){
			System.out.println(pList.get(i).getCb_content());
			if(pList.get(i).getCb_content().length() > 14){
				simpleContent = pList.get(i).getCb_content().substring(0, 14);
				System.out.println("14글자로 자른애 : "+simpleContent);
				simpleContent += "...";
				System.out.println("처리 후 : "+simpleContent);
				pList.get(i).setCb_simpleContent(simpleContent);
			}
		}
		
		String path = uploadFile.getPath(7);
		String[] realPath = path.split(":");
		System.out.println("fs_index : "+7);
		System.out.println("path : "+realPath[1]);
		
		String msg = request.getParameter("msg");
		System.out.println(msg);
		
		map.put("msg", msg);
		map.put("pList", pList);
		map.put("path", realPath[1]);

		return map;
	}
}
