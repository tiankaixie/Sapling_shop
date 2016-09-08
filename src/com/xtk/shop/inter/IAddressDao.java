package com.xtk.shop.inter;

import java.util.List;

import com.xtk.shop.model.Address;

public interface IAddressDao {
	public void add(Address address, int userId);
	public void update(Address address);
	public void delete(int id);
	public Address load(int id);
	public List<Address> list(int userId);
}
