package com.xtk.shop.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IOrderDao;
import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Orders;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

@Controller
public class OrdersController {
	private IOrderDao od = (IOrderDao) DaoUtil.createDaoFactory().getDao(
			"orderDao");
	private IStoreDao sd = (IStoreDao) DaoUtil.createDaoFactory().getDao(
			"storeDao");
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao("goodsDao");

	@RequestMapping(value = "/addOrders", method = RequestMethod.POST)
	public String addOrders(@ModelAttribute("orders") Orders tempOrders,
			HttpSession session, Model model) {
		User tempuser = (User) session.getAttribute("loginUser");
		if (tempuser == null) {
			model.addAttribute(new User());
			return "redirect:/login";
		}
		Goods goods = gd.loadById(tempOrders.getGoods_id());
		int finalStock = goods.getStock() - tempOrders.getQuantity();
		if (finalStock<=0) {
			goods.setStatus(0);//商品下架
		}
		goods.setStock(finalStock);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		tempOrders.setBuyDate(df.format(new Date()));
		tempOrders.setStatus(1); // status 值为1时表示订单待处理
		tempOrders.setUser_id(tempuser.getId());// tempuser.getId()
		System.out.println("输出一下穿过来的价格的数值：" + tempOrders.getPrice()
				+ tempuser.getId());
		tempOrders.setPrice(tempOrders.getPrice() * tempOrders.getQuantity());
		tempOrders.setStore_id(1);
		od.add(tempOrders);
		return "add_orders_success";
	}

	@RequestMapping(value = "/my_orders", method = RequestMethod.GET)
	public String showOrders(Model model, HttpSession session) {
		User tempuser = (User) session.getAttribute("loginUser");
		Pager<Orders> po = od.list(tempuser.getId());
		model.addAttribute("my_orders", po);
		return "my_order";
	}

	@RequestMapping(value = "/store_orders", method = RequestMethod.GET)
	public String showStoreOrders(Model model, HttpSession session) {
		Store tempStore;
		if (session.getAttribute("my_store") != null) {
			tempStore = (Store) session.getAttribute("my_store");
		} else {
			User user = (User) session.getAttribute("loginUser");
			tempStore = sd.loadByUserId(user.getId());
			session.setAttribute("my_store", tempStore);
		}
		Pager<Orders> po = od.listByStore(tempStore.getId());
		model.addAttribute("store_orders", po);
		return "store_orders";
	}

	@RequestMapping(value = "/delete_orders", method = RequestMethod.GET)
	public String deleteOrders(int orders_id) {
		od.delete(orders_id);
		return "redirect:/store_orders";
	}

	@RequestMapping(value = "/delete_my_orders", method = RequestMethod.GET)
	public String deleteMyOrders(int orders_id) {
		od.delete(orders_id);
		return "redirect:/my_orders";
	}
}
