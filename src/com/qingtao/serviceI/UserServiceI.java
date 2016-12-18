package com.qingtao.serviceI;

import com.qingtao.pojo.User;

public interface UserServiceI {

	public User readUser(String username);
	
	public Integer createUser(User user);
	
	public Integer updateUser(User user);
}
