package com.xtk.shop.dao;

import com.xtk.shop.inter.ICategoryDao;
import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IImagesDao;
import com.xtk.shop.inter.ILikeListDao;
import com.xtk.shop.inter.IOrderDao;
import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.inter.IUserDao;

public class DaoFactory {

	public static IUserDao getUserDao(){
		return new UserDao();
	}
	public static IOrderDao getOrderDao(){
		return new OrderDao();
	}
	public static IStoreDao getStoreDao(){
		return new StoreDao();
	}
	public static IGoodsDao getGoodsDao(){
		return new GoodsDao();
	}
	public static IImagesDao getImagesDao(){
		return new ImagesDao();
	}
	public static ILikeListDao getLikeListDao(){
		return new LikeListDao();
	}
	public static ICategoryDao getCategoryDao(){
		return new CategoryDao();
	}
}
