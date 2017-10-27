package com.dnow.biz.impl;

import java.util.List;

import com.dnow.biz.AddressBiz;
import com.dnow.dao.impl.AddressDaoImpl;
import com.dnow.entity.Address;

public class AddressBizImpl implements AddressBiz {
	private AddressDaoImpl adi = new AddressDaoImpl();
	
	@Override
	public List<Address> findAddressByUid(int uid) {
		List<Address> alist = this.adi.getEntities("uid=?", uid);
		return alist;
	}

	@Override
	public Address getAddressByAid(int aid) {
		return this.adi.getEntity(aid);
	}
	
	public boolean addAddress(Address address) {
		try {
			List<Address> addlist = this.adi.getEntities("user=? and address_name=?", address.getUser(), address.getAddressName());
			if(addlist.size()<=0)
				this.adi.saveEntity(address);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateAddress(Address address) {
		try {
			List<Address> addlist = this.adi.getEntities("user=? and address_name=?", address.getUser(), address.getAddressName());
			this.adi.updateEntity(addlist.get(0));
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteAddressByAid(int aid) {
		try {
			this.adi.deleteEntity(aid);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//	public static void main(String[] args) {
//		AddressBizImpl abi = new AddressBizImpl();
//		List<Address> alist = abi.findAddressByUid(4);
//		for(Address add:alist) {
//			System.out.println(add.getAddressName());
//		}
//	}

}
