package com.dnow.vo;

import java.util.ArrayList;
import java.util.List;

import com.dnow.entity.User;

public class Cart {
	private List<CartItem> items;
	private int count;
	private float totalprice;
	private User user;

	private void comTotalPrice() {
		if(items==null)
			return;
		this.totalprice = 0.0f;
		for(CartItem item:items) {
			this.totalprice += item.getProduct().getPrice()*item.getProduct().getDiscount()*item.getCount();
		}
	}

	public void addItem(CartItem curritem) {
		if(items==null)
			items = new ArrayList<CartItem>();
		for(CartItem item:items) {
			if(item.getProduct().getPid()==curritem.getProduct().getPid()) {
				item.setCount(item.getCount()+curritem.getCount());
				this.count+=curritem.getCount();
				this.totalprice += curritem.getCount()*curritem.getProduct().getPrice()*curritem.getProduct().getDiscount();
				return;
			}
		}
		items.add(curritem);
		this.count+=curritem.getCount();
		comTotalPrice();
	}
	
	public void deleteItemByPid(int pid) {
		if(items==null||items.size()==0)
			return;
		int i = 0;
		for(CartItem item:items) {
			if(item.getProduct().getPid()==pid) {
				this.totalprice -= item.getCount()*item.getProduct().getPrice()*item.getProduct().getDiscount();
				this.count -= item.getCount();
				this.items.remove(i);
				break;
			}
			i++;
		}
	}
	
	public Cart() {
		
	}
	
	public Cart(User user) {
		this.user = user;
	}
	
	public List<CartItem> getItems() {
		return items;
	}
	public void setItems(List<CartItem> items) {
		this.items = items;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
