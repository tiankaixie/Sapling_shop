package com.xtk.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;




import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IGoodsRecommendDao;
import com.xtk.shop.inter.IOrderDao;
import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.inter.IUserDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.GoodsRecommend;
import com.xtk.shop.model.Orders;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

@Controller
public class AdminController {
	private IUserDao ud = (IUserDao) DaoUtil.createDaoFactory().getDao(
			"userDao");
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao(
			"goodsDao");
	private IStoreDao sd = (IStoreDao) DaoUtil.createDaoFactory().getDao(
			"storeDao");
	private IGoodsRecommendDao grd = (IGoodsRecommendDao) DaoUtil
			.createDaoFactory().getDao("goodsRecommendDao");
	private IOrderDao od = (IOrderDao) DaoUtil.createDaoFactory().getDao("orderDao");

	@RequestMapping(value = "/manage_user", method = RequestMethod.GET)
	public String manageUser(HttpSession session) {
		Pager<User> pu = ud.list();
		session.setAttribute("users", pu);
		return "manage_user";
	}

	@RequestMapping(value = "/manage_goods", method = RequestMethod.GET)
	public String manageGoods(HttpSession session) {
		Pager<Goods> pg = gd.listAll();
		session.setAttribute("allGoods", pg);
		return "manage_goods";
	}

	@RequestMapping(value = "/manage_store", method = RequestMethod.GET)
	public String manageStore(HttpSession session) {
		Pager<Store> ps = sd.list();
		session.setAttribute("allStore", ps);
		return "manage_store";
	}

	@RequestMapping(value = "/manage_home", method = RequestMethod.GET)
	public String manageHome(Model model) {
		List<GoodsRecommend> roll = grd.loadByType(1);// ¹ö¶¯
		List<GoodsRecommend> recommends = grd.loadByType(2);// ÍÆ¼ö
		model.addAttribute("roll", roll);
		model.addAttribute("recommends", recommends);
		return "manage_home";
	}

	@RequestMapping(value = "/show_index", method = RequestMethod.GET)
	public String showIndex(int id, Model model) {
		GoodsRecommend tempgGoodsRecommend = new GoodsRecommend();
		tempgGoodsRecommend.setGoods_id(id);
		tempgGoodsRecommend.setRecommend_type(1);
		grd.add(tempgGoodsRecommend);
		return "redirect:/manage_home";
	}

	@RequestMapping(value = "/recommend_index", method = RequestMethod.GET)
	public String recommendIndex(int id) {
		GoodsRecommend tempgGoodsRecommend = new GoodsRecommend();
		tempgGoodsRecommend.setGoods_id(id);
		tempgGoodsRecommend.setRecommend_type(2);
		grd.add(tempgGoodsRecommend);
		return "redirect:/manage_home";
	}

	@RequestMapping(value = "/delete_recommend", method = RequestMethod.GET)
	public String deleteRecommend(int id) {
		grd.delete(id);
		return "redirect:/manage_home";
	}
	@RequestMapping(value = "manage_orders", method = RequestMethod.GET)
	public String manageOrders(HttpSession session){
		Pager<Orders> po = od.listAll();
		session.setAttribute("allOrders", po);
		return "manage_orders";
	}
	@RequestMapping(value = "delete_orders_formAdmin",method = RequestMethod.GET)
	public String deleteOrdersFormAdmin(int orders_id){
		od.delete(orders_id);
		return "redirect:/manage_orders";
	}
}
