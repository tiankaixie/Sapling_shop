package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.Map;

import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;

public class StoreDao extends BaseDao<Store> implements IStoreDao {

	@Override
	public void add(Store store) {
		super.add(store);
	}

	@Override
	public void update(Store store) {
		super.update(store);
	}

	@Override
	public void delete(int id) {
		super.delete(Store.class, id);
	}

	@Override
	public Pager<Store> list() {
		Map<String, Object> params = new HashMap<String, Object>();
		return super.list(Store.class, params);
	}

	@Override
	public Store loadById(int id) {
		String sqlId = Store.class.getName()+".load";
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("id", id);
		return super.loadBySqlId(sqlId, params);
	}

	@Override
	public Store loadByUserId(int user_id) {
		String sqlId = Store.class.getName()+".load";
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("user_id", user_id);
		return super.loadBySqlId(sqlId, params);
	}

}
