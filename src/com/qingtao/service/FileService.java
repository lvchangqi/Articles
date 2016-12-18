package com.qingtao.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingtao.dao.FileMapper;
import com.qingtao.pojo.File;
import com.qingtao.serviceI.FileServiceI;

@Service
public class FileService implements FileServiceI {

	@Autowired
	private FileMapper fm;
	
	@Override
	public File readFile(String number, Integer times) {
		return fm.readFile(number, times);
	}

	@Override
	public Integer createFile(File file) {
		return fm.createFile(file);
	}

	@Override
	public Integer readCount() {
		return fm.readCount();
	}

	@Override
	public Integer readTimes(String number) {
		return fm.readTimes(number);
	}

	@Override
	public Integer readForPage(File file) {
		return fm.readForPage(file);
	}

	@Override
	public List<File> readAll(Map<String, Object> map) {
		return fm.readAll(map);
	}

	@Override
	public Integer updateProgress(String number, Integer progress) {
		return fm.updateProgress(number, progress);
	}

	@Override
	public List<File> readByPaper(Map<String, Object> map) {
		return fm.readByPaper(map);
	}

	@Override
	public List<File> readForSearch(Map<String, Object> map) {
		return fm.readForSearch(map);
	}
	
	

}
