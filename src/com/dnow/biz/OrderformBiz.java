package com.dnow.biz;

import com.dnow.entity.OrderForm;
import com.dnow.vo.OrderPageBean;
import com.dnow.vo.OrderidPageBean;

public interface OrderformBiz {
	public OrderForm getOrderByOid(String orderid);
//	public List<String> getOrderidByUidState(int uid, int lowstate, int upstate);
	public OrderidPageBean getPageOrderidByUidState(int pagesize, int currpage, int uid, int lowstate, int upstate);
	public boolean addOrder(OrderForm order);
	public boolean deleteOrderByOid(String orderid);
	public boolean changeOrderStateByOid(String orderid, int newstate);
	
	public OrderPageBean getPageOrderByState(int pagesize, int currpage, int lowstate, int upstate);
}
