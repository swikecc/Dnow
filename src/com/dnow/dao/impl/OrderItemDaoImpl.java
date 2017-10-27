package com.dnow.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import com.dnow.dao.OrderItemDao;
import com.dnow.entity.OrderItem;
import com.dnow.entity.Product;
import com.dnow.vo.HotProduct;

public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem> implements
		OrderItemDao {
	
	@Override
	public List<HotProduct> rankProductByCount(int first, int size) {
		String hql = "select item.product,sum(item.count) from OrderItem as item group by item.product order by sum(item.count) desc";
		Query query = this.session.createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(size);
		List<Object[]> objlist = query.list();
		List<HotProduct> hotlist = new ArrayList<HotProduct>();
		for(Object[] obj:objlist) {
			HotProduct hotproduct = new HotProduct();
			hotproduct.setProduct((Product)obj[0]);
			hotproduct.setCount((Long)obj[1]);
			hotlist.add(hotproduct);
		}
		return hotlist;
	}
	
}
