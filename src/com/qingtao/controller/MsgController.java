package com.qingtao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingtao.pojo.Msg;
import com.qingtao.serviceI.MsgServiceI;

@Controller
@RequestMapping({ "/msg" })
public class MsgController {
	
	@Autowired
	private MsgServiceI ms;
	
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertMsg(Msg msg){
		ms.createMsg(msg);
		return "200";
	}
	
	@RequestMapping(value="/select", method=RequestMethod.GET)
	@ResponseBody
	public List<Msg> selectMsg(@RequestParam(value="number") String number){
		return ms.readMsg(number);
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	@ResponseBody
	public void updateRead(@RequestParam(value="number") String number){
		ms.updateIsread(number);
	}
	
}
