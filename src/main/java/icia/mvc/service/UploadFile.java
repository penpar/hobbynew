package icia.mvc.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UploadFile {
	//파일 업로드 메소드   
	   //String fullPath="D:/Work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SpringMVC-Board/resources/upload";
	   
	   public Map<String,String> fileUp(MultipartHttpServletRequest multi){
	      System.out.println("fileUp");
	      
	      /*//1.이클립스의 물리적 저장경로 찾기
	      String root=multi.getSession().getServletContext().getRealPath("/");*/
	      //저장경로를 넣을 변수
	      String path = "";
	      int fs_index = Integer.parseInt(multi.getParameter("fs_index"));
	      path = getPath(fs_index);
	      
	      //2.폴더 생성을 꼭 할것...
	      File dir=new File(path);
	      if(!dir.isDirectory()){  //upload폴더 없다면
	         dir.mkdir();  //upload폴더 생성
	      }
	      //3.파일을 가져오기-일태그 이름들 반환
	      Iterator<String> files=multi.getFileNames(); //파일업로드 2개이상일때
	      Map<String,String> fMap=new HashMap<String, String>();
	      fMap.put("fs_index", multi.getParameter("fs_index")); //파일 구분
	      while(files.hasNext()){
	         String fileTagName=files.next();
	         //파일 메모리에 저장
	         MultipartFile mf=multi.getFile(fileTagName); //실제파일
	         String oriFileName=mf.getOriginalFilename();  //a.txt
	         fMap.put("oriFileName", oriFileName);
	         
	         //4.시스템파일이름 생성  a.txt  ==>112323242424.txt
	         String sysFileName=System.currentTimeMillis()+"."
	               +oriFileName.substring(oriFileName.lastIndexOf(".")+1);
	         fMap.put("sysFileName", sysFileName);
	         //5.메모리->실제 파일 업로드
	         try {
	            mf.transferTo(new File(path+sysFileName));
	         }catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      return fMap;
	   }

	//구분에 따라서 저장경로 구하기
	public String getPath(int fs_index) {
		//1.이클립스의 물리적 저장경로 찾기
	      //String root=multi.getSession().getServletContext().getRealPath("/");
	      String root = "D:/HNresources/uploadFolder/"; 
	      //저장경로를 넣을 변수
	      String path = "";
		 if(fs_index == 0){
	    	  path=root+"resources/memberJoin/";
	      }else if(fs_index == 1){
	    	  path=root+"resources/announce/";
	      }else if(fs_index == 2){
	    	  path=root+"resources/freeboard/";
	      }else if(fs_index == 3){
	    	  path=root+"resources/question/";
	      }else if(fs_index == 4){
	    	  path=root+"resources/siteIntro/";
	      }else if(fs_index == 5){
	    	  path=root+"resources/userChange/";
	      }else if(fs_index == 6){
	    	  path=root+"resources/vote/";
	      }else if(fs_index == 7){
	    	  path=root+"resources/photo/";
	      }
		return path;
	}
	   
	   //파일 다운로드 메소드
	   //파일 삭제 메소드
	   //삭제
}
