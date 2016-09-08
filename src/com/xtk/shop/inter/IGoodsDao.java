package com.xtk.shop.inter;

import java.util.List;
import java.util.Map;

import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Pager;

public interface IGoodsDao {
	public void add(Goods goods);
	public void update(Goods goods);
	public void delete(int id);
	public Pager<Goods> list(int id); //�̵�id 
	public Pager<Goods> listByClass(int id); //����������id
	public Pager<Goods> find(String name);
	public Pager<Goods> findMyGoods(Map<String, Object> params);
	public Pager<Goods> listAll();//�г�������Ʒ
	public int count();
	public Goods loadById(int id);
	public int getLastInsertId();
	public List<Goods> discover();
	public List<Goods> anythingElse(int store_id);
	public Pager<Goods> quickSearch(Map<String,Object> params);
}
