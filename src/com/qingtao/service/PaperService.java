package com.qingtao.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingtao.dao.PaperMapper;
import com.qingtao.pojo.Paper;
import com.qingtao.serviceI.PaperServiceI;

@Service
public class PaperService implements PaperServiceI{

	@Autowired
	private PaperMapper pm;
	
	@Override
	public Integer createPaper(Paper paper) {
		return pm.createPaper(paper);
	}

	@Override
	public Integer readForPage(String username, Integer version) {
		return pm.readForPage(username, version);
	}

	@Override
	public List<Map<String, Object>> readCountForNew(String[] args) {
		return pm.readCountForNew(args);
	}
	
}
