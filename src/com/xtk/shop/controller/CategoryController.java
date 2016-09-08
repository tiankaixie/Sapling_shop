package com.xtk.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xtk.shop.inter.ICategoryDao;
import com.xtk.shop.inter.IGoodsDao;
import com.xtk.shop.inter.IGoodsRecommendDao;
import com.xtk.shop.inter.IImagesDao;
import com.xtk.shop.model.Category;
import com.xtk.shop.model.Goods;
import com.xtk.shop.model.GoodsRecommend;
import com.xtk.shop.model.Images;
import com.xtk.shop.util.DaoUtil;

@Controller
public class CategoryController {
	private ICategoryDao cd = (ICategoryDao) DaoUtil.createDaoFactory().getDao("categoryDao");
	private IGoodsDao gd = (IGoodsDao) DaoUtil.createDaoFactory().getDao("goodsDao");
	private IGoodsRecommendDao grd = (IGoodsRecommendDao) DaoUtil.createDaoFactory().getDao("goodsRecommendDao");
	private IImagesDao imgd = (IImagesDao) DaoUtil.createDaoFactory().getDao("imagesDao");
	@RequestMapping(value = "/home",method = RequestMethod.GET)
	public String loadCategoryAtStart(HttpSession session,Model model)
	{
		if (session.getAttribute("b_macrophanerophytes_evergreen") == null) {
		List<Category> categories= cd.list();
		List<Category> b_macrophanerophytes_evergreen = new ArrayList<Category>();
		List<Category> b_macrophanerophytes_fallen = new ArrayList<Category>();
		List<Category> s_macrophanerophytes_evergreen = new ArrayList<Category>();
		List<Category> s_macrophanerophytes_fallen = new ArrayList<Category>();
		List<Category> shrub_evergreen = new ArrayList<Category>();
		List<Category> shrub_fallen = new ArrayList<Category>();
		List<Category> liana_evergreen = new ArrayList<Category>();
		List<Category> liana_fallen = new ArrayList<Category>();
		List<Category> hydrophyte = new ArrayList<Category>();
		List<Category> herb_evergreen = new ArrayList<Category>();
		List<Category> herb_fallen = new ArrayList<Category>();
		List<Category> cover = new ArrayList<Category>();
		List<Category> bamboo = new ArrayList<Category>();
		
		for (Category category : categories) {
			switch (category.getSpecies()) {
			case "大乔木（常绿）":
				b_macrophanerophytes_evergreen.add(category);
				break;
			case "大乔木（落叶）":
				b_macrophanerophytes_fallen.add(category);
				break;
			case "小乔木（常绿）":
				s_macrophanerophytes_evergreen.add(category);
				break;
			case "小乔木（落叶）":
				s_macrophanerophytes_fallen.add(category);
				break;
			case "灌木（常绿）":
				shrub_evergreen.add(category);
				break;
			case "灌木（落叶）":
				shrub_fallen.add(category);
				break;
			case "藤本（常绿）":
				liana_evergreen.add(category);
				break;
			case "藤本（落叶）":
				liana_fallen.add(category);
				break;
			case "水生":
				hydrophyte.add(category);
				break;
			case "草本（常绿）":
				herb_evergreen.add(category);
				break;
			case "草本（落叶）":
				herb_fallen.add(category);
				break;
			case "地被":
				cover.add(category);
				break;
			case "竹":
				bamboo.add(category);
				break;
			default:
				break;
			}
		}
		session.setAttribute("b_macrophanerophytes_evergreen", b_macrophanerophytes_evergreen);
		session.setAttribute("b_macrophanerophytes_fallen", b_macrophanerophytes_fallen);
		session.setAttribute("s_macrophanerophytes_evergreen", s_macrophanerophytes_evergreen);
		session.setAttribute("s_macrophanerophytes_fallen", s_macrophanerophytes_fallen);
		session.setAttribute("shrub_evergreen", shrub_evergreen);
		session.setAttribute("shrub_fallen", shrub_fallen);
		session.setAttribute("liana_evergreen", liana_evergreen);
		session.setAttribute("liana_fallen", liana_fallen);
		session.setAttribute("hydrophyte", hydrophyte);
		session.setAttribute("herb_evergreen", herb_evergreen);
		session.setAttribute("herb_fallen", herb_fallen);
		session.setAttribute("cover", cover);
		session.setAttribute("bamboo", bamboo);
		}
		
		List<Goods> lg = gd.discover();
		session.setAttribute("discover", lg);
		//这里有一个小算法，即将870*420大小的图片名字传到goods.img中，这样以来就可以实现大图显示了
		List<GoodsRecommend> roll = grd.loadByType(1);
		for (int i=0;i<roll.size();i++) {
			List<Images> listimage = imgd.loadByGoodsId(roll.get(i).getGoods_id());
			roll.get(i).getGoods().setImg(listimage.get(0).getImg());
		}
		model.addAttribute("rollone",roll.get(0));
		List<GoodsRecommend> recommends = grd.loadByType(2);
		roll.remove(0);
		model.addAttribute("roll",roll);
		model.addAttribute("recommends", recommends);
		
		return "home";
	}
}
