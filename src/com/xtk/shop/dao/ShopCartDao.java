package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.Map;

import com.xtk.shop.inter.IShopCartDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.ShopCart;

public class ShopCartDao extends BaseDao<ShopCart> implements IShopCartDao {

	@Override
	public void add(ShopCart shopCart) {
		super.add(shopCart);

	}

	@Override
	public void delete(int id) {
		super.delete(ShopCart.class, id);
	}

	@Override
	public Pager<ShopCart> list(int user_id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_id", user_id);
		return super.list(ShopCart.class, params);
	}

	@Override
	public void update(ShopCart shopCart) {
		super.update(shopCart);

	}

	@Override
	public ShopCart load(int id) {
		return super.load(ShopCart.class, id);
	}
}
