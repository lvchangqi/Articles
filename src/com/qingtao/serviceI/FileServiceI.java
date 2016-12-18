package com.qingtao.serviceI;

import java.util.List;
import java.util.Map;

import com.qingtao.pojo.File;

public interface FileServiceI {

	public File readFile(String number, Integer times);
	
	public Integer createFile(File file);
	
	public Integer readCount();
	
	public Integer readTimes(String number);
	
	public Integer readForPage(File file);
	
	public List<File> readByPaper(Map<String, Object> map);
	
	public List<File> readForSearch(Map<String, Object> map);
	
	public List<File> readAll(Map<String, Object> map);
	
	public Integer updateProgress(String number, Integer progress);
}
