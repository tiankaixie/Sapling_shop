package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;





import org.apache.ibatis.session.SqlSession;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.MyBatisUtil;

public class GoodsDao extends BaseDao<Goods> implements IGoodsDao {

	@Override
	public void add(Goods goods) {
		super.add(goods);
	}

	@Override
	public void delete(int id) {
		super.delete(Goods.class, id);
	}

	@Override
	public Pager<Goods> list(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("store_id", id);
		return super.list(Goods.class, params);
	}

	@Override
	public int count() {
		return 0;
	}
	
	@Override
	public void update(Goods goods){
		super.update(goods);
	}

	@Override
	public Pager<Goods> find(String name) {

			Map<String, Object> params = new HashMap<String, Object>();
			if (!name.equals("") && name != null) {
				params.put("name", "%" + name + "%");
			}
			return super.find(Goods.class, params);

	}

	@Override
	public Goods loadById(int id) {
		return super.load(Goods.class, id);
	}

	@Override
	public int getLastInsertId() {
		return super.getLastInsertId(Goods.class);
	}

	@Override
	public Pager<Goods> listByClass(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("category_id", id);
		return super.list(Goods.class, params);
	}

	@Override
	public List<Goods> discover() {
		SqlSession session = null;
		List<Goods> datas ;
		try {
			session = MyBatisUtil.createSession();
			datas = session.selectList(Goods.class.getName()+".discover");
			
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return datas;
	}

	@Override
	public Pager<Goods> listAll() {
		String sqlId = Goods.class.getName()+".listAll";
		Map<String, Object> params = new HashMap<String, Object>();
		return super.list(sqlId, params);
	}

	@Override
	public List<Goods> anythingElse(int store_id) {
		SqlSession session = null;
		List<Goods> datas ;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("store_id", store_id);
		try {
			session = MyBatisUtil.createSession();
			datas = session.selectList(Goods.class.getName()+".anythingElse",params);
			
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return datas;
	}

	@Override
	public Pager<Goods> quickSearch(Map<String, Object> params) {
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		String order = SystemContext.getOrder();
		String sort = SystemContext.getSort();
		Pager<Goods> pages = new Pager<Goods>();
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			if (params==null) {
				params = new HashMap<String, Object>();
			}
			params.put("pageSize", pageSize);
			params.put("pageOffset", pageOffset);
			params.put("order", order);
			params.put("sort", sort);
			List<Goods> datas = session.selectList(Goods.class.getName()+".quickSearch",params);
			pages.setDatas(datas);
			pages.setPageOffset(pageOffset);
			pages.setPageSize(pageSize);
			int totalRecord = session.selectOne(Goods.class.getName()+".quickSearch_count", params);
			pages.setTotalRecord(totalRecord);
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return pages;
	}

	@Override
	public Pager<Goods> findMyGoods(Map<String, Object> params) {
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		String order = SystemContext.getOrder();
		String sort = SystemContext.getSort();
		Pager<Goods> pages = new Pager<Goods>();
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			if (params==null) {
				params = new HashMap<String, Object>();
			}
			params.put("pageSize", pageSize);
			params.put("pageOffset", pageOffset);
			params.put("order", order);
			params.put("sort", sort);
			List<Goods> datas = session.selectList(Goods.class.getName()+".find",params);
			pages.setDatas(datas);
			pages.setPageOffset(pageOffset);
			pages.setPageSize(pageSize);
			int totalRecord = session.selectOne(Goods.class.getName()+".find_count", params);
			pages.setTotalRecord(totalRecord);
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return pages;
	}
	
}
