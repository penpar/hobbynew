package icia.mvc.dao;

import java.util.Map;

import icia.mvc.bean.Question;

public interface QuestionDAO {
	
	int comboardWrite(Question question);
	
	int questionWrite(Question question);

	int questionFileInsert(Map<String, String> fMap);
}
