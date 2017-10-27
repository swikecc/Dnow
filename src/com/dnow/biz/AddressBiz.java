package com.dnow.biz;

import java.util.List;

import com.dnow.entity.Address;

public interface AddressBiz {
	public Address getAddressByAid(int aid);
	public List<Address> findAddressByUid(int uid);
	public boolean addAddress(Address address);
	public boolean updateAddress(Address address);
	public boolean deleteAddressByAid(int aid);
}
