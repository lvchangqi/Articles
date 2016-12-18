package com.qingtao.dao;

import java.util.List;
import java.util.Map;

import com.qingtao.pojo.Roles;

public interface RolesMapper {

	public Roles readRole(String username);
	
	public List<Map<String, String>> readRolerName(String version, String role);
	
	public Integer readForPage(Integer version);
	
	public List<Roles> readAll(Map<String, Object> map);
	
	public Integer updateRole(Integer role, String username);
	
	public Integer createRole(Roles roles);
}
