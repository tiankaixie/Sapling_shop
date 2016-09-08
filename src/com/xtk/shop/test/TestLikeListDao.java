package com.xtk.shop.test;

import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.ILikeListDao;
import com.xtk.shop.model.LikeList;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.DaoUtil;

public class TestLikeListDao {

	private ILikeListDao lld;
	@Before
	public void Init(){
		lld = (ILikeListDao) DaoUtil.createDaoFactory().getDao("likeListDao");
	}
	@Test
	public void testadd() {
		LikeList ll = new LikeList();
		ll.setUser_id(1);
		ll.setGoods_id(2);
		lld.add(ll);
	}
	@Test
	public void testList(){
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(15);
		SystemContext.setOrder("desc");
		SystemContext.setSort("id");
		Pager<LikeList> pl = lld.list(1);
		for (LikeList likeList : pl.getDatas()) {
			System.out.println(likeList.getGoods().toString());
		}
	}
}
