
package icia.mvc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import icia.mvc.bean.Note;
import icia.mvc.bean.Report;

public interface INoteDAO{

	int noteInsert(Note note);

	ArrayList<Note> getNoteList_0(String id);

	ArrayList<Note> getNoteList_1(String id);

	int noteDelete(int index);

	int noteBlock(HashMap<String, Object> setBlock);

	Note noteDetail(int index);

	void noteState(Note nt);

	int noteCount(String id);

	int noteReport(int index);

	List<String> noteAuto(String id);

	int noteCheck(String id);

	int checkId(String m_id2);

	List<Note> noteM_id2(int index);

	void banInsert(Report rt);

 //	int noteStateCheck(int index);

	int noteWriteChange(int index);
}