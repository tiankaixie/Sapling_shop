package com.xtk.shop.test;


import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IGoodsRecommendDao;
import com.xtk.shop.model.GoodsRecommend;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.DaoUtil;

public class TestGoodsRecommendDao {
	private IGoodsRecommendDao grd;
	@Before
	public void init(){
		grd = (IGoodsRecommendDao) DaoUtil.createDaoFactory().getDao("goodsRecommendDao");
	}
	@Test
	public void TestAdd(){
		GoodsRecommend gRecommend = new GoodsRecommend();
		gRecommend.setGoods_id(2);
		gRecommend.setRecommend_type(2);
		grd.add(gRecommend);
	}
	@Test
	public void TestDelete(){
		grd.delete(1);
	}
	@Test
	public void testlist(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		List<GoodsRecommend> ldr = grd.loadByType(3);
		System.out.println(ldr.toString());
	}
}
