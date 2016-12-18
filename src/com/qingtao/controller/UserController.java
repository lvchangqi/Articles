package com.qingtao.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.qingtao.pojo.Info;
import com.qingtao.pojo.Roles;
import com.qingtao.pojo.User;
import com.qingtao.serviceI.InfoServiceI;
import com.qingtao.serviceI.RolesServiceI;
import com.qingtao.serviceI.UserServiceI;
import com.qingtao.util.Mail;

@Controller
@RequestMapping({ "/user" })
@SessionAttributes({ "user", "version" })
public class UserController {
	private final String SALT = "QingTao";

	@Autowired
	private UserServiceI us;
	@Autowired
	private RolesServiceI rs;
	@Autowired
	private InfoServiceI is;

	@RequestMapping(value = { "/submit" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String submit(User user, Info info, @RequestParam(value = "role_version") String r_v) {

		user.setPassword(new Md5Hash(user.getPassword(), SALT).toString());
		user.setTime(new Date());
		
		us.createUser(user);
		is.createInfo(info);
		if (r_v.contains("/")) {
			Roles role = new Roles();
			role.setUsername(user.getUsername());
			role.setVersion(Integer.parseInt(r_v.split("/")[1]));

			rs.createRole(role);
		}

		return "WEB-INF/goto";
	}

	@RequestMapping(value = { "/login" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam(value = "role_version") String r_v, ModelMap model) {
		Subject subject = SecurityUtils.getSubject();
		password = new Md5Hash(password, SALT).toString();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		try {
			if (us.readUser(username) == null) {
				return "no user";
			} else {
				Roles roles = rs.readRole(username);
				if (roles != null) {
					String place = roles.getRole() + "/" + roles.getVersion();
					model.addAttribute("version", roles.getVersion());
					if (!place.equals(r_v)) {
						return "NotMatch";
					}
				} else {
					if (!r_v.equals("0") && !r_v.equals("1")) {
						return "NotMatch";
					} else {
						model.addAttribute("version", r_v);
					}
				}
			}
			subject.login(token);

			model.addAttribute("user", is.readInfo(username));
			return "token";
		} catch (IncorrectCredentialsException e) {
			e.printStackTrace();
			return "UsernamePassword is wrong";
		} catch (UnknownAccountException e) {
			e.printStackTrace();
			return "UsernamePassword is unable";
		} catch (AuthenticationException e) {
			e.printStackTrace();
			return "another wrong";
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return "no user";
	}

	@RequestMapping(value = { "/updatePwd" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	@ResponseBody
	public String updatePassword(@RequestParam(value = "inputpwd", required = false) String inputpwd,
			@RequestParam(value = "newpwd", required = false) String newpwd, ModelMap map) {
		Info info = (Info) map.get("user");
		User user = us.readUser(info.getUsername());
		String result = null;
		String md5 = null;

		String opwd = user.getPassword();
		String uname = user.getUsername();

		if (inputpwd != null) {
			md5 = new Md5Hash(inputpwd, SALT).toString();
		}
		if ((md5 != null) && (md5.equals(opwd))) {
			result = "inputpwd";
		} else if (newpwd != null) {
			User paramUser = new User();
			paramUser.setUsername(uname);
			paramUser.setPassword(new Md5Hash(newpwd, SALT).toString());

			this.us.updateUser(paramUser);
			result = "updatepwd";
		}
		return result;
	}

	@RequestMapping(value = { "/Email" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	@ResponseBody
	public Integer sendCode(@RequestParam("email") String email, @RequestParam("username") String username)
			throws Exception {
		String realEmail = this.is.readInfo(username).getEmail();
		if (email.equals(realEmail)) {
			return new Mail().sendCode(email);
		}
		return Integer.valueOf(0);
	}

	@RequestMapping(value = { "/updatePwdo" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public String newPwd(@RequestParam("pwd") String pwd, @RequestParam("name") String username) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(new Md5Hash(pwd, SALT).toString());
		this.us.updateUser(user);
		return "OK";
	}

	@RequestMapping(value = { "/check" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public boolean checkUsername(@RequestParam(value = "username", required = false) String username) {
		boolean flag = false;
		if ((username != null) && (this.us.readUser(username) != null)) {
			flag = true;
		}

		return flag;
	}

	@ResponseBody
	@RequestMapping(value = { "/select" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public List<Map<String, String>> select(@RequestParam(value = "role") String role,
			@RequestParam("version") String version) {
			return this.rs.readRolerName(version, role);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/info" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public Info info(@RequestParam(value = "username") String username) {
			return is.readInfo(username);
	}

	@RequestMapping(value = { "/loginOut" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String loginOut(ModelMap map) {
		map.clear();
		SecurityUtils.getSubject().logout();
		return "WEB-INF/cometo";
	}
}
