package com.xtk.shop.inter;

import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;

public interface IStoreDao {
	public void add(Store store);
	public void update(Store store);
	public void delete(int id);
	public Store loadById(int id);
	public Store loadByUserId(int user_id);
	public Pager<Store> list();
}
