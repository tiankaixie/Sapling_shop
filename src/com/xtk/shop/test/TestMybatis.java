package com.xtk.shop.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.xtk.shop.model.User;
import com.xtk.shop.util.MyBatisUtil;

public class TestMybatis {

	@Test
	public void test() {
		System.out.println("hello");
		System.out.println(User.class.getName());
	}

	@Test
	public void testDelete() {
		InputStream iStream;
		try {
			iStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder()
					.build(iStream);
			SqlSession session = factory.openSession();
			session.delete(User.class.getName() + ".delete", 1);
			session.commit();
			session.close();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("删除数据已完成。");
		}
	}

	@Test
	public void testAdd() {
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			User user = new User();
			user.setPassword("123");
			user.setUsername("hehehe");
			session.insert(User.class.getName()+".add", user);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
			System.out.println("插入数据已完成。");
		}
	}

	@Test
	public void testLoad() {
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			User user = (User) session.selectOne(
					User.class.getName() + ".load", 2);
			System.out.println(user.getUsername());
			
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("Load加载已完成。");
		}
	}
	
	@Test
	public void testList(){
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			java.util.List<User> users = session.selectList(User.class.getName()+".list");
			System.out.println(users.size());
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("List加载已完成。");
		}
	}
}
