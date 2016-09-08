package com.xtk.shop.model;

public class ShopCart {
	private int id;
	private int user_id;
	private int goods_id;
	private int number;
	private Goods goods;
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "ShopCart [id=" + id + ", user_id=" + user_id + ", goods_id="
				+ goods_id + ", number=" + number + ", goods=" + goods + "]";
	}

}
