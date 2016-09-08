package com.xtk.shop.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IOrderDao;
import com.xtk.shop.inter.IShopCartDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Orders;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.ShopCart;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

@Controller
public class ShopCartController {
	private IShopCartDao scd = (IShopCartDao) DaoUtil.createDaoFactory()
			.getDao("shopCartDao");
	private IOrderDao od = (IOrderDao) DaoUtil.createDaoFactory().getDao(
			"orderDao");
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao(
			"goodsDao");

	@RequestMapping(value = "/my_shopCart", method = RequestMethod.GET)
	public String loadShopCart(Model model ,HttpSession session) {
		model.asMap().remove("shopCart");
		User user = (User) session.getAttribute("loginUser");
		Pager<ShopCart> pscPager = scd.list(user.getId());
		session.setAttribute("shopCart", pscPager);
		return "my_shopCart";
	}

	@RequestMapping(value = "/deleteShopCart", method = RequestMethod.GET)
	public String deleteShopCart(int id, Model model, HttpSession session) {
		scd.delete(id);
		model.asMap().remove("shopCart");
		User user = (User) session.getAttribute("loginUser");
		Pager<ShopCart> pscPager = scd.list(user.getId());
		session.setAttribute("shopCart", pscPager);
		return "redirect:/my_shopCart";
	}

	@RequestMapping(value = "/orderMake", method = RequestMethod.GET)
	public String orderMake(String[] id, int[] quantity, HttpSession session) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		User user = (User) session.getAttribute("loginUser");
		// 我们先将quantity中的数据按照选出来的对象进行更新
		Pager<ShopCart> tempShopCart = scd.list(user.getId());
		Orders tempOrders = new Orders();
		tempOrders.setStatus(1); // status 值为1时表示订单待处理
		int index = 0;
		for (ShopCart shopCart : tempShopCart.getDatas()) {
			shopCart.setNumber(quantity[index]);
			index++;
			scd.update(shopCart);
		}
		for (int i = 0; i < id.length; i++) {
			ShopCart shopCart = scd.load(Integer.parseInt(id[i]));
			double totalPrice = shopCart.getNumber()*shopCart.getGoods().getPrice();// 将单种商品的总价算出
			int finalStock = shopCart.getGoods().getStock() - shopCart.getNumber();
			if (finalStock<=0) {
				finalStock = 0;
				tempOrders.setStatus(2); // status 值为2时表示订单库存不足，请进款与卖家联系！
				shopCart.getGoods().setStatus(0);
			}
			shopCart.getGoods().setStock(finalStock);
			gd.update(shopCart.getGoods());
			
			//添加到订单
			tempOrders.setBuyDate(df.format(new Date()));
			tempOrders.setUser_id(user.getId());// tempuser.getId()
			tempOrders.setPrice(totalPrice);
			tempOrders.setQuantity(shopCart.getNumber());
			tempOrders.setStore_id(shopCart.getGoods().getStore_id());
			tempOrders.setGoods_id(shopCart.getGoods_id());
			od.add(tempOrders);
			scd.delete(shopCart.getId());

		}
		return "orders_success";
	}
	@RequestMapping(value = "/addToCart",method = RequestMethod.GET)
	public String addToCart(int goods_id,HttpSession session){
		ShopCart shopCart = new ShopCart();
		shopCart.setGoods_id(goods_id);
		User user = (User) session.getAttribute("loginUser");
		shopCart.setUser_id(user.getId());
		scd.add(shopCart);
		return "shopCart_success";
	}
}
