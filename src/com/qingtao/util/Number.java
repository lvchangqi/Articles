package com.qingtao.util;

import java.util.Calendar;

public class Number {

	public static String instance(Integer size) {
		if(size == null){
			size = 1;
		} else {
			size++;
		}
		int MAXSIZE = String.valueOf(size).length();
		String number = null;
		switch (MAXSIZE) {
		case 1:
			number = "000" + size;
			break;
		case 2:
			number = "00" + size;
			break;
		case 3:
			number = "0" + size;
			break;
		}
		Calendar calendar = Calendar.getInstance();
		
		return calendar.get(Calendar.YEAR) + "-" + number;
	}
}
