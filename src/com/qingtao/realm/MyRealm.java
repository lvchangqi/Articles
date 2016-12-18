package com.qingtao.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.qingtao.pojo.Roles;
import com.qingtao.pojo.User;
import com.qingtao.serviceI.RolesServiceI;
import com.qingtao.serviceI.UserServiceI;

public class MyRealm extends AuthorizingRealm {
	
	@Autowired
	private UserServiceI userService;
	@Autowired
	private RolesServiceI roleService;

	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = principals.getPrimaryPrincipal().toString();
		Roles role = this.roleService.readRole(username);
		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		if(role != null){
			if(role.getRole() == 0){
				sai.addRole("super_editor");
			} else {
				sai.addRole("editor");
			}
		} else {
			sai.addRole("writer");
		}
		return sai;
	}

	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = token.getPrincipal().toString();
		User user = this.userService.readUser(username);
		if (user != null) {
			AuthenticationInfo ai = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), "QingTao");
			return ai;
		}
		return null;
	}
}
