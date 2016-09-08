package com.xtk.shop.test;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.DaoUtil;

public class TestGoodsDao {
	private IGoodsDao gd;
	
	@Before
	public void Init(){
		gd =  (IGoodsDao) DaoUtil.createDaoFactory().getDao("goodsDao");
	}
	


	@Test
	public void testadd() {
		Goods goods = new Goods();
		goods.setName("啊啊啊啊啊年呵呵呵");
		goods.setPrice(6.2);
		goods.setStore_id(1);
		goods.setStock(2);
		goods.setDiscount("6折");
		goods.setType("成苗");
		goods.setVarieties("红富士");
		goods.setHeight("23cm");
		goods.setDiameter("66cm");
		goods.setPunta_trail("85cm");
		goods.setSurvival("99.999%");
		goods.setLife(8);
		goods.setFruit_year(5);
		goods.setHabits("喜阴吸氧不长命");
		goods.setCulture_notes("不要浇水");
		goods.setLink("www.baidu.com");
		goods.setIntro("我勒个去啊啊啊啊啊啊啊 啊啊啊啊啊啊啊 啊啊啊 啊啊啊");
		goods.setImg("321354687987845241548789684541321");
		gd.add(goods);
		int lastInsertId = gd.getLastInsertId();
		System.out.println("获得id！！！！！！："+lastInsertId);
	}
	@Test
	public void testdelete(){
		gd.delete(1);
	}
	@Test
	public void testfind(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<Goods> ps = gd.find("胡桃");
		System.out.println("查找总数为：" + ps.getTotalRecord());
		for (Goods g : ps.getDatas()) {
			System.out.println(g.toString());
		}
	}
	
	@Test
	public void testloadById(){
		Goods goods = gd.loadById(2);
		System.out.println("我这样load一下看看行不行："+goods.getName());
		
	}
	@Test
	public void testlist(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<Goods> ps = gd.listAll();
		System.out.println("查找总数为：" + ps.getTotalRecord());
		for (Goods g : ps.getDatas()) {
			System.out.println(g.toString());
		}
	}
	@Test
	public void testDiscover(){
		List<Goods> lGoods  = gd.discover();
		for (Goods good : lGoods) {
			System.out.println(good.toString());
			System.out.println(good.getCategory().getName()+good.getCategory().getLatin());
		}
	}
	@Test
	public void testAnythingElse(){
		List<Goods> lGoods = gd.anythingElse(1);
		for (Goods goods : lGoods) {
			System.out.println(goods.toString());
		}
	}
	@Test
	public void testQuickSearch(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("species", "%"+"大乔木"+"%");
		params.put("type", "成苗");
		Pager<Goods> pg = gd.quickSearch(params);
		System.out.println("查找总数为：" + pg.getTotalRecord());
		for (Goods g : pg.getDatas()) {
			System.out.println(g.toString());
		}
		
	}
	@Test
	public void testSearchMyGoods(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("name", "%"+"白皮松"+"%");
		params.put("store_id", 1);
		Pager<Goods> pg = gd.findMyGoods(params);
		System.out.println("查找总数为：" + pg.getTotalRecord());
		for (Goods g : pg.getDatas()) {
			System.out.println(g.toString());
		}
	}
}