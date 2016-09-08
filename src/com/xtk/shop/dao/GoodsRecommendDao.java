package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xtk.shop.inter.IGoodsRecommendDao;
import com.xtk.shop.model.GoodsRecommend;

public class GoodsRecommendDao extends BaseDao<GoodsRecommend> implements IGoodsRecommendDao {
	@Override
	public void add(GoodsRecommend goodsRecommend) {
		super.add(goodsRecommend);
	}

	@Override
	public void delete(int id) {
		super.delete(GoodsRecommend.class, id);
	}

	@Override
	public List<GoodsRecommend> loadByType(int recommend_type) {
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("recommend_type", recommend_type);
		return super.list(GoodsRecommend.class, params).getDatas();
	}

}
