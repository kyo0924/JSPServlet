package com.mybatis.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.model.vo.Rstudent;
import com.mybatis.model.vo.Student;

public class MybatisDaoImpl implements MybatisDao {

	@Override
	public int insertStudent(SqlSession session) {
		int result = session.insert("student.insertStudent");
		return result;
	}

	@Override
	public int insertStudent(SqlSession session, String name) {
		
		return session.insert("student.insertName", name);
	}

	@Override
	public int insertStudent(SqlSession session, Student s) {
		return session.insert("student.insertAll", s);
	}

	@Override
	public int insertStudent(SqlSession session, Map<String, Object> map) {
		return session.insert("student.insertMap", map);
	}

	@Override
	public int selectCount(SqlSession session) {
		return session.selectOne("student.selectCount");
	}

	@Override
	public Rstudent selectOne(SqlSession session, int no) {
		return session.selectOne("student.selectOne", no);
	}

	@Override
	public Map selectMap(SqlSession session, int no) {
		return session.selectOne("student.selectMap", no);
	}
	

/*	@Override
	public List<Rstudent> selectTotal(SqlSession session) {
		return session.selectList("student.selectTotal");
	}*/
	
	@Override
	public List selectTotal(SqlSession session) {
		return session.selectList("student.selectTotal");
	}

	@Override
	public List<Map<String, String>> selectTotalMap(SqlSession session) {
		return session.selectList("student.selectTotalMap");
	}

	@Override
	public int deleteStudent(SqlSession session, int no) {
		return session.delete("student.deleteStudent", no);
	}

	@Override
	public List<Student> memberAll(SqlSession session) {
		return session.selectList("student.memberAll");
	}

	
	//map으로 하는 것
	@Override
	public List<Map> memberAllMap(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("student.memberAllMap");
	}

	
	//이름으로 검색 - 만약에 일치되는 것 하나만 찾는다 그러면 selcetOne으로 써야함 지금은 여러개를 찾는거니깐 selctList
	@Override
	public List<Map> memberSearch(SqlSession session, String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("student.memberSearch", keyword);
	}

	
	
	
	
}
