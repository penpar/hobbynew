package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import icia.mvc.bean.Question;
import icia.mvc.bean.ClassBean;

public interface SurvayDAO {

	List<ClassBean> classList(String cn);
	
}
