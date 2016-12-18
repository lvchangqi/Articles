package com.qingtao.serviceI;

import com.qingtao.pojo.Info;

public interface InfoServiceI {

	public Info readInfo(String username);
	
	public Integer createInfo(Info info);
}
