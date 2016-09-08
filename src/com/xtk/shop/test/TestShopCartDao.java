package com.xtk.shop.test;


import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IShopCartDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.ShopCart;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.DaoUtil;

public class TestShopCartDao {
	private IShopCartDao scdCartDao;
	@Before
	public void Init() {
		scdCartDao = (IShopCartDao) DaoUtil.createDaoFactory().getDao("shopCartDao");
	}

	@Test
	public void testAdd() {
		ShopCart shopCart = new ShopCart();
		shopCart.setGoods_id(1);
		shopCart.setNumber(10);
		shopCart.setUser_id(6);
		scdCartDao.add(shopCart);
	}
	
	@Test
	public void testDelete(){
		scdCartDao.delete(1);
	}
	
	@Test
	public void testList(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<ShopCart> psc = new Pager<ShopCart>();
		psc = scdCartDao.list(1);
		System.out.println("Number   "+psc.getTotalRecord());
		for (ShopCart shopCart : psc.getDatas()) {
			System.out.println(shopCart.toString());
		}
	}
	
	@Test
	public void  testLoad(){
		ShopCart shopCart = scdCartDao.load(2);
		System.out.println(shopCart.toString());
	}
}
