package com.dnow.vo;

import java.util.List;

import com.dnow.entity.OrderForm;
import com.dnow.entity.User;

public class Order {
	private List<OrderForm> Orderlist;
	private User user;
	private String address;
	private String phone;
	private String orderid;
	private int allcount;
	private float totalprice;
	public List<OrderForm> getOrderlist() {
		return Orderlist;
	}
	public void setOrderlist(List<OrderForm> orderlist) {
		Orderlist = orderlist;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getAllcount() {
		return allcount;
	}
	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}
}
