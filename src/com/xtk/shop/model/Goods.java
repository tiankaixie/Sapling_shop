package com.xtk.shop.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Goods {
	private int id;
	private String name;
	private int store_id;
	private double price;
	private int stock;
	private String discount;
	private String type;
	private String varieties;
	private String height;
	private String diameter;
	private String punta_trail;
	private String survival;
	private int life;
	private int fruit_year;
	private String habits;
	private String culture_notes;
	private String link;
	private String intro;
	private String img;
	private String goods_address;
	private int category_id;
	private Category category;
	private int status;

	public String getGoods_address() {
		return goods_address;
	}

	public void setGoods_address(String goods_address) {
		this.goods_address = goods_address;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Size(min = 1, max = 20, message = "商品名字应该在1-20个字符之间！")
	@NotEmpty(message = "商品名字不能为空！！")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getVarieties() {
		return varieties;
	}

	public void setVarieties(String varieties) {
		this.varieties = varieties;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getDiameter() {
		return diameter;
	}

	public void setDiameter(String diameter) {
		this.diameter = diameter;
	}

	public String getPunta_trail() {
		return punta_trail;
	}

	public void setPunta_trail(String punta_trail) {
		this.punta_trail = punta_trail;
	}

	public String getSurvival() {
		return survival;
	}

	public void setSurvival(String survival) {
		this.survival = survival;
	}

	public int getLife() {
		return life;
	}

	public void setLife(int life) {
		this.life = life;
	}

	public int getFruit_year() {
		return fruit_year;
	}

	public void setFruit_year(int fruit_year) {
		this.fruit_year = fruit_year;
	}

	public String getHabits() {
		return habits;
	}

	public void setHabits(String habits) {
		this.habits = habits;
	}

	public String getCulture_notes() {
		return culture_notes;
	}

	public void setCulture_notes(String culture_notes) {
		this.culture_notes = culture_notes;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getStatus() {   //0表示下架 1表示上架
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", store_id=" + store_id + ", price=" + price + ", stock=" + stock + ", discount=" + discount
				+ ", type=" + type + ", varieties=" + varieties + ", height=" + height + ", diameter=" + diameter + ", punta_trail=" + punta_trail
				+ ", survival=" + survival + ", life=" + life + ", fruit_year=" + fruit_year + ", habits=" + habits + ", culture_notes="
				+ culture_notes + ", link=" + link + ", intro=" + intro + ", img=" + img + ", goods_address=" + goods_address + ", category_id="
				+ category_id + ", category=" + "]";
	}

}
