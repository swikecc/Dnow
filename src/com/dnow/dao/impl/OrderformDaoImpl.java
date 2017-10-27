package com.dnow.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.dnow.dao.OrderformDao;
import com.dnow.entity.OrderForm;

public class OrderformDaoImpl extends BaseDaoImpl<OrderForm> implements
		OrderformDao {

	@Override
	public List<String> selectPageOrderidByUidState(int first, int size, int uid, int lowstate,
			int upstate) {
		String hql = "select orderid from OrderForm where uid=? and state between ? and ? order by time desc";
		Query query = this.session.createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(size);
		query.setInteger(0, uid);
		query.setInteger(1, lowstate);
		query.setInteger(2, upstate);
		List<String> orderidlist = query.list();
		return orderidlist;
	}

	@Override
	public int getOrderidCountByUidState(int uid, int lowstate, int upstate) {
		String hql = "select count(*) from OrderForm where uid=? and state between ? and ?";
		Query query = this.session.createQuery(hql);
		query.setInteger(0, uid);
		query.setInteger(1, lowstate);
		query.setInteger(2, upstate);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public int getOrderCountByState(int lowstate, int upstate) {
		String hql = "select count(*) from OrderForm where state between ? and ?";
		Query query = this.session.createQuery(hql);
		query.setInteger(0, lowstate);
		query.setInteger(1, upstate);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	
	
//	public static void main(String[] args) {
//		OrderformDaoImpl oformdi = new OrderformDaoImpl();
//		List<String> list = oformdi.selectOrderidByUidState(4, 1, 3);
//		for(String orderid: list)
//			System.out.println(orderid);
//	}
}
