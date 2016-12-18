package com.qingtao.dao;

import com.qingtao.pojo.Info;

public interface InfoMapper {
	
	public Info readInfo(String username);
	
	public Integer createInfo(Info info);
}
