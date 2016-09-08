package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.xtk.shop.inter.IImagesDao;
import com.xtk.shop.model.Images;
import com.xtk.shop.util.MyBatisUtil;

public class ImagesDao extends BaseDao<Images> implements IImagesDao {

	@Override
	public void add(Images images) {
		super.add(images);
	}

	@Override
	public void update(Images images) {
		super.update(images);
	}

	@Override
	public List<Images> loadByGoodsId(int id) {
		Map<String, Object> params= new HashMap<String, Object>();
		params.put("goods_id", id);
		return super.list(Images.class, params).getDatas();
	}

	@Override
	public void delete(int id) {
		super.delete(Images.class, id);
	}

	@Override
	public void deleteByGoodsId(int goods_id) {
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			session.delete(Images.class.getName() + ".deleteByGoodsId", goods_id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("É¾³ýÍê³É");
		}
	}

}
