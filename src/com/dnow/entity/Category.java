package com.dnow.entity;

// Generated 2013-8-16 17:32:55 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import com.dnow.entity.Category;

/**
 * Category generated by hbm2java
 */
public class Category implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cid;
	private String cname;
	private Category supercategory;
	private Set<Category> subcategories = new HashSet<Category>();
	private Set<Product> products = new HashSet<Product>(0);

	public Category() {
	}

	public Category(String category) {
		this.cname = category;
	}

	public Category(String cname, Category supercategory,
			Set<Category> subcategories, Set<Product> products) {
		this.cname = cname;
		this.supercategory = supercategory;
		this.subcategories = subcategories;
		this.products = products;
	}

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category getSupercategory() {
		return supercategory;
	}

	public void setSupercategory(Category supercategory) {
		this.supercategory = supercategory;
	}

	public Set<Category> getSubcategories() {
		return subcategories;
	}

	public void setSubcategories(Set<Category> subcategories) {
		this.subcategories = subcategories;
	}

	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
