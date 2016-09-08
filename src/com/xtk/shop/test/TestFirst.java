package com.xtk.shop.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.xtk.shop.model.User;

public class TestFirst {
	public static void main(String[] args) {
		InputStream inputstream;
		try {
			inputstream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder()
					.build(inputstream);
			SqlSession session = factory.openSession();
			User user = new User();
			user.setPassword("123");
			user.setUsername("bajie");
			session.insert("com.xtk.shop.model.User.add", user);
			session.commit();
			session.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Finished.");
	}
}
