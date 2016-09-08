package com.xtk.shop.inter;

import com.xtk.shop.model.Orders;
import com.xtk.shop.model.Pager;

public interface IOrderDao {
	public void add(Orders orders);
	public void delete(int id);
	public Pager<Orders> list(int user_id);
	public Pager<Orders> listByStore(int store_id);
	public Pager<Orders> listAll();
	public int count();
}
