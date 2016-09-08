package com.xtk.shop.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IImagesDao;
import com.xtk.shop.inter.ILikeListDao;
import com.xtk.shop.inter.IStoreDao;
import com.xtk.shop.inter.IUserDao;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.Images;
import com.xtk.shop.model.LikeList;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.Store;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;
import com.xtk.shop.util.FileOperateUtil;

@Controller
public class GoodsController {
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao(
			"goodsDao");
	private IImagesDao imgd = (IImagesDao) DaoUtil.createDaoFactory().getDao(
			"imagesDao");
	private ILikeListDao lld = (ILikeListDao) DaoUtil.createDaoFactory()
			.getDao("likeListDao");
	private IStoreDao sd = (IStoreDao) DaoUtil.createDaoFactory().getDao(
			"storeDao");
	private IUserDao ud = (IUserDao) DaoUtil.createDaoFactory().getDao(
			"userDao");

	@RequestMapping(value = "add_goods", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute(new Goods());
		return "add_goods";
	}

	@RequestMapping(value = "add_goods", method = RequestMethod.POST)
	public String add_goods(@Validated Goods goods, BindingResult br,
			@RequestParam("attachs") MultipartFile[] attachs,
			HttpServletRequest request) throws IOException {
		if (br.hasErrors()) {
			return "add_goods";
		}
		String realpath = "E:/代码/JAVA EE/Sapling_shop/WebContent/resources/photo";// request.getSession().getServletContext().getRealPath("/resources/photo");
		System.out.println(realpath);
		String filename;
		if (!attachs[0].isEmpty()) {
			filename = FileOperateUtil.rename(attachs[0].getOriginalFilename());
			File Thumbnail = new File(realpath + "/" + filename);
			FileUtils.copyInputStreamToFile(attachs[0].getInputStream(),
					Thumbnail);
			goods.setImg(filename);
		}
		gd.add(goods);
		int lastInsertId = gd.getLastInsertId();
		for (int i = 1; i < attachs.length; i++) {
			if (attachs[i].isEmpty()) {
				continue;
			}
			filename = FileOperateUtil.rename(attachs[i].getOriginalFilename());
			File file = new File(realpath + "/" + filename);
			FileUtils.copyInputStreamToFile(attachs[i].getInputStream(), file);
			// 将图片名称地址存入数据库
			Images img = new Images();
			System.out.println("上次插入的商品的信息完毕后得到的id：" + lastInsertId);
			img.setGoods_id(lastInsertId);
			img.setImg(filename);

			imgd.add(img);
		}
		return "redirect:store";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String goods_class, String searchInfo, Model model,
			HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		if (searchInfo == null) {
			Pager<Goods> ps = gd.listByClass(Integer.parseInt(goods_class));
			System.out.println("查找总数为：" + ps.getTotalRecord());
			for (Goods g : ps.getDatas()) {
				System.out.println(g.toString());
			}
			model.addAttribute("the_goods", ps);
			model.addAttribute("goods_class", goods_class);
		} else {
			Pager<Goods> ps = gd.find(searchInfo);
			System.out.println("查找总数为：" + ps.getTotalRecord());
			for (Goods g : ps.getDatas()) {
				System.out.println(g.toString());
			}
			model.addAttribute("the_goods", ps);
			model.addAttribute("searchInfo", searchInfo);
		}
		return "list";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String details(int id, Model model, HttpSession session) {
		String isInLikeList = "没有收藏";
		// 整型isInLikeList 0 表示没有收藏， 1表示已经收藏
		List<Images> templistImages = imgd.loadByGoodsId(id);
		model.addAttribute("images", templistImages);
		System.out.println("图片加载已完成");
		Goods tempgood = gd.loadById(id);
		model.addAttribute("goods", tempgood);
		System.out.println("商品加载已完成");
		Store tempstore = sd.loadById(tempgood.getStore_id());
		model.addAttribute("store", tempstore);
		System.out.println("店铺信息加载完成" + tempstore.getId() + "...."
				+ tempstore.getUser_id());
		User tempUser = ud.load(tempstore.getUser_id());
		model.addAttribute("seller", tempUser);
		System.out.println("卖家信息加载完成");
		List<Goods> anythingElse = gd.anythingElse(tempgood.getStore_id());
		model.addAttribute("anythingElse", anythingElse);
		// 从likelist中读取用户的收藏情况，如果有的话就传一个值给detail，从而改变button是否disabled
		if (session.getAttribute("loginUser") != null) {
			User user = (User) session.getAttribute("loginUser");
			List<LikeList> templikelist = lld.list(user.getId()).getDatas();
			for (LikeList likeList : templikelist) {
				System.out.println("列出所有收藏的ID："+likeList.getGoods_id());
				if (likeList.getGoods_id() == id) {
					System.out.println("该商品已经存在于收藏列表！！");
					isInLikeList = "已经收藏";
					break;
				}
			}
		}
		model.addAttribute("isInLikeList", isInLikeList);
		return "detail";
	}

	@RequestMapping(value = "update_goods", method = RequestMethod.GET)
	public String update(int id, Model model) {
		model.addAttribute(gd.loadById(id));
		model.addAttribute("update_goods_id", id);
		return "update_goods";
	}

	@RequestMapping(value = "update_goods", method = RequestMethod.POST)
	public String update(@Validated Goods goods, BindingResult br,
			@RequestParam("attachs") MultipartFile[] attachs,HttpSession session) throws IOException {
		if (br.hasErrors()) {
			return "update_goods";
		}
		String realpath = "E:/代码/JAVA EE/Sapling_shop/WebContent/resources/photo";// request.getSession().getServletContext().getRealPath("/resources/photo");
		System.out.println(realpath);
		String filename;
		if (!attachs[0].isEmpty()) {
			filename = FileOperateUtil.rename(attachs[0].getOriginalFilename());
			File Thumbnail = new File(realpath + "/" + filename);
			FileUtils.copyInputStreamToFile(attachs[0].getInputStream(),
					Thumbnail);
			goods.setImg(filename);
		}
		gd.update(goods);
		int lastInsertId = gd.getLastInsertId();
		for (int i = 1; i < attachs.length; i++) {
			if (!attachs[i].isEmpty()) {
				break;
			}
			imgd.deleteByGoodsId(goods.getId());//既然选择修改之后的任意项，即将所有的图片都删除
			//随后的文件也通过文件流删除
			
		}
		for (int i = 1; i < attachs.length; i++) {
			if (attachs[i].isEmpty()) {
				continue;
			}
			filename = FileOperateUtil.rename(attachs[i].getOriginalFilename());
			File file = new File(realpath + "/" + filename);
			FileUtils.copyInputStreamToFile(attachs[i].getInputStream(), file);
			// 将图片名称地址存入数据库
			Images img = new Images();
			System.out.println("上次插入的商品的信息完毕后得到的id：" + lastInsertId);
			img.setGoods_id(goods.getId());
			img.setImg(filename);
			imgd.add(img);
		}
			
		User user = (User) session.getAttribute("loginUser");
		if (user.getType() == 2) {
			return "redirect:/manage_goods";
		}
		return "redirect:/store";
	}

	@RequestMapping(value = "delete_goods", method = RequestMethod.GET)
	public String delete(int id) {
		gd.delete(id);
		return "redirect:store";
	}

	@RequestMapping(value = "quickSearch", method = RequestMethod.GET)
	public String quickSearch(String category, String isEverGreen, String type,
			String lowPrice, String highPrice, Model model) {
		model.addAttribute("category_Info", category);
		model.addAttribute("isEverGreen_Info", isEverGreen);
		if (category.equals("草本") || category.equals("地被")
				|| category.equals("竹")) {

		} else {
			if (!isEverGreen.equals("任何")) {
				category = category + "（" + isEverGreen + "）";
			}
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("species", "%" + category + "%");
		params.put("type", type);
		if (lowPrice != null) {
			params.put("lowPrice", lowPrice);
			model.addAttribute("lowPrice_Info", lowPrice);
		}
		if (highPrice == null) {
			params.put("highPrice", highPrice);
			model.addAttribute("hgihPrice_Info", highPrice);
		}
		Pager<Goods> pg = gd.quickSearch(params);
		model.addAttribute("the_goods", pg);
		model.addAttribute("type_Info", type);

		return "quickSearch";
	}

	@RequestMapping(value = "/searchMyGoods", method = RequestMethod.GET)
	public String searchMyGoods(String name, Model model, HttpSession session) {
		Store tempsStore = (Store) session.getAttribute("my_store");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name);
		params.put("store_id", tempsStore.getId());
		Pager<Goods> pg = gd.findMyGoods(params);
		model.addAttribute("result_of_search", pg);
		model.addAttribute("search_name", name);
		return "search_MyGoods";
	}
	@RequestMapping(value = "/addStock",method = RequestMethod.GET)
	public String addStock(int goods_id,int quantity){
		Goods goods = gd.loadById(goods_id);
		goods.setStock(quantity);
		goods.setStatus(1);
		gd.update(goods);
		return "redirect:/store";
	}
	@RequestMapping(value = "/itemDownshelf",method = RequestMethod.GET)
	public String itemDownshelf (int id){
		Goods goods = gd.loadById(id);
		goods.setStatus(0);
		gd.update(goods);
		return "redirect:/store";
	}
	@RequestMapping(value = "/itemUpshelf", method = RequestMethod.GET)
	public String itemUpshelf(int id,Model model){
		Goods goods = gd.loadById(id);
		model.addAttribute("goodsToUpshelf", goods);
		return "itemUpshelf";
	}
}
