package com.qingtao.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.qingtao.pojo.File;
import com.qingtao.pojo.Info;
import com.qingtao.pojo.Msg;
import com.qingtao.serviceI.FileServiceI;
import com.qingtao.serviceI.MsgServiceI;
import com.qingtao.util.Number;

@Controller
@RequestMapping({ "/file" })
@SessionAttributes({ "user", "version" })
public class FileController {

	@Autowired
	private FileServiceI fs;
	@Autowired
	private MsgServiceI ms;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadFile(MultipartFile file, String number, HttpSession session) {
		String path = session.getServletContext().getRealPath("/");
		String filePath = path + "/WEB-INF/articles";

		if (number == null) {
			number = Number.instance(fs.readCount());
		}
		String username = ((Info) session.getAttribute("user")).getUsername();
		Integer version = Integer.parseInt(session.getAttribute("version").toString());
		Integer times = fs.readTimes(number);
		if (times != null) {
			times++;
		} else {
			times=1;
		}
		String fileName = "(" + times + ")-" + file.getOriginalFilename();

		File fileParam = new File();
		fileParam.setUsername(username);
		fileParam.setVersion(version);
		fileParam.setFilename(fileName);
		fileParam.setUrl(filePath + "/" + fileName);
		fileParam.setNumber(number);
		fileParam.setTimes(times);

		Msg msg = new Msg();
		msg.setNumber(number);
		msg.setUsername(username);
		msg.setMessage("上传文件: " + number + "-" + fileName);

		java.io.File dir = new java.io.File(filePath, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			file.transferTo(dir);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/page/control.jsp";
		}

		fs.createFile(fileParam);
		ms.createMsg(msg);
		return "redirect:/page/control.jsp";
	}

	@RequestMapping(value = { "/page" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	@ResponseBody
	public int[] page(ModelMap model, 
			@RequestParam(value = "username", required = false) String username) {
		Integer version = Integer.parseInt(model.get("version").toString());
		File file = new File();
		file.setVersion(version);
		file.setUsername(username);
		
		int pageNum = this.fs.readForPage(file);
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
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "progress", required = false) Integer progress,
			ModelMap model) {
		String version = model.get("version").toString();
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		map.put("version", version);
		map.put("progress", progress);
		
		map.put("pre", prefixLimit.toString());
		map.put("limit", "10");

		return this.fs.readAll(map);
	}
	
	@RequestMapping(value = { "/search" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	@ResponseBody
	public Collection<File> searchFile(@RequestParam(value = "condition") String condition,
			@RequestParam(value = "value") String value,
			ModelMap model) {
		String version = model.get("version").toString();
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("version", version);
		map.put("value", value);

		return fs.readForSearch(map);
	}

	@RequestMapping(value = { "/download/{number}/{times}" }, method = RequestMethod.GET)
	public ResponseEntity<byte[]> fileDownload(@PathVariable("number") String number,
			@PathVariable("times") Integer times) throws IOException {

		File _file = fs.readFile(number, times);
		String name = _file.getNumber() + "-" + _file.getFilename();
		java.io.File file = new java.io.File(_file.getUrl());

		HttpHeaders headers = new HttpHeaders();
		headers.setContentDispositionFormData("attachment", new String(name.getBytes("UTF-8"), "iso-8859-1"));
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}
}
