package com.dnow.dao;

import java.util.List;

import com.dnow.entity.OrderForm;

public interface OrderformDao extends BaseDao<OrderForm> {
	public int getOrderidCountByUidState(int uid, int lowstate, int upstate);
	public List<String>	selectPageOrderidByUidState(int pagesize, int currpage, int uid, int lowstate, int upstate);
	
	public int getOrderCountByState(int lowstate, int upstate);
}
