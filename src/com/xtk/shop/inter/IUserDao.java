package com.xtk.shop.inter;


import com.xtk.shop.model.Pager;
import com.xtk.shop.model.User;

public interface IUserDao {
	public User load(int id);
	public void add(User user);
	public void update(User user);
	public void delete(int id);
	public Pager<User> list();
	public User loadByUsername(String name, int type);
	//public Pager<User> find(String name);
	public User login(String username,String password,int type);
}
