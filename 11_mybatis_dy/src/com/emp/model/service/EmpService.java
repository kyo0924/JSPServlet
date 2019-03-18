package com.emp.model.service;

import java.util.List;
import java.util.Map;

public interface EmpService {
	
	List<Map> selectAll();
	
	List<Map> selectSearch(Map<String,Object> map);

	//페이징 처리
	int selectCount();
	List<Map> selectPaging(int cPage, int numPerPage);
	
	
	
	
}
