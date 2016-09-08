package com.xtk.shop.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FileOperateUtil {
	public static String rename(String name) {  
		  
        Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")  
                .format(new Date()));  
        Long random = (long) (Math.random() * now);  
        String fileName = now + "" + random;  
  
        if (name.indexOf(".") != -1) {  
            fileName += name.substring(name.lastIndexOf("."));  
        }  
  
        return fileName;  
    }  
}
