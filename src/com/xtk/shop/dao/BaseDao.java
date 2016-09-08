package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.xtk.shop.model.Pager;
import com.xtk.shop.model.SystemContext;
import com.xtk.shop.util.MyBatisUtil;

public class BaseDao<T> {
	@SuppressWarnings("unchecked")
	public T load (Class<T> clz,int id){
		SqlSession session = null;
		T t = null;
		try {
			session = MyBatisUtil.createSession();
			t = (T) session.selectOne(clz.getName() + ".load", id);
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("load已完成。");
		}
		return t;
	}
	
	public void add (T obj){
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			session.insert(obj.getClass().getName() + ".add", obj);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback(); 
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println(obj.getClass().getName()+":Base_insert已完成。");
		}
	}
	
	public void update (T obj){
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			session.update(obj.getClass().getName() + ".update", obj);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("Base_update已完成。");
		}
	}
	
	public void delete(Class<T> clz, int id){
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			session.delete(clz.getName() + ".delete", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("Base_delete已完成。");
		}
	}

	public Pager<T> find(Class<T> clz, Map<String ,Object> params){
		return this.find(clz.getName()+".find", params);
	}
	
	public Pager<T> find(String sqlId, Map<String ,Object> params){
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		String order = SystemContext.getOrder();
		String sort = SystemContext.getSort();
		Pager<T> pages = new Pager<T>();
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
			List<T> datas = session.selectList(sqlId,params);
			pages.setDatas(datas);
			pages.setPageOffset(pageOffset);
			pages.setPageSize(pageSize);
			int totalRecord = session.selectOne(sqlId+"_count", params);
			pages.setTotalRecord(totalRecord);
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return pages;
	}
	
	/*public List<T> list(Class<T> clz, Map<String , Object> params){
		return this.list(clz.getName()+".list", params);
	}
	
	public List<T> list(String sqlId, Map<String , Object> params){
		List<T> list = null;
		SqlSession session = null;
		try {
			session = MyBatisUtil.createSession();
			list = session.selectList(sqlId,params);
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}*/
	public Pager<T> list(Class<T> clz, Map<String , Object> params){
		return this.list(clz.getName()+".list", params);
	}
	public Pager<T> list(String sqlId, Map<String , Object> params){
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		String order = SystemContext.getOrder();
		String sort = SystemContext.getSort();
		Pager<T> pages = new Pager<T>();
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
			List<T> datas = session.selectList(sqlId,params);
			pages.setDatas(datas);
			pages.setPageOffset(pageOffset);
			pages.setPageSize(pageSize);
			int totalRecord = session.selectOne(sqlId+"_count", params);
			pages.setTotalRecord(totalRecord);
		} finally{
			MyBatisUtil.closeSession(session);
		}
		return pages;
	}
	
	@SuppressWarnings("unchecked")
	public T loadBySqlId(String sqlId, Map<String, Object> params){
		SqlSession session = null;
		T t = null;
		System.out.println("BASE中的参数情况："+params.get("name")+" "+params.get("type"));
		try {
			session = MyBatisUtil.createSession();
			t = (T) session.selectOne(sqlId, params);
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("load已完成。");
		}
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public T loadBySqlId(String sqlId,Object obj){
		SqlSession session = null;
		T t = null;
		try {
			session = MyBatisUtil.createSession();
			t = (T) session.selectOne(sqlId, obj);
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("loadBySqlId已完成。");
		}
		return t;
	}
	
	public int getLastInsertId(Class<T> clz)
	{
		SqlSession session = null;
		int lastInsertId = 0;
		try {
			session = MyBatisUtil.createSession();
			lastInsertId = session.selectOne(clz.getName()+".get_last_insert_id");
		} finally {
			MyBatisUtil.closeSession(session);
			System.out.println("get_last_insert_id已完成。");
		}
		return lastInsertId;
	}
	public List<T> listAll(Class<T> clz){
		SqlSession session = null;
		List<T> datas = null;
		try {
			session = MyBatisUtil.createSession();

			datas = session.selectList(clz.getName()+".list_all");

		} finally{
			MyBatisUtil.closeSession(session);
		}
		return datas;
	}
} 
