package com.dnow.entity;

// Generated 2013-8-26 13:47:59 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * OrderForm generated by hbm2java
 */
public class OrderForm implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private String address;
	private String orderid;
	private int state;
	private Date time;
	private String name;
	private String phone;
	private Integer count;
	private Float total;
	private Set<OrderItem> orderItems = new HashSet<OrderItem>(0);

	public OrderForm() {
	}

	public OrderForm(User user, String address, String orderid, int state,
			Date time, String name, String phone, Integer count, Float total) {
		this.user = user;
		this.address = address;
		this.orderid = orderid;
		this.state = state;
		this.time = time;
		this.name = name;
		this.phone = phone;
		this.count = count;
		this.total = total;
	}

	public OrderForm(User user, String address, String orderid, int state,
			Date time, String name, String phone, Integer count, Float total, Set<OrderItem> orderItems) {
		this.user = user;
		this.address = address;
		this.orderid = orderid;
		this.state = state;
		this.time = time;
		this.name = name;
		this.phone = phone;
		this.phone = phone;
		this.count = count;
		this.orderItems = orderItems;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

	public Set<OrderItem> getOrderItems() {
		return this.orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

}