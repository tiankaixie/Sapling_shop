package com.xtk.shop.dao;

import java.util.List;

import com.xtk.shop.inter.ICategoryDao;
import com.xtk.shop.model.Category;

public class CategoryDao extends BaseDao<Category> implements ICategoryDao {

	@Override
	public void add(Category category) {
		super.add(category);
	}

	@Override
	public void delete(int id) {
		super.delete(Category.class, id);
	}

	@Override
	public List<Category> list() {
		List<Category> list = super.listAll(Category.class);
		return list;
	}

}
