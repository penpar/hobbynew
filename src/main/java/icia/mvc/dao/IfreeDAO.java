package icia.mvc.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import icia.mvc.bean.Files;
import icia.mvc.bean.Free;
import icia.mvc.bean.Recommand;

public interface IfreeDAO {
	
	//자유게시판 작성란 분류목록 불러오기
	List<Free> freeCN_indexCall();

	//자유게시판 글 작성 시 게시판 테이블 등록
	int comboardWrite(Free free);

	//자유게시판 글 작성 시 자유테이블 등록
	int freeBoardWrite(Free free);

	//자유게시판 글 작성 시 파일 등록
	int freeFileInsert(Files files);
	
	//자유게시판 리스트 불러오기
	List<Free> freeList();

	//자유게시판 상세보기
	Free getFreeDetail(int cb_index);
	
	//자유게시판  상세보기 파일 전체 이름 가져오기
	List<String> freeGetFile(int cb_index);
	
	//자유게시판 댓글 작성
	int b_FreeComWrite(Free free);

	//자유게시판 댓글 리스트 불러오기
	List<Free> getCommList(Free free);

	//자유게시판 댓글 총 갯수 불러오기
	int commCount(int cb_index);

	//자유게시판 상세보기 파일 리스트 가져오기
	List<String> freeGetFiles(int cb_index);

	//자유게시판 수정 시 해당 글 파일 갯수 가져오기
	/*int freeFileCount(int cb_index);*/
	
	//자유게시판 수정 시 해당 글 파일 이름 가져오기
	List<Free> findDelFile(int cb_index);

	//자유게시판 수정 시 기존 파일 제거
	int freeFileDelete(Free free);

	//자유게시판 수정 시 게시판테이블 업데이트
	int comboardChange(Free free);

	//자유게시판 수정 시 자유테이블 업데이트
	int b_freeChange(Free free);
	
	//자유게시판 글 삭제 시 DB파일 삭제
	int freeFileDel(int cb_index);

	//자유게시판 글 삭제 시 자유테이블 삭제
	int b_FreeDel(int cb_index);
	
	//자유게시판 글 삭제 시 게시판테이블 삭제
	int comboardFreeDel(int cb_index);

	//댓글 가져오기
	List<Free> getFreeCommList(Free free);

	//댓글 삭제
	int comDelete(int co_index);

	int viewUp(int cb_index);

	int getViewUp(int cb_index);

	int myBookList(HashMap<String, String> rc);
	

	

}
