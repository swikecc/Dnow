package com.dnow.biz.impl;

import java.util.Iterator;
import java.util.List;

import com.dnow.biz.OrderformBiz;
import com.dnow.dao.impl.OrderItemDaoImpl;
import com.dnow.dao.impl.OrderformDaoImpl;
import com.dnow.entity.OrderForm;
import com.dnow.entity.OrderItem;
import com.dnow.vo.OrderPageBean;
import com.dnow.vo.OrderidPageBean;

public class OrderformBizImpl implements OrderformBiz {
	private OrderformDaoImpl odi = new OrderformDaoImpl();
	private OrderItemDaoImpl oidi = new OrderItemDaoImpl();
	
	@Override
	public boolean addOrder(OrderForm order) {
		try {
			this.odi.saveEntity(order);
			Iterator<OrderItem> iter = order.getOrderItems().iterator();
			while(iter.hasNext()) {
				OrderItem item = iter.next();
				item.setOrder(order);
				this.oidi.saveEntity(item);
			}
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteOrderByOid(String orderid) {
		try {
			List<OrderForm> orderlist = this.odi.getEntities("orderid=?", orderid);
			if(orderlist!=null&&orderlist.size()>0) {
				OrderForm order = orderlist.get(0);
				order.setState(5);
				this.odi.updateEntity(order);
			}
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public OrderForm getOrderByOid(String orderid) {
		List<OrderForm> orderlist = this.odi.getEntities("orderid=?", orderid);
		if(orderlist.size()>0)
			return orderlist.get(0);
		return null;
	}

//	@Override
//	public List<String> getOrderidByUidState(int uid, int lowstate, int upstate) {
//		List<String> orderidList = this.odi.selectOrderidByUidState(uid, lowstate, upstate);
//		if(orderidList.size()>0)
//			return orderidList;
//		return null;
//	}
	
	@Override
	public OrderidPageBean getPageOrderidByUidState(int pagesize, int currpage, int uid, int lowstate, int upstate) {
		int rowcount = this.odi.getOrderidCountByUidState(uid, lowstate, upstate);
		int pagecount = rowcount%pagesize==0?rowcount/pagesize:rowcount/pagesize+1;
		List<String> orderidList = this.odi.selectPageOrderidByUidState((currpage-1)*pagesize, pagesize, uid, lowstate, upstate);
		if(orderidList.size()>0) {
			OrderidPageBean opb = new OrderidPageBean();
			opb.setPagesize(pagesize);
			opb.setCurrpage(currpage);
			opb.setRowcount(rowcount);
			opb.setPagecount(pagecount);
			opb.setList(orderidList);
			return opb;
		}
		return null;
	}

	//管理员
	@Override
	public OrderPageBean getPageOrderByState(int pagesize, int currpage, int lowstate, int upstate) {
		int rowcount = this.odi.getOrderCountByState(lowstate, upstate);
		int pagecount = rowcount%pagesize==0?rowcount/pagesize:rowcount/pagesize+1;
		List<OrderForm> orderList = this.odi.getEntities((currpage-1)*pagesize, pagesize, "state between ? and ?", lowstate, upstate);
		if(orderList.size()>0) {
			OrderPageBean opb = new OrderPageBean();
			opb.setPagesize(pagesize);
			opb.setCurrpage(currpage);
			opb.setRowcount(rowcount);
			opb.setPagecount(pagecount);
			opb.setList(orderList);
			return opb;
		}
		return null;
	}

	@Override
	public boolean changeOrderStateByOid(String orderid, int newstate) {
		try {
			List<OrderForm> orderlist = this.odi.getEntities("orderid=?", orderid);
			OrderForm order = orderlist.get(0);
			if(order.getState()<newstate) {
				order.setState(newstate);
				this.odi.updateEntity(order);
			}
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//	public static void main(String[] args) {
//	OrderformBizImpl obi = new OrderformBizImpl();
//	System.out.println(obi.deleteOrderItemById(127));
//	ProductBizImpl pbi = new ProductBizImpl();
//	Product product = pbi.findProductById(1);
//	UserBizImpl ubi = new UserBizImpl();
//	User user = ubi.findUserById(4);
//	Date date = new Date();
//	System.out.println(date);
//	OrderForm order = new OrderForm("123", product, user, 1, date, 1, "ok", "123", "12");
//	System.out.println(obi.setOrderItem(order));
//	}
}
