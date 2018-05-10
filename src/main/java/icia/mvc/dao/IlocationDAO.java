package icia.mvc.dao;

import java.util.List;

import icia.mvc.bean.ClassBean;
public interface IlocationDAO {

	String mmAdress(String id);

	List<ClassBean>locatioInfo();

	List<ClassBean> locSort(int sort);

	
	
	// locatioInfo();

}
