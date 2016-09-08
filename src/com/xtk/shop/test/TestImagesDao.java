package com.xtk.shop.test;


import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IImagesDao;
import com.xtk.shop.model.Images;
import com.xtk.shop.util.DaoUtil;

public class TestImagesDao {
	private IImagesDao imgd;
	@Before
	public void Init(){
		imgd =   (IImagesDao) DaoUtil.createDaoFactory().getDao("imagesDao");
	}
	@Test
	public void testadd() {
		Images imgtemp = new Images();
		imgtemp.setGoods_id(1);
		imgtemp.setImg("959595959595646446");
		imgd.add(imgtemp);	
	}
	@Test
	public void testdelete(){
		imgd.delete(1);
	}
	@Test
	public void testlist(){	
		List<Images> list = imgd.loadByGoodsId(1);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
	}
	@Test
	public void testDeleteAll(){
		imgd.deleteByGoodsId(13);
	}
}
