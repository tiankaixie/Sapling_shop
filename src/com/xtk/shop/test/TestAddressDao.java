package com.xtk.shop.test;



import org.junit.Before;
import org.junit.Test;

import com.xtk.shop.inter.IAddressDao;
import com.xtk.shop.model.Address;
import com.xtk.shop.util.DaoUtil;

public class TestAddressDao {
	private IAddressDao ad;

	@Before
	public void Init() {
		ad = (IAddressDao) DaoUtil.createDaoFactory().getDao("addressDao");
	}
	@Test
	public void testAdd() {
		Address address = new Address();
		address.setName("北京市海淀区清华东路35号北京林业大学王勇收");
		address.setPhone("18810594502");
		address.setPostcode("100083");
		ad.add(address, 2);
	}
	
	@Test
	public void testLoad(){
		Address address = ad.load(1);
		System.out.println(address.getName()+","+address.getPhone());
	}
	
	@Test
	public void testList(){
		java.util.List<Address> addresses = ad.list(2);
		for(Address a:addresses){
			System.out.println(a.getName()+","+a.getPhone());
		}
	}

}
