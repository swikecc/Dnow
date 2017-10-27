package com.dnow.javabean;

import java.util.HashMap;
import java.util.Map;

import com.dnow.biz.impl.BrandBizImpl;

public class BrandBean {
	private Map<Integer, String> brandmap = new HashMap<Integer, String>();
	public BrandBean() {
		BrandBizImpl bbi = new BrandBizImpl();
		this.brandmap = bbi.getBrandMap();
	}
	public Map<Integer, String> getBrandmap() {
		return brandmap;
	}
	public void setBrandmap(Map<Integer, String> brandmap) {
		this.brandmap = brandmap;
	}
}
