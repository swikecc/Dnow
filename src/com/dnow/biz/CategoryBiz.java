package com.dnow.biz;

import java.util.List;
import java.util.Map;

import com.dnow.entity.Category;

public interface CategoryBiz {
	public List<Category> getAllCategory();
	public Category getCategoryById(int id);
	public Map<Integer, String> getCategoryMap();
}
