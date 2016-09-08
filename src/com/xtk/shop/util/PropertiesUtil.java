package com.xtk.shop.util;

import java.io.IOException;
import java.util.Properties;

public class PropertiesUtil {
	private static Properties daoProp;

	public static Properties getDaoProp() {

		try {
			if (daoProp == null) {
				daoProp = new Properties();
				daoProp.load(PropertiesUtil.class.getClassLoader()
						.getResourceAsStream("dao.properties"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return daoProp;
	}

}
