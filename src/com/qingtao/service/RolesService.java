package com.qingtao.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingtao.dao.RolesMapper;
import com.qingtao.pojo.Roles;
import com.qingtao.serviceI.RolesServiceI;

@Service
public class RolesService implements RolesServiceI {

	@Autowired
	private RolesMapper rm;
	
	@Override
	public Roles readRole(String username) {
		return rm.readRole(username);
	}

	@Override
	public Integer createRole(Roles roles) {
		return rm.createRole(roles);
	}

	@Override
	public List<Map<String, String>> readRolerName(String version, String role) {
		return rm.readRolerName(version, role);
	}

	@Override
	public Integer readForPage(Integer version) {
		return rm.readForPage(version);
	}

	@Override
	public List<Roles> readAll(Map<String, Object> map) {
		return rm.readAll(map);
	}

	@Override
	public Integer updateRole(Integer role, String username) {
		return rm.updateRole(role, username);
	}

}
