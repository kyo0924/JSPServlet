package com.mybatis.model.service;

import static common.SessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.model.dao.MybatisDao;
import com.mybatis.model.dao.MybatisDaoImpl;
import com.mybatis.model.vo.Member;
import com.mybatis.model.vo.Rstudent;
import com.mybatis.model.vo.Student;
public class MybatisServiceImpl implements MybatisService {

	private MybatisDao dao = new MybatisDaoImpl();
	
	@Override
	public int insertStudent() {
		
		SqlSession session = getSession();
		int result = dao.insertStudent(session);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return 0;
	}

	@Override
	public int insertStudent(String name) {
		SqlSession session = getSession();
		int result = dao.insertStudent(session, name);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}

	@Override
	public int insertStudent(Student s) {
		SqlSession session = getSession();
		int result = dao.insertStudent(session, s);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		
		return result;
	}

	@Override
	public int insertStudent(Map<String, Object> map) {
		SqlSession session = getSession();
		int result = dao.insertStudent(session, map);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}

	@Override
	public int selectCount() {
		SqlSession session = getSession();
		int result = dao.selectCount(session);
		session.close();
		return result;
	}

	@Override
	public Rstudent selectOne(int no) {
		SqlSession session = getSession();
		Rstudent s = dao.selectOne(session, no);
		session.close();
		return s;
	}

	@Override
	public Map selectMap(int no) {
		SqlSession session = getSession();
		Map map = dao.selectMap(session, no);
		session.close();
		return map;
	}

	@Override
	public int deleteStudent(int no) {
		SqlSession session = getSession();
		int result = dao.deleteStudent(session, no);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}

	/*@Override
	public List<Rstudent> selectTotal() {
		SqlSession session = getSession();
		List<Rstudent> list = dao.selectTotal(session);
		session.close();
		return list;
	}*/
	
	@Override
	public List selectTotal() {
		SqlSession session = getSession();
		List<Rstudent> list = dao.selectTotal(session);
		session.close();
		return list;
	}

	@Override
	public List<Map<String, String>> selectTotalMap() {
		SqlSession session = getSession();
		List<Map<String, String>> list = dao.selectTotalMap(session);
		session.close();
		return list;
	}

	@Override
	public List memberAll() {
		SqlSession session = getSession();
		List<Student> list = dao.memberAll(session);
		session.close();
		return list;
	}

	@Override
	public List<Map> memberAllMap() {
		SqlSession session=getSession();
		List<Map> list = dao.memberAllMap(session);
		session.close();
		return list;
	}

	@Override
	public List<Map> memberSearch(String keyword) {
		SqlSession session=getSession();
		List<Map> list = dao.memberSearch(session, keyword);
		session.close();
		return list;
	}

	

	
	

}
