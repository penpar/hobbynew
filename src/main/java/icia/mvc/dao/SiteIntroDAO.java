package icia.mvc.dao;

import java.util.Map;

import icia.mvc.bean.SiteIntro;

public interface SiteIntroDAO {

	int comboardWrite(Map<String, String> stMap);
	
	int siteFileInsert(Map<String, String> stMap);

	SiteIntro getSiteIntro(int rnum);
}