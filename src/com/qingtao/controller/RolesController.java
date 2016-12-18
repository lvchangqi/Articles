package com.qingtao.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.qingtao.pojo.Roles;
import com.qingtao.serviceI.RolesServiceI;

@Controller
@RequestMapping("/role")
@SessionAttributes({ "user", "version" })
public class RolesController {

	@Autowired
	private RolesServiceI rs;

	@RequestMapping(value = { "/page" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	@ResponseBody
	public int[] page(ModelMap model) {
		Integer version = Integer.parseInt(model.get("version").toString());

		int pageNum = rs.readForPage(version);
		int pagevisible = 5;

		if (pageNum % 10 == 0) {
			pageNum /= 10;
		} else {
			pageNum = pageNum / 10 + 1;
		}
		if (pageNum <= 5) {
			pagevisible = pageNum;
		}
		return new int[] { pageNum, pagevisible };
	}

	@RequestMapping(value = { "/list" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public Collection<Roles> listFile(@RequestParam(value = "prefixLimit", defaultValue = "0") Integer prefixLimit,
			ModelMap model) {
		String version = model.get("version").toString();
		Map<String, Object> map = new HashMap<>();
		map.put("version", version);

		map.put("pre", prefixLimit.toString());
		map.put("limit", "10");

		return rs.readAll(map);
	}

	@RequestMapping(value = { "/role" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public Integer updateRole(@RequestParam("role") Integer role, @RequestParam("username") String username) {
		return rs.updateRole(role, username);
	}

}
