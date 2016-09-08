package com.xtk.shop.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Properties;

import com.xtk.shop.inter.IFactoryDao;


public class DaoUtil {
	public static void main(String [] args){
		System.out.println(createDaoFactory());
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static IFactoryDao createDaoFactory(){
		IFactoryDao f = null;
		try {
			Properties properties = PropertiesUtil.getDaoProp();
			String fString = properties.getProperty("factory");
			Class clz = Class.forName(fString);
			String mn = "getInstance";
			Method method = clz.getMethod(mn);
			f = (IFactoryDao) method.invoke(clz);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return f;
	}
}
