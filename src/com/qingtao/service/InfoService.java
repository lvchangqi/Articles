package com.qingtao.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingtao.dao.InfoMapper;
import com.qingtao.pojo.Info;
import com.qingtao.serviceI.InfoServiceI;

@Service
public class InfoService implements InfoServiceI {

	@Autowired
	private InfoMapper im;
	
	@Override
	public Info readInfo(String username) {
		return im.readInfo(username);
	}

	@Override
	public Integer createInfo(Info info) {
		return im.createInfo(info);
	}

}
