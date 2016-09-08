package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.Map;


import com.xtk.shop.inter.IOrderDao;
import com.xtk.shop.model.Orders;
import com.xtk.shop.model.Pager;

public class OrderDao extends BaseDao<Orders> implements IOrderDao {

	@Override
	public void add(Orders orders) {
		super.add(orders);
	}

	@Override
	public void delete(int id) {
		super.delete(Orders.class, id);
	}

	@Override
	public int count() {
		return 0;
	}

	@Override
	public Pager<Orders> list(int user_id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_id", user_id);
		return super.list(Orders.class, params);
	}

	@Override
	public Pager<Orders> listByStore(int store_id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("store_id", store_id);
		return super.list(Orders.class, params);
	}

	@Override
	public Pager<Orders> listAll() {
		Map<String, Object> params = new HashMap<String, Object>();
		return super.list(Orders.class, params);
	}

}
