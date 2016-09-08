package com.xtk.shop.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Store {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String postcode;
	private String address;
	private int user_id;
	private String details;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Size(min=1,max=20,message="���ֵĳ���Ҫ����20���ַ��ڣ���")
	@NotEmpty(message="��������Ϊ�գ���")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Email(message="�ʼ���ʽ����ȷ����")
	@NotEmpty(message="���䲻��Ϊ�գ���")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {  
		this.email = email;
	}
	@NotEmpty(message="��ϵ�绰����Ϊ�գ���")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	@NotEmpty(message="��ַ����Ϊ�գ���")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
}
