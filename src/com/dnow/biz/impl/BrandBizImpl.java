package com.dnow.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dnow.biz.BrandBiz;
import com.dnow.dao.impl.BrandDaoImpl;
import com.dnow.entity.Brand;

public class BrandBizImpl implements BrandBiz {
	private BrandDaoImpl bdi = new BrandDaoImpl();

	@Override
	public Brand findBrandById(int bid) {
		return this.bdi.getEntity(bid);
	}

	@Override
	public List<Brand> findBrandList() {
		List<Brand> blist = this.bdi.getEntities();
		List<Brand> brandlist = new ArrayList<Brand>();
		if(blist.size()>0) {
			for(Brand brand:blist)
				brandlist.add(brand);
			return brandlist;
		}
		return null;
	}

	@Override
	public Map<Integer, String> getBrandMap() {
		List<Brand> blist = this.bdi.getEntities();
		Map<Integer, String> bmap = new HashMap<Integer, String>();
		for(Brand brand:blist) {
			bmap.put(brand.getBid(), brand.getBrand());
		}
		return bmap;
	}

}
