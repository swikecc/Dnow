package com.dnow.biz;

import java.util.List;

import com.dnow.vo.HotProduct;

public interface OrderItemBiz {
	public List<HotProduct> findHotProduct(int low, int high);
}
