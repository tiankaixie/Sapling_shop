package com.xtk.shop.test;


import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.ICategoryDao;
import com.xtk.shop.model.Category;
import com.xtk.shop.util.DaoUtil;

public class TestCategoryDao {
	
	private ICategoryDao cd;
	@Before
	public void init(){
		cd = (ICategoryDao) DaoUtil.createDaoFactory().getDao("categoryDao");
	}
	@Test
	public void testlist() {

		List<Category> categories = cd.list();
		for (Category category : categories) {
			System.out.println("列出项目："+category.getName()+category.getLatin());
		}
	}

}
