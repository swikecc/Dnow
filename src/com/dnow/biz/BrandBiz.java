package com.dnow.biz;

import java.util.List;
import java.util.Map;

import com.dnow.entity.Brand;


public interface BrandBiz {
	public Brand findBrandById(int bid);
	public List<Brand> findBrandList();
	public Map<Integer, String> getBrandMap();
}
