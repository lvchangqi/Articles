package com.qingtao.dao;

import com.qingtao.pojo.User;

public interface UserMapper {

	public User readUser(String username);
	
	public Integer createUser(User user);
	
	public Integer updateUser(User user);
}
