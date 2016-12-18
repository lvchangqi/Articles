package com.qingtao.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingtao.dao.UserMapper;
import com.qingtao.pojo.User;
import com.qingtao.serviceI.UserServiceI;

@Service
public class UserService implements UserServiceI{

	@Autowired
	private UserMapper um;
	
	public User readUser(String username){
		return um.readUser(username);
	}

	@Override
	public Integer createUser(User user) {
		return um.createUser(user);
	}

	@Override
	public Integer updateUser(User user) {
		return um.updateUser(user);
	}
}
