package com.dnow.biz.impl;

import java.util.List;

import com.dnow.biz.OrderItemBiz;
import com.dnow.dao.impl.OrderItemDaoImpl;
import com.dnow.vo.HotProduct;

public class OrderItemBizImpl implements OrderItemBiz {
	private OrderItemDaoImpl oitemdi = new OrderItemDaoImpl();
	
	@Override
	public List<HotProduct> findHotProduct(int low, int high) {
		List<HotProduct> hotlist = this.oitemdi.rankProductByCount(low, high-low);
		if(hotlist.size()>0) {
			return hotlist;
		}
		return null;
	}

}
