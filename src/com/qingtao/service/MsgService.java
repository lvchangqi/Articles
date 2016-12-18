package com.qingtao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingtao.dao.MsgMapper;
import com.qingtao.pojo.Msg;
import com.qingtao.serviceI.MsgServiceI;

@Service
public class MsgService implements MsgServiceI {

	@Autowired
	private MsgMapper mm;
	
	@Override
	public List<Msg> readMsg(String number) {
		return mm.readMsg(number);
	}

	@Override
	public Integer createMsg(Msg msg) {
		return mm.createMsg(msg);
	}

	@Override
	public int updateIsread(String number) {
		return mm.updateIsread(number);
	}
}
