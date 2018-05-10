package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import icia.mvc.bean.ClassBean;
import icia.mvc.bean.ClassReply;
import icia.mvc.bean.Files;
import icia.mvc.bean.Pay;
import icia.mvc.bean.Review;
import icia.mvc.bean.Vote;

public interface IclassDAO {

	List<ClassBean> getClassList();
	
	int classWrite(ClassBean classBean);

	int classFileInsert(Files files);

	List<Integer> getClassAver(int c_index);

	ClassBean getClassDetail(int c_index);

	String getMemberInfo(String m_id);

	List<String> getExplainImg(int c_index);

	List<Pay> getPayList(int c_index);

	List<Review> getClassReview(int c_index);

	int setClassReview(Review review);

	int reviewFileInsert(Review review);

	int setAver(Review review);

	int reviewDel(int re_index);

	int getReviewFileCount(int re_index);

	List<String> getReviewFile(int re_index);

	int setVoteUrl(ClassBean classBean);

	String getFileName(Map<String, Object> fMap);
	
	List<String> getFileNames(Map<String, Object> fMap);

	List<Vote> getMyVoteList(String m_id);

	int classUpdate(ClassBean classBean);

	int classFileDelete(Map<String, Integer> indexMap);

	String getFileNewName(Map<String, Integer> indexMap);

	List<String> getFileNewNames(Map<String, Integer> indexMap);

	Review getReview(int re_index);

	int setReviewUpdate(Review review);

	int updateAver(Review review);

	int reviewFileDelete(int re_index);

	int updateVoteUrl(ClassBean classBean);

	List<ClassReply> getReplyList(Map<String, Integer> pagingMap);

	int classReplyInsert(ClassReply classReply);

	int classReplyDelete(int cr_index);

	List<ClassBean> classSearch(Map<String, Object> searchMap);

	int getReplyCount(int c_index);

	List<Integer> myClassList(String m_id);

	int myClassAdd(Map<String, Object> classMap);

	int myClassDel(Map<String, Object> classMap);

	int classDelete(int c_index);

	List<ClassBean> dateList();

	List<Integer> userCheckList(String m_id);

	List<ClassBean> rateList();
}