package com.xtk.shop.inter;


import com.xtk.shop.model.LikeList;
import com.xtk.shop.model.Pager;

public interface ILikeListDao {
	public void add(LikeList likeList);
	public void delete(int id);
	public Pager<LikeList> list(int user_id);
}
