package com.xtk.shop.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IOrderDao;
import com.xtk.shop.model.Orders;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.DaoUtil;

public class TestOrderDao {
	
	private IOrderDao od;
	@Before
	public void Init(){
		od = (IOrderDao) DaoUtil.createDaoFactory().getDao("orderDao");
	}
	@Test
	public void testadd() {
		Orders orders = new Orders();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
		orders.setBuyDate(df.format(new Date()));
		orders.setStatus(1);
		orders.setUser_id(1);
		orders.setPrice(36.23);
		orders.setStore_id(1);
		od.add(orders);
	}
	@Test
	public void testlist(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<Orders> temporder = od.listAll();
		for (Orders order : temporder.getDatas()) {
			System.out.println("order�е�����Ԫ�أ�"+order.getBuyDate());
			System.out.println(order.getGoods().toString());
			
		}
		
	}
}
