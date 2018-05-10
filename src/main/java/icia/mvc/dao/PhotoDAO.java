package icia.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import icia.mvc.bean.Files;
import icia.mvc.bean.Photo;

public interface PhotoDAO {

	int comboardWrite(Photo photo);

	int photoFileInsert(Files files);

	List<Photo> photoList();
	/*List<Photo> photoList(Map divMap);*/
	
	Photo photoAjax(int cb_index);

	List<Photo> photoGallery_update(int cb_index);

	String getPhotoFile(int cb_index);

	int photoFileCount(int cb_index);

	String getAllFileName(Map<String, Object> ptMap);

	String getOriFileName(HashMap<String, Object> photoMap);

	int photoFileDelete(Photo photo);

	int photoUpdate(Photo photo);

	int photoFileInsert(Photo photo);

	int photoGallery_delete(int cb_index);

	/*이름 가져오기*/
	Files photoDelete(Map photoMap);

	int photoPoint(String m_id);

	

}
