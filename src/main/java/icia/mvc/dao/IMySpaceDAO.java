package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import icia.mvc.bean.Board;
import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Recommand;

public interface IMySpaceDAO {
	
	List<Board> MyWriteList(String id);

	List<Board> MyBookList(String id);

	void myBookDel(Map<String,String> rc);

	List<ClassBean> MyWriteClassList(String id);

	List<ClassBean> MyClassList(String id);

	int MyClassEnrolled(int c_index);

	void myClassDel(Map<String, String> rc);
	
	List<ClassBean> MyClassImg(int c_index);

	void myBookIn(Map<String, String> rc);


	
}
