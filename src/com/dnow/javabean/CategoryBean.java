package com.dnow.javabean;

import java.util.HashMap;
import java.util.Map;

import com.dnow.biz.impl.CategoryBizImpl;

public class CategoryBean {
	private Map<Integer, String> categorymap = new HashMap<Integer, String>();
	public CategoryBean() {
		CategoryBizImpl cbi = new CategoryBizImpl();
		this.categorymap = cbi.getCategoryMap();
	}
	public Map<Integer, String> getCategorymap() {
		return categorymap;
	}
	public void setCategorymap(Map<Integer, String> categorymap) {
		this.categorymap = categorymap;
	}
	
}
