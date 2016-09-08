package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.Map;

import com.xtk.shop.inter.ILikeListDao;
import com.xtk.shop.model.LikeList;
import com.xtk.shop.model.Pager;

public class LikeListDao extends BaseDao<LikeList> implements ILikeListDao {

	@Override
	public void add(LikeList likeList) {
		super.add(likeList);
	}

	@Override
	public void delete(int id) {
		super.delete(LikeList.class, id);
	}

	@Override
	public Pager<LikeList> list(int user_id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_id", user_id);
		return super.list(LikeList.class, params);
	}

}
