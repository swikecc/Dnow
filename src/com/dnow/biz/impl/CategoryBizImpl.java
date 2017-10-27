package com.dnow.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dnow.biz.CategoryBiz;
import com.dnow.dao.impl.CategoryDaoImpl;
import com.dnow.entity.Category;

public class CategoryBizImpl implements CategoryBiz {
	private CategoryDaoImpl cdi = new CategoryDaoImpl();
	@Override
	public List<Category> getAllCategory() {
		
		List<Category> categories = this.cdi.getEntities("supercategory=0");
		return categories;
		
	}
	@Override
	public Category getCategoryById(int id) {
		Category category = cdi.getEntity(id);
		return category;
	}
	@Override
	public Map<Integer, String> getCategoryMap() {
		List<Category> list = this.cdi.getEntities("cid>=?", 4);
		Map<Integer, String> categorymap = new HashMap<Integer, String>();
		for(Category category:list) {
			categorymap.put(category.getCid(), category.getCname());
		}
		return categorymap;
	}
}
