package com.qingtao.dao;

import java.util.List;

import com.qingtao.pojo.Msg;

public interface MsgMapper {

	public List<Msg> readMsg(String number);

	public Integer createMsg(Msg msg);
	
	public int updateIsread(String number);

}