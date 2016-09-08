package com.xtk.shop.inter;

import com.xtk.shop.model.Pager;
import com.xtk.shop.model.ShopCart;

public interface IShopCartDao {
	public void add(ShopCart shopCart);
	public void delete(int id);
	public void update(ShopCart shopCart);
	public Pager<ShopCart> list(int user_id);
	public ShopCart load(int id);
}
