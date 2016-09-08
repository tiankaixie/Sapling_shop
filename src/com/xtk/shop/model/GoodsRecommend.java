package com.xtk.shop.model;

public class GoodsRecommend {
	private int id;
	private int goods_id;
	private int recommend_type;  //1表示首页滚动  2表示网站推荐
	private Goods goods;
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getRecommend_type() {
		return recommend_type;
	}
	public void setRecommend_type(int recommend_type) {
		this.recommend_type = recommend_type;
	}
	@Override
	public String toString() {
		return "GoodsRecommend [id=" + id + ", goods_id=" + goods_id
				+ ", recommend_type=" + recommend_type + ", goods=" + goods
				+ "]";
	}
	
}
