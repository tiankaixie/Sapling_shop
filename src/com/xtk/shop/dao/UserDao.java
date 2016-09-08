package com.xtk.shop.dao;

import java.util.HashMap;
import java.util.Map;

import com.xtk.shop.exception.ShopException;
import com.xtk.shop.inter.IUserDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.User;

public class UserDao extends BaseDao<User> implements IUserDao {

	@Override
	public User load(int id) {
		return super.load(User.class, id);
	}

	@Override
	public void add(User user) {
	User usertemp = this.loadByUsername(user.getUsername(),user.getType());
		if (usertemp != null) {
			throw new ShopException("要添加的用户已经存在！");
		}
		super.add(user);
	}
	@Override
	public void update(User user) {
		super.update(user);
	}

	@Override
	public void delete(int id) {
		super.delete(User.class, id);
	}

	@Override
	public User loadByUsername(String name, int type) {
		Map<String, Object> params = new HashMap<String, Object>();
		System.out.println(name);
		params.put("name", name);
		params.put("type", type);
		System.out.println("loadByUsername中的type值为："+type);
		System.out.println(User.class);
		return super.loadBySqlId(User.class.getName() + ".load_by_username",
				params);
	}
	
/*
	@Override
	public Pager<User> find(String name) {
		Map<String, Object> params = new HashMap<String, Object>();
		if (!name.equals("") && name != null) {
			params.put("name", "%" + name + "%");
		}
		return super.find(User.class, params);
	}
*/
	@Override
	public User login(String username, String password, int type) {
		User usertemp = this.loadByUsername(username,type);
		return usertemp;
	}

	@Override
	public Pager<User> list() {
		Map<String, Object> params = new HashMap<String, Object>();
		return super.list(User.class,params);
	}
}
