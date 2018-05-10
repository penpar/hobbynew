package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import icia.mvc.bean.Board;
import icia.mvc.bean.Member;

public interface ImemberDao {

	int mb_checkId(String m_id);

	int mb_Login(Member mb);

	Member getMemberInfo(String m_id);

	int mb_Join(Member mb) throws Exception;

	int ch_check(Member mb);

	int mb_ArtJoin(Member member);

	int p_pointExp(Member mb);

	int mp_MyOut(String m_id);

	int mp_MyInfoChange(Member mb);

	int mp_ChangePw(Member mb);

	int m_ArtFileInserte(Map<String, String> fMap);
	
	int getPoint(String m_id);

	String idFind(Member mb);

	String pwFind(Member mb);

	
	
}
