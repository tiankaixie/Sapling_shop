package com.xtk.shop.test;


import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.DaoUtil;

public class TestStore {
	private IStoreDao sd;

	@Before
	public void Init() {
		sd = (IStoreDao) DaoUtil.createDaoFactory().getDao("storeDao");
	}

	@Test
	public void testadd() {
		Store store = new Store();
		store.setName("小满外设店");
		store.setPhone("18810594457");
		store.setAddress("北京市海淀区");
		store.setEmail("85494849@efef.cdc");
		store.setPostcode("100083");
		store.setDetails("我们店是很牛逼的店，如果你不满意是你的问题。");
		store.setUser_id(2);
		sd.add(store);
	}
	@Test
	public void testLoad(){
		System.out.println(sd.loadByUserId(5).getName());
	}
	
	@Test
	public void testList(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<Store> ps = sd.list();
		for (Store store : ps.getDatas()) {
			System.out.println(store.getName());
		}
	}
}
