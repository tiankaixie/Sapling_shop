package com.xtk.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

@Controller
public class StoreController {
	private IStoreDao sd = (IStoreDao) DaoUtil.createDaoFactory().getDao("storeDao");
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao("goodsDao");
	
	@RequestMapping(value = "/register_store", method = RequestMethod.GET)
	public String register_store(Model model) {
		model.addAttribute(new Store());
		return "register_store";
	}
	
	@RequestMapping(value = "/register_store", method = RequestMethod.POST)
	public String add(@Validated Store store, BindingResult br,Model model) {
		if (br.hasErrors()) {
			return "register_store";
		}
		sd.add(store);

		return "register_success";
	}
	
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String showStore(Model model,HttpSession session){
		//如果还没有注册商店的话就注册一个商店
		User user =  (User) session.getAttribute("loginUser");
		if (sd.loadByUserId(user.getId())==null) {
			model.addAttribute(new Store());
			return "register_store";
		}
		else {
			Store tempsStore = sd.loadByUserId(user.getId());
			if (session.getAttribute("my_store")!=null) {}
			else {
				session.setAttribute("my_store",tempsStore);
			}
			Pager<Goods> ps = gd.list(tempsStore.getId());
			model.addAttribute("my_goods", ps);
		}
		return "store";
	}
	@RequestMapping(value = "/update_store",method = RequestMethod.GET)
	public String updateStore(int id ,Model model){
		Store oldStore = sd.loadById(id);
		System.out.println(oldStore.getName()+"  "+oldStore.getDetails());
		model.addAttribute(new Store());
		model.addAttribute("old_store", oldStore);
		return "update_store";
	}
	@RequestMapping(value = "/update_store",method = RequestMethod.POST)
	public String updateStore(@Validated Store store ,BindingResult br){
		if (br.hasErrors()) {
			return "update_store";
		}
		sd.update(store);
		return "redirect:/manage_store";
	}
	@RequestMapping(value= "delete_store",method=RequestMethod.GET)
	public String deleteStore(int id){
		sd.delete(id);
		return "redirect:/manage_store";
	}
	
	
}
