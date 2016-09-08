package com.xtk.shop.inter;

import java.util.List;

import com.xtk.shop.model.GoodsRecommend;

public interface IGoodsRecommendDao {
	public void add(GoodsRecommend goodsRecommend);
	public void delete(int id);
	public List<GoodsRecommend> loadByType(int recommend_type);
}
