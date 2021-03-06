package com.som.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.som.project.model.BbsDto;


@Repository
public class BbsDao {
	
	@Autowired
	SqlSession sqlsession;
	
	public List<BbsDto> bbsList() {
		//return sqlsession.selectList("bbsList");
		return sqlsession.selectList("bbsList");
	}

	public int bbsWrite(BbsDto bbsDto) {
		int i = sqlsession.insert("bbsWrite", bbsDto);
		return i;
	}
	
	public BbsDto bbsDetail(int seq, String loginId) {
		return sqlsession.selectOne("bbsDetail", seq);
	}
	
	public void bbsReadCount(int seq) {
		//sqlsession.update("bbsReadCount", seq);
	}
	
	public boolean bbsUpdate(BbsDto bbsDto) {
		int i = sqlsession.update("bbsUpdate", bbsDto);
		return i == 1 ? true : false;
	}
	
	public void bbsDelete(int seq) {
		sqlsession.delete("bbsDelete", seq);
	}

}
