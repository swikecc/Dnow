package com.dnow.dao;

import java.util.List;

import com.dnow.entity.OrderItem;
import com.dnow.vo.HotProduct;

public interface OrderItemDao extends BaseDao<OrderItem> {
	public List<HotProduct> rankProductByCount(int first, int size);
}
