package com.mybatis.model.service;

import java.util.List;
import java.util.Map;

import com.mybatis.model.vo.Rstudent;
import com.mybatis.model.vo.Student;

public interface MybatisService {

	int insertStudent();
	int insertStudent(String name); // 오버로딩
	int insertStudent(Student s);
	int insertStudent(Map<String, Object> map);
	int selectCount();
	Rstudent selectOne(int no);
	Map selectMap(int no);
	int deleteStudent(int no);
//	List<Rstudent> selectTotal();
	List selectTotal();
	List<Map<String, String>> selectTotalMap();
	
	List<Student> memberAll();
	
	//map으로 하는 것
	List<Map> memberAllMap();
	
	//이름검색 
	List<Map> memberSearch(String keyword);
	
	
}
