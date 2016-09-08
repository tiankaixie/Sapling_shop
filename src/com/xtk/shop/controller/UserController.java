package com.xtk.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xtk.shop.inter.IShopCartDao;
import com.xtk.shop.inter.IUserDao;
import com.xtk.shop.model.Pager;
import com.xtk.shop.model.ShopCart;
import com.xtk.shop.model.User;
import com.xtk.shop.util.DaoUtil;

@Controller
public class UserController {
	private IUserDao ud = (IUserDao) DaoUtil.createDaoFactory().getDao(
			"userDao");
	private IShopCartDao scd = (IShopCartDao) DaoUtil.createDaoFactory()
			.getDao("shopCartDao");

	public UserController() {
	}

	/*
	 * @RequestMapping(value = "/users", method = RequestMethod.GET) public
	 * String list(Model model) { model.addAttribute("users", users); return
	 * "user/list"; }
	 */

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute(new User());
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String add(@Validated User user, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return "register";
		}
		ud.add(user);
		return "register_success";
	}

	@RequestMapping(value = "/update_user", method = RequestMethod.GET)
	public String update(int id, Model model) {
		User old_user = ud.load(id);
		model.addAttribute("old_user", old_user);
		model.addAttribute(new User());
		return "update_user";
	}

	@RequestMapping(value = "/update_user", method = RequestMethod.POST)
	public String Update(@Validated User user, BindingResult br) {
		if (br.hasErrors()) {
			return "update_user";
		}
		System.out.println("user�е���Ϣ�Ƿ�Ĺ� ��" + user.getUsername());
		ud.update(user);
		return "redirect:/manage_user";
	}

	@RequestMapping(value = "/delete_user", method = RequestMethod.GET)
	public String delete(int id) {
		ud.delete(id);
		return "redirect:/manage_user";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String Login(Model model) {
		model.addAttribute(new User());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Validated User user, BindingResult br,
			HttpSession session, Model model) {
		if (br.hasErrors()) {
			return "login";
		}
		System.out.println("��jsp��������typeֵΪ��" + user.getType());
		User u = ud.login(user.getUsername(), user.getPassword(),
				user.getType());
		if (u == null) {
			System.out.println("�û��������ڣ�");
			// throw new ShopException("�û��������ڣ�");
			model.addAttribute("errorMessage", "�û��������ڣ�");
			return "login";
		}
		if (!user.getPassword().equals(u.getPassword())) {
			System.out.println("�û����벻��ȷ��");
			// throw new ShopException("�û����벻��ȷ��");
			model.addAttribute("errorMessage", "�û����벻��ȷ��");
			return "login";
		}
		session.setAttribute("loginUser", u);
		Pager<ShopCart> psc = scd.list(u.getId());
		session.setAttribute("shopCart", psc);
		if (user.getType() == 2) {
			// ��ù���ԱȨ�ޣ��������Աģʽ
			return "admin";
		}
		return "redirect:/home";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		model.asMap().remove("loginUser");
		model.asMap().remove("my_store");
		model.asMap().remove("shopCart");
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/my_order", method = RequestMethod.GET)
	public String my_order(Model model) {
		return "my_order";
	}
	/*
	 * �ֲ����쳣����,����������е�
	 */
	@RequestMapping(value = "/modify_pwd" , method = RequestMethod.GET)
	public String modify_pwd(){
		return "modify_pwd";
	}
	
	@RequestMapping(value = "/modify_pwd" , method = RequestMethod.POST)
	public String modify_pwd(String oldPassword,String newPassword, String confirmPassword,HttpSession session,Model model){
		User user = (User) session.getAttribute("loginUser");
		if (!user.getPassword().equals(oldPassword)) {
			model.addAttribute("err", "ԭ���벻��ȷ��");
			return "modify_pwd";
		}
		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("err", "�����������벻��ȷ��");
			return "modify_pwd";
		}
		user.setPassword(newPassword);
		ud.update(user);
		return "modify_pwd_success";
	}
}