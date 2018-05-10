package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Notice;

public interface InoticeDAO {

	int b_NoticeWrite(Notice notice);

	int b_Announce(Notice notice);

	List<Notice> getboardList();

	int b_AnFileInserte(Map<String, String> fMap);

	List<Notice> getboardDetail(int cb_index);
	
	//공지사항 수정 시 파일 제거
	int anFileDel(int cb_index);
	
	//공지사항 수정 시 게시판 테이블 수정
	int b_NoticeChange(Notice notice);
	
	/*//공지사항 수정 시 공지사항 테이블 수정
	int b_AnnounceChange(Notice notice);*/
	
	//공지사항 수정 시 파일 새로 업데이트
	int b_AnFileChange(Map<String, String> fMap);

	int announceDel(int cb_index);

	int comboardDel(int cb_index);

	List<Notice> b_NoticeSort(int cb_sort);

	int removeChk();

	List<Notice> getAnnList();

}
