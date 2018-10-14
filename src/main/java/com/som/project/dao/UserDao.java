package com.som.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.som.project.dao.UserDao;
import com.som.project.model.UserDto;

@Repository
public class UserDao {
	
	@Autowired
	SqlSession sqlsession;

	public UserDto login(UserDto dto) throws Exception {
		return sqlsession.selectOne("login", dto);
	}
	
	public String regiIdCheck(String id) {
		return sqlsession.selectOne("regiIdCheck", id);
	}
	
	public int regiAf(UserDto dto) {
		return sqlsession.insert("register", dto);
	}
}
