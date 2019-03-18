package com.emp.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface EmpDao {
	
	List<Map> selectAll(SqlSession session);
	
	List<Map> selectSearch(SqlSession session, Map<String,Object> map);
	
	//paging처리
	int selectCount(SqlSession session);
	List<Map> selectPaging(SqlSession session, int cPage, int numPerPage);
	
	

}
