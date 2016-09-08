package com.xtk.shop.test;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IUserDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

public class TestUserDao {

	private IUserDao ud;

	@Before
	public void Init() {
		ud = (IUserDao) DaoUtil.createDaoFactory().getDao("userDao");
	}

	@Test
	public void testAdd() {
		User user = new User();
		user.setPassword("4543455");
		user.setUsername("zhudatou");
		user.setType(1);
		user.setEmail("48111484@efe.com");
		ud.add(user);
	}

	@Test
	public void testDelete() {
		ud.delete(1);
	}

	@Test
	public void testUpdate() {
		User user = new User();
		user.setPassword("1232");
		user.setUsername("wugaga");
		user.setEmail("564106841@qq.com");
		user.setId(2);
		ud.update(user);
	}

	/*@Test
	public void testFind() {
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<User> ps = ud.find("");
		System.out.println("查找总数为：" + ps.getTotalRecord());
		for (User u : ps.getDatas()) {
			System.out.println(u.toString());
		}
	}*/
	
	/*@Test
	public void testLoad(){
		User user = ud.load(2);
		for(Address a : user.getAddress()){
			System.out.println(a);
		}
	}*/
	@Test
	public void testLoad(){
		User user = ud.login("xietiankaii", "564546", 0);
		System.out.println(user.getUsername());
	}
	
	@Test
	public void testList(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<User> pu= ud.list();
		for (User u : pu.getDatas()) {
			System.out.println(u.toString());
		}
		
	}
}
