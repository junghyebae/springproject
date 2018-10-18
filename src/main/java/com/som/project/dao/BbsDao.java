package com.som.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.som.project.dao.BbsDao;
import com.som.project.model.BbsDto;

@Repository
public class BbsDao {
	
	@Autowired
	SqlSession sqlsession;
	
	public List<BbsDto> bbsList() {
		return  sqlsession.selectList("bbsList");
	}

	public int bbsWrite(BbsDto bbsDto) {
		int i = sqlsession.insert("bbsWrite", bbsDto);
		return i;
	}
	
	public BbsDto bbsDetail(int seq, String loginId) {
		BbsDto dto = sqlsession.selectOne("bbsDetail", seq);
		
		// dto의 아이디가 로그인아이디와 같지 않을 경우 조회수 증가 시켜준다.
		if(!dto.getId().equals(loginId)) {
			sqlsession.update("bbsReadCount", seq);
		}
		return dto;
	}
	
	public boolean bbsUpdate(BbsDto bbsDto) {
		int i = sqlsession.update("bbsUpdate", bbsDto);
		return i == 1 ? true : false;
	}
	
	public void bbsDelete(int seq) {
		sqlsession.delete("bbsDelete", seq);
	}

	public List<BbsDto> bbsSearch(String search) {
		return sqlsession.selectList("bbsSearch", search);
	}
}
