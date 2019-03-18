package com.mybatis.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.model.vo.Rstudent;
import com.mybatis.model.vo.Student;

public interface MybatisDao {

	int insertStudent(SqlSession session);
	int insertStudent(SqlSession session, String name);
	int insertStudent(SqlSession session, Student s);
	int insertStudent(SqlSession session, Map<String, Object> map);
	int selectCount(SqlSession session);
	Rstudent selectOne(SqlSession session, int no);
	Map selectMap(SqlSession session, int no);
	int deleteStudent(SqlSession session, int no);
//	List<Rstudent> selectTotal(SqlSession session);
	List selectTotal(SqlSession session);
	List<Map<String, String>> selectTotalMap(SqlSession session);
	
	List<Student> memberAll(SqlSession session);
	
	//map으러 하는것
	List<Map> memberAllMap(SqlSession session);
	
	//이름 검색
	List<Map> memberSearch(SqlSession session, String keyword);
	
	
}
