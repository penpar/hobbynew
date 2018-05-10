package icia.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Files;
import icia.mvc.bean.Photo;
import icia.mvc.bean.Vote;

public interface VoteDAO {

	int comboardWrite(Vote vote);

	int voteFileInsert(Files files);

	int voteWrite(Vote vote);

	int voteItemWrite(Map<String, Object> nameList);

	List<Vote> voteList();

	String getVoteFile(int cb_index);

	Vote voteDetail(int cb_index);

	List<String> voteGetFile(int cb_index);

	List<String> voteName(int cb_index);

	int voteFileCount(int cb_index);

	Files voteDelete(Map<String, Object> voteMap);

	int voteFileDelete(Vote vote);

	int voteComDelete(int cb_index);

	int vSelect(Vote vote);

	int getVotePerson(Vote vote);

	List<Vote> getItemList(int cb_index);

	int getPeople(Vote vote);

	int getVotePerson(int cb_index);

	int voteCheck(Map<String, Object> userCheck);

	int viewUp(int cb_index);

	int getViewUp(int cb_index);

	int comment(Vote vote);

	List<Vote> getCommList(Vote vote);

	int comDelete(int co_index);

	List<Vote> voteUpdate(Vote vote);

	String getOriFileName(HashMap<String, Object> voteUpMap);

	int voteUpdate_last(Vote vote);

	int commSum(int cb_index);

	int votePoint(String m_id);

	int voteReplyPoint(String m_id);

}
