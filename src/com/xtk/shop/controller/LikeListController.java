package com.xtk.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IImagesDao;
import com.xtk.shop.inter.ILikeListDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Images;
import com.xtk.shop.model.LikeList;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

@Controller
public class LikeListController {
	private ILikeListDao lld = (ILikeListDao) DaoUtil.createDaoFactory().getDao("likeListDao");
	private IImagesDao imgd = (IImagesDao) DaoUtil.createDaoFactory().getDao("imagesDao");
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao("goodsDao");
	
	@RequestMapping(value= "/like",method = RequestMethod.GET)
	public String like(int like_goods_id,HttpSession session,Model model){
		LikeList ll = new LikeList();
		//获取loginUser 的id 和它的id
		User u = (User) session.getAttribute("loginUser");
		if (u==null) {
			model.addAttribute(new User());
			return "redirect:/login";
		}
		ll.setUser_id(u.getId());
		ll.setGoods_id(like_goods_id);
		lld.add(ll);
		//调用add方法
		List<Images> templistImages = imgd.loadByGoodsId(like_goods_id);
		model.addAttribute("images", templistImages);
		System.out.println("图片加载已完成");
		Goods tempgood = gd.loadById(like_goods_id);
		model.addAttribute("goods", tempgood);
		System.out.println("商品加载已完成");
		return "redirect:/detail?id="+like_goods_id;
	}
	
	@RequestMapping(value="/user_homepage", method = RequestMethod.GET)
	public String home_buyer(@RequestParam int id, HttpSession session){
		Pager<LikeList> pl = lld.list(id);
		session.setAttribute("likelist", pl);
		return "user_homepage";
	}
	
	@RequestMapping(value ="delete_likelistGoods",method = RequestMethod.GET)
	public String deleteGoodsFromLikeList(int id,HttpSession session){
		lld.delete(id);
		User tempuser = (User) session.getAttribute("loginUser");
		return "redirect:/user_homepage?id="+tempuser.getId();
	}
}
