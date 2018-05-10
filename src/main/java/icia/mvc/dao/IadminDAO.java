package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import icia.mvc.bean.Board;
import icia.mvc.bean.ClassBean;
import icia.mvc.bean.ClassName;
import icia.mvc.bean.Files;
import icia.mvc.bean.Report;
import icia.mvc.bean.User;

public interface IadminDAO {

	List<User> getUserList();

	List<User> getUserSortList(int sort);

	List<User> getUserSearchList(String searchValue);

	int updateUserSort(String m_id);

	int updateUserWarn(String m_id);

	int getUserCount(String m_id);

	List<Report> getReportList();

	List<ClassName> getClassNameList();

	int setClassName(String cn_name);

	int delClassName(String cn_name);

	List<Board> questionMgt();

	List<Board> questionMgtSort(String sort);

	List<Board> qUserSearch(String searchValue);

	List<User> getJudgeList(User user);

	int changeWrite(ClassBean classBean);

	int setVoteUrl(ClassBean classBean);

	int changeFileInsert(Files files);

	int joinComfirm(String m_id);

	int joinDelete(String m_id);
}
