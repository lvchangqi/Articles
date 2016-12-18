package com.qingtao.serviceI;

import java.util.List;

import com.qingtao.pojo.Msg;

public interface MsgServiceI {

	public List<Msg> readMsg(String number);

	public Integer createMsg(Msg record);
	
	public int updateIsread(String number);

}