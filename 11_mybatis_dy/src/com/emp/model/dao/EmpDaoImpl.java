package com.emp.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public class EmpDaoImpl implements EmpDao {

	@Override
	public List<Map> selectAll(SqlSession session) {
		return session.selectList("emp.selectAll");
	}

	@Override
	public List<Map> selectSearch(SqlSession session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		//parameter값이 있으면 반드시 넣어줘야한다. searchType이 컬럼명 keyword가 검색어 쓰는 부분
		//System.out.println(map);
		return session.selectList("emp.selectSearch", map);
	}

	
	//페이징 처리
	@Override
	public int selectCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.selectCount");
	}

	@Override
	public List<Map> selectPaging(SqlSession session, int cPage, int numPerPage) {
		//.selectList 눌렀을 때 3번째인 Rowbounds 를 클릭하면 자동 페이징처리
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		//매개변수가 있으면 null자리에 넣어주면 된다.
		return session.selectList("emp.selectPaging", null, row);
	}
	
	
	
	

}
