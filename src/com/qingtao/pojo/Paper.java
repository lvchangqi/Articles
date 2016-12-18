package com.qingtao.pojo;

import java.util.Date;

public class Paper {
    private Integer id;

    private String ename;

    private String number;
    
    private Integer version;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }
    

    public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}