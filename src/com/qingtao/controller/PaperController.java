package com.qingtao.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.qingtao.pojo.File;
import com.qingtao.pojo.Info;
import com.qingtao.pojo.Paper;
import com.qingtao.serviceI.FileServiceI;
import com.qingtao.serviceI.PaperServiceI;

@Controller
@RequestMapping("/paper")
@SessionAttributes({ "user", "version" })
public class PaperController {

	@Autowired
	private PaperServiceI ps;
	
	@Autowired
	private FileServiceI fs;
	
	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public Integer createPaper(@RequestParam("ename") String ename, 
			@RequestParam("number") String number,
			ModelMap model) {
		Integer version = Integer.parseInt(model.get("version").toString());
		Paper paper = new Paper();
		paper.setEname(ename);
		paper.setNumber(number);
		paper.setVersion(version);
		fs.updateProgress(number, 1);
		return ps.createPaper(paper);
	}
	
	@RequestMapping(value = { "/page" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	@ResponseBody
	public int[] page(ModelMap model) {
		Integer version = Integer.parseInt(model.get("version").toString());
		String username = ((Info) model.get("user")).getUsername();
		
		int pageNum = this.ps.readForPage(username, version);
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
	public Collection<File> listFile(@RequestParam(value = "prefixLimit", defaultValue = "0") Integer prefixLimit,
			ModelMap model) {
		String version = model.get("version").toString();
		String ename = ((Info) model.get("user")).getUsername();
		Map<String, Object> map = new HashMap<>();
		map.put("ename", ename);
		map.put("version", version);
		
		map.put("pre", prefixLimit.toString());
		map.put("limit", "10");
		
		
		return fs.readByPaper(map);
	}
	
	@RequestMapping(value = { "/new" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> listNew(@RequestParam(value="args") String[] args){
		return ps.readCountForNew(args);
	}
}
