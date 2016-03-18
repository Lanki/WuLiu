package com.xy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CountTime {

	public String currentlyTime(){
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
}
