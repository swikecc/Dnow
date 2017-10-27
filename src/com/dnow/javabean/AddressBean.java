package com.dnow.javabean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dnow.entity.Address;

public class AddressBean {
	private List<Address> alist;
	private Map<String,String> addmap;
	public List<Address> getAlist() {
		return alist;
	}
	public void setAlist(List<Address> alist) {
		this.alist = alist;
		if(addmap==null)
			addmap = new HashMap<String, String>();
		if(alist.size()>0)
			for(Address add:alist) {
				addmap.put(add.getAddressName(), add.getAddressName());
			}
	}
	public Map<String, String> getAddmap() {
		if(addmap.size()>0)
			return addmap;
		return null;
	}
}
