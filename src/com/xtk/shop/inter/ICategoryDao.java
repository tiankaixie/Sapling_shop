package com.xtk.shop.inter;

import java.util.List;

import com.xtk.shop.model.Category;

public interface ICategoryDao {
	public void add(Category category);
	public void delete(int id);
	public List<Category> list(); 
}
