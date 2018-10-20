package com.som.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.som.project.dao.BbsDao;
import com.som.project.model.BbsDto;
import com.som.project.service.BbsService;

@Service
public class BbsService {
	
	@Autowired
	private BbsDao bbsDao;
	
	public List<BbsDto> bbsList(String search, String item) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("item", item);
		return bbsDao.bbsList(map);
	}

	public int bbsWrite(BbsDto bbsDto) {
		return bbsDao.bbsWrite(bbsDto);
	}
	
	public BbsDto bbsDetail(int seq, String loginId) {
		return bbsDao.bbsDetail(seq, loginId);
	}
	
	public boolean bbsUpdate(BbsDto bbsDto) {
		return bbsDao.bbsUpdate(bbsDto);
	}
	
	public void bbsDelete(int seq) {
		bbsDao.bbsDelete(seq);
	}
}
