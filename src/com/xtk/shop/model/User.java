package com.xtk.shop.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private int type;
	
	public User() {
	}

	public User(String name, String password, String nickname, String email) {
		super();
		this.username = name;
		this.password = password;
		this.email = email;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Size(min=1,max=10,message="密码的长度不符合要求！！")
	public String getPassword() {
		return password;
	}
	
	@NotEmpty(message="用户名不能为空！！")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Email(message="邮件格式不正确！！")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
