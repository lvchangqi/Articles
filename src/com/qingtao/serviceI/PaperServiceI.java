package com.qingtao.serviceI;

import java.util.List;
import java.util.Map;

import com.qingtao.pojo.Paper;

public interface PaperServiceI {

    public Integer createPaper(Paper paper);
    
    public List<Map<String, Object>> readCountForNew(String[] args);
    
    public Integer readForPage(String username, Integer version);
}