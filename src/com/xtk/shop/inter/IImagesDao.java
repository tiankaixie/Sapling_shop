package com.xtk.shop.inter;

import java.util.List;

import com.xtk.shop.model.Images;

public interface IImagesDao {
	public void add(Images images);
	public void update(Images images);
	public List<Images> loadByGoodsId(int id);
	public void delete(int id);
	public void deleteByGoodsId(int goods_id);
}
